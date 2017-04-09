y=[1 0 0 0];
k=1;
while k~=3*4*4*4
    
    z=y(k,:);
    k=k+1;
    carry=1;
    
    
    for i=1:4
        t= 5-i;
        if carry~=0
            z(t)=z(t)+carry;
            carry=0;
            
        end
        if z(t)==4
            z(t)=0;
            carry=1;
        end
    end
    y(k,:)=z;
    
    
end