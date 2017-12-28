clear
load MNIST_digit_data
whos

acc = zeros(1,10);
acc_av = 0;
images_train_1 = images_train(1:1000, :);
labels_train_1 = labels_train(1:1000, :);
images_test_1 = images_test(1:1000,:);
labels_test_1 = labels_test(1:1000,:);
[acc, acc_av] = kNN (images_train_1, labels_train_1, images_test_1, labels_test_1,5)