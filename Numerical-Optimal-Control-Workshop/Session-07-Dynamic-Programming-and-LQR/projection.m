function index = projection(in, values)
    minv = values(1);
    maxv = values(end);
    N = length(values);
    index = round(((in-minv)/(maxv-minv))*(N-1)) + 1;
end
