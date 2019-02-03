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

!!!Wont work with Elasticsearch 6!!!

## Install

```
    cd somewhere
    git clone https://github.com/Hellfar/picture_board.git
    cd picture_board
    bundle install
    rake db:create
    rake db:migrate
    rake db:seed

    rake searchkick:reindex CLASS=Offer
    rake jobs:work &

    rails s -d
```

## Statement (in FR)

Test technique Ruby On Rails *********** :
- Vues : html.erb
- Authentification: Devise
- Permissions : CanCanCan
- Background Jobs : delayed_jobs
- Recherche : ElasticSearch ou SearchKick
- Upload d’images : CarrierWave

Scénario d’utilisation:  
Un utilisateur doit pouvoir:
- S’inscrire via un combo login/password/password-confirmation
- Se logger via un combo login/password, après un login réussit l’utilisateur doit atterrir sur un moteur
de recherche d’images.
- Recherche une image par nom via un moteur de recherche simpliste
- Consulter cette image via un bouton “Consulter"
- Reserver cette image via un bouton “Reserver”
Contraintes:
- Le fichier db/seed.rb doit remplir la base de données d’images et lancer l’indexation du moteur de
recherche lors du premier déploiement.
- Une fois une image réservée, l’image ne doit plus être visible dans le moteur de recherche.
- Une fois une image réservée, elle ne doit pas être visible ou consultable (encore moins réservable)
par un autre utilisateur.
- L’image doit être réservée pour 24h, à l’issue de ce temps elle reprend un comportement pré-
réservation.
Le code doit être disponible sur un github public à la convenance du candidat, un README.md
expliquant comment déployer l'app est un plus, les tests unitaires des models sont fortement conseillés.
