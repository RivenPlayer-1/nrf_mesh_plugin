import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'nordic_nrf_mesh_faradine_platform_interface.dart';

/// An implementation of [NordicNrfMeshFaradinePlatform] that uses method channels.
class MethodChannelNordicNrfMeshFaradine extends NordicNrfMeshFaradinePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('nordic_nrf_mesh_faradine');

  @override
  Future<String?> getPlatformVersion() async {
    final version =await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
