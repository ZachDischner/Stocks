% Simple function. Adds directory to path. If it does not exist, it creates
% the directory, and then adds it

function status = AddOrCreatePath(dir_name)

dir_name = cell(dir_name);

for ii = 1:length(dir_name)
    
    if ~exist(dir_name{ii},'dir')
        mkdir(dir_name{ii});
    end
    addpath(dir_name{ii})
    
end

end



