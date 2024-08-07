import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, this.onDelete, required this.desc, required this.title, required this.date, this.onEdit, required this.noteColor});
  final void Function()? onDelete;
    final void Function()? onEdit;
  final String desc;
  final String title;
  final String date;
  final Color noteColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: noteColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Spacer(),
              IconButton(onPressed: onEdit, icon: Icon(Icons.edit,color: Colors.black,)),
               IconButton(onPressed: onDelete, icon: Icon(Icons.delete,color: Colors.black,)),
               
            ],
          ),

          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                desc,
                maxLines: 4,
              
               style: TextStyle(
                overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),),
            

             Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              IconButton(onPressed: (){
                Share.share("$title\n$desc\n$date");
              }, icon: Icon(Icons.share))
               
            ],
          ),

            ],
          )
        ],
      ),
    );
    
  }
}