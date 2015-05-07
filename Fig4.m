figure
hold on
set(gcf,'color','w','position',[2146,317,800,400])
steps=100;
EX=0.0:2/steps:2;
load E_NoDis_V0p5_Lx16.mat
plot(EX,tran,'b','linewidth',2);
load E_NoDis_V1Lx16.mat
plot(EX,tran,'r','linewidth',2);
legend('V/E_F=0.5','V/E_F=1.0','location','NorthWest')
load E_NoDis_V0p5_Lx8.mat
plot(EX,tran,'--b','linewidth',2);
load E_NoDis_V1Lx8.mat
plot(EX,tran,'--r','linewidth',2);
load E_NoDis_V0p5_Lx4.mat
plot(EX,tran,'-.b','linewidth',2);
load E_NoDis_V1Lx4.mat
plot(EX,tran,'-.r','linewidth',2);

plot([0.5 0.5],[0 5],':b','linewidth',3)
plot([1 1],[0 5],':r','linewidth',3)

xlabel('Gate Energy $E/E_F$','interpreter','latex','fontsize',14)
ylabel('Conductance $G/(e^2/\pi\hbar)$','interpreter','latex','fontsize',14)
set(gca,'box','on','fontsize',16)