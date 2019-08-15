# sphinx-doc-sample

Sphinx ドキュメントのサンプルです。

# 開発環境構築方法

1. Gitリポジトリをクローンする
    ```bash
    git clone https://github.com/ryu-sato/sphinx-doc-sample.git
    ```
2. pipenv コマンドをインストールする
    ```bash
    pip install pipenv
    ```
3. PyPI パッケージをインストールする
    ```bash
    pipenv sync --dev
    ```

# コンテンツビルド

```bash
pipenv run build
```

## 自動コンテンツビルド

* 英語
    ```bash
    pipenv run auto_build
    ```
* 日本語
    ```bash
    # ターミナル1
    pipenv run auto_build_ja
    # ターミナル2
    pipenv run auto_i18_po
    ```


# 参考情報

## pipenv スクリプト

Pipfile に `pipenv run ＜スクリプト名＞` として以下が登録されています。

|スクリプト名|説明|
| --- | --- |
|build|HTMLファイルをビルドする(en)|
|build_ja|HTMLファイルをビルドする(ja)|
|auto_build|Webサーバを起動し、ソースファイルに変更があれば自動でHTMLファイルをビルドして反映させる(en)|
|auto_build_ja|Webサーバを起動し、ソースファイルに変更があれば自動でHTMLファイルをビルドして反映させる(ja)|
|i18n_pot|i18n用カタログテンプレートを作成する|
|i18n_po|i18n用メッセージカタログを作成する|
|auto_i18n_po|ソースファイルに変更があれば自動でメッセージカタログを作成する|
