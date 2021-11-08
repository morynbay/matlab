% Calculation of rates for complex spikes and simple spikes.
% Load file with Psort_read_psort.m, you will see 'ans' in workspace. 
% keep.m should be included into the path
% Type in 'n_sweep_in_lab_book = ...' value of sweeps from lab book, then run psort_analysis_v2.m 
 
file_name = ans.topLevel_data.file_name_without_ext;
n_sweep_in_lab_book = 49;
n_sweeps = n_sweep_in_lab_book + 1;
total_index = 60000 * n_sweeps;

ch_time = ans.topLevel_data.ch_time;
cs_index = ans.topLevel_data.cs_index;
ss_index = ans.topLevel_data.ss_index;

ncol = size(cs_index);
dif = total_index - ncol(1, 1);

% here we convert to double for being able to manipulate with 'nan', 'nan'
% does not work with uint8
time_doub = double(ch_time);
cs_doub = double(cs_index);
ss_doub = double(ss_index); 

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

cs_resh = reshape(cs_doub, [], n_sweeps);
ss_resh = reshape(ss_doub, [], n_sweeps);
time_resh = reshape(time_doub, [], n_sweeps);

time = time_resh(:,1); % we take only first 3 s - the time of one sweep, 
%  we don't care about 'NaN's at the end of 'time_resh'
cs_before_stim = cs_resh(1:22003, :);
cs_during_stim = cs_resh(22004:25962, :);
cs_after_stim = cs_resh(25963:47965, :);
cs_after_base = cs_resh(47966:60000, :);
ss_before_stim = ss_resh(1:22003, :);
ss_during_stim = ss_resh(22004:25962, :);
ss_after_stim = ss_resh(25963:47965, :);
ss_after_base = ss_resh(47966:60000, :);

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

n_cs_after_base_nnz = nnz(cs_after_base);
n_cs_after_base_nnz_isnan = nnz(isnan(cs_after_base));
n_cs_after_base = n_cs_after_base_nnz - n_cs_after_base_nnz_isnan;


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

n_ss_after_base_nnz = nnz(ss_after_base);
n_ss_after_base_nnz_isnan = nnz(isnan(ss_after_base));
n_ss_after_base = n_ss_after_base_nnz - n_ss_after_base_nnz_isnan;

t1 = time(1, :);
t2 = time(22003, :);
dt_before = t2 - t1;
t3 = time(22004, :);
t4 = time(25962, :);
dt_during = t4 - t3;
t5 = time(25963, :);
t6 = time(47965, :);
dt_after = t6 - t5;
t7 = time(47966, :);
t8 = time(60000, :);
dt_after_base = t8 - t7;


rate_cs_before = n_cs_before / (dt_before * n_sweeps);
rate_cs_after = n_cs_after / (dt_after * n_sweeps);
rate_cs_during = n_cs_during / (dt_during * n_sweeps);
rate_cs_after_base = n_cs_after_base / (dt_after_base * n_sweeps);

rate_ss_before = n_ss_before / (dt_before * n_sweeps);
rate_ss_after = n_ss_after / (dt_after * n_sweeps);
rate_ss_during = n_ss_during / (dt_during * n_sweeps);
rate_ss_after_base = n_ss_after_base / (dt_after_base * n_sweeps);

keep ans file_name rate_cs_after rate_cs_after_base rate_cs_before rate_cs_during rate_ss_after rate_ss_after_base rate_ss_before rate_ss_during;


