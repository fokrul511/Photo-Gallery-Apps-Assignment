import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'image_list.dart';

class ShowImageScreen extends StatelessWidget {
  final String title;
  final String image;
  final String ditails;

  const ShowImageScreen({
    super.key,
    required this.title,
    required this.image,
    required this.ditails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
        title: Text(title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: OrientationBuilder(
            builder: (context, orientation) =>
                orientation == Orientation.portrait
                    ? buildPortait(image, title, ditails)
                    : buildlandScope(context, image, title, ditails),
          )),
    );
  }
}

Widget buildPortait(String image, String title, String ditails) {
  return Column(
    children: [
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                title,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, right: 10),
              child: Text(
                ditails,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 51,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "See More",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Suggestions",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff2CAB00),
                ),
              ),
            )
          ],
        ),
      ),
      Expanded(
          child: GridView.builder(
        itemCount: photoGalleryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowImageScreen(
                        title: photoGalleryList[index]['title'] ?? '',
                        image: photoGalleryList[index]['image'] ?? '',
                        ditails: photoGalleryList[index]['Ditails'] ?? ''),
                  ),
                );
              },
              child: Stack(
                children: [
                  Card(
                    elevation: 10,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          photoGalleryList[index]['image'].toString(),
                          // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      photoGalleryList[index]['title'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ))
    ],
  );
}

buildlandScope(
    BuildContext context, String image, String title, String ditails) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height * 10,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 10, right: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      ditails,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.06,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "See More",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    "Suggestions",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff2CAB00),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    ],
  );
}
