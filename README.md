# picture_board

## Dependencies

```
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install oracle-java8-installer
  sudo apt install oracle-java8-set-default
```

- Download: [`elasticsearch-5.2.1.tar.gz`](https://www.elastic.co/downloads/elasticsearch).
- Enter the extracted downloaded file.
- Run: `./bin/elasticsearch &`

## Install

```
    cd somewhere
    git clone https://github.com/Hellfar/picture_board.git
    cd picture_board
    bundle install
    rake db:create
    rake db:migrate
    rake db:seed

    rake searchkick:reindex
    rake jobs:work

    rails s -d
```
