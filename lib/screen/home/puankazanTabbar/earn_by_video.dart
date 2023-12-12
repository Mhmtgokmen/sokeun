import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class VideokodilepuankazanScreeenPAGEE extends StatefulWidget {
  const VideokodilepuankazanScreeenPAGEE({Key? key}) : super(key: key);

  @override
  _VideokodilepuankazanScreeenPAGEEState createState() =>
      _VideokodilepuankazanScreeenPAGEEState();
}

class _VideokodilepuankazanScreeenPAGEEState
    extends State<VideokodilepuankazanScreeenPAGEE> {
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  // late ApiService apiService;

  // Map<String, dynamic>? videoData;

  // Future<void> initializeVideoPlayer() async {
  //   String apiUrl = "https://development.coneexa.com/api/video";
  //   http.Response response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> responseData = json.decode(response.body);

  //     videoData = responseData['data'][0];

  //     // Video başlığı, açıklama ve kapak görüntüsü bu sayfada gösteriliyor.
  //     _controller = VideoPlayerController.networkUrl(videoData!['path'] ?? '');
  //     _initializeVideoPlayerFuture = _controller.initialize();
  //   } else {
  //     print('API çağrısında hata oluştu: ${response.statusCode}');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initializeVideoPlayerFuture = initializeVideoPlayer();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(videoData?['title'] ?? 'Video Başlığı'),
  //     ),
  //     body: FutureBuilder(
  //       future: _initializeVideoPlayerFuture,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               AspectRatio(
  //                 aspectRatio: _controller.value.aspectRatio,
  //                 child: VideoPlayer(_controller),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       videoData?['title'] ?? 'Başlık Yok',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 20,
  //                       ),
  //                     ),
  //                     Text(
  //                       videoData?['description'] ?? 'Açıklama Yok',
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           );
  //         } else if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(
  //             child: CircularProgressIndicator(
  //               color: Colors.red,
  //             ),
  //           );
  //         } else {
  //           return Center(
  //             child: Text('Hata: ${snapshot.error}'),
  //           );
  //         }
  //       },
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         setState(() {
  //           if (_controller.value.isPlaying) {
  //             _controller.pause();
  //           } else {
  //             _controller.play();
  //           }
  //         });
  //       },
  //       child: Icon(
  //         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
  //       ),
  //     ),
  //   );
  // }

  late VideoPlayerController _controller;
  late String videoUrl = '';
  late String coverImage = '';
  late String title = '';
  late String description = '';
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
