function [ glycan ] = PerfectClock( Termination,Max_Length )
%This 
glycan=0;

while time<Termination
    time=time+exprnd(1);
    if glycan<Max_Length
        glycan=glycan+1;
    end
end

