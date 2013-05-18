str = "強調將堅決支持";

str_length = length(str) / 3;
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
    result = [];
    start_position = 1;
    chr = [chr_groups(i, :) 1];
    for i=1:length(chr)
        if chr(i) == 1
            result = [result; str_arr(start_position:i*3)];
            start_position = i*3+1;
        end
    end

    score = 0;
    cmd_str = 'redis-cli get ';
    for i=1:size(result)(1)
        [s, output] = system([cmd_str result(i, :)]);
        output = str2num(output);
        if isempty(output)
            output = 1;
        end
        score += (length(result(i, :)) / 3)^2 + output;
    end
    if score >= final_score
        final_result = result;
        final_score = score;
    end
end
final_score
final_result
