import 'package:flutter/material.dart';
import 'package:todo_app/style.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List ToDoList = [];
  String item = "";

  MyInputOnChange(content) {
    setState(() {
      item = content;
    });
  }

  AddItem() {
    setState(() {
      ToDoList.add({'item=': item});
    });
  }

  RemoveItem(index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 70,
                        child: TextFormField(
                          onChanged: (content) {
                            MyInputOnChange(content);
                          },
                          decoration: AppInputDecoration("List Item"),
                        )),
                    Expanded(
                      flex: 30,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            AddItem();
                          },
                          child: Text('Add'),
                          style: AppButtonStyle(),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 90,
              child: ListView.builder(
                  itemCount: ToDoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: sizedBox50(Row(
                        children: [
                          Expanded(
                              flex: 80,
                              child: Text(ToDoList[index]['item'].toString())),
                          Expanded(
                            flex: 20,
                            child: TextButton(
                                onPressed: () {
                                  RemoveItem(index);
                                },
                                child: Icon(Icons.delete)),
                          ),
                        ],
                      )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
