import 'dart:math';

import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_top_blocked_bouncing_scroll_physics/flutter_top_blocked_bouncing_scroll_physics.dart';
import 'package:unsplash_client/unsplash_client.dart';

void main() {
  EmailJS.init(Options(publicKey: 'yiL928-BlJWdzi-fB', privateKey: 'uDoPhHosAFH3FqJr6jqVs'));
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
  List<Photo>? photos;
  late final AnchorScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = AnchorScrollController();
    final client = UnsplashClient(
      settings: ClientSettings(
          credentials: AppCredentials(
        accessKey: 'pTW45Ix9gepbGuPtQJEAut-FBYRBSWatjY_GU_1Ud2k',
        secretKey: '2kMWPRJWfpbpjU6CMDyeh9ArND3fZ9iiFHuEppb9FZM',
      )),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      photos = await client.photos.random(count: 30).goAndGet();
      await Future.delayed(Duration(seconds: 2));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: TopBlockedBouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            title: Text(
              'FlutterSchool',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text('Об авторе')),
              TextButton(
                  onPressed: () {
                    print('try to scroll');
                    _scrollController.scrollToIndex(index: 1);
                  },
                  child: Text('Программа курса')),
              TextButton(
                  onPressed: () {
                    _scrollController.scrollToIndex(index: 5);
                  },
                  child: Text('Покупка')),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Builder(builder: (context) {
                return photos == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : MasonryGridView.count(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        itemBuilder: (context, index) {
                          return Image.network(photos![index % 30].urls.thumb.toString());
                        },
                      );
              }),
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                ExpansionTile(
                  expandedAlignment: Alignment.centerLeft,
                  title: Text(
                    '1. Вступление',
                    style: TextStyle(fontSize: 16),
                  ),
                  children: [
                    Text('Установка Флаттера'),
                    Text('Первые шаги'),
                  ],
                ),
              ]),
            ),
          ),
          AnchorItemWrapper(
            index: 1,
            controller: _scrollController,
            child: SliverFixedExtentList(
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
                        onPressed: () async {
                          await EmailJS.send(
                            'service_0eq3t0h',
                            'template_ejkn7gu',
                            {'client_name': 'Mazafaka', 'client_phone_number': '112233'},
                          );
                        },
                        child: Text('Купить'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Container(
              color: Colors.green,
              child: Text(
                'Этот лендинг был создан на Flutter.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
