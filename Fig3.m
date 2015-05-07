figure
hold on
set(gcf,'color','w','position',[2146,317,600,800])
steps=100;
VX=0.0:1/steps:1;
load BE_NoDis_E1_Lx16.mat
plot(VX,tran1,'b','linewidth',2)
plot(VX,tran2,'--b','linewidth',2)
plot(VX,tran3,'-.b','linewidth',2)
plot(VX,tran4,':b','linewidth',2)

plot(VX,tran1+tran2,'r','linewidth',2)
plot(VX,tran1+tran2+tran3,'--r','linewidth',2)
plot(VX,tran1+tran2+tran3+tran4,'-.r','linewidth',2)

xlabel('Bottom Energy $V/E_F$','interpreter','latex','fontsize',14)
ylabel('Conductance $G/(e^2/\pi\hbar)$','interpreter','latex','fontsize',14)
set(gca,'box','on','fontsize',16)

legend('C1','C2','C3','C4','C1+C2','C1+C2+C3','C1+C2+C3+C4')