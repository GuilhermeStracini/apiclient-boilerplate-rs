mod api_client;

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    // Create an instance of the API client
    let api_client = api_client::ApiClient::new("https://jsonplaceholder.typicode.com");

    // Example: Get a post by ID
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
