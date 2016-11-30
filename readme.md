# Neptunes Pride Pager Duty

Uses [Prowl](https://www.prowlapp.com/) to send push notifications to your iOS
device.

### Required ENV Vars

`PROWL_KEY` - Prowl app API key (paid for iOS app)
`REDIS_URL` - Redis URL (free heroku redis dev addon)
`PLAYER_ID` - Your Neptunes Pride player ID
`GAME_ID` - Neptunes Pride game ID
`AUTH` - Neptunes Pride auth cookie (aquired using Chrome's dev tools)

## Usage

Ruby the `app.rb` file to query the NP API and send attack alerts:

```ruby
ruby app.rb
```

To acknowledge an attack and stop notifications:

```ruby
irb

> require './boot'
> NP::Attack.acknowledge("{{CODE}}")
>
> # Example
> # NP::Attack.acknowledge("201-19-236")
```

## Deploy

Deploy to heroku with env vars and redis:

```bash
heroku create np-app
git push heroku master
```

Set up scheduled job addon and run `ruby app.rb` every 10 mins.

