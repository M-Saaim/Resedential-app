import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({Key? key}) : super(key: key);

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  get textStyle => const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  @override
  Widget build(BuildContext context) {
    const title = 'Home Page';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Residential Mgnt."),
          backgroundColor: const Color.fromARGB(255, 170, 0, 0),
        ),
        body: Builder(builder: (context) {
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       const Text('Download'), // <-- Text
          //       const SizedBox(
          //         width: 5,
          //       ),
          //       const Icon(
          //         // <-- Icon
          //         Icons.download,
          //         size: 24.0,
          //       ),
          //     ],
          //   ),
          // );
          // Column(children: [
          //   const SizedBox(
          //     height: 50,
          //   ),
          //   ElevatedButton.icon(
          //     // <-- ElevatedButton
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.person,
          //       size: 24.0,
          //     ),
          //     label: const Text('Profile'),
          //   ),
          // ]);

          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: GridButton(
              textStyle: textStyle,
              borderColor: Colors.grey[300],
              borderWidth: 2,
              onPressed: (dynamic val) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(val.toString()),
                    duration: const Duration(milliseconds: 400),
                  ),
                );
              },
              items: [
                [
                  GridButtonItem(
                    title: "Profile",
                    color: const Color.fromARGB(255, 170, 0, 0),
                    textStyle: textStyle.copyWith(color: Colors.white),
                    borderRadius: 30,
                  ),
                  GridButtonItem(
                    title: "Voting",
                    color: Colors.black,
                    textStyle: textStyle.copyWith(color: Colors.white),
                    borderRadius: 30,
                  ),
                ],
                [
                  GridButtonItem(
                    title: "Complaints",
                    color: Colors.black,
                    textStyle: textStyle.copyWith(color: Colors.white),
                    borderRadius: 30,
                  ),
                  GridButtonItem(
                    title: "Notice",
                    color: const Color.fromARGB(255, 170, 0, 0),
                    textStyle: textStyle.copyWith(color: Colors.white),
                    borderRadius: 30,
                  ),
                ],
                [
                  GridButtonItem(
                    title: "Visitors",
                    color: const Color.fromARGB(255, 170, 0, 0),
                    textStyle: textStyle.copyWith(color: Colors.white),
                    borderRadius: 30,
                  ),
                  GridButtonItem(
                    title: "Log out",
                    color: Colors.black,
                    textStyle: textStyle.copyWith(color: Colors.white),
                    borderRadius: 30,
                  ),
                ],
                [
                  GridButtonItem(
                      child: const Icon(
                        Icons.image,
                        size: 50,
                      ),
                      textStyle: textStyle.copyWith(color: Colors.white),
                      value: 'image',
                      color: Colors.blue,
                      shape: const BorderSide(width: 4),
                      borderRadius: 30)
                ],
              ],
            ),
          );
        }),
      ),
      // body: GridView.count(
      //   // Create a grid with 2 columns. If you change the scrollDirection to
      //   // horizontal, this produces 2 rows.
      //   crossAxisCount: 2,
      //   // Generate 100 widgets that display their index in the List.
      //   children: List.generate(6, (index) {
      //     return Center(
      //       child: Text(
      //         'Item $index',
      //         style: Theme.of(context).textTheme.headlineSmall,
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}
