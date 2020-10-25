-- Your SQL goes here
CREATE TABLE IF NOT EXISTS sources (
    id uuid DEFAULT uuid_generate_v4 (),
    name VARCHAR NOT NULL,
    source_type VARCHAR NOT NULL,
    url VARCHAR NOT NULL,
    author VARCHAR NOT NULL,
    description VARCHAR,
    PRIMARY KEY (id),
);
