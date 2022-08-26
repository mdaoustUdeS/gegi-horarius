# gegi-horarius

## Problème

L'horaire sur horarius est souvent mis à jour, mais ne peux pas savoir ce qui est mis à jour, ni à quel moment.

## Solution

`curl` l'horaire au complet à toutes les heures, commit lorsqu'il y a des changements et utiliser le flux `Atom` des commit comme source de notification!

## Fonctionnalités

- Notification avec le flux `Atom` des commit: https://github.com/mdaoustUdeS/gegi-horarius/commits.atom
- Changements lorsque les groupes de tutorat sont connu (horarius retire les événements qui ne sont plus pertinent)
- Changements lisibles dans un CSV pour les propriétés:
  - Heure de début et de fin (`DTSTART` et `DTEND`)
  - Local (`LOCATION`)
  - Titre ou description (`SUMMARY` et `DESCRIPTION`)

## Collaboration

N'hésitez pas à suggérer des idées d'améliorations!

## Développement

Pour utiliser le projet avec GitHub action, vous devez créer le secret de GitHub action `HORARIUS_KEY` (qui contient tout les caractères après la partie `?key=` de l'URL ical d'horarius).

Si vous souhaitez utiliser un fichier `.ics` qui n'est pas sur horarius, vous pouvez modifier l'URL dans le fichier [/getUrls.sh](/getUrls.sh).
