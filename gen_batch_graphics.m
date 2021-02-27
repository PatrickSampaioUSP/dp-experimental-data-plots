function gen_batch_graphics()

    files_struct = dir(fullfile(pwd, '*.mat'));
    file_names = {files_struct(:).name};
    for k = 1 : length(file_names)
        
        load(file_names{k});
        folder_name = strcat('plots\', file_names{k}, '.graphics_folder');
        mkdir(folder_name);
        plot_experimental_data(sampleData, folder_name);
        
    end
    