figure
hold on
set(gcf,'color','w','position',[2146,317,800,400])
steps=100;
VX=0.0:1/steps:1;

load BE_Dis_20.mat
plot(VX,tran,'r','linestyle','none','Marker','*','Markersize',5)
load BE_Dis_200.mat
plot(VX,tran,'b','linestyle','none','Marker','o','Markersize',5)

xlabel('Bottom Energy $V/E_F$','interpreter','latex','fontsize',14)
ylabel('Conductance $G/(e^2/\pi\hbar)$','interpreter','latex','fontsize',14)
set(gca,'box','on','fontsize',16)