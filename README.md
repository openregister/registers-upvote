# GOV.UK Register Upvote

## Firebreak - Q3-Q4 17/18

**A page that includes options to:**
- express interest as a potential data source - provide contact details to the GOV.UK Registers Team (not public)
- express interest as a potential user (publicly visible as a +1 for that register)
- provide contact details & service description/link/name to GOV.UK Registers Team (not public)

## Setting up development environment

Install gems

```
bundle install
```

Setup database

```
rake db:create
rake db:migrate
```

Add some data

```
rails db:seed
```

Run the application

```
rails server
```

## Licence

Unless stated otherwise, the codebase is released under [the MIT licence](./LICENSE).

The data is [© Crown copyright](http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/) and available under the terms of the [Open Government 3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) licence.
