import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FlightAware Group Code

class FlightAwareGroup {
  static AirportInformationCall airportInformationCall =
      AirportInformationCall();
  static ListOfAirlinesCall listOfAirlinesCall = ListOfAirlinesCall();
  static AirlineDetailsCall airlineDetailsCall = AirlineDetailsCall();
  static AirlineFlightsCall airlineFlightsCall = AirlineFlightsCall();
  static AirlineArrivalsCall airlineArrivalsCall = AirlineArrivalsCall();
  static AlrlineFlightCountsCall alrlineFlightCountsCall =
      AlrlineFlightCountsCall();
  static AirlineFlightsEnRouteCall airlineFlightsEnRouteCall =
      AirlineFlightsEnRouteCall();
  static AirlineFlightsScheduledCall airlineFlightsScheduledCall =
      AirlineFlightsScheduledCall();
  static FlightsMapCall flightsMapCall = FlightsMapCall();
  static NextPageCall nextPageCall = NextPageCall();
  static AIrportwideDelaysCall aIrportwideDelaysCall = AIrportwideDelaysCall();
}

class AirportInformationCall {
  Future<ApiCallResponse> call({
    String? airportCode = 'JFK',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AirportInformationCall',
        'variables': {
          'airportCode': airportCode,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic alternatives(dynamic response) => getJsonField(
        response,
        r'''$.alternatives''',
        true,
      );
  dynamic airportFlightsUrl(dynamic response) => getJsonField(
        response,
        r'''$.airport_flights_url''',
      );
  dynamic wikiURL(dynamic response) => getJsonField(
        response,
        r'''$.wiki_url''',
      );
  dynamic countryCode(dynamic response) => getJsonField(
        response,
        r'''$.country_code''',
      );
  dynamic timezone(dynamic response) => getJsonField(
        response,
        r'''$.timezone''',
      );
  dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.latitude''',
      );
  dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.longitude''',
      );
  dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.state''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.city''',
      );
  dynamic elevation(dynamic response) => getJsonField(
        response,
        r'''$.elevation''',
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.type''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic codeIATA(dynamic response) => getJsonField(
        response,
        r'''$.code_iata''',
      );
  dynamic codeICAO(dynamic response) => getJsonField(
        response,
        r'''$.code_icao''',
      );
  dynamic alternateIdent(dynamic response) => getJsonField(
        response,
        r'''$.alternate_ident''',
      );
  dynamic airportCode(dynamic response) => getJsonField(
        response,
        r'''$.airport_code''',
      );
}

class ListOfAirlinesCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListOfAirlinesCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic nextPage(dynamic response) => getJsonField(
        response,
        r'''$.links.next''',
      );
}

class AirlineDetailsCall {
  Future<ApiCallResponse> call({
    String? airlineID = 'AC',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AirlineDetailsCall',
        'variables': {
          'airlineID': airlineID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AirlineFlightsCall {
  Future<ApiCallResponse> call({
    String? airlineID = 'AC',
    String? start = '2023-09-09',
    String? end = '2023-09-10',
    int? maxPages = 1,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AirlineFlightsCall',
        'variables': {
          'airlineID': airlineID,
          'start': start,
          'end': end,
          'maxPages': maxPages,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AirlineArrivalsCall {
  Future<ApiCallResponse> call({
    String? airlineID = 'AC',
    String? start = '2023-09-09',
    String? end = '2023-09-10',
    int? maxPages = 1,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AirlineArrivalsCall',
        'variables': {
          'airlineID': airlineID,
          'start': start,
          'end': end,
          'maxPages': maxPages,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AlrlineFlightCountsCall {
  Future<ApiCallResponse> call({
    String? airlineID = 'AC',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AlrlineFlightCountsCall',
        'variables': {
          'airlineID': airlineID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AirlineFlightsEnRouteCall {
  Future<ApiCallResponse> call({
    String? airlineID = 'UAL',
    String? start = '2023-09-08',
    String? end = '2023-09-10',
    int? maxPages = 1,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AirlineFlightsEnRouteCall',
        'variables': {
          'airlineID': airlineID,
          'start': start,
          'end': end,
          'maxPages': maxPages,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AirlineFlightsScheduledCall {
  Future<ApiCallResponse> call({
    String? airlineID = 'ACA',
    String? start = '2023-09-08',
    String? end = '2023-09-10',
    int? maxPages = 1,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AirlineFlightsScheduledCall',
        'variables': {
          'airlineID': airlineID,
          'start': start,
          'end': end,
          'maxPages': maxPages,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FlightsMapCall {
  Future<ApiCallResponse> call({
    String? flightID = 'ACA721-1694046937-airline-357p',
    String? identType = 'fa_flight_id',
    String? start = '2023-09-09',
    String? end = '2023-09-10',
    int? maxPages = 1,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FlightsMapCall',
        'variables': {
          'flightID': flightID,
          'identType': identType,
          'start': start,
          'end': end,
          'maxPages': maxPages,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class NextPageCall {
  Future<ApiCallResponse> call({
    String? cursor = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NextPageCall',
        'variables': {
          'cursor': cursor,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AIrportwideDelaysCall {
  Future<ApiCallResponse> call({
    String? airportID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AIrportwideDelaysCall',
        'variables': {
          'airportID': airportID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic airport(dynamic response) => getJsonField(
        response,
        r'''$..airport''',
        true,
      );
  dynamic color(dynamic response) => getJsonField(
        response,
        r'''$..color''',
        true,
      );
  dynamic reason(dynamic response) => getJsonField(
        response,
        r'''$..reason''',
        true,
      );
  dynamic delays(dynamic response) => getJsonField(
        response,
        r'''$..delays''',
        true,
      );
  dynamic delaySeconds(dynamic response) => getJsonField(
        response,
        r'''$.delays[:].delay_secs''',
        true,
      );
}

/// End FlightAware Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
