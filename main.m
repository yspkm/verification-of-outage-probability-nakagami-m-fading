function [hvector, mvector, lvector] = main()
    
    height = 0:10*pi:200*pi; 
    model = height;
    label = height;
    i = 1;
    for i = 1:length(height)
        [model(i), label(i)] = get_test_vector(height(i), height(i));
        i = i + 1;
    end

    %disp(model);
    %disp(label);

    plot(height, model, height, label);
    hvector = height;
    mvector = model;
    lvector = label;
end