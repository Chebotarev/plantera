# Plantera - A Plant Collection Management Web Application

Plantera LLC presents a web-based application for users to manage their collection of plants and build a community.

## Local Installation

These instructions assume a Unix operating system (MacOS or Linux). For a Windows operating system, follow a [guide for setting up Ruby on Rails](https://gorails.com/setup/windows/10)

In order to run this application locally, the following libraries must be installed:

- ruby (version ~3.0.0)
- [bundler (version ~2.2.3)](https://rubygems.org/gems/bundler/versions/2.2.3)

To start the server on a locally:

1. Open a new terminal
2. Change directory to the root of the project
3. Install ruby dependencies through bundler:
```bash
bundle install
```
3. Create the database. Note: In development environments this uses Sqlite3, while in production the application relies on Postgres
```bash
rails db:create
```
4. Run migrations and seed database with some data:
```bash
rails db:migrate db:seed
```
5. Start the server. This process will run indefinitely and the server log messages will be output to the console.
```bash
rails s
```
6. Navigate to [localhost:3000](localhost:3000) to view the site


## Production Maintenance

The production deployment of Plantera is hosted through [Heroku](https://www.heroku.com/). This cloud interface provides access to manage the environment, database, server instance size and all other configurations. In order to manage this application, please request access from the owner of the Heroku project.
