CREATE SCHEMA if not exists catalog;

USE catalog;

CREATE TABLE IF NOT exists categories (
      id            BIGINT PRIMARY KEY AUTO_INCREMENT,
      name          VARCHAR(50)    NOT NULL UNIQUE,
      description   TEXT,
      created_at    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
      updated_at    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP
          ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT exists supplies (
    id            BIGINT PRIMARY KEY AUTO_INCREMENT,
    title         VARCHAR(255)   NOT NULL,
    isbn          VARCHAR(13)    NOT NULL UNIQUE,
    description   TEXT,
    author        VARCHAR(100)   NOT NULL,
    format        ENUM('PHYSICAL','DIGITAL_PDF','DIGITAL_EPUB') NOT NULL,
    price         DECIMAL(10,2)  NOT NULL,
    discount_pct  DECIMAL(5,2)   NOT NULL DEFAULT 0.00,
    stock         INT            NOT NULL DEFAULT 0,
    file_url      VARCHAR(500),          -- NULL si es físico
    average_rating DECIMAL(3,2)  NOT NULL DEFAULT 0.00, -- cada vez que se agrega una reseña, se debe recalcular el promedio
    review_count   INT           NOT NULL DEFAULT 0,
    is_active     BOOLEAN        NOT NULL DEFAULT TRUE,
    created_at    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT exists reviews (
   id            BIGINT PRIMARY KEY AUTO_INCREMENT,
   book_id       BIGINT         NOT NULL,
   rating        DECIMAL(3,2)   NOT NULL CHECK (rating >= 0 AND rating <= 5),
   comment       TEXT,
   user_id       BIGINT         NOT NULL,
   created_at    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

   UNIQUE (book_id, user_id),  -- un usuario, una reseña por libro
   CONSTRAINT fk_reviews_book_id
       FOREIGN KEY (book_id) REFERENCES supplies (id)
           ON DELETE CASCADE ON UPDATE CASCADE
);


-- tabla para almacenar especificaciones de cada libro (ej: número de páginas, idioma, dimensiones, published_at, etc.)
CREATE TABLE IF NOT exists specs (
     id BIGINT NOT NULL AUTO_INCREMENT,
     supply_id BIGINT NOT NULL,
     spec_key VARCHAR(100) NOT NULL,
     spec_value VARCHAR(255),
     PRIMARY KEY (id),
     CONSTRAINT fk_supply_spec_supply_id
         FOREIGN KEY (supply_id) REFERENCES supplies(id)
             ON DELETE CASCADE ON UPDATE CASCADE,
     CONSTRAINT uk_supply_spec_unique
         UNIQUE (supply_id, spec_key)
);

CREATE TABLE IF NOT exists images (
      id BIGINT NOT NULL AUTO_INCREMENT,
      supply_id BIGINT NOT NULL,
      image_url VARCHAR(500) NOT NULL,
      PRIMARY KEY (id),
      CONSTRAINT fk_supply_image_supply_id
          FOREIGN KEY (supply_id) REFERENCES supplies(id)
              ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT exists supply_category
(
    supply_id     BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    PRIMARY KEY (supply_id, category_id),
    CONSTRAINT fk_book_category_supply_id
    FOREIGN KEY (supply_id) REFERENCES supplies (id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_supply_category_category_id
    FOREIGN KEY (category_id) REFERENCES categories (id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
