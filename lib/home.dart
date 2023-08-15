import 'package:flutter/material.dart';
import 'package:todoapp/constrains/colours.dart';
import 'package:todoapp/drawer.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widgets/todo_item.dart';


class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo>_foundToDo=[];
  final _todoController=TextEditingController(
  );

  // This widget is the root of your application.
  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appDrawer(context),
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children:[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 100),
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        child: Text
                          (
                          'All To Do Lists',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for(ToDo todo in _foundToDo )
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem:_deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(
                  bottom:20,
                  right: 20,
                  left: 20
                ),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),],
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  cursorColor:Colors.black,
                  controller: _todoController,
                  decoration: InputDecoration(
                    hintText: 'Add ToDo Item',
                    border: InputBorder.none
                  ),
                ),
              ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20,right: 20
                ),
                child: ElevatedButton(
                 child: Text('+',style: TextStyle(fontSize: 40),),
                  onPressed: (){
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(60,60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          )
        ]

      ),
    );
  }
  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone=!todo.isDone;
    });
  }
  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

    void _addToDoItem(String toDo){
      setState(() {
        todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
        ));

      });
      _todoController.clear();
  }
  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }


  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),

      elevation: 0,
      // title:
      // title: Row(
      //   mainAxisAlignment:MainAxisAlignment.spaceBetween,
      //   children: [
      //   Icon(
      //     Icons.menu,
      //     color:tdBlack,
      //     size: 30,
      //   ),
      //   Container(
      //     height: 40,
      //     width: 40,
      //     child: ClipRect(
      //       child:Image.asset('assets/profile1.jpg') ,
      //     ),
      //   ),
      // ],),
    );
  }

  Widget searchBox() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        cursorColor: tdBlack,
        onChanged: (value)=>_runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25),
          border: InputBorder.none,
          hintText: 'search',
          hintStyle:TextStyle(
              color: tdGrey
          ),
        ),
      ),
    );
  }
}
