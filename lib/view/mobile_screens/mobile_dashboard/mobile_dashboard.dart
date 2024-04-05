import 'package:flutter/material.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: GridView.builder(
          itemCount: items.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              color: Color(0xffDEB887),
              child: Column(
                children: [
                  Text("${items[index]["title"]}"),
                  Image.asset(
                    "${items[index]["icon"]}",
                    width: 50,

                  ),
                ],
              ),
            );
          },
        ));
  }

  List items = [
    {
      "title":"Play VS Computer",
      "icon":"assets/icons/versus.png"
    },
    {
      "title":"Play VS friend",
      "icon":"assets/icons/versus.png"
    },
    {
      "title":"Practice",
      "icon":"assets/icons/rules.png"
    },
    {
      "title":"Learn Chess",
      "icon":"assets/icons/training.png"
    }

  ];
}
