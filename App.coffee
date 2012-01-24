require('lib/setup')

Task = require('models/Task')
TaskController = require('controllers/TaskController')

class TaskApp extends Spine.Controller
  events:
    "submit form":   "create"
    "click  .clear": "clear"

  elements:
    ".items":     "items"
    ".countVal":  "count"
    ".clear":     "clear"
    "form input": "input"
  
  constructor: ->
    super

    @render()

    Task.bind("create",  @addOne)
    Task.bind("refresh", @addAll)
    Task.bind("refresh change", @renderCount)
    Task.fetch()


  render: ->
    @html require('views/App')()
  
  addOne: (task) =>
    controller = new TaskController(item: task)
    @items.append(controller.render())
  
  addAll: =>
    Task.each(@addOne)

  create: (e) ->
    e.preventDefault()
    Task.create(name: @input.val())
    @input.val("")
  
  clear: ->
    Task.destroyCompletedTasks()
  
  renderCount: =>
    active = Task.activeTasks().length
    @count.text(active)
    
    completedTasks = Task.completedTasks().length
    if completedTasks
      @clear.show()
    else
      @clear.hide()

module.exports = TaskApp