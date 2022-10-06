enum ServiceMethod {
  get,
  post,
  put,
  patch,
  delete,
}

extension ServiceDescription on ServiceMethod {
  String get methodName => name.toUpperCase();
}
