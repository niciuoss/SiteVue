stages:
  - build
  - deploy

build-frontend:main:
  stage: build
  tags:
    - node
  only:
    - main
  cache:
    paths:
    - frontend/node_modules/
  script:
    - 'cd frontend'
    - 'yarn version'
    - 'yarn install'
    - 'yarn vite build'
  artifacts:
    expire_in: 1 day
    paths:
      - frontend/dist

deploy:
  stage: deploy
  needs:
    - job: build-frontend:main
      artifacts: true
  when: manual
  tags:
    - deploy
  only:
    - main
  environment:
    name: prod
    url: https://telite.quixada.ufc.br
    on_stop: undeploy
  script:
    - 'docker-compose up --build -d'

undeploy:
  stage: deploy
  when: manual
  dependencies:
    - build-frontend:main
  only:
    - main
  tags:
    - deploy
  script:
    - 'docker-compose down'
  environment:
    name: prod
    action: stop
