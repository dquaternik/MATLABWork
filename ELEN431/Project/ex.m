wd = pwd;
cd('C:\Program Files\MATLAB\R2011b\toolbox\images\imdemos')
D = dir;
cd(wd)
C = {'.tif';'.jp';'.png';'.bmp'};
idx = false(size(D));
for ii = 1:length(C)
    idx = idx | (arrayfun(@(x) any(strfind(x.name,C{ii})),D));
end
D = D(idx);
L = length(D);
for ii = 1:2:numel(D)
    fprintf('%25s %25s\n',D(ii:min(ii+1,L)).name)
end
fprintf('\n')