# Platform engineering challenge
> To be used in the live problem challenge

## Context

This code repository contains the blog rails app based on the [Getting Started with Rails guide](https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application).

## Problems

There are some improvements and bug fixes that can be made in:

- `Dockerfile`
- `docker-compose.yml`
- `.github/workflows/build.yml`
- The automation of repetitive tasks

## Tasks


### Containers

- [ ] Looking at the Dockerfile, how can we avoid busting the cache for the dependency update everytime we update the source code ?
- [ ] Ideally the image size for running in production should be less than 1GB (**bonus**)
- [ ] Use build arguments so we can use the same ruby version as defined in file `blog/.ruby-version` as opposed of an hardcoded image version
- [ ] Persist the database's data for future, so that when the service is stopped the data is not lost
- [ ] Check if the environment variables defined in the blog service are valid and match expected names/values in the rails database configuration `blog/config/database.yml`
- [ ] Once all services are started, ensure that database is created and has no pending migrations (can be done by using `bin/rake db:create db:migrate`) (**bonus**)
- [ ] Automate all repetitive tasks such as building the image, starting/stopping the services, run database migrations (**bonus**)
- [ ] Test that everything works by accessing the [blog app](http://localhost:3000/), creating an article, restarting all services, loading the article and deleting it afterwards (**bonus**)

### Continuous Deployment

Using `.github/workflows/build.yml`:

- [ ] Add the neccessary steps to tag the image based on the git commit hash
- [ ] Uploaded to AWS ECR using `000000000000.dkr.ecr.us-east-1.amazonaws.com/blog` as registry and github actions secrets `AWS_SECRET_ACCESS_KEY` and `AWS_ACCESS_KEY_ID`
- [ ] Add another job, that depends on the build job, which would call `kubectl` to set the image for the k8s deployment named `blog` (assume the kubectl config file exists locally with the name `k8s.config`)
- [ ] Alternatively, use the manifests under `kubernetes` to apply the change. There's a TAG placeholder that can be used in to replace with the actual commit hash.
- [ ] Add a step on this job that would monitor the deployment progress (**bonus**)

### Infra with terraform

Looking at the `infra` directory, databases are defined in `rds.tf`
In `monitor.tf` there are two resources with an imaginary type that define database monitors

- [ ] How can we simplify the change of values that keep repeating ?
- [ ] If we get a request to create 20 more databases, how can we avoid duplicating some of the code for the required 40 extra monitors ? (hint: we might want to adjust the values for each monitor)


### Kubernetes

Looking at the `kubernetes` directory we can see the definition of a deployment and a service

- [ ] What kubectl command would you use to create an HorizontalPodAutoscaler with 1 minimum and 20 max replicas triggered by a cpu usage threshold of 70% ?
- [ ] Assuming the subdomain `blog.info` how would you expose this application to the world ?
- [ ] Write the necessary configuration manifest to make it happen
