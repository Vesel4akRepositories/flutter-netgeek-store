enum Environment { dev, staging, prod }

class EnvironmentConstants {
  static String? config;

  static String protocol = "https";


  static String apiResource = "$protocol://example.com/api/";
  static String apiDevResource = "http://127.0.0.1:8000/api/";

  static String apiVersion = "v1";

  static String setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        config = '$apiDevResource$apiVersion/';
        break;
      case Environment.staging:
        config = '$apiResource$apiVersion/';
        break;
      case Environment.prod:
        config = '$apiResource$apiVersion/';
        break;
    }

    return config!;
  }
}
