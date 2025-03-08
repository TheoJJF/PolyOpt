function [path,SDP1,SDP2] = addsolverSDP()
    clc;clear path;
    path.sedumipath      = "path/to/sedumi";
    path.manoptpath      = "path/to/manopt";
    path.sdpt3path       = "path/to/sdpt3";
    path.sdpnalpath      = "path/to/sdpnal";
    path.mosekpath       = "path/to/mosek";
    path.stridepath      = "path/to/stride";
    
    SDP1 = load('../data/quasar_50_1.mat');    
    SDP2 = load('../data/quasar_100_1.mat');   
    
    addpath(genpath(path.sedumipath));
    addpath(genpath(path.manoptpath));
    addpath(genpath(path.sdpt3path));
    addpath(genpath(path.sdpnalpath));
    addpath(genpath(path.mosekpath));
    addpath(genpath(path.stridepath));
end
