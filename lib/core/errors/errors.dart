abstract class Error {
  final String errMessage;
  Error(this.errMessage);
}

class SupabaseError extends Error {
  SupabaseError(super.errMessage);
}
