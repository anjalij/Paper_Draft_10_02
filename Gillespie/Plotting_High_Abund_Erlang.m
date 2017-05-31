%Master list of all Structures
%Store with maximum length
%Reassign to the Frequency Table
%Stort by length
%
%Best

load('OneComp_Erlang/Observable/high_abund_mat_1.mat');
load('OneComp_Erlang/Observable/high_abund_mat_2.mat');
load('OneComp_Erlang/Observable/high_abund_mat_3.mat');
X=[cell2mat(high_abund(:,3))];
Y1_1=[cell2mat(abundance_matrix_1(2:end,6))]/10000;
Y1_2=[cell2mat(abundance_matrix_1(2:end,55))]/10000;
Y2_1=[cell2mat(abundance_matrix_2(2:end,6))]/10000;
Y2_2=[cell2mat(abundance_matrix_2(2:end,55))]/10000;
Y3_1=[cell2mat(abundance_matrix_3(2:end,6))]/10000;
Y3_2=[cell2mat(abundance_matrix_3(2:end,55))]/10000;

P1_1=[X,Y1_1];
P1_2=[X,Y1_2];
P2_1=[X,Y2_1];
P2_2=[X,Y2_2];
P3_1=[X,Y3_1];
P3_2=[X,Y3_2];

ix=find(Y1_1==0);
P1_1(ix,:)=[];
ix=find(Y1_2==0);
P1_2(ix,:)=[];
ix=find(Y2_1==0);
P2_1(ix,:)=[];
ix=find(Y2_2==0);
P2_2(ix,:)=[];
ix=find(Y3_1==0);
P3_1(ix,:)=[];
ix=find(Y3_2==0);
P3_2(ix,:)=[];

%plot range
r=[-0.1,15];

name='Images/Erlang_4.8_Comp1';
figure
h=stem(P1_1(:,1),P1_1(:,2))
set(h(1),'MarkerSize',0, 'Color','red','LineWidth',6)
xlim(r)
title('Comp 1: 4.8')
saveas(h,[name,'.fig'],'fig')
saveas(h,[name,'.png'],'png')
saveas(h,[name,'.pdf'],'pdf')

name='Images/Erlang_96.8_Comp1';
figure
h=stem(P1_2(:,1),P1_2(:,2))
xlim(r)
set(h(1),'MarkerSize',0, 'Color','red','LineWidth',6)
title('Comp 1: 96.3')
saveas(h,[name,'.fig'],'fig')
saveas(h,[name,'.png'],'png')
saveas(h,[name,'.pdf'],'pdf')

name='Images/Erlang_4.8_Comp2';
figure
h=stem(P2_1(:,1),P2_1(:,2))
xlim(r)
set(h(1),'MarkerSize',0, 'Color','red','LineWidth',6)
title('Comp 2: 4.8')
saveas(h,[name,'.fig'],'fig')
saveas(h,[name,'.png'],'png')
saveas(h,[name,'.pdf'],'pdf')


figure
h=stem(P2_2(:,1),P2_2(:,2))
xlim(r)
set(h(1),'MarkerSize',0, 'Color','red','LineWidth',6)
title('Comp 2: 96.3')

figure
h=stem(P3_1(:,1),P3_1(:,2))
xlim(r)
set(h(1),'MarkerSize',0, 'Color','red','LineWidth',6)
title('Comp 3: 4.8')

figure
h=stem(P3_2(:,1),P3_2(:,2))
xlim(r)
set(h(1),'MarkerSize',0, 'Color','red','LineWidth',6)
title('Comp 3: 96.3')

%}