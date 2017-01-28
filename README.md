# About
This is a docker containerized version of [gitrob](https://github.com/michenriksen/gitrob).

# Installation
1. You need [Docker-Compose](https://docs.docker.com/compose/) installed, following this will install Docker if you don't already have that.
2. You need a Github Access Token, per @michenriksen's instructions:
```
> "Gitrob works by querying the [GitHub API](https://developer.github.com/v3/) for interesting information, so you need at least one access token to get up and running. The easiest way is to create a [Personal Access Token](https://github.com/settings/tokens). Press the `Generate new token` button and give the token a description. If you intend on using Gitrob against organizations you're not a member of you don't need to give the token any scopes, as we will only be accessing public data. If you intend to run Gitrob against your own organization, you'll need to check the `read:org` scope to get full coverage.
If you plan on using Gitrob extensively or against a very large organization, it might be necessary to have multiple access tokens to avoid running into rate limiting. These access tokens will have to be from different user accounts."
```
3. Clone this repo, `git clone `
4. Configure `data/.gitrobrc` with your token and creds (if you have changed them)

# Usage

To fire up the instance, run:
```
docker-compose -d up
```
This needs to be ran from the project directory (i.e. where you .yaml file lives). This automatically launches the server locally on port 9393.

If you wish to run commands via command line,then simply run the commands appended to `docker-compose run`, like so:
```
docker-compose run web analyze acme
```
Where:
* run - instructs the "web" container
* analyze - per gitrob documentation analyzes at target

## Todo
* Document steps for saving the database
* Add the ability to add custom signatures as featured as part of the original project
