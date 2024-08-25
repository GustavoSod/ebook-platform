# Ebook Platform

Platform to encourage reading, readers can download ebooks and writers can post their books. Remember 100% free.

## Dependencies

- [Ruby    3.3.1](https://www.ruby-lang.org/pt/downloads/)
- [Rails    7.1.3](https://rubyonrails.org)


## Setup

use this command to generate .env and fill them with your data:

```
cp .env.example .env
```


build your application:

```
docker compose up
```

create your database:

```
docker compose run web bin/rails db:create
```

You can now access the application by navigating to [localhost:3000](http://localhost:3000) in your browser.
