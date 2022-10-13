class SecretStore {
  final Map<String, dynamic> _keys;

  const SecretStore(this._keys);

  String get traktApiKey => _keys['apiKeyTRAKT'] ?? '';

  String get omdbApiKey => _keys['apiKeyOMDB'] ?? '';

  String get tmdbApiKey => _keys['apiKeyTMDB'] ?? '';
}
