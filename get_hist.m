function rt = get_hist(rd,m,n,l,cdf)
rt = zeros(1,256);
for i = 1:m          %Create histogram of the image
    for j = 1:n
        for k = 0:255
            if l == 1
                if rd(i,j) == k
                    rt(k+1) = rt(k+1)+1;
                end
            elseif l == 2
                if rd(i,j) == k
                    rt(i,j) = cdf(k+1);
                end
            end
        end
    end
end