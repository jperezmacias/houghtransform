%Program by Martin Turesson and Jose M. Pérez-Macias Martin
%December 10th 2007
%Project Image Analysis

close all,clear all,clc
 tic
%% Loading the image
%Output: I
%  [Im,MAP]= imread('coins.png');
[Im,MAP]= imread('eight.tif');
I=Im;
figure, imshow(Im)
%I = ind2gray(Im,MAP);
I=double(I);
I = I/max(I(:));

%% Edge detection
logfilt = fspecial('log');
%figure(1);imshow(I);
filt = filter2(logfilt,I,'same');
% % % figure;imshow(filt);imhist(filt);
filtbw = im2bw(filt,0.25); % We convert the edge image in black and white w/ threshold 0.25

% Canny edge detection
%filtbw=edge(I, 'canny', [0.1 0.2], 2);

figure,imshow(filtbw)
%% Edges (x,y) --> Edge points
[x,y]=find(filtbw);
%%

%% Radius loop
centers=[];
votes_radius=[];
size1=size(I,1);size2=size(I,2);
rad=24:40;
NOP = 200;theta=linspace(0,2*pi,NOP); %Variables for plotting
threshold=0.16;
figure,imshow(I),hold on
m=zeros(1,NOP);
n=m;
for r=1:size(rad,2)

    radius=rad(r);r2=radius^2;
    H=zeros(size1,size2); % we create the voting matrix

    %Hough transform of the matrix. We draw a circle around all the edges
    %of the image. H
    tic
    for i=1:length(x)

        %Calculatin the coordinates of the circle for each edge point (x_i,y_i)
        last=[0,0];now=[0,0]; %We store the last draw value, because we just want to draw
        %one pixel for each edge. This is because rounding problems.

        %m,n coordinates of the possible centers

        m=ceil(x(i)+radius*cos(theta));n=ceil(y(i)+radius*sin(theta));
       
        for p=1:length(m)

            now=[m(p),n(p)]; %we store the pixel we are going to draw and check if its the same as the last pixel

            %If the point is within the H matrix and different to the last
            %point we voted, we vote for it

           if ((m(p)<size1)&&(n(p)<size2)&&(m(p)>0)&&(n(p)>0)&&(now(1,1)~=last(1,1))&&(now(1,2)~=last(1,2)))
                H(m(p),n(p))=H(m(p),n(p))+1;
            end

           last=[m(p),n(p)];

        end


    end
   
    toc


    %Plot of the Hough transform for an specific radius
    %g=fspecial('average'); %H=filter2(g,H);
    
    
    figure,Hmax = max(max(H));imshow(H/Hmax,[0 1]);title('Hough Transform')
   
    %     figure, surf(H)
    %peaks=houghpeaks(H,10,'threshold',ceil(0.3*max(H(:))));
    %peaks=houghpeaks(H,9,'Threshold',1-Hmax*0.40,'NHoodSize',[5 5])
    %peaks=houghpeaks(H,2,'Threshold',Hmax*0.15,'NHoodSize',[5 5])

    Hbis=H;

 
  figure,surf(H), hold on, plano=H;

    %bwh = imdilate(d, ones(3, 3));
    %bwh = imerode(d, ones(3, 3));
    %stat = imfeature(bwh, 'Centroid')

    l=2*pi*radius;


    %We see if there are posible circles within the threshold


    if(find(Hbis>l*threshold))
        plano(:)=l*threshold;
        surf(plano);hold off;
        Hbis(find(Hbis<l*threshold))=0;
        
        [p,q]=find(Hbis);
        si=size(p,1); %Number of posible centers, to use with Houghpeaks
        peaks=houghpeaks(Hbis,si);
        %figure,imshow(Hbis);
        
        p=peaks(:,1);q=peaks(:,2);
        votes_radius=[];
        if(peaks)
            for h=1:size(peaks,1)
                votes_radius=[votes_radius;H(peaks(h,1),peaks(h,2)),radius];
            end

            centers=[centers;peaks,votes_radius];
        end

        % H2=imdilate(H, ones(1,1));highest=ordfilt2(H2,9,ones(3,3));secondhighest=ordfilt2(H2,8,ones(3,3)),
        % nounique= (highest == secondhighest),figure,imshow(nounique)

    end
end

%% end radius loop

%% Code for choosing the right circles. Operations with the centers matrix
% matrix=[1 2;1 3];
% matrix(1,:)=[]; deletes the entire row #1

%% Checking close centers of different radii
 
%Investigate if different radii give the same point, or almost
%the same
centers;
centers_delete=[];
for k=1:size(centers,1)
    for l=1:size(centers,1)
        %if the centers of two centerpoints occur on a distance that is
        %smaller than half of the smaller radius        
        if (sqrt( (centers(k,1)-centers(l,1))^2 + (centers(k,2)-centers(l,2))^2 ) < 5 && ...
                l~=k)%sqrt( (centers(k,1)-centers(l,1))^2 + (centers(k,2)-centers(l,2))^2 ) ~= 0)
            %then delete that row in 'centers' which contains the smallest
            %vote value
            if(centers(k,3)>centers(l,3))
                centers_delete = [centers_delete l];
            else
                centers_delete = [centers_delete k];                
            end      
        end
    end
end

centers(centers_delete,:)=[];

%% Ploting all the "valid" centers
% centers(x,y,vote,radius)

for n=1:size(centers,1)

    RHO=ones(1,NOP)*centers(n,4);
    [X,Y] = pol2cart(theta,RHO);

    % XX and YY all coordinates for one circle
    XX=round(X+centers(n,1));
    YY=round(Y+centers(n,2));

    plot(YY,XX)


    % % % % %     %We build a matrix of the same size as the image and put to one all the
    % % % % %     %last values
    % % % % %     HH=zeros(size1,size2);
    % % % % %
    % % % % %     for pp=1:length(XX)
    % % % % %         if XX(pp)>0 && YY(pp)>0
    % % % % %             HH(XX(pp),YY(pp))=1;
    % % % % %         end
    % % % % %     end


end

    

















