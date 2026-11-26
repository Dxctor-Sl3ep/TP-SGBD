Question 1 : Un conteneur démarré garantit-il que son service est prêt à recevoir des connexions ?

Non, le conteneur peut très bien être démaré sans que le service sois fonctionnel dessus 

Question 2 : Pourquoi conserver prix_unitaire dans une ligne de commande alors que le produit possède déjà un prix ?

Pour pouvoir effectuer des test 

Mini-exercice 1 : Écrire une requête qui affiche uniquement les produits dont le stock est inférieur à 35.

SELECT * FROM stock WHERE stock.num <35

Mini-exercice 2 :
SELECT
    co.id
    ventes.commandes
FROM ventes.client as cl
WHERE cl.email = 'farid@example.com'
ADD 2 clavier(by id)  Where price = 49.90
CHECK ventes.commandes == 98.80


Question 3 : Pourquoi une base contenant quelques lignes occupe-t-elle davantage que la seule taille du texte saisi ?

Poids de requetes > nombres de requetes

Questions de compréhensions :
1.Quelle différence existe entre PostgreSQL et pgAdmin ?
PostgreSQL est la base de donée, pgAdmin est la page web pour "gerer" la base de donée

2.Quelle différence existe entre une base, un schéma et une table ?
Une base peut contenir plusieurs schéma, les schéma peuvent contenir plusieurs tables avec des relations entre elles, et les tables sont les zones ou sont stocké et parser les donées

3.Pourquoi pgAdmin utilise-t-il postgres comme adresse du serveur ?


4.À quoi sert une clé primaire ?
Identifiant d'une table

5.Quel problème une clé étrangère permet-elle d’éviter ?
relation entre les tables (la duplication d'une information dans la table x et y )

6.Pourquoi associer NOT NULL et CHECK sur le prix ?
être sur d'avoir une valeur et pas d'injection SQL avec valeur <0

Pourquoi conserver le prix de vente dans la ligne de commande ?
Quelle différence existe entre COMMIT et ROLLBACK ?
Pourquoi les données survivent-elles à la recréation des conteneurs ?
Pourquoi un volume Docker ne remplace-t-il pas une sauvegarde ?
