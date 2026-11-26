-- Sélectionner une requête à la fois dans pgAdmin.

-- Afficher les clients.
SELECT id, nom, email, ville
FROM ventes.clients
ORDER BY id;

-- Afficher les clients de Bordeaux.
SELECT nom, email
FROM ventes.clients
WHERE ville = 'Bordeaux'
ORDER BY nom;

-- Afficher les produits du plus cher au moins cher.
SELECT nom, prix, stock
FROM ventes.produits
ORDER BY prix DESC;

-- Afficher les commandes avec le nom du client.
SELECT
    co.id AS numero_commande,
    cl.nom AS client,
    co.date_commande,
    co.statut
FROM ventes.commandes AS co
JOIN ventes.clients AS cl
    ON cl.id = co.client_id
ORDER BY co.id;

-- Calculer le montant de chaque commande.
SELECT
    co.id AS numero_commande,
    cl.nom AS client,
    SUM(lc.quantite * lc.prix_unitaire) AS montant
FROM ventes.commandes AS co
JOIN ventes.clients AS cl
    ON cl.id = co.client_id
JOIN ventes.lignes_commande AS lc
    ON lc.commande_id = co.id
GROUP BY co.id, cl.nom
ORDER BY co.id;

-- Mini-exercice : afficher les produits dont le stock est inférieur à 35.
SELECT nom, stock
FROM ventes.produits
WHERE stock < 35
ORDER BY nom;
