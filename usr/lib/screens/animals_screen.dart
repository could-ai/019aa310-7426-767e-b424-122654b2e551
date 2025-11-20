import 'package:flutter/material.dart';
import '../models/data_models.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية للحيوانات
    final List<Animal> animals = [
      Animal(name: 'أسد', soundDescription: 'زئير', icon: Icons.pets, color: Colors.orangeAccent),
      Animal(name: 'قطة', soundDescription: 'مواء', icon: Icons.cruelty_free, color: Colors.blueAccent),
      Animal(name: 'كلب', soundDescription: 'نباح', icon: Icons.pets, color: Colors.brown),
      Animal(name: 'عصفور', soundDescription: 'تغريد', icon: Icons.flutter_dash, color: Colors.green),
      Animal(name: 'بقرة', soundDescription: 'خوار', icon: Icons.grass, color: Colors.grey),
      Animal(name: 'بطة', soundDescription: 'وقوقة', icon: Icons.egg, color: Colors.yellow),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عمودين
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.1,
        ),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return _buildAnimalCard(context, animals[index]);
        },
      ),
    );
  }

  Widget _buildAnimalCard(BuildContext context, Animal animal) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: animal.color.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          // محاكاة تشغيل الصوت
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تشغيل صوت: ${animal.name} (${animal.soundDescription})...'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(animal.icon, size: 50, color: animal.color),
            const SizedBox(height: 10),
            Text(
              animal.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              animal.soundDescription,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
