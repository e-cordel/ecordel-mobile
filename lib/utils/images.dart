import '../configs/env_config.dart';
import 'package:flutter/material.dart';

Image getXilogravuraImageOrDefault(String? imageUrl, BoxFit fit) {
  if ( imageUrl == null || imageUrl.isEmpty ) {
    imageUrl = EnvironmentConfig.DEFAULT_IMAGE;
  }
  return Image.network(imageUrl, fit: fit);
}
