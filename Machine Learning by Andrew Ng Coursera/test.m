v = 1:10;
v(1) = 2;

if v(1) == 1
    disp('The value is one');
elseif v(1) ==2
    disp('The value is two');
else
    disp('The value is not one or two.');
end;
