# sandbox-template-static

plaize Sandbox basaban の **静的HTML/SPA テンプレ**。HTML/CSS/JS だけのアプリ（フォーム送信や DB書き込みが**不要**なもの）用。

> サーバーサイドのロジック・DBアクセスが必要な場合は `sandbox-template-python` または `sandbox-template-node` を使ってください。

## 使い方

1. **テンプレから新規リポを作る**: Claude Code で `/sandbox-new` を実行（推奨）、または GitHub で "Use this template" → 新リポ `sandbox-<owner>-<app>` 作成
2. **`sandbox.yaml` を編集**: `owner` / `app` / `name` / `purpose` / `expires_at` を埋める
3. **`public/index.html` を作る**: 好きに書いてOK。複数ファイル可（`public/` 配下に静的アセット）
4. **push**: main にマージすると CI が自動で Cloud Run にデプロイ
5. **URL**: 約2分後に `https://<owner>--<app>.sandbox.plaize.co` で開ける

## `sandbox.yaml` の項目

詳しくは [build/validate-sandbox.py](build/validate-sandbox.py) を参照。重要項目：

- `owner` — 自分の short id（例: `urara`、`tanaka`）。`a-z0-9` のみ、ハイフン不可
- `app` — アプリの短い slug（例: `invoice-form`）。`a-z0-9-` 可
- `runtime: static` — このテンプレでは固定
- `expires_at` — `YYYY-MM-DD` 形式・作成日から最長180日。延長は何度でも可
- `lifetime: permanent` — 業務常用ツールに昇格するときだけ。Urara レビュー必須

## ローカル確認

```bash
docker build -t my-sandbox-app .
docker run --rm -p 8080:8080 my-sandbox-app
# → http://localhost:8080 で開ける
```

## オーナーシップ

各アプリのオーナーは自分。退職時は `sandbox.yaml` の `owner` を別の社員に変更する PR を出すか、アプリを archive。
