# CLAUDE.md — sandbox-template-static

これは plaize Sandbox 基盤の **静的HTML/SPA テンプレ** です。Claude Code がここでアプリを開発する際の指針。

## このリポジトリで Claude がやってよいこと

- `public/` 配下の HTML/CSS/JS を編集・追加する
- `sandbox.yaml` の `name` / `purpose` / `expires_at` を編集する
- `Dockerfile` / `Caddyfile` は基本的に触らない（必要ならユーザーに確認）

## やってはいけないこと

- `owner` / `app` を勝手に変える（リポ作成時に決定済み）
- `lifetime: permanent` を勝手に追加する（Urara レビュー必須）
- 顧客個人情報・APIキー・パスワードを `public/` にコミットする
- 外部サービスのトークンを `public/` に書く（必要なら Secret Manager 経由・このテンプレでは未対応 → python/node テンプレを使う）

## サーバーサイド処理が必要になったら

このテンプレは **静的ファイルのみ**。フォーム送信→DB保存、API呼び出し、認証付きAPI が必要なら：

```
/sandbox-new
```
を再実行して `python` か `node` の動的テンプレで作り直す。

## デプロイ

`git push` で自動デプロイ。URL は `https://<owner>--<app>.sandbox.plaize.co`。

## 参考リンク

- 全体プラン: `/Users/ularanishitani/.claude/plans/https-zenn-dev-aircloset-articles-65efe9-lovely-glacier.md`
- ルーター: `sandbox-platform/`
- Sandbox 利用ガイド: Notion ページ「Sandbox 利用ガイド」
