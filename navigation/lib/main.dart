import 'package:flutter/material.dart';

class ToDo{
  final String title;
  final String description;

  ToDo(this.title, this.description);

}

void main (){
  runApp(MaterialApp(
   title: 'passing data',
   home: TodosScreen(todos: List.generate(20, (i) => ToDo('Todo $i', 'A description of what needs to be done for todo $i') )),
  ));
}
class TodosScreen extends StatelessWidget {
  final List<ToDo> todos;

  TodosScreen({ @required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('toDos'),

      ),
      body: ListView.builder(
        itemCount: todos.length,
          itemBuilder:(context, index){
          return ListTile(
            title:  Text(todos[index].title),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen(todo: todos[index])));
            },
          );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final ToDo todo;

  DetailScreen({@required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(todo.description),
      ),
      
    );
  }
}
