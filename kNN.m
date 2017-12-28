function [acc, acc_av] = kNN (images_train, labels_train, images_test, labels_test, k)
 % This function kNN reports the accuracy of each class(acc) and average accuracy(acc_av) of each class, where  
%   acc is a vector of length 10 and acc_av is a scalar.

    acc = zeros(1,10);
    acc_av = 0;
    acc_av_temp =0;
    acc_test_data = zeros(1,10); 
    acc_predicted_data = zeros(1,10);
    sizeDataTest=size(images_test,1);
    
    %% repeats the loop n times , where n is count of test images
    for i = 1 : sizeDataTest 
        index = 0;
        
        %% Distance_test is m(number of training images) x 1 vector, which contains the distance of test image
        %% from ech of the training image.
        Distance_test = pdist2(images_test(i,:),images_train);
        
        %% Sorted training lables w.r.t distance vector in ascending order to find the shortest path 
        [sortedDistance_test,IX] = sort(Distance_test);
        sortedlabels_train = labels_train(IX,:);    
        
        %% k closest lables are populated and frequesnt one is choosen using mode function.
        k_closest_lables = sortedlabels_train(1:k);
        index = mode(k_closest_lables) + 1;
        
        
        
        %% accuracy is incremented by one If the predicted label is equal to test label 
        acc_test_data(index) = acc_test_data(index) + 1 ;
        if labels_test(i) == mode(k_closest_lables)
            acc_av_temp = acc_av_temp + 1;
            acc_predicted_data(index) = acc_predicted_data(index) + 1;
        end
          
    end 
        %% average is calculated by dividing the total accuracy with number of testing data.   
         acc_av = 100 * acc_av_temp / sizeDataTest;
         acc = 100 * rdivide(acc_predicted_data,acc_test_data);
         fprintf('Average accuracy is %f \n',acc_av) 
         g=sprintf('%g ', acc);
         fprintf('Average accuracy of class : %s\n', g)
end



