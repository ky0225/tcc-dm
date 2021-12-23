## サーバ構成と起動について

### 各ディレクトリ・ファイル説明
※ 以下ディレクトリとファイルパスは、READMEから見たパスです。
* ./docker_alma : apache・phpの設定ファイルの置き場所
* ./docker_mysql : mysqlの設定ファイルの置き場所
* ../db : データベース保存場所
* ./docker_init.sh : ./docker_centosと./docker_mysql内の設定ファイルをコンテナ内にコピーする時に使用するシェルスクリプト、その他起動時必要な処理
* ./docker-compose.yml : コンテナの構成記述

### 起動方法
1. docker-compose up -d実行(docker-compose.ymlのあるディレクトリで)
2. bash ./docker_init.sh実行

### マウントポイント
* web-container : プロジェクト内の全ファイルがコンテナ内の/var/www/app/にマウントされている。
* db-container : ../dbにコンテナ内のDBがマウントされている。

## 開発環境について

### OS
AlmaLinux: 8.0

### Webサーバー
Apache: 2.4

### Database
MySQL: 5.7

### 開発言語
PHP: 8.1

### フレームワーク
Laravel: 8.7
