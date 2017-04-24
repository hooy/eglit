from rest_framework.views import exception_handler
from rest_framework.exceptions import ValidationError
from rest_framework import status
from rest_framework.response import Response
from models import IncorrectTransactionDetected


def custom_exception_handler(exc, context):
    # Call REST framework's default exception handler first,
    # to get the standard error response.
    response = exception_handler(exc, context)
    if isinstance(exc, ValidationError):
        if (isinstance(response.data, dict)):
            r = response.data
            # lets map fields and messages together
            f, m = r.keys(), [x[0] for x in r.values()]
            error_message = '; '.join('%s: %s' % t for t in zip(f, m))
        else:
            error_message = response.data[0]
        data = {
            'error': True,
            'code': 'VALIDATION_ERROR',
            'message': error_message
        }
        status_code = status.HTTP_400_BAD_REQUEST
    elif isinstance(exc, IncorrectTransactionDetected):
        data = {
            'error': True,
            'code': 'INCORRECT_TRANSACTION_DETECTED',
            'message': "Generic transaction error"
        }
    else:
        # In ideal world this should not happen
        data = {
            'error': True,
            'code': 'GENERIC_ERROR',
            'message': "Generic error occured."
        }
        status_code = status.HTTP_400_BAD_REQUEST

    return Response(data, status=status_code)
