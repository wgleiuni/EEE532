figure
set(gcf,'color','w','position',[2146,317,800,400])
y=-2:4/1000:2;
Ly=4;
V=0.5;
stepx=100;
v=zeros(stepx,length(y));
for i=1:stepx
    x=-0.5+i/stepx;
    v(i,:)=Vxy(x,y,V,Ly);
end

f1=subplot(1,2,1);
hold on
plot(f1,y,v(50,:),'b','linewidth',2);
plot(f1,y,v(66,:),'r','linewidth',2);
plot(f1,y,v(75,:),'c','linewidth',2);
plot(f1,y,v(83,:),'m','linewidth',2);
set(f1,'box','on','fontsize',14)
legend('x/L_x=0.0','x/L_x=0.66','x/L_x=0.75','x/L_x=0.83')
xlabel(f1,'Position $y/\lambda_F$','interpreter','latex','fontsize',14)
ylabel(f1,'Energy $V(x,y)/E_F$','interpreter','latex','fontsize',14)


f2=subplot(1,2,2);
[X,Y]=meshgrid(y,-0.5+(1:stepx)/stepx);
contourf(f2,X,Y,v,200,'LineStyle','none')
cb=colorbar('location','eastoutside');
set(f2,'fontsize',14)
xlabel(f2,'Position $y/\lambda_F$','interpreter','latex','fontsize',14)
ylabel(f2,'Position $x/L_x$','interpreter','latex','fontsize',14)

po1=get(f1,'position');
po2=get(f2,'position');

annotation('textbox',[po1(1)-0.06,po1(2)+po1(4)-0.025,0.05,0.05],'String','$$(a)$$','interpreter','latex','fontsize',14,'linestyle','none')
annotation('textbox',[po2(1)-0.06,po2(2)+po2(4)-0.025,0.05,0.05],'String','$$(b)$$','interpreter','latex','fontsize',14,'linestyle','none')
