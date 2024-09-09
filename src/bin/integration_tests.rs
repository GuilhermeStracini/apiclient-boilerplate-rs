use reqwest;
use tokio::time::Duration;
use wiremock::{Mock, MockServer, ResponseTemplate};
use apiclient_boilerplate_rust::client::ApiClient;

#[tokio::test]
async fn integration_test_apiclient_boilerplate_rust() {
    let mock_server = MockServer::start().await;
    let mock = Mock::given(wiremock::matchers::method("GET"))
        .and(wiremock::matchers::path("/posts/1"))
        .respond_with(ResponseTemplate::new(200).set_body_json(json!({
            "userId": 1,
            "id": 1,
            "title": "Test Post",
            "body": "This is a test post."
        })))
        .expect(1)
        .mount(&mock_server)
        .await;

    let base_url = mock_server.uri();
    let api_client = ApiClient::new(base_url);

    match api_client.get_post(1).await {
        Ok(post) => {
            assert_eq!(post.title, "Test Post");
        }
        Err(err) => {
            eprintln!("Error: {}", err);
            panic!("Test failed");
        }
    }

    mock.assert().await;
}
