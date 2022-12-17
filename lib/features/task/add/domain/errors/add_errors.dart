abstract class AddTaskFailure implements Exception {}

class DataSourceError extends AddTaskFailure {}

class EmptyList extends AddTaskFailure {}

class ErrorSearch extends AddTaskFailure {}

class DataSourceResultNull extends AddTaskFailure {}
