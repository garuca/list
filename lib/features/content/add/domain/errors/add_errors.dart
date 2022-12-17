abstract class AddContentFailure implements Exception {}

class DataSourceError extends AddContentFailure {}

class EmptyList extends AddContentFailure {}

class ErrorSearch extends AddContentFailure {}

class DataSourceResultNull extends AddContentFailure {}
