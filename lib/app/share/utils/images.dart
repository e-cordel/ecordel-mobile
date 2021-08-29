import 'package:ecordel/app/share/configs/env_config.dart';
import 'package:flutter/material.dart';

Widget getXilogravuraImageOrDefault(String? imageUrl, BoxFit fit) {
  imageUrl ??= EnvironmentConfig.DEFAULT_IMAGE;
  return Image.network(imageUrl, fit: fit);
}
