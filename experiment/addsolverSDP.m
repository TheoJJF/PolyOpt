function [path,SDP1,SDP2] = addsolverSDP()
    clc;clear path;
    path.sedumipath      = "C:\Users\itsth\solvers\sedumi";
    path.manoptpath      = "C:\Users\itsth\solvers\manopt";
    path.sdpt3path       = "C:\Users\itsth\solvers\SDPT3-4.0";
    path.sdpnalpath      = "C:\Users\itsth\solvers\SDPNAL+v1.0";
    path.mosekpath       = "C:\Program Files\Mosek";
    path.stridepath      = "C:\Users\itsth\Desktop\STRIDE";
    
    SDP1 = load('../data/quasar_50_1.mat');    
    SDP2 = load('../data/quasar_100_1.mat');   
    
    addpath(genpath(path.sedumipath));
    addpath(genpath(path.manoptpath));
    addpath(genpath(path.sdpt3path));
    addpath(genpath(path.sdpnalpath));
    addpath(genpath(path.mosekpath));
    addpath(genpath(path.stridepath));
end