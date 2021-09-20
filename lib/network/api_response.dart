class APIResponse<T> {
  Status? status;

  T? data;

  String? message;

  APIResponse.loading(this.message) : status = Status.Loading;
  APIResponse.complete(this.data) : status = Status.Complete;
  APIResponse.error(this.message) : status = Status.Error;

  T? get getData=>data;
  
  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}

enum Status { Complete, Loading, Error }
