
import 'package:flutter/material.dart';












class Manga{
  final String imageName;
  final String title;
  final String chapter;
  final String description;

  Manga({
    required this.imageName,
    required this.title,
    required this.chapter,
    required this.description,
  });
}













class MangaWidget extends StatefulWidget {
  const MangaWidget({super.key});

  @override
  State<MangaWidget> createState() => _MangaWidgetState();
}

class _MangaWidgetState extends State<MangaWidget> {
  final _manga = [
    Manga(
      imageName: ("assets/images/manga1.png"),
       title: ("Безумный азарт"),
        chapter: ("загруженных глав: 100"),
         description: ("Авторы: Хомура Кавамото, Наомура, Тоору")
         ),
     Manga(
      imageName: (""),
       title: (""),
        chapter: (""),
         description: ("")
         ),
     Manga(
      imageName: (""),
       title: (""),
        chapter: (""),
         description: ("")
         ),
  ];
  // логика отслежования манги







  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2)
              )]
            ),
            clipBehavior: Clip.hardEdge,
            child: GestureDetector(
              onTap: (){
                print("open the manga");
              },
              child: Row(
                children: [
                  Image.asset("assets/images/manga1.png"),   
                  SizedBox(width: 15,) ,
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Безумный азарт"),
                  Text("Загруженных глав: 100"),
                  Text("Авторы: Хомура Кавамото, Наомура, Тоору")
                      ],
                    ),
                    )              
                ],
              ),
            ),
          ),
        )
      ],

    );
  }
}