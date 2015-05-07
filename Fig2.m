figure
hold on
set(gcf,'color','w','position',[2146,317,800,400])
steps=100;
VX=0.0:1/steps:1;
load BE_NoDis_E1_Lx16.mat
plot(VX,tran,'b','linewidth',2);
load BE_NoDis_E2_Lx16.mat
plot(VX,tran,'r','linewidth',2);
load BE_NoDis_E0p5_Lx16.mat
plot(VX,tran,'m','linewidth',2);
legend('E/E_F=1.0','E/E_F=2.0','E/E_F=0.5')
load BE_NoDis_E1_Lx8.mat
plot(VX,tran,'--b','linewidth',2);
load BE_NoDis_E2_Lx8.mat
plot(VX,tran,'--r','linewidth',2);
load BE_NoDis_E0p5_Lx8.mat
plot(VX,tran,'--m','linewidth',2);
load BE_NoDis_E1_Lx4.mat
plot(VX,tran,'-.b','linewidth',2);
load BE_NoDis_E2_Lx4.mat
plot(VX,tran,'-.r','linewidth',2);
load BE_NoDis_E0p5_Lx4.mat
plot(VX,tran,'-.m','linewidth',2);

xlabel('Bottom Energy $V/E_F$','interpreter','latex','fontsize',14)
ylabel('Conductance $G/(e^2/\pi\hbar)$','interpreter','latex','fontsize',14)
set(gca,'box','on','fontsize',16)