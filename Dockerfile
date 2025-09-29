FROM nginx:1.27-alpine

# Nginx のドキュメントルートを空にする（不要なデフォルトファイルを消す）
RUN rm -rf /usr/share/nginx/html/*

# アプリの静的ファイルをコピー
COPY index.html /usr/share/nginx/html/
COPY main.js /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# nginx 設定を上書き（任意）
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
