abstract class Failures {
  final String message;

  Failures(this.message);

  @override
  String toString() {
    return message.toString();
  }
}

class ServerFailures extends Failures {
  ServerFailures(super.message);
}
