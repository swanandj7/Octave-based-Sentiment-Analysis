function Xhappy5 = TestData1(n)
  
Xhappy5 = zeros(n,5000);

  for i=1 : 2500
    while(1)
      k=randi(n);
      if(Xhappy5(k,i)~=1)
         Xhappy5(k,i)=1;
         break;
      endif
    end
end

end