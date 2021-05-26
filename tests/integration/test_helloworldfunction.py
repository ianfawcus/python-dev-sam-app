import json
import boto3
import botocore

def test_helloworld():
    # Set "running_locally" flag if you are running the integration test locally
    # this requires local lambda to be running using 'sam local start-lambda'
    running_locally = True

    if running_locally:

        # Create Lambda SDK client to connect to appropriate Lambda endpoint
        lambda_client = boto3.client('lambda',
            region_name="eu-west-1",
            endpoint_url="http://127.0.0.1:3001",
            use_ssl=False,
            verify=False,
            config=botocore.client.Config(
                signature_version=botocore.UNSIGNED,
                read_timeout=10,
                retries={'max_attempts': 0},
            )
        )
    else:
        lambda_client = boto3.client('lambda')


    # Invoke your Lambda function as you normally usually do. The function will run
    # locally if it is configured to do so
    response = lambda_client.invoke(FunctionName="HelloWorldFunction")
    payload = json.loads(response["Payload"].read().decode('ascii'))

    # Verify the response
    assert payload["statusCode"] == 200
    messages = [
        'hello world',
        'top of the morning to ya',
        'word up sucka'
    ]
    assert json.loads(payload["body"])["message"] in messages