%% 1mps 320 TP

Baseline_5UE_1mps_320 = 5.3195e+08;
SVM_5UE_1mps_320 = 5.4479e+08;
Baseline_10UE_1mps_320 = 4.9896e+08;
svm_10UE_1mps_320 = 5.3214e+08;
Baseline_20UE_1mps_320 = 4.4141e+08;
svm_20UE_1mps_320 = 5.2715e+08;
Baseline_30UE_1mps_320 = 4.1273e+08;
svm_30UE_1mps_320 = 5.3135e+08;

X_Baseline=[5,10,20,30];
Y_Baseline=[Baseline_5UE_1mps_320,Baseline_10UE_1mps_320,Baseline_20UE_1mps_320,Baseline_30UE_1mps_320];

X_svm=[5,10,20,30];
Y_svm=[SVM_5UE_1mps_320,svm_10UE_1mps_320,svm_20UE_1mps_320,svm_30UE_1mps_320];

plot(X_svm,Y_svm,'--g');
hold on
grid;
plot(X_Baseline,Y_Baseline,'g')
legend('1mps SVM','1mps 3GPP');
hold on;
%% 5mps 320 TP
Baseline_5UE_5mps_320 = 5.3095e+08;
SVM_5UE_5mps_320 = 5.2607e+08;
Baseline_10UE_5mps_320 = 4.9896e+08;
svm_10UE_5mps_320 = 5.1454e+08;
Baseline_20UE_5mps_320 = 4.3496e+08;
svm_20UE_5mps_320 = 5.0657e+08;
Baseline_30UE_5mps_320 = 4.1152e+08;
svm_30UE_5mps_320 = 5.1266e+08;

X_Baseline=[5,10,20,30];
Y_Baseline=[Baseline_5UE_5mps_320,Baseline_10UE_5mps_320,Baseline_20UE_5mps_320,Baseline_30UE_5mps_320];

X_svm=[5,10,20,30];
Y_svm=[SVM_5UE_5mps_320,svm_10UE_5mps_320,svm_20UE_5mps_320,svm_30UE_5mps_320];

plot(X_svm,Y_svm,'--r');
hold on
grid;
plot(X_Baseline,Y_Baseline,'r')
xlabel('Number of UEs');
ylabel('Avg Throughput');
title('Average throughput comparison');
legend('5mps SVM','5mps 3GPP');
hold on;
legend('5mps SVM','5mps 3GPP');
%% 10mps 320 TP
Baseline_5UE_10mps_320 = 5.3010e+08;
SVM_5UE_10mps_320 = 5.1099e+08;
Baseline_10UE_10mps_320 = 4.9847e+08;
svm_10UE_10mps_320 = 5.0150e+08;
Baseline_20UE_10mps_320 = 4.3481e+08;
svm_20UE_10mps_320 = 4.9912e+08;
Baseline_30UE_10mps_320 = 4.0887e+08;
svm_30UE_10mps_320 = 4.9709e+08;

X_Baseline=[5,10,20,30];
Y_Baseline=[Baseline_5UE_10mps_320,Baseline_10UE_10mps_320,Baseline_20UE_10mps_320,Baseline_30UE_10mps_320];

X_svm=[5,10,20,30];
Y_svm=[SVM_5UE_10mps_320,svm_10UE_10mps_320,svm_20UE_10mps_320,svm_30UE_10mps_320];

plot(X_svm,Y_svm,'--b');
hold on
grid;
plot(X_Baseline,Y_Baseline,'b')
legend('1mps SVM','1mps 3GPP','5mps SVM','5mps 3GPP','10mps SVM','10mps 3GPP');




