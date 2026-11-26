BEGIN;

INSERT INTO ventes.clients (nom, email, ville)
VALUES
    ('Alice Martin', 'alice@example.com', 'Bordeaux'),
    ('Bob Bernard', 'bob@example.com', 'Paris'),
    ('Charlie Robert', 'charlie@example.com', 'Lyon'),
    ('Diana Petit', 'diana@example.com', 'Bordeaux'),
    ('Emma Durand', 'emma@example.com', 'Nantes');

INSERT INTO ventes.produits (nom, prix, stock)
VALUES
    ('Clavier', 49.90, 40),
    ('Souris', 24.90, 80),
    ('Ecran 24 pouces', 189.90, 25),
    ('Station USB-C', 89.90, 30),
    ('Casque audio', 39.90, 50);

INSERT INTO ventes.commandes (client_id, statut)
VALUES
    (1, 'validee'),
    (2, 'expediee'),
    (1, 'en_attente'),
    (3, 'validee');

INSERT INTO ventes.lignes_commande
    (commande_id, produit_id, quantite, prix_unitaire)
VALUES
    (1, 1, 1, 49.90),
    (1, 2, 2, 24.90),
    (2, 3, 1, 189.90),
    (3, 4, 1, 89.90),
    (3, 2, 1, 24.90),
    (4, 5, 2, 39.90);

COMMIT;

SELECT 'clients' AS table_nom, COUNT(*) AS nombre
FROM ventes.clients
UNION ALL
SELECT 'produits', COUNT(*)
FROM ventes.produits
UNION ALL
SELECT 'commandes', COUNT(*)
FROM ventes.commandes
UNION ALL
SELECT 'lignes_commande', COUNT(*)
FROM ventes.lignes_commande;
