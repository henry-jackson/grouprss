-- Your SQL goes here
CREATE TABLE IF NOT EXISTS feeds (
    id uuid DEFAULT uuid_generate_v4 (),
    user_id uuid,
    group_id uuid,
    name VARCHAR NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
            REFERENCES users(id)
            ON DELETE CASCADE,
    CONSTRAINT fk_group
        FOREIGN KEY (group_id)
            REFERENCES groups(id)
            ON DELETE CASCADE
);
