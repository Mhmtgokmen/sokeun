import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sokeun/service/api.service.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class VideokodilepuankazanScreeenPAGEE extends StatefulWidget {
  const VideokodilepuankazanScreeenPAGEE({Key? key}) : super(key: key);

  @override
  _VideokodilepuankazanScreeenPAGEEState createState() =>
      _VideokodilepuankazanScreeenPAGEEState();
}

class _VideokodilepuankazanScreeenPAGEEState
    extends State<VideokodilepuankazanScreeenPAGEE> {
  late VideoPlayerController _controller;
  late String videoUrl = '';
  late String coverImage = '';
  late String title = '';
  late String description = '';

  late Future<void> _initializeVideoPlayerFuture;

  late ApiService apiService;

  Map<String, dynamic>? data;

  Future<void> initializeVideoPlayer() async {
    String apiUrl = "https://development.coneexa.com/api/video";
    http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YWQzNWY3Yi1mOGNjLTQ2YWEtOGRlNC01MzhlMjA5NzNlYWQiLCJqdGkiOiJlZDFjOTk1NDNiMzVlNWM1MmUxZTUxZTVmODE1MzhjMDRkNzg0YTRjOGU4ZjNmYmU1OGE3NjMzM2U5MzgyNDc2N2Y0NGNiMjJhODdmZGYwZCIsImlhdCI6MTcwMjM4ODgxMi40Mjc5OTk5NzMyOTcxMTkxNDA2MjUsIm5iZiI6MTcwMjM4ODgxMi40MjgwMDMwNzI3Mzg2NDc0NjA5Mzc1LCJleHAiOjE3MTgyMDAwMTIuNDIxNTc1MDY5NDI3NDkwMjM0Mzc1LCJzdWIiOiIxMDkiLCJzY29wZXMiOltdfQ.iHFAkbJNLvGW5XmbjQc9ZCeaN1DEEk-Upb2OD6-OeXBEkdDVWOfGdn4fSfiYVs0Wa1iIKHhMZgZSxr-xZ_GwimSzZxmz_aVCWE8D0GaCqBhM8IGaF9yIXhDxYNGWr0LVDpdRSt0Co4Un5OO2jCkHzW0BqcfXoU2MGuoVfP44WwzBd3XQ0jQ_Rfd4WRhKD2NbHTXPTB3HPzXNQOwaKVW4ihCQlsMnTAJ5mi66ETmda_oMZuUnRdJi8sJ_7vNvs2fRS6j4eMljKKh-jBtnyfv83SOA87kFMesNnWnmZoB-tVPgYyfseTfaxUPRlGn74of1yyLhndkG-to-dBefXmvqQoE6_A7daP-UnZ90oEbQbHyDmWrzyw32NgZetzpLjuXzzIkWZFnF37-rAo7UXrwdjHkkAf6AFzqKZ2fJEQE15Zub-8fU4cTDiq_vc6P2MoKYAO-UXzkgEh_6A9CW_gpYnM-PBq5QjP92_5pl5t4V0pCI3GDLUnHD_KbymuPVrdN_up0MOY6VWIBwGtZb58q9LV3zaFMs6Fb3b7aWnNiLajjGOT4BlF8slTjAL5erd_qW9pM3Hj7GbO3T-eS52ZvoVrH7Fa_bvRcaHBn-JaN7ELyC9D1ZzwkBPHSU7Rl1pLkI_oQK83NTgTkT6Wk5f9W8lasekwFMG-wl-bruLHsCqMs',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      data = responseData['data'][0];
      print(data);

      _controller = VideoPlayerController.networkUrl(data!['path'] ?? '');
      _initializeVideoPlayerFuture = _controller.initialize();
    } else {
      print('API çağrısında hata oluştu: ${response.statusCode}');
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = initializeVideoPlayer();

    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }

  String displayPoint(int? point) {
    return point != null ? '$point Puan' : 'Puan Bilgisi Yok';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //   data?['cover_image'] ?? '',
                  //   height: 200,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        displayPoint(data?['point']),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data?['title'] ?? 'Başlık Yok',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            data?['description'] ?? 'Açıklama Yok',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            formatDate(data?['created_at'] ?? ''),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            formatDate(data?['updated_at'] ?? ''),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          } else {
            return Center(
              child: Text('Hata: ${snapshot.error}'),
            );
          }
        },
      ),
    );
  }
}
