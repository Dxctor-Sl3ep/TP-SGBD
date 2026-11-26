BEGIN;

CREATE SCHEMA ventes;

CREATE TABLE ventes.clients (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT clients_email_unique UNIQUE (email)
);

CREATE TABLE ventes.produits (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(150) NOT NULL,
    prix NUMERIC(10, 2) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT produits_prix_positif CHECK (prix >= 0),
    CONSTRAINT produits_stock_positif CHECK (stock >= 0)
);

CREATE TABLE ventes.commandes (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id INTEGER NOT NULL,
    date_commande TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    statut VARCHAR(20) NOT NULL DEFAULT 'en_attente',
    CONSTRAINT commandes_client_fk
        FOREIGN KEY (client_id)
        REFERENCES ventes.clients(id),
    CONSTRAINT commandes_statut_valide
        CHECK (statut IN ('en_attente', 'validee', 'expediee', 'annulee'))
);

CREATE TABLE ventes.lignes_commande (
    commande_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    prix_unitaire NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (commande_id, produit_id),
    CONSTRAINT lignes_commande_fk
        FOREIGN KEY (commande_id)
        REFERENCES ventes.commandes(id),
    CONSTRAINT lignes_produit_fk
        FOREIGN KEY (produit_id)
        REFERENCES ventes.produits(id),
    CONSTRAINT lignes_quantite_positive CHECK (quantite > 0),
    CONSTRAINT lignes_prix_positif CHECK (prix_unitaire >= 0)
);

COMMIT;
