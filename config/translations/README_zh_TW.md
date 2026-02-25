## 翻譯 (Translations)

### 需求：
- 所有依賴項已安裝，在根目錄執行 `npm ci`。
- bun: https://bun.sh/
- 專案根目錄 `.env` 檔案中包含 `ANTHROPIC_API_KEY`。

### ⚠️ 警告：

執行此指令稿可能費用昂貴，即使有提示詞快取 (Prompt Caching)，也可能花費數美元。如果有一段時間沒有執行，且有新的翻譯貢獻，執行速度可能會很慢。

### 指令說明：

*所有指令皆在根目錄下執行。*

**支援的語言為具備一般翻譯提示詞的本地化**
- 這些提示詞直接位於 `client/src/localization/prompts`。
- 如果您的語言缺失，您可以透過在 `client/src/localization/prompts` 中新增一個以語言代碼命名的檔案來做出貢獻。

0. 確保 git 歷史記錄是乾淨的，執行 `git status`。
1. 暫時安裝 `hnswlib-node` 套件 (我們不需要將其包含在專案中)：
```bash
npm install --save-dev hnswlib-node
```
2. 執行 `bun install`。
3. 主指令稿：執行 `bun config/translations/scan.ts`。
4. 觀察在所有支援語言中生成的翻譯，並儲存在 `client/src/localization/languages` 中。
  - 例如：`client/src/localization/languages/Es_missing_keys.json`
5. 捨棄所有 git 變更，執行 `git checkout .`。
6. 將生成的翻譯複製到各自的檔案中，例如：`client/src/localization/languages/Es.ts`。
