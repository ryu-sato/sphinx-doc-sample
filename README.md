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

# 参考情報

## pipenv スクリプト

Pipfile に `pipenv run ＜スクリプト名＞` として

|スクリプト名|説明|
| --- | --- |
|build|HTMLファイルをビルドする|
|auto_build|Webサーバを起動し、ソースファイルに変更があれば自動でHTMLファイルをビルドして反映させる|
