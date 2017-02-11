function [ glycans, time ] = TwoLengthGillespie( max_len1,max_len2,compartments,res_time )
%Gives the final length for a system in which there is a maximum length and
% a specified number of compartments

exports=0;
glycans=[0,0];
time=0;
res_time;

while ~isequal(exports,compartments)
    WT=[exprnd(res_time),exprnd(1),exprnd(1)];
    if isequal(sum(lt(WT(1),[WT(2),WT(3)])),2)
        exports=exports+1;
        time=time+WT(1);
    elseif isequal(sum(lt(WT(2),[WT(1),WT(3)])),2)
        if lt(glycans(1),max_len1)
            glycans(1)=glycans(1)+1;
        end
        time=time+WT(2);
    else
        if lt(glycans(2),max_len2)
            glycans(2)=glycans(2)+1;
        end
        time=time+WT(3);
    end
end

            


end

