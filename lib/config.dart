/// app development state
class Environments {
  static const String PRODUCTION = 'prod';
}

/// config data class
class ConfigEnvironments {

  static const String currentEnvironments = Environments.PRODUCTION;

  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.PRODUCTION,
      'url': 'https://mocki.io/v1/',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == currentEnvironments,
      orElse: () => _availableEnvironments[1],
    );
  }
}
