[path,SDP1,SDP2]                = addsolverSDP;


% SeDuMi Quasar50 Experiment
[A,b,c,K]                       = SDPT3data_SEDUMIdata(SDP1.SDP.blk,SDP1.SDP.At,SDP1.SDP.C,SDP1.SDP.b);
[xSedumi,ySedumi,infoSedumi1]   = sedumi(A,b,c,K);

% MOSEK Quasar50 Experiment
prob                            = convert_sedumi2mosek(A,b,c,K);
[~,res1]                        = mosekopt('minimize info',prob);
[Xopt,yopt,Sopt,objMosek1]      = recover_mosek_sol_blk(res1,SDP1.SDP.blk);
infoMosek                       = get_performance_quasar(Xopt,yopt,Sopt,SDP1.SDP,SDP1.R_gt);

% STRIDE (No GNC) Quasar50 Experiment
options.maxiterPGD              = 5;
options.tolADMM                 = 1e-4;
options.tolPGD                  = 1e-8;
options.SDPNALpath              = path.sdpnalpath;
options.rrOpt                   = 1:3;
options.rrFunName               = 'local_search_quasar';

[outPGD1,Xopt,yopt,Sopt]        = PGDSDP(SDP1.SDP.blk,SDP1.SDP.At,SDP1.SDP.b,SDP1.SDP.C,[],options);
infoStride_noGNC                = get_performance_quasar(Xopt,yopt,Sopt,SDP1.SDP,SDP1.R_gt);

% STRIDE (GNC) Quasar50 Experiment
[R_gnc,info_gnc]                = GNC_Wahba(SDP1.v1,SDP1.v2,SDP1.barc2,2.0);
q_gnc                           = rotm2quat(R_gnc); 
q_gnc                           = [q_gnc(2:4),q_gnc(1)]';
v_gnc                           = kron([1;info_gnc.theta_gnc],q_gnc);
X0                              = {v_gnc*v_gnc'};

[outPGD2,Xopt,yopt,Sopt]        = PGDSDP(SDP1.SDP.blk,SDP1.SDP.At,SDP1.SDP.b,SDP1.SDP.C,X0,options);
infoStride_GNC                  = get_performance_quasar(Xopt,yopt,Sopt,SDP1.SDP,SDP1.R_gt);

% SeDuMi Quasar100 - Time Unavailable
% Out-of-Memory Error (OOM)
[A,b,c,K]                       = SDPT3data_SEDUMIdata(SDP2.SDP.blk,SDP2.SDP.At,SDP2.SDP.C,SDP2.SDP.b);

% MOSEK Quasar100 Experiment
prob                            = convert_sedumi2mosek(A,b,c,K);
[~,res2]                        = mosekopt('minimize info',prob);
[Xopt,yopt,Sopt,objMosek2]      = recover_mosek_sol_blk(res2,SDP2.SDP.blk);
infoMosek2                      = get_performance_quasar(Xopt,yopt,Sopt,SDP2.SDP,SDP2.R_gt);

% STRIDE (No GNC) Quasar100 Experiment
options.maxiterPGD              = 5;
options.tolADMM                 = 1e-4;
options.tolPGD                  = 1e-8;
options.SDPNALpath              = path.sdpnalpath;
options.rrOpt                   = 1:3;
options.rrFunName               = 'local_search_quasar';

[outPGD1_100,Xopt,yopt,Sopt]    = PGDSDP(SDP2.SDP.blk,SDP2.SDP.At,SDP2.SDP.b,SDP2.SDP.C,[],options);
infoStride_noGNC2               = get_performance_quasar(Xopt,yopt,Sopt,SDP2.SDP,SDP2.R_gt);

% STRIDE (GNC) Quasar100 Experiment
[R_gnc,info_gnc]                = GNC_Wahba(SDP2.v1,SDP2.v2,SDP2.barc2,2.0);
q_gnc                           = rotm2quat(R_gnc); 
q_gnc                           = [q_gnc(2:4),q_gnc(1)]';
v_gnc                           = kron([1;info_gnc.theta_gnc],q_gnc);
X0                              = {v_gnc*v_gnc'};

[outPGD2_100,Xopt,yopt,Sopt]    = PGDSDP(SDP2.SDP.blk,SDP2.SDP.At,SDP2.SDP.b,SDP2.SDP.C,X0,options);
infoStride_GNC2                 = get_performance_quasar(Xopt,yopt,Sopt,SDP2.SDP,SDP2.R_gt);
save('projectdata');
