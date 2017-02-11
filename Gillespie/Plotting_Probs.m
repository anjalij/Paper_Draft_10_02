figure
Y=[A(2:end,55), -A(2:end,6)];
h=stem(A(2:end,2),Y,'Marker','none','LineWidth',2)
ylim([-0.4,0.4])
xlim([-.1,21])
%set(gca,'xtick',[])
%set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

figure
Y=[A(2:end,134), -A(2:end,92)];
h=stem(A(2:end,2),Y,'Marker','none','LineWidth',2)
ylim([-0.4,0.4])
xlim([-.1,21])
%set(gca,'xtick',[])
%set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

figure
Y=[A(2:end,187), -A(2:end,138)];
h=stem(A(2:end,2),Y,'Marker','none','LineWidth',2)
ylim([-0.4,0.4])
xlim([-.1,21])
set(gca,'yticklabel',[])