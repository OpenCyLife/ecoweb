title=EcoWeb
date=2019-03-01
type=org_openCiLife_project
tags=Eco-conception
status=published
contentImage=images/project/no_image.png
exerpt=Créez un site Web avec la durabilité à l'esprit : Réduire l'empreinte carbone
projectStatus=prototypage
owner=Open Cy Life
members=Jérémie D, Frédéric L
order=005
~~~~~~

## Objectif
Fournir des "templates" pour faciliter la création de site web lèger, éco-conçut et facile à (auto)héberger.

## Pourquoi
Pour permettre aux très nombreux "petits site" de ne pas être obligé de passer par des technologies, inutilement, gourmanded en ressources (Wordpress, Winx,...)

## Comment
Pour le moment le projet se base sur le princiep de "generation statique de site Web". Au lieu de générer une page web a chaque demande du naviguateur, la page est génèrée une seul fois et seul la page HTML doit être envoyée au naviguateur sans traitement coé serveur.

Eco-Web utilise actuellement [JBake](https://jbake.org/) pour la génération du site. Cet outil permet de clairement séparer les **contenus** et les **template**. Chaque contenu va (simplement) indiquer quel template doit être utilisé pour etre généré. Pour le moment le format des contenus proposé est MarkDown, mais d'autre formats sont suporté par JBake. Les template sont ecris en [FreeMarker](https://freemarker.apache.org/).

## Réalisation(s)
Le site d'Open Cy Life utilises se framework (enfin très bientot).

## Source
Le "framework" est entièrement libre et co-construit, il est disponible ici : [https://github.com/OpenCyLife/ecoweb](https://github.com/OpenCyLife/ecoweb)

