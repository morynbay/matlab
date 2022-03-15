
% Calculation of rates for complex spikes (cs) and simple spikes (ss).
%
% The script loads files with script Psort_read_psort.m  
% The scripts Psort_read_psort.m and keep.m should be in one folder with 
% psort_spike_rate_analysis.m and must be included into the path.
%
% Analysed results are placed in array 'cs_ss_be_du_af', which columns are organized in sequence as: 
% rate_cs_before rate_cs_during rate_cs_after rate_ss_before rate_ss_during rate_ss_after
%
% The *.psort files must be in one folder
% First type pathway to the *.psort files in 'Folder'


% initialization
clear all;
close all;

Folder = '/media/murat/T7 Touch/spike_analysis_before_during_after/psorted/Sural_10_stim/';
% Folder = '/media/mrt/T7 Touch/spike_analysis_before_during_after/psorted/Sural_10_stim';
% Folder = '/media/bsinvivo2/team_brandon_working_copy/poste_bs_invivo1/neuron_data/2022_03_03/psorted/';
FileList = dir(fullfile(Folder, '**', '*.psort'));
howmanyfiles = length(FileList);   % number of files in the Filelist
cs_ss_be_du_af_30_train_Sural = [];

tic
for l = 1:howmanyfiles

filename = FileList(l).name;
file_fullPath = fullfile(Folder, filename);
Psort_read_psort(file_fullPath)  

% here we extract recorded numbers (begin and end) from file name and
% calculate difference that is the number of sweeps
x = FileList(l).name;
extract_number_from_name = strsplit(x,{'-','_','.'},'CollapseDelimiters',true);
record_start = str2double(extract_number_from_name(4));
record_end = str2double(extract_number_from_name(5));
n_sweep_in_lab_book = record_end - record_start;
%----------------------------------------------------------------------

file_name = ans.topLevel_data.file_name_without_ext;
% n_sweep_in_lab_book = sweeps;
n_sweeps = n_sweep_in_lab_book + 1;
total_index = 60000 * n_sweeps;

ch_time = ans.topLevel_data.ch_time;
cs_index = ans.topLevel_data.cs_index;
ss_index = ans.topLevel_data.ss_index;

ncol = size(cs_index);
dif = total_index - ncol(1, 1);


% here we convert ch_time, cs_index, ss_index to double for being able to manipulate with 'nan', 'nan'
% otherwise it does not work with uint8 formate
time_doub = double(ch_time);
cs_doub = double(cs_index);
ss_doub = double(ss_index); 
%-----------------------------------------------------------------------------------------------------

% if number of sweeps not 50, than we add zeros after end of cs_index (ss_index, ch_time) and
% convert these zeros to NaNs
if (n_sweeps ~= 50)
    cs_doub(end+dif,:)=0;
    cs_doub(ncol(1, 1)+1:end,:)=nan;
    ss_doub(end+dif,:)=0;
    ss_doub(ncol(1, 1)+1:end,:)=nan;
    time_doub(end+dif,:)=0;
    time_doub(ncol(1, 1)+1:end, :)=nan;
else
    time_doub = double(ch_time);
    cs_doub = double(cs_index);
    ss_doub = double(ss_index);  
end
%---------------------------------------------------------------------------------------------

cs_resh = reshape(cs_doub, [], n_sweeps);
ss_resh = reshape(ss_doub, [], n_sweeps);
time_resh = reshape(time_doub, [], n_sweeps);

time = time_resh(:,1); % we take only first 3 s - the time of one sweep, 
%  we don't care about 'NaN's at the end of 'time_resh'
cs_before_stim = cs_resh(18004:22003, :);
cs_during_stim = cs_resh(22005:26004, :);
cs_after_stim = cs_resh(26006:30005, :);

ss_before_stim = ss_resh(18004:22003, :);
ss_during_stim = ss_resh(22005:26004, :);
ss_after_stim = ss_resh(26006:30005, :);


%  number of complex spikes before, during, after stimulation. 
%  Calculates all non zero values including NaNs. Calculates all NaNs. 
%  Calculates all "1"s (complex spikes): all non sero values minus NaNs

n_cs_before_nnz = nnz(cs_before_stim); 
n_cs_before_nnz_isnan = nnz(isnan(cs_before_stim));
n_cs_before = n_cs_before_nnz - n_cs_before_nnz_isnan;

n_cs_during_nnz = nnz(cs_during_stim);
n_cs_during_nnz_isnan = nnz(isnan(cs_during_stim));
n_cs_during = n_cs_during_nnz - n_cs_during_nnz_isnan;

n_cs_after_nnz = nnz(cs_after_stim);
n_cs_after_nnz_isnan = nnz(isnan(cs_after_stim));
n_cs_after = n_cs_after_nnz - n_cs_after_nnz_isnan;

%  number of simple spikes before, during, after stimulation
n_ss_before_nnz = nnz(ss_before_stim);
n_ss_before_nnz_isnan = nnz(isnan(ss_before_stim));
n_ss_before = n_ss_before_nnz - n_ss_before_nnz_isnan;

n_ss_during_nnz = nnz(ss_during_stim);
n_ss_during_nnz_isnan = nnz(isnan(ss_during_stim));
n_ss_during = n_ss_during_nnz - n_ss_during_nnz_isnan;

n_ss_after_nnz = nnz(ss_after_stim);
n_ss_after_nnz_isnan = nnz(isnan(ss_after_stim));
n_ss_after = n_ss_after_nnz - n_ss_after_nnz_isnan;
%------------------------------------------------------------------------

% we determine time intervals (before, during, after 200 ms) where must be calculated spike rates
t1 = time(18004, :);
t2 = time(22003, :);
dt_before = t2 - t1;
t3 = time(22005, :);
t4 = time(26004, :);
dt_during = t4 - t3;
t5 = time(26006, :);
t6 = time(30005, :);
dt_after = t6 - t5;
%------------------------------------------------------------------------------------------------

% Calculation of spike rates
rate_cs_before = n_cs_before / (dt_before * n_sweeps);
rate_cs_after = n_cs_after / (dt_after * n_sweeps);
rate_cs_during = n_cs_during / (dt_during * n_sweeps);

rate_ss_before = n_ss_before / (dt_before * n_sweeps);
rate_ss_after = n_ss_after / (dt_after * n_sweeps);
rate_ss_during = n_ss_during / (dt_during * n_sweeps);
%------------------------------------------------------

new_cs_ss_be_du_af = [rate_cs_before rate_cs_during rate_cs_after rate_ss_before rate_ss_during rate_ss_after];
cs_ss_be_du_af_30_train_Sural = vertcat(cs_ss_be_du_af_30_train_Sural, new_cs_ss_be_du_af);

end
toc

cs_ss_be_du_af_30_train_Sural(:,7) = cs_ss_be_du_af_30_train_Sural(:,2)-cs_ss_be_du_af_30_train_Sural(:,1);
CSneg = sum(cs_ss_be_du_af_30_train_Sural(:,7) < 0);
CSpos = sum(cs_ss_be_du_af_30_train_Sural(:,7) > 0);
CSzer = sum(cs_ss_be_du_af_30_train_Sural(:,7) == 0);

cs_ss_be_du_af_30_train_Sural(:,8) = cs_ss_be_du_af_30_train_Sural(:,5)-cs_ss_be_du_af_30_train_Sural(:,4);
SSneg = sum(cs_ss_be_du_af_30_train_Sural(:,8) < 0);
SSpos = sum(cs_ss_be_du_af_30_train_Sural(:,8) > 0);
SSzer = sum(cs_ss_be_du_af_30_train_Sural(:,8) == 0);

[numRows,numCols] = size(cs_ss_be_du_af_30_train_Sural);
CS_neg_percent = round(CSneg*100/numRows,0);
CS_pos_percent = round(CSpos*100/numRows,0);
SS_neg_percent = round(SSneg*100/numRows,0);
SS_pos_percent = round(SSpos*100/numRows,0);
neg_pos_percent = [CS_neg_percent CS_pos_percent SS_neg_percent SS_pos_percent];

keep cs_ss_be_du_af_30_train_Sural Folder FileList CSneg CSpos CSzer SSneg SSpos SSzer numRows numCols ...
    CS_neg_percent CS_pos_percent SS_neg_percent SS_pos_percent neg_pos_percent;




 
