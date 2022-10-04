class GetDataResponse {
  const GetDataResponse({
    required this.headers,
    required this.body,
  });

  final Map<String, dynamic> headers;
  final List<dynamic> body;
}
