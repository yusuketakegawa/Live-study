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
<img width="924" alt="83effc3b659bfecf253c14955f08af1c" src="https://user-images.githubusercontent.com/66053927/95708348-f9c50b00-0c96-11eb-84b2-b2926402755f.png">
