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
          child: TabBarView(controller: _tabController, children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Getting\nStarted',
                      style: TextStyle(fontSize: 36),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Personal details',
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const CustomCard(
                      title: 'System related questions:',
                      icon: Icons.arrow_drop_up_sharp,
                      caption:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus phasellus sollicitudin pretium, est id massa turpis accumsan ',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomCard(
                      title: 'Support related questions:',
                      icon: Icons.arrow_drop_down_sharp,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomCard(
                      title: 'How do I add new credit card',
                      icon: Icons.arrow_drop_down_sharp,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'See all 12 articles',
                      style: TextStyle(fontSize: 14, color: Color(0xFF004225)),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Discover',
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomCard(
                      title: 'System related questions:',
                      caption:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus phasellus sollicitudin pretium, est id massa turpis accumsan ',
                      icon: Icons.arrow_drop_up_sharp,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomCard(
                      title: 'Support related questions:',
                      icon: Icons.arrow_drop_down_sharp,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomCard(
                      title: 'How do I add new credit card',
                      icon: Icons.arrow_drop_down_sharp,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 64.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Contact Us',
                              style: TextStyle(
                                  fontSize: 22, color: Color(0xFFEED448)),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(),
            Container()
          ]),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.title,
    required this.icon,
    this.caption = '',
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              Icon(icon)
            ],
          ),
          if (caption.isNotEmpty)
            Text(caption,
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.7)))
        ],
      ),
    );
  }
}
