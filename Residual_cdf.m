clear; clc;

%Analysis = load('00_Analysis.txt');

Pt_ind = load('Residual.txt'); 

Ix_max = max(Pt_ind); Ix_min = min(Pt_ind); 
threshold = (6500 - Ix_min)/(Ix_max - Ix_min);
Pt_ind = (Pt_ind - Ix_min)/(Ix_max - Ix_min);

Interval = 1/100;

Ind_CDF = [];
for i = 1:100
    Ind_CDF = [Ind_CDF size(find(Pt_ind<=Ix_min + Interval*i),1)/size(Pt_ind,1)*100];
end

figure(1)
axes('FontName','Times New Roman','Fontweight','bold','FontSize',20)
hold on
plot(Ind_CDF,'b', 'Linewidth', 1.5);

plot(1,0,'b.', 'Markersize', 30);
plot(100,Ind_CDF(100),'b.', 'Markersize', 30);
plot(round((threshold-Ix_min)/Interval),Ind_CDF(round((threshold-Ix_min)/Interval)),'b.', 'Markersize', 30);

plot([round((threshold-Ix_min)/Interval) round((threshold-Ix_min)/Interval)],[0 Ind_CDF(round((threshold-Ix_min)/Interval))],'b:','Linewidth', 1.5);

axis([1, size(Ind_CDF,2), -Inf, Inf]);
ylabel('Percentage(%)');
set(gca,'XTick',0:size(Ind_CDF,2)/4:size(Ind_CDF,2))%0:size(Ind_CDF,2)/4:size(Ind_CDF,2)
set(gca,'YTick',0:25:100)
hold off
