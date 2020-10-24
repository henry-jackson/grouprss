-- Your SQL goes here
CREATE TABLE users (
    id UUID PRIMARY KEY,
    username VARCHAR NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
)
