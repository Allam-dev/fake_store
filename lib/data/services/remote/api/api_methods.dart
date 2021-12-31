enum ApiMethods { get, post, put, delete }

extension Methods on ApiMethods{
  String get toText{
    String method = toString().split(".").last;
    return method;
  }
}
