# Redis 配置與設置

此目錄包含用於 LibreChat 開發與測試的完整 Redis 配置文件與腳本，支援叢集 (Cluster) 與單節點設置，並提供選用的 TLS 加密功能。

## 支援的配置

### 1. Redis 叢集 (3 節點)
- **3 個 Redis 節點**，分別運行在連接埠 7001, 7002, 與 7003。
- **無副本 (No replicas)** (每個節點皆為 Master)。
- **自動雜湊槽 (Hash slot) 分配**於所有節點。

### 2. 具備 TLS 加密的單一 Redis
- **單一 Redis 實例**運行在連接埠 6380，具備 TLS 加密。
- **CA 憑證驗證**以確保連線安全。
- **自簽章憑證**，具備正確的主體別名 (Subject Alternative Names)。

### 3. 標準單一 Redis
- **基礎 Redis 實例**運行在連接埠 6379 (預設)。
- **無加密** - 適用於本地開發。

所有配置皆專為**本地開發與測試**而設計。

## 先決條件

1. 您的系統必須安裝 **Redis**：
   ```bash
   # macOS
   brew install redis
   
   # Ubuntu/Debian
   sudo apt-get install redis-server
   
   # CentOS/RHEL
   sudo yum install redis
   ```

2. 應可使用 **Redis CLI** (通常隨 Redis 一併安裝)。

## 快速入門

### 選項 1：Redis 叢集 (3 節點)

```bash
# 進入 redis-config 目錄
cd redis-config

# 啟動並初始化叢集
./start-cluster.sh
```

### 選項 2：具備 TLS 的單一 Redis

```bash
# 在連接埠 6380 啟動具備 TLS 加密的 Redis
./start-redis-tls.sh
```

### 選項 3：標準 Redis

```bash
# 在預設連接埠 6379 使用系統 Redis
redis-server
```

## 測試您的設置

### 測試叢集
```bash
# 連接至叢集
redis-cli -c -p 7001

# 測試基本操作
SET test_key "Hello World"
GET test_key
```

### 測試 TLS Redis
```bash
# 使用 CA 憑證驗證進行測試
redis-cli --tls --cacert certs/ca-cert.pem -p 6380 ping
```

### 測試標準 Redis
```bash
# 連接至預設 Redis
redis-cli ping
```

## 停止服務

### 停止叢集
```bash
./stop-cluster.sh
```

### 停止 TLS Redis
```bash
# 查找並停止 TLS Redis 進程
ps aux | grep "redis-server.*6380"
kill <PID>
```

## 配置文件

- `redis-7001.conf` - 節點 1 的配置 (連接埠 7001)
- `redis-7002.conf` - 節點 2 的配置 (連接埠 7002)
- `redis-7003.conf` - 節點 3 的配置 (連接埠 7003)

## 腳本

- `start-cluster.sh` - 啟動並初始化 Redis 叢集
- `stop-cluster.sh` - 停止所有 Redis 節點並進行清理
- `start-redis-tls.sh` - 啟動具備 TLS 加密與 CA 憑證驗證的 Redis
- `redis-tls.conf` - TLS Redis 配置文件

## 目錄結構

```
redis-config/
├── README.md
├── redis-7001.conf         # 叢集節點 1 配置
├── redis-7002.conf         # 叢集節點 2 配置
├── redis-7003.conf         # 叢集節點 3 配置
├── redis-tls.conf          # TLS Redis 配置
├── start-cluster.sh        # 啟動叢集腳本
├── stop-cluster.sh         # 停止叢集腳本
├── start-redis-tls.sh      # 啟動 TLS Redis 腳本
├── certs/                  # TLS 憑證 (自動建立)
│   ├── ca-cert.pem         # 憑證授權單位 (CA) 憑證
│   ├── ca-key.pem          # CA 私鑰
│   ├── server-cert.pem     # 具備 SAN 的伺服器憑證
│   ├── server-key.pem      # 伺服器私鑰
│   ├── redis.dh            # Diffie-Hellman 參數
│   └── server.conf         # OpenSSL 憑證配置
├── data/                   # 資料檔案 (自動建立)
│   ├── 7001/               # 叢集節點 1 資料
│   ├── 7002/               # 叢集節點 2 資料
│   └── 7003/               # 叢集節點 3 資料
└── logs/                   # 紀錄目錄 (自動建立)
    # 注意：預設情況下，Redis 紀錄輸出至 stdout/stderr
    # 若在配置中啟用，紀錄檔案將建立於此
```

## 在 LibreChat 中使用

根據您選擇的 Redis 配置更新您的 `.env` 檔案：

### 用於 Redis 叢集
```bash
USE_REDIS=true
REDIS_URI=redis://127.0.0.1:7001,redis://127.0.0.1:7002,redis://127.0.0.1:7003
```

### 用於 TLS Redis
```bash
USE_REDIS=true
REDIS_URI=rediss://127.0.0.1:6380
REDIS_CA=/path/to/LibreChat/redis-config/certs/ca-cert.pem
```

### 用於標準 Redis
```bash
USE_REDIS=true
REDIS_URI=redis://127.0.0.1:6379
```

### 選項配置
```bash
# 使用環境變數進行動態鍵前綴 (Key prefixing)
REDIS_KEY_PREFIX_VAR=K_REVISION

# 或設置靜態前綴
REDIS_KEY_PREFIX=librechat

# 連線限制
REDIS_MAX_LISTENERS=40

# 保持連線活耀的 Ping 間隔 (秒，0 為停用)
REDIS_PING_INTERVAL=0

# 重新連線配置
REDIS_RETRY_MAX_DELAY=3000      # 重新連線嘗試間的最大延遲 (毫秒)
REDIS_RETRY_MAX_ATTEMPTS=10     # 最大重新連線嘗試次數 (0 = 無限)
REDIS_CONNECT_TIMEOUT=10000     # 連線逾時 (毫秒)
REDIS_ENABLE_OFFLINE_QUEUE=true # 斷線時將指令加入佇列
```

## TLS/SSL Redis 設置

對於使用具備 CA 憑證驗證的 TLS 加密安全 Redis 連線：

### 1. 啟動具備 TLS 的 Redis

```bash
# 在連接埠 6380 啟動具備 TLS 的 Redis
./start-redis-tls.sh
```

### 2. 為 TLS 配置 LibreChat

更新您的 `.env` 檔案：

```bash
# .env 檔案 - 具備 CA 憑證驗證的 TLS Redis
USE_REDIS=true
REDIS_URI=rediss://127.0.0.1:6380
REDIS_CA=/path/to/LibreChat/redis-config/certs/ca-cert.pem
```

### 3. 測試 TLS 連線

```bash
# 使用 CA 憑證測試 Redis TLS 連線
redis-cli --tls --cacert certs/ca-cert.pem -p 6380 ping

# 應返回：PONG

# 測試基本操作
redis-cli --tls --cacert certs/ca-cert.pem -p 6380 set test_tls "TLS Working"
redis-cli --tls --cacert certs/ca-cert.pem -p 6380 get test_tls
```

### 4. 測試後端整合

```bash
# 啟動 LibreChat 後端
npm run backend

# 在日誌中尋找以下成功指標：
# ✅ "No changes needed for 'USER' role permissions"
# ✅ "No changes needed for 'ADMIN' role permissions"
# ✅ "Server listening at http://localhost:3080"
# ✅ 無 "IoRedis connection error" 訊息
```

### TLS 憑證詳情

TLS 設置包括：

- **CA 憑證**：用於驗證的自簽章憑證授權單位。
- **伺服器憑證**：包含以下主體別名 (SAN)：
  - `DNS: localhost`
  - `IP: 127.0.0.1`
- **TLS 配置**：
  - 支援 TLS v1.2 與 v1.3。
  - 不需要客戶端憑證身份驗證。
  - 強大的加密套件 (AES-256-GCM, ChaCha20-Poly1305)。

### TLS 疑難排解

#### 憑證驗證錯誤

```bash
# 如果看到 "Hostname/IP does not match certificate's altnames"
# 檢查憑證 SAN 項目：
openssl x509 -in certs/server-cert.pem -text -noout | grep -A3 "Subject Alternative Name"

# 應顯示：DNS:localhost, IP Address:127.0.0.1
```

#### 連線被拒絕 (Connection Refused)

```bash
# 檢查 Redis TLS 是否正在運行
lsof -i :6380

# 檢查 Redis TLS 伺服器日誌
ps aux | grep redis-server
```

#### 後端連線問題

```bash
# 驗證 .env 中的 CA 憑證路徑
ls -la /path/to/LibreChat/redis-config/certs/ca-cert.pem

# 測試 LibreChat Redis 配置
cd /path/to/LibreChat
npm run backend
# 在輸出中尋找 Redis 連線錯誤
```

## 常見操作

### 檢查叢集狀態

```bash
# 叢集資訊
redis-cli -p 7001 cluster info

# 節點資訊
redis-cli -p 7001 cluster nodes

# 檢查特定節點
redis-cli -p 7002 info replication
```

### 監控叢集

```bash
# 監控所有操作
redis-cli -p 7001 monitor

# 檢查記憶體使用情況
redis-cli -p 7001 info memory
redis-cli -p 7002 info memory
redis-cli -p 7003 info memory
```

### 疑難排解

#### 叢集無法啟動

1. 檢查是否安裝 Redis：`redis-server --version`
2. 檢查連接埠衝突：`netstat -tlnp | grep :700`
3. 檢查 Redis 進程：`ps aux | grep redis-server`
4. 檢查節點是否有回應：`redis-cli -p 7001 ping`

#### 叢集初始化失敗

1. 確保所有節點皆在運行：`./start-cluster.sh`
2. 檢查叢集配置：`redis-cli -p 7001 cluster nodes`
3. 根據需要重置：`redis-cli -p 7001 CLUSTER RESET`

#### 效能問題

1. 監控記憶體使用情況：`redis-cli -p 7001 info memory`
2. 檢查慢查詢：`redis-cli -p 7001 slowlog get 10`
3. 調整配置文件中的 `maxmemory` 設置。

## 配置詳情

### 節點配置

每個節點配置如下：
- **記憶體限制**：256MB 並採用 LRU 淘汰機制。
- **持久化**：AOF + RDB 快照。
- **叢集功能**：啟用並設有 15 秒逾時。
- **日誌記錄**：Notice 級別 (預設記錄至 stdout/stderr)。

### 雜湊槽分配 (Hash Slot Distribution)

在 3 個節點且無副本的情況下：
- 節點 1 (7001)：雜湊槽 0-5460
- 節點 2 (7002)：雜湊槽 5461-10922
- 節點 3 (7003)：雜湊槽 10923-16383

## 安全注意事項

### 開發設置
基礎 Redis 叢集設置僅供**本地開發使用**。

### TLS 設置
TLS Redis 配置提供：
- ✅ **TLS 加密**並具備 CA 憑證驗證。
- ✅ **伺服器憑證**並具備正確的主體別名。
- ✅ **強大的加密套件** (AES-256-GCM, ChaCha20-Poly1305)。
- ✅ 透過自簽章 CA 進行**憑證驗證**。

### 生產環境考量
對於生產環境使用，請考慮：
- 身份驗證 (`requirepass` 或 `AUTH` 指令)。
- 客戶端憑證身份驗證 (`tls-auth-clients yes`)。
- 防火牆配置。
- 用於高可用性的副本節點。
- 正確的憑證管理 (非自簽章)。
- 金鑰輪換政策。

## 備份與恢復

### 備份

```bash
# 備份所有節點
mkdir -p backup
redis-cli -p 7001 BGSAVE
redis-cli -p 7002 BGSAVE
redis-cli -p 7003 BGSAVE

# 複製備份檔案
cp data/7001/dump.rdb backup/dump-7001.rdb
cp data/7002/dump.rdb backup/dump-7002.rdb
cp data/7003/dump.rdb backup/dump-7003.rdb
```

### 恢復

```bash
# 停止叢集
./stop-cluster.sh

# 恢復備份檔案
cp backup/dump-7001.rdb data/7001/dump.rdb
cp backup/dump-7002.rdb data/7002/dump.rdb
cp backup/dump-7003.rdb data/7003/dump.rdb

# 啟動叢集
./start-cluster.sh
```

## 支援

對於 Redis 特有的問題：
- [Redis 文件](https://redis.io/docs/)
- [Redis 叢集教學](https://redis.io/docs/manual/scaling/)

對於 LibreChat 整合問題：
- [LibreChat 文件](https://github.com/danny-avila/LibreChat)
