-- Your SQL goes here
CREATE TABLE IF NOT EXISTS groups (
    id uuid DEFAULT uuid_generate_v4 (),
    name VARCHAR NOT NULL,
    PRIMARY KEY (id)
);
