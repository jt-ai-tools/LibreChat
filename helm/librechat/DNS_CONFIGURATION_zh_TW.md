# LibreChat Helm Chart 的 DNS 配置

此功能允許您為 LibreChat Pod 配置自定義 DNS 設置，從而實現將流量重新導向至代理伺服器或自定義端點。

## 使用案例

- **代理重新導向 (Proxy Redirection)**：將 AI 服務流量 (AWS Bedrock, OpenAI 等) 重新導向至內部代理伺服器。
- **企業 DNS**：使用公司特定的 DNS 伺服器進行名稱解析。
- **流量控制**：透過自定義 DNS 伺服器路由特定網域，同時為其他網域保留叢集 DNS。
- **安全性**：強制流量通過安全代理或閘道器。

## 配置選項

### DNS 策略 (DNS Policy)

`dnsPolicy` 欄位決定 DNS 解析的運作方式：

- `ClusterFirst` (預設)：優先使用叢集 DNS，失敗時回退至配置的 DNS。
- `Default`：使用節點的 DNS 設置。
- `None`：僅使用來自 `dnsConfig` 的 DNS 設置。
- `ClusterFirstWithHostNet`：適用於使用主機網路 (Host network) 的 Pod。

### DNS 配置 (DNS Config)

`dnsConfig` 欄位允許您指定：

- `nameservers`：DNS 伺服器 IP 列表 (最多 3 個)。
- `searches`：用於主機名查找的 DNS 搜尋網域列表。
- `options`：DNS 解析器選項列表。

## 範例

### 基礎配置

```yaml
# values.yaml
dnsPolicy: "None"
dnsConfig:
  nameservers:
    - "10.0.0.10"  # 自定義 DNS 伺服器
```

### 將 AI 服務重新導向至代理

```yaml
# values.yaml
dnsPolicy: "None"
dnsConfig:
  nameservers:
    - "10.96.0.100"  # 將 AI 網域重新導向至代理的 DNS 伺服器
  searches:
    - "svc.cluster.local"
  options:
    - name: ndots
      value: "2"
```

部署：
```bash
helm upgrade --install librechat ./helm/librechat -f values.yaml
```

### 企業 DNS 配置

```yaml
# values.yaml
dnsPolicy: "None"
dnsConfig:
  nameservers:
    - "192.168.1.53"  # 主要企業 DNS
    - "192.168.1.54"  # 次要企業 DNS
  searches:
    - "corp.internal"
    - "svc.cluster.local"
```

## 測試

### 驗證 DNS 配置

1. 使用自定義 DNS 設置進行部署：
```bash
helm install librechat ./helm/librechat 
  --set dnsPolicy="None" 
  --set dnsConfig.nameservers[0]="10.0.0.10"
```

2. 檢查 Pod 的 DNS 配置：
```bash
kubectl exec <pod-name> -- cat /etc/resolv.conf
```

3. 測試 DNS 解析：
```bash
kubectl exec <pod-name> -- nslookup example.com
```

### 測試結果

此功能已在以下場景中完成測試：

✅ **DNS 解析測試**
- Pod 中已正確配置自定義名稱伺服器 (Nameservers)。
- 網域成功解析為配置的代理 IP。
- 流量成功重新導向至代理伺服器。

✅ **多個名稱伺服器**
- 主要與回退 DNS 伺服器運作正常。
- 當主要伺服器不可用時，會發生容錯移轉 (Failover)。

✅ **整合測試**
- 與現有的 LibreChat 配置相容。
- 使用 ClusterFirst 策略時與叢集 DNS 無衝突。
- 與所有 Pod 安全上下文 (Security contexts) 相容。

## 進階用法

### 結合主機別名 (Host Aliases)

對於簡單的主機到 IP 映射，您可以將 DNS 配置與 hostAliases 結合使用：

```yaml
# 在 deployment spec 中 (非直接在 values.yaml 中)
spec:
  dnsPolicy: "None"
  dnsConfig:
    nameservers:
      - "10.0.0.10"
  hostAliases:
    - ip: "10.100.50.200"
      hostnames:
        - "api.openai.com"
```

### 動態 DNS 配置

您可以使用 Helm 的範本功能根據環境動態設置 DNS：

```yaml
{{- if eq .Values.environment "production" }}
dnsPolicy: "None"
dnsConfig:
  nameservers:
    - "10.0.0.10"  # 生產環境 DNS
{{- else }}
dnsPolicy: "ClusterFirst"  # 開發環境使用預設值
{{- end }}
```

## 疑難排解

### DNS 無法解析

1. 檢查 Pod 的 DNS 策略：
```bash
kubectl get pod <pod-name> -o yaml | grep -A5 dnsPolicy
```

2. 驗證名稱伺服器是否可連通：
```bash
kubectl exec <pod-name> -- ping <nameserver-ip>
```

### 配置未應用

確保 values.yaml 中的縮進正確：
```yaml
dnsPolicy: "None"  # 頂層，不在任何區段下
dnsConfig:         # 頂層，不在任何區段下
  nameservers:
    - "10.0.0.10"
```

## 安全考量

- 確保 DNS 伺服器是受信任且安全的。
- 盡可能使用啟用了 TLS 的 DNS 伺服器。
- 監控 DNS 查詢日誌以發現異常活動。
- 考慮使用將叢集 DNS 保留為回退方案的 DNS 策略。

## 相容性

- Kubernetes 1.19+
- 與所有 LibreChat 部署模式相容。
- 無論是否啟用 MongoDB 與 Meilisearch 皆可運作。
- 無需額外權限。
