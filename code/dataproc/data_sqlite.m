load('../../experiments/sqlite/toMeasure_14april2017/configurations.mat');
parameters = {'SQLITE_SECURE_DELETE','SQLITE_ENABLE_ATOMIC_WRITE','SQLITE_ENABLE_STAT2','SQLITE_DISABLE_LFS',...
    'SQLITE_DISABLE_DIRSYNC','SQLITE_OMIT_AUTOMATIC_INDEX','SQLITE_OMIT_BETWEEN_OPTIMIZATION',...
    'SQLITE_OMIT_BTREECOUNT','SQLITE_OMIT_LIKE_OPTIMIZATION','SQLITE_OMIT_LOOKASIDE','SQLITE_OMIT_OR_OPTIMIZATION',...
    'SQLITE_OMIT_QUICKBALANCE','SQLITE_OMIT_SHARED_CACHE','SQLITE_OMIT_XFER_OPT'};
responses = {'operation_time_feature7_3763','operation_time_feature6_3763','operation_time_feature4_3190'...
    'operation_time_feature3_3763','operation_time_feature20_3763','operation_time_feature21_3190',...
    'operation_time_amazon_micro_3763'
};
benchmark = {'fillseq','fillseqsync','fillseqbatch','fillrandom','fillrandsync'...
    'fillrandbatch','overwrite','overwritebatch','readrandom','readseq'...
    'fillrand100K','fillseq100K','readseq','readrand100K'};
num_of_options = length(parameters);

operation_time_feature7_3763 = preproc_sqlite('../../experiments/sqlite/measurements/sqlite_results_feature7/');
operation_time_feature6_3763 = preproc_sqlite('../../experiments/sqlite/measurements/sqlite_results_feature6/');
operation_time_feature4_3190 = preproc_sqlite('../../experiments/sqlite/measurements/sqlite_results_feature4/');
operation_time_feature3_3763 = preproc_sqlite('../../experiments/sqlite/measurements/sqlite_results_feature3/');
operation_time_feature20_3763 = preproc_sqlite('../../experiments/sqlite/measurements/sqlite_results_feature20/');
operation_time_feature21_3190 = preproc_sqlite('../../experiments/sqlite/measurements/sqlite_results_feature21/');
operation_time_amazon_micro_3763 = preproc_sqlite('../../experiments/sqlite/measurements/sqlite_results_amazon_micro/');

sqlite = [configurations,...
    operation_time_feature7_3763,operation_time_feature6_3763,operation_time_feature4_3190,...
    operation_time_feature3_3763,operation_time_feature20_3763,operation_time_feature21_3190,...
    operation_time_amazon_micro_3763
];

csvwrite_with_headers('sqlite.csv',sqlite,[parameters,benchmark,benchmark,benchmark,benchmark,benchmark,benchmark,benchmark])