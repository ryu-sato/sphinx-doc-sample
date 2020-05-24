# sphinx-doc-sample

Sphinx ドキュメントのサンプルです。

# 開発環境構築方法

1. Gitリポジトリをクローンする
    ```bash
    git clone https://github.com/ryu-sato/sphinx-doc-sample.git
    ```
2. poetry コマンドをインストールする ([参考](https://python-poetry.org/docs/#installation))
3. PyPI パッケージをインストールする
    ```bash
    poetry install
    ```

# コンテンツビルド

[[#ビルドコマンド]] を参考にする

# 参考情報

## ビルドコマンド

|コマンド|説明|
| --- | --- |
|poetry run sphinx-build -M html source build|HTMLファイルをビルドする(en)|
|poetry run sphinx-build -M html source build -D language=ja|HTMLファイルをビルドする(ja)|
|poetry run sphinx-autobuild -b html source build/html|Webサーバを起動し、ソースファイルに変更があれば自動でHTMLファイルをビルドして反映させる(en)|
|poetry run sphinx-autobuild -b html source build/html -D language=ja|Webサーバを起動し、ソースファイルに変更があれば自動でHTMLファイルをビルドして反映させる(ja)|
|poetry run sphinx-build -M gettext source build|i18n用カタログテンプレートを作成する|
|poetry run sphinx-intl update -d source/locales -p build/gettext -l ja|i18n用メッセージカタログを作成する|
|poetry run watchmedo shell-command --pattern="*.rst" --recursive --command="poetry run sphinx-build -M gettext source build && poetry run sphinx-intl update -d source/locales -p build/gettext -l ja"|ソースファイルに変更があれば自動でメッセージカタログを作成する|
