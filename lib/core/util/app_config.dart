
abstract class AppConfig {

  Future<String> getApiKey();
}


class AppConfigImpl extends AppConfig {

  @override
  Future<String> getApiKey() {
    return Future.value('Client-ID 8aq-XA4EReojiiNEsDQJvdGQ_mNjkMqnL4jXfJHsBsI');
  }

}