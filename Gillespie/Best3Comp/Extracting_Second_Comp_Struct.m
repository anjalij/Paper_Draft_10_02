dirData = dir('Simulations');

for k=3:19%68
    B=dirData(k).name
    fileName=['Simulations/',B];
    load(fileName)
    for i=1:10000
        i
        Chains1=sort(glycans{i,3}{1,1}); %first compartment chains
        nochains1=length(Chains1);
        Comp1Struct=[];
        if nochains1==0
            Comp1Struct=' ';
        else
            for j=1:nochains1
                Comp1Struct=[Comp1Struct,Chains1{j}];
            end
        end
        glycans{i,7}=Comp1Struct;


        Chains2=sort(glycans{i,3}{2,1}); %first compartment chains
        nochains2=length(Chains2);
        Comp2Struct=[];
        if nochains2==0
            Comp2Struct=' ';
        else
            for j=1:nochains2
                Comp2Struct=[Comp2Struct,Chains2{j}];
            end
        end
        glycans{i,8}=Comp2Struct;
    end
    save(fileName,'glycans')
end