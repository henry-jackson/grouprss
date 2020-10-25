use actix_web::{Error, HttpRequest, HttpResponse, Responder};
use serde::{Serialize, Deserialize};
use futures::future::{ready, Ready};
use uuid::Uuid;

#[derive(Serialize, Deserialize)]
pub struct Feed {
    pub id: Uuid,
    pub user_id: Uuid,
    pub name: String,
    pub source_ids: Vec<Uuid>,
}

impl Responder for Feed {
    type Error = Error;
    type Future = Ready<Result<HttpResponse, Error>>;

    fn respond_to(self, _req: &HttpRequest) -> Self::Future {
        let body = serde_json::to_string(&self).unwrap();

        // Create response and set content type
        ready(Ok(HttpResponse::Ok()
            .content_type("application/json")
            .body(body)))
    }
}
