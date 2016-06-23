function signal=frequency_modulator(A,carfunc,wc,vm,msgfcn,wm,beta,simtime,type)
if type==0
if msgfcn=='sin'
    int_msg='cos';
else
    int_msg='-sin';
end;
z=[];
for i=1:length(simtime)
sigfcn=[A '*' carfunc '(' wc '*' num2str(simtime(i)) '+' num2str(beta) '*(' int_msg '(' wm '*' num2str(simtime(i)) ')-' int_msg '(' num2str(0) ')))'];
z(i)=str2num(sigfcn);
end;
signal=z;
return;
else
    z=[];
    for i=1:length(simtime)
        z(i)=0;
        for n=-5:5
            sigfcn=[A '*' num2str(besselj(beta,n)) '*' carfunc '((' wc '+(' num2str(n) '*' wm '))*' num2str(simtime(i)) ')'];
            z(i)=z(i)+str2num(sigfcn);
        end;
    end;
signal=real(z);
return;
end;
end