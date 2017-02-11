function [ glycan,time ] = PerfectClock2( Termination,maxlength1,maxlength2 )
%This is the perfect clock for a branched structure b=0;
glycan=[0,0];
time=0;


while time<Termination
    WT1=exprnd(1);
    WT2=exprnd(1);
    if isequal(sum(lt(Termination,[time+WT1,time+WT2])),2)
        exit='yes'
        break;
    else
        if lt(WT2,WT1)
            if glycan(1)<maxlength1
                glycan(1)=glycan(1)+1;
            end
            time=time+WT2;
        else
            if glycan(2)<maxlength2
                glycan(2)=glycan(2)+1;
            end
            time=time+WT1;
        end
    end
end

