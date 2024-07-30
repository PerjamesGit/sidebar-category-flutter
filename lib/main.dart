import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrolling_demo/category.dart';
import 'package:scrolling_demo/category_button.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'menu_category.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final future = ref.watch(menuCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 100,
            child: future.when(data: (data) {
              return ListView(
                children: data.map((e) {
                  return CategoryButton(e.name);
                }).toList(),
              );
            }, error: (_, __) {
              return SizedBox();
            }, loading: () {
              return SizedBox();
            }),
          ),
          Expanded(
            child: future.when(data: (data) {
              return ListView(
                cacheExtent: MediaQuery.of(context).size.height * 100,
                children: data.map((e) {
                  return Category(menuCategory: e);
                }).toList(),
              );
            }, error: (_, __) {
              return SizedBox();
            }, loading: () {
              return SizedBox();
            }),
          ),
        ],
      ),
    );
  }
}
