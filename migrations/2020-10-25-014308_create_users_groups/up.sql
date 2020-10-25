-- Your SQL goes here
CREATE TABLE IF NOT EXISTS users_groups (
    user_id uuid NOT NULL,
    group_id uuid NOT NULL,
    PRIMARY KEY (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE,
    FOREIGN KEY (group_id) REFERENCES groups(id)
        ON UPDATE CASCADE
);
