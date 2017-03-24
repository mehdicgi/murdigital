# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Création des paramètres'
puts Property.create(
    [
      {
        name: 'SMS_GATEWAY',
        value: '+33789002400,+33638764260'
      },
      {
        name: 'TWITTER_ACCOUNT',
        value: '@ITransilien'
      }
    ]
  )

puts 'Création des providers'
puts Provider.create(
    [
      {
        name: 'TWITTER',
        color: '#4099FF',
        picto: 'fa-twitter'
      },
      {
        name: 'SMS',
        color: '#009AA6',
        picto: 'fa-mobile'
      },
      {
        name: 'PEPPER',
        img_src: '/Pepper-Softbank3.jpg',
        color: '#009AA6'
      },
      {
        name: 'ADMIN',
        color: '#82BE00',
        picto: 'fa-lock'
      }
    ]
  )

puts 'Création des channels'
puts terrasse = Channel.create(name: 'TERRASSE')
puts cafet = Channel.create(name: 'CAFET')
puts pulseone = Channel.create(name: 'PULSE1')
puts pulsetwo = Channel.create(name: 'PULSE2')

puts 'Création des affichages'
puts Display.create(
    [
      {
        name: 'NUMA_PROJECTEUR',
        show_date: 1,
        show_from: 1,
        show_limit: 16,
        columns: 4,
        lines: 4,
        consigne: "Pour réagir au débat envoyer un SMS au {SMS_GATEWAY} ou un tweet @ITransilien avec le #Cafet"
      },
      {
        name: 'NUMA_MONITEUR',
        show_date: 1,
        show_from: 1,
        show_limit: 40,
        columns: 6,
        lines: 5,
        consigne: "Envoyez votre message au {SMS_GATEWAY} ou tweetez @ITransilien avec le #cafet"
      }
    ]
  )

puts 'Ajout des mot-cles'
puts Keyword.create(
  [
    {
      word: 'terasse',
      channel: terrasse
    },
    {
      word: 'terrase',
      channel: terrasse
    },
    {
      word: 'térrasse',
      channel: terrasse
    },
    {
      word: 'cafét',
      channel: cafet
    },
    {
      word: 'cafétéria',
      channel: cafet
    }
  ]
)

puts 'Création du message de Bienvenue'
puts Message.create(content:'Bienvenue sur le Mur Digital Transilien', author: 'Admin', provider_id:4)

Message.create!([
  {content: "Ce message va se créé 3 fois. Je vais faire une carte dans trello pour traiter ce point de #rec. Remarque ca me permet de tester l'affichage plus rapidement.", author: "Admin", provider_id: 4},
  {content: "un nouvel essai de #recette", author: "Admin", provider_id: 4},
  {content: "#Recette reproduction du bug 3 message créés", author: "Admin", provider_id: 4},
  {content: "Test message pour atteindre la limite du nombre de caractères. Lorem ipsum Quasi his quidam prim100. o ardenter ad r120. ectequeecteque delatum ad150 delatumd d cd 170.", author: "Admin", provider_id: 4},
  {content: "Coucou la recetteee", author: "david_yoteau", provider_id: 1},
  {content: "Test avec Pierre #terasse", author: "Admin", provider_id: 4},
  {content: "Test message pour atteindre la limite du nombre de caractères. Lorem ipsum Quasi his quidam prim100. o ardenter ad r120. ectequeecteque delatum ad150 recette d cd 170.", author: "Admin", provider_id: 4},
  {content: "test recette", author: "guillaume", provider_id: 1},
  {content: "Message pour channel supp", author: "Admin", provider_id: 4},
  {content: "Message 2 pour channel supp", author: "Admin", provider_id: 4},
  {content: "Salut transilien comment va la recette", author: "+33638764260", provider_id: 2},
  {content: "Salut transilien comment va la recette avec ce test d'affichage ", author: "Admin", provider_id: 4},
  {content: "salut recette", author: nil, provider_id: 2},
  {content: "Premier message test ", author: "Admin", provider_id: 4},
  {content: "Second message test de la longueur sur l'affichage en mode terrasse dans Manu", author: "Admin", provider_id: 4},
  {content: "Premier message test Yann ", author: "Admin", provider_id: 4},
  {content: "test1 ", author: "Admin", provider_id: 4},
  {content: "Pourquoi le message depassent de ma tuile?", author: "Admin", provider_id: 4},
  {content: "Test le plus long message du monde de Transilien au semi", author: "Admin", provider_id: 4},
  {content: "il faut creer une couleur différente en fonction de la source de mon message : Bleu tweet, bleu foncé SMS, bleu encore plus foncé pepper, vert admin. et les 160", author: "Admin", provider_id: 4},
  {content: "message 12", author: "Admin", provider_id: 4},
  {content: "message pour test affichage. sur le mur", author: "Admin", provider_id: 4},
  {content: "message 13", author: "Admin", provider_id: 4},
  {content: "message 14", author: "Admin", provider_id: 4},
  {content: "eh mais on s'eclate à creer tout ces messages", author: "Admin", provider_id: 4},
  {content: "message 15", author: "Admin", provider_id: 4},
  {content: "message 16", author: "Admin", provider_id: 4},
  {content: "et l'envoi de message par sms ou par tweet ne fonctionne pas ;-)", author: "Admin", provider_id: 4},
  {content: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20", author: "Admin", provider_id: 4},
  {content: "@ITransilien Salut l'equipe", author: "david_yoteau", provider_id: 1},
  {content: "cafet my dear", author: "Admin", provider_id: 4},
  {content: "@ITransilien Salut carnot", author: "david_yoteau", provider_id: 1},
  {content: "salut la cafet", author: "david", provider_id: 2},
  {content: "Test 574 cafet", author: "+33699607579", provider_id: 2},
  {content: "Coucou le séminaire, je viens d'arriver c'est trop bien!!!! #cafet", author: "+33631362536", provider_id: 2},
  {content: "message de l'admin #cafet", author: "Admin", provider_id: 4},
  {content: "Hey la cafet on va boire une bière?", author: "+33631362536", provider_id: 2},
  {content: "Aujourd'hui c'est le début de l'euro!! On se retrouve en terrasse!", author: "+33631362536", provider_id: 2},
  {content: "Salut la terrase c'est pepper!", author: "Guillaume", provider_id: 3},
  {content: "Salut la terrase c'est pepper!", author: "Guillaume", provider_id: 3},
  {content: "il faut creer une couleur différente en fonction de la source de mon message : Bleu tweet, bleu foncé SMS, bleu encore plus foncé pepper, vert admin. et les 160", author: "Guillaume", provider_id: 3},
  {content: "test message pour la terrase et la cafet avec un long message pour faire 2 tuiles et voir ce que cela donne", author: "Guillaume", provider_id: 3},
  {content: "test message pour la recette et la cafet avec un court message", author: "Guillaume", provider_id: 3},
  {content: "test message pour la recette et la cafet avec un court message", author: "Guillaume", provider_id: 1},
  {content: "a voir sur la recette si gestion des doubles tuiles est bonne ou non mais a priori cela ne se passe pas comme attendu", author: "Guillaume", provider_id: 1},
  {content: "@ITransilien Salut la térasse", author: "david_yoteau", provider_id: 1},
  {content: "@ITransilien Comment va la recette", author: "david_yoteau", provider_id: 1},
  {content: "@ITransilien On se retrouve à la cafet", author: "david_yoteau", provider_id: 1},
  {content: "@ITransilien Debut de l'euro! on se retrouve en terrasse !", author: "InnoTransilien", provider_id: 1},
  {content: "Salut la tablette", author: "+33789002400", provider_id: 2},
  {content: "@ITransilien Terrasse https://t.co/mhAtmeilix", author: "InnoTransilien", provider_id: 1},
  {content: "@ITransilien  bravo la terrasse https://t.co/7RipkT4MHK", author: "InnoTransilien", provider_id: 1},
  {content: "@ITransilien Salut l'equipe", author: "david_yoteau", provider_id: 1},
  {content: "@ITransilien bonjour la terrasse comment ca va?", author: "InnoTransilien", provider_id: 1},
  {content: "Salut la terrasse, belle victoire de la France, quelqu'un pour en parler???", author: "+33631362536", provider_id: 2},
  {content: "@ITransilien tweet sans mot clé", author: "InnoTransilien", provider_id: 1},
  {content: "Salut la terrase c'est pepper!", author: "Mathieu", provider_id: 3},
  {content: "Hello la terrasse", author: "+33631362536", provider_id: 2},
  {content: "@ITransilien test twwet pierre", author: "InnoTransilien", provider_id: 1},
  {content: "@ITransilien test pierre terrasse", author: "InnoTransilien", provider_id: 1}
])