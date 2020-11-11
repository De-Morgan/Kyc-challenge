class EnvironmentConfig {
  static const BASE_API =
      String.fromEnvironment('BASE_API', defaultValue: "not defined");
}
