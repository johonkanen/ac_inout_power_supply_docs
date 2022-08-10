%flyback design, DCM operation
clc
clear all
format shortEng % show numbers in "engineering format" ex. 167e-3, 12e3

Po = 10.275; %W, output power
Uin_min = 100;
Uin_max = 420;

%peak transistor voltage, higher reduces rectifier voltage
% Vpeak = 100; %V added to maximum input voltage
duty = 0.5;
Vpeak = Uin_min/(1-duty)*duty;

Eff = 0.8; % estimated efficiency /%

Pin = Po/Eff; % input power
% secondaries
Vout1 = 14.7;
Vout2 = 14.7;
Vout3 = 6.0;
Vout4 = 6.0;
Vout5 = 80;
Vout6 = 6.0;

%ef20 core, n87
Ae = 32.1e-6; %m2
Al = 1470; %nH/turns^2
Bsat = 300.1e-3; %mT
Fs = 72e3; %Hz

Krf = 2.35; % ripplefactor, DCM => Krf > 1, increase for increased ripple
% Krf = 1.5;

%transistor peak voltage vs duty

Dmax = Vpeak/(Vpeak+Uin_min);

Vro = Dmax/(1-Dmax)*Uin_min;

% peak transistor voltage == Vpeak + Uin_max
Vds = Uin_max + Vro;
% Magnetization inductance

 Lm = (Uin_min*Dmax)^2/2/Pin/Fs/Krf;

 % transistor current
 Iedc = Pin/Uin_min/Dmax;
 dI = Uin_min*Dmax/Lm/Fs; 
 Idrms = sqrt(((3*Iedc)^2+dI^2/4)*Dmax/3); % rms current
 Ids = Iedc + dI/2; %peak current
 

 % Input voltage where DCM cannot be guaranteed
 Vdc_ccm = (1/sqrt(2*Lm*Fs*Pin)-1/Vro)^-1;
 
 %primary turns
 
 Iover = Ids*1.1; %current limit, allow for extra 10% current peak
 
 Np_min = Lm*Iover/Bsat/Ae;

 % windings, needs iteration
 Vdiode = 0.9; %diode drop

 n = Vro/(Vout1 + Vdiode); % turns ratio
 Np = round(Np_min+1);
 N1 = Np/(Vro/(Vout1 + Vdiode));
 
 N2 = (Vout2 + Vdiode)/(Vout1 + Vdiode) * N1;
 N3 = (Vout3 + Vdiode)/(Vout1 + Vdiode) * N1; 
 N4 = (Vout4 + Vdiode)/(Vout1 + Vdiode) * N1; 
 N5 = (Vout5 + Vdiode)/(Vout1 + Vdiode) * N1; 
 N6 = (Vout6 + Vdiode)/(Vout1 + Vdiode) * N1; 
 
 Al_nh = Lm/Np^2;
 
 if round(Np_min) >= round(Np)
     disp('Warning, increase primary turns')
 elseif .5*Lm*Iover^2*Fs <= Po
     disp('Warning, Lm too high')     
 else
     disp('Primary turns')
     Np
     disp('secondary turns')
     [N1, N2, N3, N4, N5, N6]
%      disp('Maximum duty cycle')
%      Dmax
     disp('Transistor peak and rms currents')
     Ids
     Idrms
     disp('Transistor peak voltage')
     Vds  
     gap = 4*1e-7*pi*Lm*Iover^2/Ae/Bsat^2
     disp('Al value(nH/turn^2')
     disp('iterate until close to manufacturer value')
     disp('see datasheet for factory airgaps')
     disp('https://en.tdk.eu/inf/80/db/fer/e_20_10_6.pdf')
     Al_nh
     Lm
 end