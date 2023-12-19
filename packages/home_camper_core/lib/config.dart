class Config {
  static const String _buildType = String.fromEnvironment(
    'BUILD_TYPE',
    defaultValue: "DEBUG",
  );
  static BuildType get buildType => BuildTypeExtension.fromString(_buildType);
}

enum BuildType {
  debug,
  release,
}

extension BuildTypeExtension on BuildType {
  static BuildType fromString(String buildTypeString) {
    switch (buildTypeString) {
      case "DEBUG":
        return BuildType.debug;
      case "RELEASE":
        return BuildType.release;
      default:
        return BuildType.debug;
    }
  }
}
