FROM ruby:2.6.3
ADD ./ /app/
WORKDIR /app
ENV PORT 4000
EXPOSE 4000

CMD ["sh", "-c", "while :; do ruby ./server.rb; done"]
