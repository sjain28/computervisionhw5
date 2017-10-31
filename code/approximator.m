function net = approximator(f, T)
 k = 1/T;
 dOut = 3*(k+1);
 
 layer1.gain = double(ones(dOut, 1) * 1/T);
 layer1.bias = double(zeros(dOut, 1));
 layer1.h = @(x) max(0, x);
 
 layer2.gain = double(zeros(1, dOut));
 layer2.bias = double(zeros(1, 1));
 layer2.h = @(x) x;
 
 for i = 0:k
     index = 3*i+1;
     layer1.bias(index:index+2, 1) = [-i+1; -i; -i-1];
     a = f(i*T);
     layer2.gain(1, index:index+2) = [a, -2*a, a];
 end
 
 net(1) = layer1;
 net(2) = layer2;
 
 
end
