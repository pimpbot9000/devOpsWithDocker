# Excercise 3.2

See a link to another [repo](https://github.com/pimpbot9000/4-ratikka-service). There's CircleCI than runs lint, tests and finally pushes the project to Heroku.

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
  
  test:
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
      - run: npm run test
  

workflows:
  lint_and_test:
    jobs:
      - eslint 
      - test        
      - docker/publish:
            image: pimpbot9000/4-tram-service
            tag: 'latest'
      - heroku/deploy-via-git:
            requires:
              - docker/publish
              - test
            filters:
              branches:
                only: master
```

There's also a ```heroku.yml``` to tell Heroku what to actually do with all that stuff pushed there.
