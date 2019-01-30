frames=dir('*.png');
first(1,:,:,:)=imread(frames(1).name);
im=repmat(first,130+2,1); % initialize buffer
for i=1:length(frames)
    im=circshift(im,1);
    im(1,:,:,:)=imread(d(i).name);
    for j=1:size(im,2) % build image from interpolated rows in buffer
        k=130*j/size(im,2); fk=floor(k);
        o(j,:,:)=double((1-(k-fk))*im(fk+1,j,:,:))+double((k-fk)*im(fk+2,j,:,:));
    end
    imwrite(uint8(o),sprintf('%06d.jpg',i))
end
