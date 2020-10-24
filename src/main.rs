mod models {
    pub mod user;
    pub mod group;
    pub mod feed;
    pub mod source;
}

use actix_web::{get, App, HttpRequest, HttpServer, Responder};
use crate::models::user::User;
use crate::models::group::Group;
use crate::models::feed::Feed;
use crate::models::source::Source;
use uuid::Uuid;

#[get("/")]
async fn index(_req: HttpRequest) -> impl Responder {
    "Hello from the index page!"
}

#[get("users/{id}")]
async fn users() -> impl Responder {
    let my_uuid = Uuid::new_v4();
    User{
        id: my_uuid,
        username: "hejojack".to_string(),
        first_name: "henry".to_string(),
        last_name: "jackson".to_string(),
        feed_ids: vec![],
    }
}

#[get("/groups/{id}")]
async fn groups() -> impl Responder {
    let my_uuid = Uuid::new_v4();
    Group{
        id: my_uuid,
        name: "my_group".to_string(),
        feed_ids: vec![],
        members: vec![],
    }
}

#[get("/feeds/{id}")]
async fn feeds() -> impl Responder {
    let my_uuid = Uuid::new_v4();
    Feed{
        id: my_uuid,
        name: "my_feed".to_string(),
        source_ids: vec![],
    }
}

#[get("/sources/{id}")]
async fn sources() -> impl Responder {
    let my_uuid = Uuid::new_v4();
    Source{
        id: my_uuid,
        name: "my_feed".to_string(),
        source_type: "blog".to_string(),
        url: "website.com".to_string(),
        author: "robby".to_string(),
        description: "robby's tech blog".to_string(),
    }
}


#[actix_web::main]
async fn main() -> std::io::Result<()> {

    println!("Starting server on http://127.0.0.1:8080");

    HttpServer::new(|| {
        App::new()
            .service(index)
            .service(users)
            .service(groups)
            .service(feeds)
            .service(sources)
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}

