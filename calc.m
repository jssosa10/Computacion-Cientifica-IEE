function [ Y ] = calc( y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Y=[];
for beta=-2:3
    
for i=1:192
  yi=0;
  for j=0:3
      yi=yi+(y(i,j+1)*(4^-j));
  end
  yi=yi*(4^beta);
  Y=[Y yi];
end
end 
