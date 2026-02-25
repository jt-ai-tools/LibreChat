# LibreChat Helm Chart
此 LibreChat Helm Chart 提供了一個簡單、輕量級的範本，以便在 Kubernetes 上部署 LibreChat。

## 變數 (Variables)
在此 Chart 中，LibreChat 僅透過環境變數運作。您可以指定現有的 Secret 來管理變數與私密資訊 (可以透過[建立 Env 檔案並將其轉換為 Kubernetes Secret](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-em-secret-em-) `--from-env-file` 來生成)。

## 設置 (Setup)

1. 生成變數
使用 `openssl rand -hex 32` 生成 `CREDS_KEY`, `JWT_SECRET`, `JWT_REFRESH_SECRET` 與 `MEILI_MASTER_KEY`；使用 `openssl rand -hex 16` 生成 `CREDS_IV`。
將它們放置在如下所示的 Secret 中 (若要更改 Secret 名稱，請記得在 Helm Values 中一併更改)：
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: librechat-credentials-env
  namespace: <librechat-chart-namespace>
type: Opaque
stringData:
  CREDS_KEY: <generated value>
  JWT_SECRET: <generated value>
  JWT_REFRESH_SECRET: <generated value>
  MEILI_MASTER_KEY: <generated value>
```
2. 將憑證新增至 Secret
根據您要使用的模型，[在提供商處建立憑證](https://docs.librechat.ai/install/configuration/ai_setup.html)並將其新增至 Secret：
```yaml
apiVersion: v1
kind: Secret
. . . .

  OPENAI_API_KEY: <your secret value>
```

3. 將 Secret 應用於叢集 (Cluster)

4. 填寫 values.yaml 並將 Chart 應用於叢集
