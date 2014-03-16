import 'package:angular/angular.dart';

@NgController(selector: '[todo-list]', publishAs: 'TodoCtrl')
  
class TodoController {
  List<Todo> todos;
  String todoText;
  
  TodoController() {
    todos = [
      new Todo('learn angular dart', true),
      new Todo('build angular dart apps', false)
    ];
  }
  
  void addTodo() {
    todos.add(new Todo(todoText, false));
    todoText = '';
  }
  
  int remaining() {
    var count = 0;
    for (var i = 0; i < todos.length; i++) {
      count += todos[i].done ? 0 : 1;
    }
    return count;
  }
  
  void archive() {
    var oldTodos = todos;
    todos = [];
    for (var i = 0; i < oldTodos.length; i++) {
      if (!oldTodos[i].done)
        todos.add(oldTodos[i]);
    }
  }
}

class Todo {
  String text;
  bool done;
  
  Todo(this.text, this.done);
}

class TodoModule extends Module {
  TodoModule() {
    type(TodoController);
  }
}

void main() {
  ngBootstrap(module: new TodoModule());
}
