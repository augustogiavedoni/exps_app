/// {@template database_client_exception}
/// Abstract class to handle the database client exceptions.
/// {@endtemplate}
abstract class DatabaseClientException implements Exception {
  /// {@macro database_client_exception}
  const DatabaseClientException(this.error);

  /// The error which was caught.
  final Object error;
}

/// {@template add_exception}
/// Thrown during insertion of a record into the database if a failure occurs.
/// {@endtemplate}
class AddException extends DatabaseClientException {
  /// {@macro add_exception}
  const AddException(super.error);
}

/// {@template get_exception}
/// Thrown when retrieving one or multiple records from the database
/// if a failure occurs.
/// {@endtemplate}
class GetException extends DatabaseClientException {
  /// {@macro get_exception}
  const GetException(super.error);
}

/// {@template update_exception}
/// Thrown during a database record update if a failure occurs.
/// {@endtemplate}
class UpdateException extends DatabaseClientException {
  /// {@macro update_exception}
  const UpdateException(super.error);
}

/// {@template delete_exception}
/// Thrown during deletion of a record from the database if a failure occurs.
/// {@endtemplate}
class DeleteException extends DatabaseClientException {
  /// {@macro delete_exception}
  const DeleteException(super.error);
}
