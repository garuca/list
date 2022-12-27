abstract class EditTaskFailure implements Exception {}

class DataSourceError extends EditTaskFailure {}

class EmptyList extends EditTaskFailure {}

class ErrorSearch extends EditTaskFailure {}

class DataSourceResultNull extends EditTaskFailure {}
