import 'package:flutter/material.dart';
import 'package:test/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);

          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorSchemeSeed: Colors.purple,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Hello',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/en/6/63/Feels_good_man.jpg',
                width: SizeConfig.imageSizeMultiplier * 30,
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'This is a label',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 5),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nice'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: Icon(
                  Icons.ac_unit,
                  size: SizeConfig.imageSizeMultiplier * 5,
                ),
                label: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
