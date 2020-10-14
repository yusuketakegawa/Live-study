## Dockerで開発環境を構築する

- docker/dev配下で実行
  ```
  docker-compose up -d
  ```
- コンテナに入る  
  ```
  docker-compose exec app bash
  ```
- railsアプリのセットアップ
  ```
  bundle install
  ```

  ```
  rails db:create
  ```

  ```
  rails db:migrate
  ```
  ```
  /usr/bin/supervisorctl restart app
  ```


## インフラ構成図
<img width="866" alt="3ef0781d7671f1cc93634cce7f1d36ed" src="https://user-images.githubusercontent.com/66053927/95939766-cb226e00-0e17-11eb-800d-195a44d847de.png">

