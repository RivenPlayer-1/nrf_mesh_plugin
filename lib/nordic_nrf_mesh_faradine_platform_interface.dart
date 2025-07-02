import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nordic_nrf_mesh_faradine_method_channel.dart';

abstract class NordicNrfMeshFaradinePlatform extends PlatformInterface {
  /// Constructs a NordicNrfMeshFaradinePlatform.
  NordicNrfMeshFaradinePlatform() : super(token: _token);

  static final Object _token = Object();

  static NordicNrfMeshFaradinePlatform _instance = MethodChannelNordicNrfMeshFaradine();

  /// The default instance of [NordicNrfMeshFaradinePlatform] to use.
  ///
  /// Defaults to [MethodChannelNordicNrfMeshFaradine].
  static NordicNrfMeshFaradinePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NordicNrfMeshFaradinePlatform] when
  /// they register themselves.
  static set instance(NordicNrfMeshFaradinePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
