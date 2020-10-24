use actix_web::{Error, HttpRequest, HttpResponse, Responder};
use serde::{Serialize, Deserialize};
use futures::future::{ready, Ready};
use uuid::Uuid;

#[derive(Serialize, Deserialize)]
pub struct Source {
    pub id: Uuid,
    pub name: String,
    pub source_type: String,
    pub url: String,
    pub author: String,
    pub description: String,
}

impl Responder for Source {
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
