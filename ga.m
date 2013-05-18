str = "強調將堅決支持";

str_length = length(str) / 3;

chr = [randi(2, 1, str_length-1) .- 1, 1]

str_arr = char(str);

start_position = 1;
for i=1:length(chr)
    if chr(i) == 1
        printf('%s \n', str_arr(start_position:i*3));
        start_position = i*3+1
    end
end
