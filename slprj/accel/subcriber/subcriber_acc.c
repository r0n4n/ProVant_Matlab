#include "__cf_subcriber.h"
#include <math.h>
#include "subcriber_acc.h"
#include "subcriber_acc_private.h"
#include <stdio.h>
#include "simstruc.h"
#include "fixedpoint.h"
#define CodeFormat S-Function
#define AccDefine1 Accelerator_S-Function
static void mdlOutputs ( SimStruct * S , int_T tid ) { jjcvqxyl3l * _rtB ;
bq0jrq5ffm * _rtP ; m0jeepxgsx * _rtDW ; _rtDW = ( ( m0jeepxgsx * )
ssGetRootDWork ( S ) ) ; _rtP = ( ( bq0jrq5ffm * ) ssGetDefaultParam ( S ) )
; _rtB = ( ( jjcvqxyl3l * ) _ssGetBlockIO ( S ) ) ; ssCallAccelRunBlock ( S ,
4 , 0 , SS_CALL_MDL_OUTPUTS ) ; ssCallAccelRunBlock ( S , 4 , 1 ,
SS_CALL_MDL_OUTPUTS ) ; _rtB -> gm5niwf1mq = ssGetT ( S ) ;
ssCallAccelRunBlock ( S , 4 , 3 , SS_CALL_MDL_OUTPUTS ) ; _rtB -> mu4zirwazl
= _rtB -> gm5niwf1mq - _rtB -> mois0hvj2y ; ssCallAccelRunBlock ( S , 4 , 5 ,
SS_CALL_MDL_OUTPUTS ) ; _rtB -> nwlbfk22bu = muDoubleScalarSin ( _rtP -> P_4
* ssGetTaskTime ( S , 0 ) + _rtP -> P_5 ) * _rtP -> P_2 + _rtP -> P_3 ;
ssCallAccelRunBlock ( S , 4 , 7 , SS_CALL_MDL_OUTPUTS ) ; _rtB -> oogsskadc3
= _rtP -> P_1 ; ssCallAccelRunBlock ( S , 0 , 0 , SS_CALL_MDL_OUTPUTS ) ; if
( _rtB -> n4bgxn5hhg ) { _rtB -> ly5nnzxge1 = _rtB -> cxvcstjqpm ; srUpdateBC
( _rtDW -> keyihfs5rm ) ; } if ( _rtB -> n4bgxn5hhg ) { _rtB -> drhfzaxofo =
_rtB -> ly5nnzxge1 . Header . Seq ; ssCallAccelRunBlock ( S , 3 , 1 ,
SS_CALL_MDL_OUTPUTS ) ; _rtB -> ky5uepyhbn = _rtB -> drhfzaxofo ; if (
ssGetLogOutput ( S ) ) { { const char * errMsg = ( NULL ) ; void * fp = (
void * ) _rtDW -> mipchecvve . FilePtr ; if ( fp != ( NULL ) ) { { real_T t ;
void * u ; t = ssGetTaskTime ( S , 1 ) ; u = ( void * ) & _rtB -> ky5uepyhbn
; errMsg = rtwH5LoggingCollectionWrite ( 1 , fp , 0 , t , u ) ; if ( errMsg
!= ( NULL ) ) { ssSetErrorStatus ( S , errMsg ) ; return ; } } } } }
srUpdateBC ( _rtDW -> oicjyyxwdw ) ; } UNUSED_PARAMETER ( tid ) ; }
#define MDL_UPDATE
static void mdlUpdate ( SimStruct * S , int_T tid ) { jjcvqxyl3l * _rtB ;
_rtB = ( ( jjcvqxyl3l * ) _ssGetBlockIO ( S ) ) ; ssCallAccelRunBlock ( S , 4
, 10 , SS_CALL_MDL_UPDATE ) ; UNUSED_PARAMETER ( tid ) ; } static void
mdlInitializeSizes ( SimStruct * S ) { ssSetChecksumVal ( S , 0 , 3688642114U
) ; ssSetChecksumVal ( S , 1 , 1708188552U ) ; ssSetChecksumVal ( S , 2 ,
171772752U ) ; ssSetChecksumVal ( S , 3 , 2092098042U ) ; { mxArray *
slVerStructMat = NULL ; mxArray * slStrMat = mxCreateString ( "simulink" ) ;
char slVerChar [ 10 ] ; int status = mexCallMATLAB ( 1 , & slVerStructMat , 1
, & slStrMat , "ver" ) ; if ( status == 0 ) { mxArray * slVerMat = mxGetField
( slVerStructMat , 0 , "Version" ) ; if ( slVerMat == NULL ) { status = 1 ; }
else { status = mxGetString ( slVerMat , slVerChar , 10 ) ; } }
mxDestroyArray ( slStrMat ) ; mxDestroyArray ( slVerStructMat ) ; if ( (
status == 1 ) || ( strcmp ( slVerChar , "8.5" ) != 0 ) ) { return ; } }
ssSetOptions ( S , SS_OPTION_EXCEPTION_FREE_CODE ) ; if ( ssGetSizeofDWork (
S ) != sizeof ( m0jeepxgsx ) ) { ssSetErrorStatus ( S ,
"Unexpected error: Internal DWork sizes do "
"not match for accelerator mex file." ) ; } if ( ssGetSizeofGlobalBlockIO ( S
) != sizeof ( jjcvqxyl3l ) ) { ssSetErrorStatus ( S ,
"Unexpected error: Internal BlockIO sizes do "
"not match for accelerator mex file." ) ; } { int ssSizeofParams ;
ssGetSizeofParams ( S , & ssSizeofParams ) ; if ( ssSizeofParams != sizeof (
bq0jrq5ffm ) ) { static char msg [ 256 ] ; sprintf ( msg ,
"Unexpected error: Internal Parameters sizes do "
"not match for accelerator mex file." ) ; } } _ssSetDefaultParam ( S , (
real_T * ) & px5nwokkrk ) ; } static void mdlInitializeSampleTimes (
SimStruct * S ) { } static void mdlTerminate ( SimStruct * S ) { }
#include "simulink.c"
