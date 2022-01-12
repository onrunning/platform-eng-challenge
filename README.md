# Platform engineering challenge
> To be used in the technical task

## Context

This code repository contains the blog rails app based on the [Getting Started with Rails guide](https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application).

## Requirements

The rails app was setup using:
- ruby 2.7.3p183 (2021-04-05 revision 6847ee089d) [x86_64-linux]
- Rails 7.0.1
- Node v14.18.3
- Yarn 1.22.17
- Postgresql as a database engine. Tested with version 13.2

## Delivery

- Fork this repository
- Work on the solution
- Send us the link to your repository

## Objective

- Containerise the application
- Orchestrate its execution with a compatible database engine
- Make it locally accessible in http://localhost:3000/
- Provide some basic automated way of operate it (start, stop, run database migration, etc)
- Document, under `/docs`, any instructions required to setup or run the solution locally
- Create CI and build pipelines using github actions
- Using terraform, describe some basic infrastructure, under `/infra` where we would run the workloads at scale
- If possible provide some CD pipeline that would automate deployment after a pull request would be merged into the default branch
- Under `/docs` describe how would you handle scalability, security, logging, and monitoring
