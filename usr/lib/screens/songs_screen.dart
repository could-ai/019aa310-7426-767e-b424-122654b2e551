import 'package:flutter/material.dart';
import '../models/data_models.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية للأغاني
    final List<Song> songs = [
      Song(title: 'ماما جابت بيبي', duration: '2:30', lyrics: 'ماما جابت بيبي... بيبي حلو صغير...'),
      Song(title: 'أنا الفرخة', duration: '3:15', lyrics: 'أنا الفرخة واحنا الكتاكيت...'),
      Song(title: 'جدو علي', duration: '2:45', lyrics: 'جدو علي عنده حمار...'),
      Song(title: 'الألوان', duration: '1:50', lyrics: 'أحمر أصفر أزرق...'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return _buildSongTile(context, songs[index]);
      },
    );
  }

  Widget _buildSongTile(BuildContext context, Song song) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.music_note, color: Colors.white),
        ),
        title: Text(
          song.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(song.lyrics, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: const Icon(Icons.play_circle_fill, color: Colors.green, size: 30),
        onTap: () {
          // محاكاة تشغيل الأغنية
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('تشغيل: ${song.title}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.mic, size: 50, color: Colors.blue),
                  const SizedBox(height: 20),
                  Text(song.lyrics),
                  const SizedBox(height: 20),
                  const LinearProgressIndicator(),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('إغلاق'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
