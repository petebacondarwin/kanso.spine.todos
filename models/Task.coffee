Spine = require('spine/core')
require('spine-adapter/couch-ajax')

class Task extends Spine.Model
  @configure "Task", "name", "done"

  @extend Spine.Model.CouchAjax

  @activeTasks: ->
    @select (item) -> !item.done

  @completedTasks: ->
    @select (item) -> !!item.done

  @destroyCompletedTasks: ->
    rec.destroy() for rec in @completedTasks()

module.exports = Task

