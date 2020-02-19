%% Class_10_Outline: Functions and Control of Flow Examples
% File: Class_10_Outline.m
% Copy: Copyright (c) 2020 Gregory C. Myers
% BlazerID: gmyers
% Vers: 1.0.0 02/13/2020 GCM - Presented Spring 2020 to EE254 Section2F
% Desc: Driver for testing concepts in Class_10_Outline.m 

x = [ 0 : pi/16 : 2*pi ];
y_actual = sin( x );
n = 10
[ value, error ] = approximate_sine( x, n );

% figure
plot( x, y_actual );
hold on 
plot( x, value );
plot( x, abs(error / y_actual ))
grid on 

max( abs( error ) )
min( abs( error ) )
max( error ) 
min(  error )

clear;
x = [ 0 : pi/16 : 2*pi ];
x = [ -pi : pi/16 : pi ];
y_actual = sin( x );
[ value, error, n ] = approximate_sine_actual_error( x, .001 );
% figure
plot( x, y_actual );
hold on 
plot( x, value )
plot( x, error )
plot( x, n )

clear;
% x = [ 0 : pi/16 : 2*pi ];
x = [ -pi : pi/4 : pi ];
y_actual = sin( x );
[ value, error, n ] = approximate_sine_relative_error( x, .1 );
% figure
plot( x, y_actual );
hold on 
plot( x, value )
plot( x, error )
plot( x, n )
