function [ length_glycan, time ] = MaxLengthGillespie( max_len,compartments,res_time )
%Gives the final length for a system in which there is a maximum length and
% a specified number of compartments

exports=0;
length_glycan=0;
time=0;

while ~isequal(exports,compartments)
    WT1=exprnd(res_time);
    WT2=exprnd(1);
    if lt(WT1,WT2)
        exports=exports+1;
        time=time+WT1;
    else
        if lt(length_glycan,max_len)
            length_glycan=length_glycan+1;
        end
        time=time+WT2;
    end
end

            


end

