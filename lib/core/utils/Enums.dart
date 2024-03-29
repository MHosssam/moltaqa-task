import 'package:task/core/utils/enumeration.dart';

class HttpMethod extends Enum {
  HttpMethod(value) : super(value);
  static final HttpMethod get = HttpMethod('GET');
  static final HttpMethod post = HttpMethod('POST');
  static final HttpMethod delete = HttpMethod('DELETE');
  static final HttpMethod put = HttpMethod('PUT');
}

class NetworkStatusCodes extends Enum {
  NetworkStatusCodes(value) : super(value);

  static final unAuthorizedUser = NetworkStatusCodes(401);
  static final badRequest = NetworkStatusCodes(400);
  static final serverInternalError = NetworkStatusCodes(500);
  static final oK_200 = NetworkStatusCodes(200);
}

class ContractTypes extends Enum {
  ContractTypes(value) : super(value);

  static final individuals = ContractTypes(230);
  static final companies = ContractTypes(231);
}

class ContractModes extends Enum {
  ContractModes(value) : super(value);

  static final contractMode = ContractModes(240);
}

class ContractStatus extends Enum {
  ContractStatus(value) : super(value);
  static final open = ContractStatus(210);
  static final close = ContractStatus(211);
  static final inDebt = ContractStatus(311);
  static final cancelled = ContractStatus(212);
}

class VoucherOperationType extends Enum {
  VoucherOperationType(value) : super(value);
  static final addContract = VoucherOperationType(2300);
  static final extendContract = VoucherOperationType(2301);
  static final contractPayment = VoucherOperationType(2302);
  static final closeContract = VoucherOperationType(2303);
  static final viewContract = VoucherOperationType(2304);
  static final switchVehicle = VoucherOperationType(2305);
  static final addBooking = VoucherOperationType(2306);
  static final editBooking = VoucherOperationType(2307);
  static final executeBooking = VoucherOperationType(2308);
  static final cancelBooking = VoucherOperationType(2309);
  static final bookingPayment = VoucherOperationType(2310);
  static final refund = VoucherOperationType(2311);
  static final cancelContract = VoucherOperationType(2312);
}

class Sources extends Enum {
  Sources(id) : super(id);
  static final backOfficeSource = Sources(120);
  static final androidSource = Sources(121);
  static final iosSource = Sources(122);
}

class ECheckType extends Enum {
  ECheckType(type) : super(type);

  static final openContract = ECheckType(1);
  static final closeContract = ECheckType(2);
}

class VoucherTypeIds extends Enum {
  VoucherTypeIds(id) : super(id);
  static final addPayment = VoucherTypeIds(270);
  static final disbursement = VoucherTypeIds(271);
}

class OperationTypes extends Enum {
  OperationTypes(id) : super(id);

  static final openContract = OperationTypes(1800);
  static final closeContract = OperationTypes(1803);
}

class BranchesTypes extends Enum {
  BranchesTypes(typeId) : super(typeId);

  static final rentalBranch = BranchesTypes(8900);
}
