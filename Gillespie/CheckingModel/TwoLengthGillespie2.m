function [ glycans, time ] = TwoLengthGillespie2( max_len1,max_len2,compartments,res_time )
%Gives the final length for a system in which there is a maximum length and
% a specified number of compartments

exports=0;
glycans=[0,0];
time=0;
Av_Rate=(1+1+1/res_time);
Av_WT=1/Av_Rate;

while ~isequal(exports,compartments)
    WT=exprnd(Av_WT);
    event=rand(1);
    if lt(event,1/Av_WT)
        if lt(glycans(1),max_len1)
            glycans(1)=glycans(1)+1;
        end
        time=time+WT
    elseif lt(event,2/Av_WT)
        if lt(glycans(2),max_len2)
            glycans(2)=glycans(2)+1;
        end
        time=time+WT
    else
        exports=exports+1;
        time=time+WT
    end
end

            


end

