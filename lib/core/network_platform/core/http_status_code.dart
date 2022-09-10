import 'package:flutter_movie_provider_archs/core/core.dart';

class HttpStatusCode {
  // 2xx Success
  static const int success = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int nonAuthoritative = 203;
  static const int noContent = 204;
  static const int resetContent = 205;
  static const int partialContent = 206;
  static const int multiStatus = 207;
  static const int alreadyReported = 208;
  static const int imUsed = 226;
  // 3xx Redirection
  static const int multipleChoices = 300;
  static const int movedPermanently = 301;
  static const int found = 302;
  static const int seeOther = 303;
  static const int notModified = 304;
  static const int useProxy = 305;
  static const int switchProxy = 306;
  static const int temporaryRedirect = 307;
  static const int resumeIncomplete = 308;
  // 4xx Client Error
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const paymentRequired = 402;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int notAcceptable = 406;
  static const int proxyAuthenticationRequired = 407;
  static const int requestTimeOut = 408;
  static const int conflict = 409;
  static const int gone = 410;
  static const int lengthRequired = 411;
  static const int preconditionFailed = 412;
  static const int requestEntityTooLarge = 413;
  static const int requestURLTooLong = 414;
  static const int unsupportedMediaType = 415;
  static const int requestedRangeNotSatisfiable = 416;
  static const int expectationFailed = 417;
  static const int teapot = 418;
  static const int authenticationTimeout = 219;
  static const int enchanceYourCalm = 420;
  static const int misdirectedRequest = 421;
  static const int unprocessableEntity = 422;
  static const int locked = 423;
  static const int failedDependency = 424;
  static const int upgradeRequired = 426;
  static const int preconditionRequired = 428;
  static const int tooManyRequests = 429;
  static const int requestHeaderFieldsTooLarge = 431;
  static const int loginTimeout = 440;
  static const int noResponse = 444;
  static const int retryWith = 449;
  static const int blockedByWindowsParentalControls = 450;
  static const int wrongExchangeServer = 451;
  static const int requestHeaderTooLarge = 494;
  static const int certError = 495;
  static const int noCert = 496;
  static const int httPtoHTTPS = 497;
  static const int tokenExpiredOrInvalid = 498;
  static const int clientClosedRequest = 499;
  // 5xx Server Error
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;
  static const int httpVersionNotSupported = 505;
  static const int variantAlsoNegotiates = 506;
  static const int insufficientStorage = 507;
  static const int loopDetected = 508;
  static const int bandwidthLimitExceeded = 509;
  static const int notExtended = 510;
  static const int networkAuthenticationRequired = 511;
  static const int networkReadTimeout = 598;
  static const int networkConnectTimeout = 599;

  int code;

  HttpStatusCode({required this.code});

  bool get isSuccess {
    return code >= 200 && code < 300;
  }

  String get description {
    switch (code) {
      // 2xx
      case success: // 200
        return "The request is OK.";
      case created: // 201
        return "The request has been fulfilled, and a new resource is created .";
      case accepted: // 202
        return "The request has been accepted for processing, but the processing has not been completed.";
      case nonAuthoritative: // 203
        return "The request has been successfully processed, but is returning information that may be from another source.";
      case noContent: // 204
        return "The request has been successfully processed, but is not returning any content.";
      case resetContent: // 205
        return "The request has been successfully processed, but is not returning any content, and requires that the requester reset the document view.";
      case partialContent: // 206
        return "The server is delivering only part of the resource due to a range header sent by the client.";
      case multiStatus: // 207
        return "XML, can contain multiple separate responses.";
      case alreadyReported: // 208
        return "Results previously returned.";
      case imUsed: // 226
        return "Request fulfilled, reponse is instance-manipulations.";
      // 3xx
      case multipleChoices: // 300
        return "A link list. The user can select a link and go to that location. Maximum five addresses.";
      case movedPermanently: // 301
        return "The requested page has moved to a new URL.";
      case found: // 302
        return "The requested page has moved temporarily to a new URL.";
      case seeOther: // 303
        return "The requested page can be found under a different URL.";
      case notModified: // 304
        return "Indicates the requested page has not been modified since last requested.";
      case useProxy: // 305
        return "The requested resource must be accessed through the proxy given by the Location field.";
      case switchProxy: // 306
        return "No longer used.";
      case temporaryRedirect: // 307
        return "The requested page has moved temporarily to a new URL";
      case resumeIncomplete: // 308
        return "Used in the resumable requests proposal to resume aborted PUT or POST requests.";
      // 4xx
      case badRequest: // 400
        return "The request cannot be fulfilled due to bad syntax.";
      case unauthorized: // 401
        return "The request was a legal request, but the server is refusing to respond to it. For use when authentication is possible but has failed or not yet been provided.";
      case paymentRequired: // 402
        return "Reserved for future use.";
      case forbidden: // 403
        return "The request was a legal request, but the server is refusing to respond to it.";
      case notFound: // 404
        return "The requested page could not be found but may be available again in the future.";
      case methodNotAllowed: // 405
        return "A request was made of a page using a request method not supported by that page.";
      case notAcceptable: // 406
        return "The server can only generate a response that is not accepted by the client.";
      case proxyAuthenticationRequired: // 407
        return "The client must first authenticate itself with the proxy.";
      case requestTimeOut: // 408
        return "The server timed out waiting for the request.";
      case conflict: // 409
        return "The request could not be completed because of a conflict in the request.";
      case gone: // 410
        return "The requested page is no longer available.";
      case lengthRequired: // 411
        return "The \"Content-Length\" is not defined. The server will not accept the request without it.";
      case preconditionFailed: // 412
        return "The precondition given in the request evaluated to false by the server.";
      case requestEntityTooLarge: // 413
        return "The server will not accept the request, because the request entity is too large.";
      case requestURLTooLong: // 414
        return "The server will not accept the request, because the URL is too long. Occurs when you convert a POST request to a GET request with a long query information.";
      case unsupportedMediaType: // 415
        return "The server will not accept the request, because the media type is not supported.";
      case requestedRangeNotSatisfiable: // 416
        return "The client has asked for a portion of the file, but the server cannot supply that portion.";
      case expectationFailed: // 417
        return "The server cannot meet the requirements of the Expect request-header field.";
      case teapot: // 418
        return "I'm a teapot";
      case authenticationTimeout: // 419
        return "Previously valid authentication has expired.";
      case enchanceYourCalm: // 420
        return "Twitter rate limiting.";
      case misdirectedRequest: // 421
        return "The request was directed at a server that is not able to produce a response.";
      case unprocessableEntity: // 422
        return "Request unable to be followed due to semantic errors.";
      case locked: // 423
        return "The resource that is being accessed is locked.";
      case failedDependency: // 424
        return "The request failed due to failure of a previous request.";
      case upgradeRequired: // 426
        return "The client should switch to a different protocol.";
      case preconditionRequired: // 428
        return "The origin server requires the request to be conditional.";
      case tooManyRequests: // 429
        return "The user has sent too many requests in a given amount of time.";
      case requestHeaderFieldsTooLarge: // 431
        return "Server is unwilling to process the request.";
      case loginTimeout: // 440
        return "Your session has expired.";
      case noResponse: // 444
        return "Server returns no information and closes the connection.";
      case retryWith: // 449
        return "Request should be retried after performing action.";
      case blockedByWindowsParentalControls: // 450
        return "Windows Parental Controls blocking access to webpage.";
      case wrongExchangeServer: // 451
        return "Resource access is denied for legal reasons.";
      case requestHeaderTooLarge: // 494
        return "Server is unwilling to process the request.";
      case certError: // 495
        return "SSL client certificate error occurred to distinguish it from 4XX in a log and an error page redirection.";
      case noCert: // 496
        return "Client didn't provide certificate to distinguish it from 4XX in a log and an error page redirection.";
      case httPtoHTTPS: // 497
        return "The plain HTTP requests are sent to HTTPS port to distinguish it from 4XX in a log and an error page redirection.";
      case tokenExpiredOrInvalid: // 498
        return "An expired or otherwise invalid token.";
      case clientClosedRequest: // 499
        return "Connection closed by client while HTTP server is processing.";
      // 5xx
      case internalServerError: // 500
        return "A generic error message, given when no more specific message is suitable.";
      case notImplemented: // 501
        return "The server either does not recognize the request method, or it lacks the ability to fulfill the request.";
      case badGateway: // 502
        return "An error has occurred, please try again.";
      case serviceUnavailable: // 503
        return "The server is currently unavailable (overloaded or down).";
      case gatewayTimeout: // 504
        return "The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.";
      case httpVersionNotSupported: // 505
        return "The server does not support the HTTP protocol version used in the request.";
      case variantAlsoNegotiates: // 506
        return "Transparent content negotiation for the request results in a circular reference.";
      case insufficientStorage: // 507
        return "The server is unable to store the representation needed to complete the request.";
      case loopDetected: // 508
        return "The server detected an infinite loop while processing the request.";
      case bandwidthLimitExceeded: // 509
        return "Server reached the bandwidth limit that the system administrator imposed.";
      case notExtended: // 510
        return "Further extensions to the request are required for the server to fulfil it.";
      case networkAuthenticationRequired: // 511
        return "The client needs to authenticate to gain network access.";
      case networkReadTimeout: // 598
        return "Network read timeout behind the proxy.";
      case networkConnectTimeout: // 599
        return "Network connect timeout behind the proxy.";
    }
    return Strings.apiErrorMessage;
  }
}
