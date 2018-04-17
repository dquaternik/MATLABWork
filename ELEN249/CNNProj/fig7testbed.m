% Test bed to run figure 7 model. Creates a small serialized portion of the
% input and runs it through the model to see if it works. 
function output_fm = fig7testbed()
Tn = 64;
Tm = 7;

output_fm = zeros(Tm,1);
weights = (-1) + (1-(-1)).*rand(Tm*Tn,1,'single');

ex  = imread('4.1.07.tiff');
input_fm = cast(ex(:,1,1),'like',weights);

output_fm = fig7model(input_fm,output_fm,weights);

end