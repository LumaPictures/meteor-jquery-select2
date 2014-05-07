environment = process.env.METEOR_ENV or "development"

defaults =
  public:
    package:
      name: "jquery-select2"
      description: "A Blaze UI select2 component that supports reactive search."
      owner: "LumaPictures"
      repo: "meteor-jquery-select2"
      absoluteUrl: Meteor.absoluteUrl()
  private: {}

settings =
  development:
    public: _.defaults {}, defaults.public
    private:_.defaults {}, defaults.private

  staging:
    public: _.defaults {}, defaults.public
    private: _.defaults {}, defaults.private

  production:
    public: _.defaults {}, defaults.public
    private: _.defaults {}, defaults.private

unless process.env.METEOR_SETTINGS
  console.log "No METEOR_SETTINGS passed in, using locally defined settings."
  if environment is "production"
    Meteor.settings = settings.production
  else if environment is "staging"
    Meteor.settings = settings.staging
  else
    Meteor.settings = settings.development

  # Push a subset of settings to the client.
  __meteor_runtime_config__.PUBLIC_SETTINGS = Meteor.settings.public  if Meteor.settings and Meteor.settings.public
  console.log "Using [ #{ environment } ] Meteor.settings"
  console.log Meteor.settings