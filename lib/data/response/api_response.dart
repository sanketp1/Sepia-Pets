import './status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  //when loading data  from server
  ApiResponse.loading() : status = Status.LOADING;

  //when getting request successfully completed
  ApiResponse.completed() : status = Status.COMPLETED;

  //when getting error from server
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() => "Status: $status \n Message:$message \n Data: $data";
}
