// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:note_app/dummy_db.dart';
import 'package:note_app/view/note_screen/widgets/note_card.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int selectedColor=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        floatingActionButton: FloatingActionButton(onPressed: (){
          titleController.clear();
          descController.clear();
          dateController.clear;
          selectedColor=0;
          customButtomSheet(context);
        },
        child: Icon(Icons.add,),),
        body: ListView.separated(
          padding: EdgeInsets.all(15),
          itemBuilder: (context, index) => NoteCard(
            noteColor: DummyDb.noteColors[DummyDb.notesList[index]["colorIndex"]],
            title:  DummyDb.notesList[index]["title"],
            date: DummyDb.notesList[index]["desc"],
            desc: DummyDb.notesList[index]["date"],

            onDelete: (){
              DummyDb.notesList.removeAt(index);
              setState(() {
                
              });
            },

            onEdit: (){
              titleController.text= DummyDb.notesList[index]["title"];
              descController.text= DummyDb.notesList[index]["desc"];
              dateController.text=   DummyDb.notesList[index]["date"];
              selectedColor=DummyDb.notesList[index]["colorIndex"];

              customButtomSheet(context,isEdit: true, itemindex:index);
            },
          ), separatorBuilder:(context, index) => 
         SizedBox(height: 10,), itemCount:DummyDb.notesList.length)
      ),
    );
  }

  Future<dynamic> customButtomSheet(BuildContext context,{bool isEdit=false, int? itemindex}) {
    return showModalBottomSheet(
          isScrollControlled: true,
          context: context, builder: (context) => Padding(
            padding: const EdgeInsets.all(20),
            child: Padding(
              padding:  EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: "TITLE",
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: descController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "description",
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: "date",
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  StatefulBuilder(builder: (context, setColorState) =>  Row(children: 
                    List.generate(DummyDb.noteColors.length, (index) => Expanded(
                      child: InkWell(
                        onTap: (){
                          selectedColor=index;
                          setColorState(() {
                            
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 50,
                          decoration: BoxDecoration(
                            border: selectedColor==index?Border.all(width: 3):null,
                            borderRadius: BorderRadius.circular(10),
                            color: DummyDb.noteColors[index],
                          ),
                        ),
                      ),
                    ),)
                  ),),
                 
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("cancel",
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            isEdit==true? DummyDb.notesList[itemindex!]={
                               "title":titleController.text,
                              "desc":descController.text,
                              "date":dateController.text,
                               "colorIndex":selectedColor,
                            }
                           : DummyDb.notesList.add({
                              "title":titleController.text,
                              "desc":descController.text,
                              "date":dateController.text,
                              "colorIndex":selectedColor,
                            });
                            Navigator.pop(context);
                            setState(() {
                              
                            });
                          },
                          child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text(
                              isEdit? "Update":
                              "save",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      )
                    ],
                  )
              
                ],
              
                        ),
            ),
          ),);
  }
}