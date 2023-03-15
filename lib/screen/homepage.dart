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
      // theme: ThemeData(
      //   colorScheme: const ColorScheme(
      //     brightness: Brightness.light,
      //     primary: Color.fromARGB(255, 200, 0, 0),
      //     onPrimary: Color.fromARGB(255, 255, 255, 255),
      //     secondary: Colors.grey,
      //     onSecondary: Colors.grey,
      //     background: Colors.grey,
      //     onBackground: Colors.grey,
      //     surface: Colors.grey,
      //     onSurface: Colors.grey,
      //     error: Colors.grey,
      //     onError: Colors.grey,
      //   ),
      // ),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          backgroundColor: const Color.fromARGB(255, 170, 0, 0),
        ),
        body: Builder(builder: (context) {
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
                    title: "Black",
                    color: Colors.black,
                    textStyle: textStyle.copyWith(color: Colors.white),
                    borderRadius: 30,
                  ),
                  GridButtonItem(
                    title: "Red",
                    color: Colors.red,
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
      // body: Center(
      //     child: GridView.extent(
      //   primary: false,
      //   padding: const EdgeInsets.all(16),
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   maxCrossAxisExtent: 200.0,
      //   children: <Widget>[
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.blue,
      //       child: const Text('First', style: TextStyle(fontSize: 20)),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: const Color.fromARGB(255, 33, 243, 117),
      //       child: const Text('Second', style: TextStyle(fontSize: 20)),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.blue,
      //       child: const Text('Third', style: TextStyle(fontSize: 20)),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: const Color.fromARGB(255, 33, 243, 117),
      //       child: const Text('Four', style: TextStyle(fontSize: 20)),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.blue,
      //       child: const Text('Fifth', style: TextStyle(fontSize: 20)),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: const Color.fromARGB(255, 33, 243, 117),
      //       child: const Text('Six', style: TextStyle(fontSize: 20)),
      //     ),
      //   ],
      // )),
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
