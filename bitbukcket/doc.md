## connect to aws ec2 using pipeline
First of all, you need the .pem file that you use to connect to ec2 instance via ssh and a Linux machine. As you can see this is an RSA file and the SSH_KEY needs base64 encoded private key as required by the ssh-run pipe.
To convert this pem file to private key, use this Linux command
```$ openssl pkcs8 -in test.pem -topk8 -nocrypt -out pvtest.pem```
Now that you have the private key, you can use any [online tool](https://www.base64encode.org/) to convert the private key file to base64 encoded string which looks like random characters ending with a =

Note: Don't forget to include the first line containing -----BEGIN PRIVATE KEY----- and the last line containing -----END PRIVATE KEY----- while encoding the file in base64.

#### demo
```
image: node:10.15.3

pipelines:
  custom:
    build-and-deploy-to-dev:
      - step:
          deployment: Test
          script:
            - docker build ./ -t $AWS_ECR_REPOSITORY --build-arg ENV=dev
            - pipe: "atlassian/aws-ecr-push-image:1.1.0"
              variables:
                  AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
                  AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
                  AWS_DEFAULT_REGION: $AWS_DEFAULT_REGION
                  IMAGE_NAME: $AWS_ECR_REPOSITORY
            - pipe: "atlassian/ssh-run:0.2.4"
              variables:
                  SSH_USER: ec2-user
                  SERVER: $SERVER_IP
                  SSH_KEY: $SSH_KEY
                  MODE: script
                  COMMAND: demo-repo-container-script.sh
