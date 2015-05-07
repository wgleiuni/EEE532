figure
hold on
set(gcf,'color','w','position',[2146,317,600,800])
steps=100;
EX=0.0:2/steps:2;
load E_NoDis_V0p5_Lx16.mat
plot(EX,tran1,'b','linewidth',2)
plot(EX,tran2,'--b','linewidth',2)
plot(EX,tran3,'-.b','linewidth',2)
plot(EX,tran4,':b','linewidth',2)

plot(EX,tran1+tran2,'r','linewidth',2)
plot(EX,tran1+tran2+tran3,'--r','linewidth',2)
plot(EX,tran1+tran2+tran3+tran4,'-.r','linewidth',2)

plot([0.5 0.5],[0 5],':m','linewidth',3)

xlabel('Gate Energy $V/E_F$','interpreter','latex','fontsize',14)
ylabel('Conductance $G/(e^2/\pi\hbar)$','interpreter','latex','fontsize',14)
set(gca,'box','on','fontsize',16)

legend('C1','C2','C3','C4','C1+C2','C1+C2+C3','C1+C2+C3+C4','location','NorthWest')