import 'package:ecordel/configs/env_config.dart';
import 'package:ecordel/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('If url is null then the default image should be returned', (){
    Image xilogravura = getXilogravuraImageOrDefault(null, BoxFit.contain);
    var image = xilogravura.image as NetworkImage;
    expect(image.url, EnvironmentConfig.DEFAULT_IMAGE);
  });

  test('If url is empty then the default image should be returned', (){
    Image xilogravura = getXilogravuraImageOrDefault("", BoxFit.contain);
    var image = xilogravura.image as NetworkImage;
    expect(image.url, EnvironmentConfig.DEFAULT_IMAGE);
  });
}