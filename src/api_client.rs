use reqwest;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
struct Post {
    userId: u32,
    id: u32,
    title: String,
    body: String,
}

pub struct ApiClient {
    base_url: String,
    client: reqwest::Client,
}

impl ApiClient {
    pub fn new(base_url: &str) -> Self {
        let client = reqwest::Client::new();
        ApiClient {
            base_url: base_url.to_string(),
            client,
        }
    }

    pub async fn get_post(&self, post_id: u32) -> Result<Post, reqwest::Error> {
        let url = format!("{}/posts/{}", self.base_url, post_id);
        let response = self.client.get(&url).send().await?;
        response.json().await
    }
}
