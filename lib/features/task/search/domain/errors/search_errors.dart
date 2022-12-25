abstract class SearchFailure implements Exception {}

class DataSourceError extends SearchFailure {}

class EmptyList extends SearchFailure {}

class ErrorSearch extends SearchFailure {}

class DataSourceResultNull extends SearchFailure {}
