abstract class Failure {
  final String meesage;

  const Failure(this.meesage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.meesage);
}
