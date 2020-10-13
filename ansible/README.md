## Live-studyのstaging環境をAnsibleで構築する


- playbookのシンタックスチェック→実行


    ```
    ansible-playbook -i hosts stg-app.yml -C 
    ```

    ```
    ansible-playbook -i hosts stg-app.yml 
    ```
- ec2にログイン→git cloneして/var/www/配下にアプリを設置
    ```
    Sudo yum update
    ```
    ```
    Git clone https://github.com/tatuya4451/Live-study.git
    ```
    ```
    sudo mkdir /var/www/
    ```
    ```
    sudo chown ec2-user /var/www/
    ```
    ```
    mv Live-study /var/www/
    ```

- mysqlのパスワードの設定
    ```
    sudo /usr/bin/mysql_secure_installation
    ```
- 先ほど設定したmysqlパスワードでログインできるか試す    
    ```
     mysql -u root -p
    ```
- secret_key_baseとデータベースのパスワードを環境変数に格納する(Live-study配下で実行)    
    ```
    bundleisntall 
    ```
    ```
   rake secret 
    ```
    ```
   sudo vim /etc/environment
    ```
    ```/etc/environment
   DATABASE_PASSWORD='データベースのrootユーザーのパスワード'
   SECRET_KEY_BASE='先程コピーしたsecret_key_base'
    ```
- railsアプリのセットアップ(Live-study配下で実行)    
    ```
  rails db:create RAILS_ENV=staging
    ```
    ```
   rails db:migrate RAILS_ENV=staging
    ```
    ```
   rails assets:precompile RAILS_ENV=staging
    ```
    ```
  RAILS_SERVE_STATIC_FILES=1 bundle exec unicorn_rails -c config/unicorn.rb -E staging -D
    ```
- letsencryptでssl証明書を取得してhttpsで接続する  
    ```
   sudo wget -r --no-parent -A 'epel-release-*.rpm' http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/
    ```
    ```
    sudo rpm -Uvh dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-*.rpm 
    ```
    ```
    sudo yum-config-manager --enable epel*
    ```
    ```
    sudo yum install certbot-nginx
    ```
    ```
    sudo certbot --nginx
    ```
- デバッグ    
    ```
    cat /var/www/Liveーstudy/log/unicorn.stderr.log
    ```
    ```
    tail -f log/production.log
    ```
    ```
    cat /var/log/nginx/error.log
    ```





