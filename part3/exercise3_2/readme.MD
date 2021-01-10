#Excercise 3.2

See a link to another [repo](https://github.com/pimpbot9000/4-ratikka-service). There's CircleCI than runs the eslint (and only lint because there are no tests :P), 
builds and pushes the image in DockerHub and deploys the whole shabang to Heroku.

The ```config.yml``` for **CircleCI**.

```
version: 2.1
orbs:
  docker: circleci/docker@1.5.0
  heroku: circleci/heroku@1.2.4

jobs:  
  eslint:
    docker:
      - image: cimg/node:14.10.1
        auth:
          username: $DOCKER_LOGIN
          password: $DOCKER_PASSWORD
    steps:
      - checkout
      - run: echo "running my CI/CD"
      - run:
          name: Install dependencies
          command: npm install
      - run: npm run lint  

workflows:
  lint_and_test:
    jobs:
      - eslint          
      - docker/publish:
            image: pimpbot9000/4-tram-service
            tag: 'latest'
      - heroku/deploy-via-git:            
            filters:
              branches:
                only: master

```

There's also a ```heroku.yml``` to tell Heroku what to actually do with all that stuff pushed there.
