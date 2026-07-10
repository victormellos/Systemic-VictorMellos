-- migration_produto_peca_origem.sql
-- Link opcional entre um produto da vitrine (`produtos`) e a peça do
-- estoque interno (`pecas`) que deu origem a ele, quando o funcionário
-- publica uma peça como produto.
--
-- Uma peça pode originar vários produtos (ex: mesma peça publicada com
-- preços diferentes em promoções distintas), por isso não há UNIQUE em
-- id_peca. Um produto só pode ter uma origem, por isso id_produto é UNIQUE.

USE oficina_db;

CREATE TABLE IF NOT EXISTS produto_peca_origem (
    id_produto INT NOT NULL,
    id_peca    INT NOT NULL,
    PRIMARY KEY (id_produto),
    CONSTRAINT fk_ppo_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos (id_produto)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_ppo_peca
        FOREIGN KEY (id_peca)
        REFERENCES pecas (id_peca)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
