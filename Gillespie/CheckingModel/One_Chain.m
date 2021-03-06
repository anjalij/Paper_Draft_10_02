%This checks the one chain Gillespie. For Residence_Time=5, it matches
%CyclicorOrdered3.nb. 

% TO DO:Should check this for the marginals of the 2 chain equations.

%{
In[9]:= Ln=4;

P(l<L)
In[10]:= P1[l_,p_]:=(1-p)* p^l
P(l=L)
In[11]:= P2[L_,p_]:=p^L
Ordered Entropy
In[12]:= EN[L_,p_]:=-(Sum[P1[l,p]*Log[P1[l,p]],{l,0,L-1}]+p^L*Log[p^L])
In[13]:= h[\[Tau]_]:=1/(1+1/\[Tau])
In[14]:= T=Evaluate@Table[P1[l,h[\[Tau]]],{l,0,4},{\[Tau],5,5}]
Out[14]= {{1/6},{5/36},{25/216},{125/1296},{625/7776}}                                                   ð?              ð¿       q              0%ò                                                                                  J@        q          ÷  @®ó                                                                 
%}

clearvars

noTrials=100000;
compartments=2;
maxlen=4;

%Residence_Times=[0.1,0.5,1,2,3,4,5,10,15,20];
L=zeros(noTrials,2);
for i=1:noTrials
    [len,time]=MaxLengthGillespie(maxlen,compartments,5);
    L(i,:)=[len,time];
end

Dist=zeros(maxlen+1,2)

for j=0:maxlen
    Dist(j+1,1)=j
    I=find(L(:,1)==j);
    Dist(j+1,2)=size(I,1)/noTrials
end