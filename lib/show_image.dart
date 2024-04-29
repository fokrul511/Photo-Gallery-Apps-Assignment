import 'package:flutter/material.dart';
import 'home_screen.dart';
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PhotoGallery(),
                ),
              );
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
        title: Text(title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 325,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image ?? ''), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 10, right: 10),
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
                              ditails:
                                  photoGalleryList[index]['Ditails'] ?? ''),
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
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            // Adjust the height according to your requirement
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
        ),
      ),
    );
  }
}
