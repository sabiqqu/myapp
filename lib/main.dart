import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Manage Motorcycles'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Sample motorcycle data (replace with your actual data structure)
  final List<Map<String, dynamic>> motorcycles = [
    {
      'brand': 'Honda',
      'model': 'CBR650R',
      'price': 120000000,
      'image': 'https://carmudi-journal.icarcdn.com/carmudi-id/wp-content/uploads/2020/02/10174430/AHM_HondaPCX.-Royal-Matte-Blue-.jpg', // Placeholder image
    },
    {
      'brand': 'Yamaha',
      'model': 'Aerox',
      'price': 135000000,
      'image': 'https://akcdn.detik.net.id/community/media/visual/2020/11/02/yamaha-aerox-155-connected-4.jpeg?w=700&q=90', // Placeholder image
    },
    {
      'brand': 'Vespa',
      'model': 'Sprint',
      'price': 140000000,
      'image': 'https://www.supersukses.net/wp-content/uploads/2022/03/red-passione-02.png'
    }
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: motorcycles.length,
          itemBuilder: (context, index) {
            final motorcycle = motorcycles[index];
            return Card(
              child: ListTile(
                leading: Image.network(
                  motorcycle['image'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(motorcycle['brand'] + ' ' + motorcycle['model']),
                subtitle: Text('Rp ' + motorcycle['price'].toStringAsFixed(2)),
                trailing: const Icon(Icons.chevron_right),
              ),
            );
          },
        ),
      ),
    );
  }
}