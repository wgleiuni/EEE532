% Final project for EEE532, 2015 Spring
lfa=8; % Lf/a=8
hwc=0.25*0;
V=1;
Lx=16;
Ly=4;
Ny=Ly*lfa+1;
Nx=Lx*lfa+3;
t=(1/2/pi)^2*lfa^2;
Hm=pi*hwc/lfa^2;
A=20;
W=sqrt(6/pi^3*lfa^2/A)*0;
steps=100;
rn=1;
En=2;

%% Calculate the basis from ideal wire
H0=eye(Ny)*4*t;
H0(1:Ny-1,2:Ny)=H0(1:Ny-1,2:Ny)+eye(Ny-1)*(-t);
H0(2:Ny,1:Ny-1)=H0(2:Ny,1:Ny-1)+eye(Ny-1)*(-t);
P=diag(exp(2*pi*1i*Hm*((1:Ny)-16)));
I=eye(Ny);
y=((0:Ny-1)-lfa*Ly/2)/lfa;
Ht=-t*P;

vn=zeros(Ny,1);
clear tran

%%
rng('shuffle');

tran=zeros(steps+1,rn);
tran1=tran;
tran2=tran;
tran3=tran;
tran4=tran;
for ii=1:rn;
    ind=1;
    for EE=0:En/steps:En
    E=EE*I;
    temp=[1/t*P*(H0-E*I),-P*P;I,0*I];
    [vec,lam]=eig(temp);
    for i=1:2*Ny
        vec(:,i)=vec(:,i)/norm(vec(:,i));
    end
    lam1=diag(lam);
    k=(log(lam1)-1i*pi*Hm*(Ny+1));
    %k1=find(((abs(imag(k))<1e-10 & real(k)<0)|(abs(real(k))<1e-10 & imag(k)>0)));
    %k2=find(((abs(imag(k))<1e-10 & real(k)>0)|(abs(real(k))<1e-10 & imag(k)<0)));
    lam_m=abs(lam1);
    k1=zeros(33,1);
    k2=zeros(33,1);
    ind1=1;
    ind2=1;
    ind1l=1;
    ind2r=1;
    for i=1:2*Ny
        vn(i)=-imag(lam1(i)*vec(1:Ny,i)'*Ht'*vec(1:Ny,i));
        if lam_m(i)<1-1e-10
            k1(ind1)=i;
            ind1=ind1+1;
        elseif lam_m(i)>1+1e-10
            k2(ind2)=i;
            ind2=ind2+1;
        else
            if vn(i)>0
                k1(ind1)=i;
                ind1=ind1+1;
                lp(ind1l)=i;
                ind1l=ind1l+1;
            elseif vn(i)<0
                k2(ind2)=i;
                ind2=ind2+1;
                rp(ind2r)=i;
                ind2r=ind2r+1;
            end
        end
        
    end
    
    U1=vec(1:Ny,k1);
    U2=vec(1:Ny,k2);
    A1=lam(k1,k1);
    A2=lam(k2,k2);
    F1=U1*A1/U1;
    F2=U2*A2/U2;
    vn1=vn(k1);
    vn2=vn(k2);

    for i=1:Nx
        if i==1
            g=inv(E-(H0-t*P/F2));
            G=g;
        elseif i>1 && i<Nx
            x=((i-2)-lfa*Lx/2)/(Lx*lfa);
            v=Vxy(x,y,V,Ly);
            H=H0+diag(v+W*(rand(1,Ny)-0.5));
            g=inv(E-H-Ht'*g*Ht);
            G=g*Ht'*G;
        else
            H=H0-t*P'*F1;
            g=inv(E-H-Ht'*g*Ht);
            G=g*Ht'*G;
        end
        
    end
    
    T=-t*inv(U1)*(G*P*((inv(F1)-inv(F2))))*U1;
    iTran=find(vn1>1e-10);
    tTran=0;
    for i=1:max(iTran)
        for j=1:max(iTran)
            tTran=sqrt(vn1(i)/vn1(j))^2*abs(T(i,j))^2+tTran;
        end
    end
    tran(ind,ii)=tTran;
    tTran=0;
    for i=1:1
        for j=1:max(iTran)
            tTran=sqrt(vn1(i)/vn1(j))^2*abs(T(i,j))^2+tTran;
        end
    end
    tran1(ind,ii)=tTran;
    tTran=0;
    for i=2:2
        for j=1:max(iTran)
            tTran=sqrt(vn1(i)/vn1(j))^2*abs(T(i,j))^2+tTran;
        end
    end
    tran2(ind,ii)=tTran;
    tTran=0;
    for i=3:3
        for j=1:max(iTran)
            tTran=sqrt(vn1(i)/vn1(j))^2*abs(T(i,j))^2+tTran;
        end
    end
    tran3(ind,ii)=tTran;
    tTran=0;
    for i=4:4
        for j=1:max(iTran)
            tTran=sqrt(vn1(i)/vn1(j))^2*abs(T(i,j))^2+tTran;
        end
    end
    tran4(ind,ii)=tTran;
    
    ind=ind+1;
    
    end
end

% figure
% plot(tran)