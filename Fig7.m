figure
hold on
set(gcf,'color','w','position',[2146,317,800,400])
steps=100;
EX=0.0:2/steps:2;
load E_Dis_20.mat
plot(EX,tran,'r','linestyle','none','Marker','*','Markersize',5)
load E_Dis_200.mat
plot(EX,tran,'b','linestyle','none','Marker','o','Markersize',5)

xlabel('Gate Energy $V/E_F$','interpreter','latex','fontsize',14)
ylabel('Conductance $G/(e^2/\pi\hbar)$','interpreter','latex','fontsize',14)
set(gca,'box','on','fontsize',16)