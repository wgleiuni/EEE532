function v = Vxy( x,y,V,Ly )

v=V/2*(1+cos(2*pi*x))+(y-(Ly/4*(1-cos(2*pi*x)))).^2.*heaviside(y.^1-(Ly/4*(1-cos(2*pi*x))).^1)+ ...
    (y-(-Ly/4*(1-cos(2*pi*x)))).^2.*heaviside(-(y.^1-(-Ly/4*(1-cos(2*pi*x))).^1));

end

