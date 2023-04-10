import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterSchool',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'FlutterSchool',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text('Об авторе')),
          TextButton(onPressed: () {}, child: Text('Программа курса')),
          TextButton(onPressed: () {}, child: Text('Покупка')),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            primary: false,
            expandedHeight: 350,
            toolbarHeight: 0.0,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/bird_background.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 30,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Text(
                      'Хочешь научиться создавать приложения на Flutter?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  Expanded(
                    child: Image.asset('assets/images/avatar.jpg'),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text('blablabla'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('blablabla'),
                    ],
                  ))
                ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Программа курса',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 34),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildListDelegate.fixed(
              [
                Container(
                  color: Colors.yellow,
                  child: ListTile(
                    title: Text(
                      '1. Вступление',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue.shade200,
                  child: ListTile(
                    title: Text(
                      '2. Вступление',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  child: ListTile(
                    title: Text(
                      '3. Вступление',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue.shade200,
                  child: ListTile(
                    title: Text(
                      '4. Вступление',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  child: ListTile(
                    title: Text(
                      '5. Вступление',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue.shade200,
                  child: ListTile(
                    title: Text(
                      '6. Вступление',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: FractionallySizedBox(
                  widthFactor: 0.4,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Имя'),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Телефон'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Купить'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Этот лендинг был создан на Flutter.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      ),
    );
  }
}
