abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class SupabaseFailure extends Failure {
  SupabaseFailure(super.errMessage);
}
