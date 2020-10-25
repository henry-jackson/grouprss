-- Your SQL goes here
CREATE TABLE IF NOT EXISTS feeds_sources (
    feed_id uuid NOT NULL,
    source_id uuid NOT NULL,
    PRIMARY KEY (feed_id, source_id),
    FOREIGN KEY (feed_id) REFERENCES feeds(id)
        ON UPDATE CASCADE,
    FOREIGN KEY (source_id) REFERENCES sources(id)
        ON UPDATE CASCADE
);
