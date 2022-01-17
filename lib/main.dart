import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        prefixIcon: const Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 12,
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Search',
                        hintText: 'Search',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.6),
                        )),
                  ),
                ),
                TabBar(
                    controller: _tabController,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 13),
                    unselectedLabelStyle:
                        const TextStyle(color: Colors.black, fontSize: 13),
                    indicatorWeight: 3.0,
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      FittedBox(
                        child: Tab(
                          text: 'FAQ',
                        ),
                      ),
                      FittedBox(
                        child: Tab(
                          text: 'Terms & Conditions',
                        ),
                      ),
                      FittedBox(
                        child: Tab(
                          text: 'Privacy & Policy',
                        ),
                      ),
                    ])
              ],
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Help Center',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          leadingWidth: 36,
          leading: Container(
            margin: const EdgeInsets.only(top: 16.0, left: 16),
            child: const Image(
              image: AssetImage('assets/images/icons/Arrow - Left.png'),
              height: 16,
              width: 16,
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
              controller: _tabController,
              children: [Container(), Container(), Container()]),
        ),
      ),
    );
  }
}
