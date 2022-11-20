import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jarvis/models/models.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: StreamBuilder<Object>(
        stream: database.child('todos').onValue,
        builder: (context, snapshot) {
          List<Widget> todoList = [];
          if(snapshot.hasError){
            return const Center(child: Text("Error occurred"));
    }
          else{
            if(snapshot.hasData){
              var event = snapshot.data! as DatabaseEvent ;
              final todos = Map<String, dynamic>.from(event.snapshot.value as dynamic);
              todos.forEach((key, value) {
                final nextTodo = Todo.fromRTDB(Map<String, dynamic>.from(value));
                todoList.add(
                  ListTile(
                    title: Text(nextTodo.title!),

                  ),
                );
              });
              return CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    title: Text(
                      'Jarvis',
                      style: TextStyle(color: Colors.blue),
                    ),
                    expandedHeight: 200.0,
                    stretch: true,
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: [
                        StretchMode.fadeTitle,
                        StretchMode.blurBackground,
                      ],
                      background: Image(image: AssetImage("assets/images/back2.jpg"),),

                    ),

                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) => todoList[index],
                        childCount: todoList.length),),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
          }
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          setState(() {
            String? fireKey = database.child('todos').push().key;
             database.child('todos').child(fireKey!).update({
              'title': 'Hello Jarvis',
              'isDone': false,
            });
          });
        },
        tooltip: 'add todo',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){

          setState(() {
            activeIndex = index;
          });

        },
        currentIndex: activeIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.event_note),label: "reminders"),
          BottomNavigationBarItem(icon: Icon(Icons.explore),label: "Projects"),
        ],
      ),

    );
  }
}

