% let's write an animation for the fluid loop
clc, clear

L = 0.460; % total length of loop
W = 0.04; % width of loop

N = L*1e3; % total nodes
Nw = W*1e3; % nodes in width section

% we need to identify where the tube corners are so that we can plot it
% we read clockwise

NtoRMax = N/2; % nodes to middle point top

C1 = NtoRMax - Nw; % corner one node
C2 = C1 + Nw; % corner two node
C3 = C2 + C1; % corner three node
C4 = C3 + Nw; % corner four node


% now we need to look at the fluid phases
% we need to build some (x,y) points to plot this. First build the Y axis
% which tells out the Y position for any node N:
YAxisC1 = 1:C1;
YAxisC2 = C1 + zeros(1,Nw);
YAxisC3 = flip(YAxisC1);
YAxisC4 = YAxisC3(end) + zeros(1,Nw);
YAxis = [YAxisC1, YAxisC2, YAxisC3, YAxisC4];

% do the same for the x-axis (simpler)
XAxisC1 = 1 + zeros(1,length(YAxisC1));
XAxisC2 = 1:Nw;
XAxisC3 = Nw + zeros(1,length(YAxisC3));
XAxisC4 = flip(XAxisC2);
XAxis = [XAxisC1, XAxisC2, XAxisC3, XAxisC4];

% use corners to build rectangle
rectangle('position', [1 1 Nw-1 C1-1],'linewidth',10)
axis equal
ylim([min(YAxis) - 10 max(YAxis) + 10]);
PosStruct = load('SampleData.mat','Phase');
Phase = PosStruct.Phase;
set(gca,'xtick',[])
set(gca,'ytick',[])
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
% now scatter the fluid phase with specific color while iterating in time

hold on

Anim = VideoWriter('FluidLoopAnimation.avi');
Anim.Quality = 100;
Anim.FrameRate = 10;
open(Anim);
for t = 0:0.1:10
    j = round(t/1e-04);
    if j == 0
        j = 1;
    end
    for i = 1:N
        X = XAxis(i);
        Y = YAxis(i);
        if Phase(i,j) == 1
            plot(X,Y,'square','MarkerFaceColor','blue','MarkerEdgeColor','blue')
        else
            plot(X,Y,'square','MarkerFaceColor','white','MarkerEdgeColor','white')
        end
    end
    title(sprintf('Time: %0.2f sec',t))
    drawnow;
    writeVideo(Anim, getframe(gcf));
end
close(gcf);
close(Anim);
