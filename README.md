# 🗓 26-27ème jour - The Event Project

## 💎 Qu'est-ce donc ?
Une app **Ruby On Rails** de création d'événements du style d'Eventbrite, où tu pourras créer des événements, t'y inscrire, etc...

## Lien vers la version en production
<https://thp-event-project.herokuapp.com>

## ⚙ Installation
1. Clone ce repo (ou download-le)
2. Mets ton fichier .env à la racine (avec tes clés d'api pour sendgrid)
2. Place-toi dans le dossier et va dans ton magnifique terminal 😍 :
3. `$ bundle install` 
4. `$ rails db:create`
5. `$ rails db:migrate` 
6. `$ rails db:seed`

## 📁 Affichage des tables
1. `$ rails console`
2. `$ tp User.all`
3. `$ tp Event.all`
4. `$ tp Attendance.all`

## 🔗 Tester les associations

1. `$ rails console`
2. `$ Attendance.first.event.administrator.first_name` (va afficher le prénom de l'administrateur du premier event)
3. `$ Event.first.attendees` (va afficher les users qui participent au premier événement créé)
4. `$ User.first.events` (va afficher les événements créés par le premier user, s'il y en a)

## 📧 Tester les envois de mail
Créer un utilisateur dans la console :
* `$ felix = User.create(first_name:"Félix", last_name:"Lechat", description:"je suis un chat", email:"felix_le_chat@yopmail.com", encrypted_password:"123456")`

Créer un événement :
* `$ super_event = Event.create(title:"Soirée THP", description:"Viens boire des coups avec les moussaillons !", price:5, location:"Paris", start_date:"18/02/2019", duration:5, administrator_id:felix.id)`

Créer une participation
* `$ Attendance.create(stripe_customer_id:"453122334", event_id:super_event.id, attendee_id:User.all.sample.id)` 

Va voir les mails envoyés à felix_le_chat@yopmail.com sur <http://www.yopmail.com?felix_le_chat> (1 pour la création du user et 1 pour la création de la participation) !

Tu peux aller voir les emails envoyés par le seed ici : <http://www.yopmail.com?clodiap>


![event](https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F81%2Fe2%2F4c%2F81e24c8567ce0530fa3fb42f3bcc5ceb--teaching-memes-work-memes.jpg&f=1)


*Programme Ruby 💎 réalisé par **Claudia Partonnau** dans le cadre de la formation THP – The Hacking Project*.
