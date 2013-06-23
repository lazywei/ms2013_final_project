function tw_spliter(str)

str_length = tw_len(str);
str_arr = char(str);

% Create init chr groups
chr_groups = [];
%for i=1:5
%    chr = [randi(2, 1, str_length-1) .- 1, 1];
%    chr_groups = [chr_groups; chr];
%end

n = str_length-1 ;
chr_groups = (dec2bin(0:(2^n)-1)=='1');

final_result = [];
final_score = 0;

for i=1:size(chr_groups)(1)
    chr = [chr_groups(i, :) 1];
    result = slice_str_by_ref(str_arr, chr);

    score = 0;
    for i=1:size(result)(1)
       score += count_score(result(i, :));
       %score *= exp(occurrence([result(i-1, :) result(i, :)]) / occurrence(result(i-1, :)));
    end

    if score > final_score
        final_result = result;
        final_score = score;
    end
end
final_score
final_result
end

function len=tw_len(str)
    len = length(str) / 3;
end

function output=occurrence(word)
    cmd_str = 'redis-cli get ';
    [s, output] = system([cmd_str word]);
    output = str2num(output);
    if isempty(output)
        output = 1;
    end
end

function score=count_score(word)
    output = occurrence(word);
    if (tw_len(word) >= 4)
        score = (-1) * output;
    else
        score = tw_len(word) * output;
    end
end

function result=slice_str_by_ref(str_arr, ref)
    result = [];
    start_position = 1;
    for i=1:length(ref)
        if ref(i) == 1
            result = [result; str_arr(start_position:i*3)];
            start_position = i*3+1;
        end
    end
end
