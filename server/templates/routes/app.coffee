module.exports = (models, helpers, config) ->
  @get '/hello/:name', (req, res) ->
    res.json { str: helpers.app.sayHello(req.params.name) }

  @get '/count', (req, res) ->
    models.count.findOne {}, (err, count) ->
      unless count
        count = new models.count({ visits: 0 })

      count.visits += 1
      count.save()

      res.json count.toJSON()
