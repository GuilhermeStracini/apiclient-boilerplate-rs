extern crate apiclient_rust;

use apiclient_rust::ApiClient;

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    let api_client = ApiClient::new("https://jsonplaceholder.typicode.com");

    match api_client.get_post(1).await {
        Ok(post) => {
            println!("Post: {:?}", post);
        }
        Err(err) => {
            eprintln!("Error: {}", err);
        }
    }

    Ok(())
}
