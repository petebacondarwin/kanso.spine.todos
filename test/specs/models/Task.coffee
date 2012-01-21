describe 'Task', ->
  Task = null
  
  beforeEach ->
    class Task extends Spine.Model
      @configure 'Task'
  
  it 'can noop', ->
    