%% format longg
T=importdata('1000 sec boom rsrps svm baseline single ue.txt'); % your text file , attached sample.txt with this answer
%T=table2cell(T);
N_Type=4;
[row,column]=size(T);
C=cell([row,column]);
NR=ceil(row/3);
N_Widebeam=12;

NR_Matrix=cell(NR,1);
Widebeam_Index=cell(N_Widebeam,1);

for j=1:NR
NR_Matrix(j) = cellstr(sprintf("[NR-%d]", j));
end
 
for j=1:NR
NR_Matrix(j) = cellstr(strrep(NR_Matrix(j),'j','k'));
end

for k=N_Widebeam:-1:1
Widebeam_Index(13-k) = cellstr(sprintf("rsrpPerWideBeam%d", k));
end

for i=1:row
C(i) = cellstr(strrep(T{i},'redhawk.protocol.mac.nr.scheduling.ue.linkadaptation.dl.NrProductBasedP2Policy',''));
C(i) = cellstr(strrep(T{i},'redhawk.protocol.mac.nr.scheduling.ue.linkadaptation.dl.NrProductBasedP2Policy',''));
C(i) = cellstr(strrep(T{i},'redhawk.protocol.mac.nr.scheduling.ue.linkadaptation.dl.NrProductBasedP2Policy',''));

end 
for i=1:row
C(i) = cellstr(strrep(C{i},'.masterthesisV2RsrpBestWideBeamLog',''));
C(i) = cellstr(strrep(C{i},'.masterthesisV2RsrpPerWideBeamLog',''));
C(i) = cellstr(strrep(C{i},'.masterthesisV2RsrpBestNarrowBeamLog ',''));
C(i) = cellstr(strrep(C{i},'.masterthesisV2RsrpPredictedNarrowBeamLog ',''));
C(i) = cellstr(strrep(C{i},'.masterthesisV3CoordDistAngleIslosLog',''));
C(i) = cellstr(strrep(C{i},'.masterthesisV2RsrpPerNarrowBeamLog',''));
end 

for i=1:row
C(i) = cellstr(strrep(C{i},'tag=sim.radioNetwork.bases[0].schedulerHandlers[0].ueContexts',''));
C(i) = cellstr(strrep(C{i},'.linkAdaptationPolicy.servingCellContexts[0].csiRequestPolicy.csiRsBmPolicy subFrameNr',''));
end 

for i=1:row
    C(i) = cellstr(strrep(C{i},'[NR-%d]',''));
end
for j=1:NR
NR_Matrix(j) = cellstr(sprintf("[NR-%d]", j));
end
for j=1:NR
NR_Matrix(j) = cellstr(strrep(NR_Matrix(j),'j','k'));
end
for k=N_Widebeam:-1:1
Widebeam_Index(13-k) = cellstr(sprintf("rsrpPerWideBeam%d", k));
end
    for j=1:NR
     C(i) = cellstr(strrep(C{i},NR_Matrix(j),''));
    end
    for i = 1:row
    C(i) = cellstr(strrep(C{i},'=',''));
    C(i) = cellstr(strrep(C{i},'time',''));
    C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam',''));
%     C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam',''));
    C(i) = cellstr(strrep(C{i},'time',''));
    C(i) = cellstr(strrep(C{i},'beamIdBestWideBeam',''));
    C(i) = cellstr(strrep(C{i},'rsrpBestWideBeam',''));
    C(i) = cellstr(strrep(C{i},'beamIdBestNarrowBeam',''));
    C(i) = cellstr(strrep(C{i},'rsrpBestNarrowBeam',''));
    C(i) = cellstr(strrep(C{i},'beamIdPredictedNarrowBeam',''));
    C(i) = cellstr(strrep(C{i},'rsrpPredictedNarrowBeam',''));
    C(i) = cellstr(strrep(C{i},'masterthesisV2CoordDistAngleIslosLog',''));
    end
for i=1:row
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam12',''));
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam11',''));
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam10',''));
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam9',''));
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam8',''));
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam7',''));  
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam6',''));
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam5',''));
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam4','')); 
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam3',''));
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam2','')); 
C(i) = cellstr(strrep(C{i},'rsrpPerWideBeam1','')); 
end 

for i=1:row
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam12',''));
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam11',''));
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam10',''));
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam9',''));
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam8',''));
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam7',''));  
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam6',''));
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam5',''));
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam4','')); 
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam3',''));
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam2','')); 
C(i) = cellstr(strrep(C{i},'rsrpPerNarrowBeam1','')); 
end

for i=1:row
C(i) = cellstr(strrep(C{i},'baseX',''));
C(i) = cellstr(strrep(C{i},'baseY',''));
C(i) = cellstr(strrep(C{i},'baseZ',''));
C(i) = cellstr(strrep(C{i},'mobileX',''));
C(i) = cellstr(strrep(C{i},'mobileY',''));
C(i) = cellstr(strrep(C{i},'mobileZ',''));  
C(i) = cellstr(strrep(C{i},'wrappedX',''));
C(i) = cellstr(strrep(C{i},'wrappedY',''));
C(i) = cellstr(strrep(C{i},'wrappedZ','')); 
C(i) = cellstr(strrep(C{i},'angleXY',''));
C(i) = cellstr(strrep(C{i},'angleZ','')); 
C(i) = cellstr(strrep(C{i},'isLos','')); 
C(i) = cellstr(strrep(C{i},'distance',''));
end


C0=cell(row/N_Type,5);
C1=cell(row/N_Type,5);
C2=cell(row/N_Type,16);
C3=cell(row/N_Type,5);
% C4=cell(row/N_Type,17);

for m=1:row/N_Type
     C0(m,:)=strsplit(char(C(4*m-3)) ,' ');%spilit 1 cell to many cells 
end 

for m=1:row/N_Type
    C1(m,:)=strsplit(char(C(4*m-2)) ,' ');
end 
for n=1:row/N_Type
    C2(n,:)=strsplit(char(C(4*n-1)) ,' ');
end 
for z=1:row/N_Type
   C3(z,:)=strsplit(char(C(4*z)) ,' ');
end 
% for t=1:row/N_Type
%     C4(t,:)=strsplit(char(C(5*t)) ,' ');
% end 

% A=strsplit(char(C1(1,4)) ,'-') to remove - in C1
A=cell(row/N_Type,15*2);
for x=1:row/N_Type
    for y=1:15

        %A(x,2*y-1:2*y)=strsplit(char(C1(x,y)) ,'-');
        A(x,2*y-1:2*y)=strsplit(char(C1(x,y)),'-');
        
    end    
end
for y=1:15
C1(:,y)=A(:,y*2); 
end

% to remove - from C3
B=cell(row/N_Type,15*2);
for x=1:row/N_Type
    for y=1:15

        %A(x,2*y-1:2*y)=strsplit(char(C1(x,y)) ,'-');
        B(x,2*y-1:2*y)=strsplit(char(C3(x,y)),'-');
        
    end    
end
% for y=1:15
% C3(:,y)=B(:,y*2); 
% end

% for x=1:row/N_Type
%     for 
% 
% end

%str2double(C3)
% RsrpBestWideBeamLog=cell(row/N_Type,5);
% RsrpPerWideBeamLog=cell(row/N_Type,15);
% RsrpBestNarrowBeamLog=cell(row/N_Type,5);
% CoordDistAngleIslosLog=cell(row/N_Type,16);
% 
RsrpBestWideBeamLog=str2double(C0);
RsrpNarrowBeamBaseline=str2double(C1);
RsrpNarrowBeamSVM=str2double(C3);
% RsrpPerNarrowBeamLog=str2double(C3(:,4:15));
% RsrpBestNarrowBeamLog=str2double(C2);
% BestNarrowBeamId=str2double(C2(:,4));
CoordDistAngleIslosLog=str2double(C2);



% for l=1:row/N_Type
%     RsrpPerWideBeamLog(:,4:15)=str2double(strcat('-',C1(:,4:15)));
%     
% end


% RsrpPerWideBeamLog(:,4:15)=(C1(:,4:15));
%making each rsrp value negative


% minus=-1;
% cellfun(@(x) x*minus, RsrpPerWideBeamLog(:,4:15),'un',0);
% % RsrpPerWideBeamLog(@(x) x*minus, C1(:,4:15),'un',0);

  RsrpPerWideBeam=RsrpPerWideBeamLog(:,4:15).*(-1);
  RsrpPerNarrowBeam=RsrpPerNarrowBeamLog(:,1:12).*(-1);


%% accuracy claculation

svm = RsrpNarrowBeamSVM(:,4);
baseline = RsrpNarrowBeamBaseline(:,4);

[r1, c1]=size(baseline);
count=0;
for i=1:r1
    if(baseline(i)==svm(i))
        count=count+1;
    end        
end
disp((count/r1)*100);

%% deviation of 1
dev=0;
for i = 1:r1
    if(baseline(i)==svm(i)+1  || baseline(i)==svm(i)-1) 
      dev=dev+1;  
    end    
end
disp((dev/r1)*100);

%% only wide beam 8 plot in simulation area

figure;
xcoordinates = CoordDistAngleIslosLog(:,7);
ycoordinates = CoordDistAngleIslosLog(:,8);

scatter(xcoordinates,ycoordinates,'.r');
print -r700;




%% plotting based on classification by svm and baseline algorithm

figure;
set(gcf,'color','w');
 svm = RsrpNarrowBeamSVM(:,4);
 baseline = RsrpNarrowBeamBaseline(:,4);

xcoordinates = CoordDistAngleIslosLog(:,7);
ycoordinates = CoordDistAngleIslosLog(:,8);

for i=1:8527
   if(baseline(i)==svm(i))
       scatter(xcoordinates(i),ycoordinates(i),'.g');
       hold on;
   elseif(baseline(i)==svm(i)+1  || baseline(i)+1 == svm(i))
       scatter(xcoordinates(i),ycoordinates(i),'.b');
       hold on;
   else
       scatter(xcoordinates(i),ycoordinates(i),'.r');
       hold on;
   end
end
print -r1000;

%% displaying different 3GPP NBs seperately in hexagon

figure;
set(gcf,'color','w');
xcoordinates = CoordDistAngleIslosLog(:,7);
ycoordinates = CoordDistAngleIslosLog(:,8);
for i=1:8527
    if(baseline(i)==1)
        scatter(xcoordinates(i),ycoordinates(i),'.k')
        hold on;
    elseif(baseline(i)==2)
        scatter(xcoordinates(i),ycoordinates(i),'.b')
        hold on;
    elseif(baseline(i)==3)
        scatter(xcoordinates(i),ycoordinates(i),'.g')
        hold on;
    elseif(baseline(i)==4)
        scatter(xcoordinates(i),ycoordinates(i),'.r')
        hold on;
    elseif(baseline(i)==5)
        scatter(xcoordinates(i),ycoordinates(i),'.y')
        hold on;
    elseif(baseline(i)==6)
        scatter(xcoordinates(i),ycoordinates(i),'.m')
        hold on;
    elseif(baseline(i)==7)
        scatter(xcoordinates(i),ycoordinates(i),'.c')
        hold on;
    elseif(baseline(i)==8)
        s1 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s1.MarkerEdgeColor = [0.9,0.45,0.3];
        hold on;
    elseif(baseline(i)==9)
        s2 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s2.MarkerEdgeColor = [1,0.8,0.1];
        hold on;
    elseif(baseline(i)==10)
        s3 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s3.MarkerEdgeColor = [0.6,0.2,0.9];
        hold on;
    elseif(baseline(i)==11)
        s4 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s4.MarkerEdgeColor = [0.8,0.7,0.5];
        hold on;
    else
        s5 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s5.MarkerEdgeColor = [0.2,0.3,0.1];
        hold on;
    end
end
print -r700; % print('filename','-dpdf');

%%  svm narrow beams in hexagon

figure;
xlabel('X-axis');
ylabel('Y-axis');
set(gcf,'color','w');
xcoordinates = CoordDistAngleIslosLog(:,7);
ycoordinates = CoordDistAngleIslosLog(:,8);
for i=1:8527
    if(svm(i)==1)
        scatter(xcoordinates(i),ycoordinates(i),'.k')
        hold on;
    elseif(svm(i)==2)
        scatter(xcoordinates(i),ycoordinates(i),'.b')
        hold on;
    elseif(svm(i)==3)
        scatter(xcoordinates(i),ycoordinates(i),'.g')
        hold on;
    elseif(svm(i)==4)
        scatter(xcoordinates(i),ycoordinates(i),'.r')
        hold on;
    elseif(svm(i)==5)
        scatter(xcoordinates(i),ycoordinates(i),'.y')
        hold on;
    elseif(svm(i)==6)
        scatter(xcoordinates(i),ycoordinates(i),'.m')
        hold on;
    elseif(svm(i)==7)
        scatter(xcoordinates(i),ycoordinates(i),'.c')
        hold on;
    elseif(svm(i)==8)
        s1 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s1.MarkerEdgeColor = [0.9,0.45,0.3];
        hold on;
    elseif(svm(i)==9)
        s2 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s2.MarkerEdgeColor = [1,0.8,0.1];
        hold on;
    elseif(svm(i)==10)
        s3 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s3.MarkerEdgeColor = [0.6,0.2,0.9];
        hold on;
    elseif(svm(i)==11)
        s4 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s4.MarkerEdgeColor = [0.8,0.7,0.5];
        hold on;
    else
        s5 = scatter(xcoordinates(i),ycoordinates(i),'.');
        s5.MarkerEdgeColor = [0.2,0.3,0.1];
        hold on;
    end
end
print -r700; % print('filename','-dpdf');