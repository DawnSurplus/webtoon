import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/models/webtoon_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoon,
  });

  final WebtoonEpisodeModel episode;
  final WebtoonModel webtoon;

  onButtonTap() async {
    await launchUrlString("https:/comic.naver.com/webtoon/detail?titleId=${webtoon.id}&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
