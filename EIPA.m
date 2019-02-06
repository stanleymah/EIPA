% intialization
clear
clc

nx = 50; %# of rows
ny = 50; %# of columns

%square matrix creation
G = sparse(nx*ny, nx*ny); 

for i= 1:1:nx
    for j= 1:1:ny
        n=j+(i-1)*ny;
        if i == 1 || j == 1 
            G(n,:)=0;% boundary conditions 
            G(n,n)=1;
        else if i == nx || j == ny
            G(n,:)=0; 
            G(n,n)=1;
        else
                
            G(n,n)= -4;
            G(n,n+1)= 1;
            G(n,n+ny)= 1;
            G(n,n-ny)= 1;
            G(n,n-1)= 1;
            end
        end       
    end
end


figure(1)
clf
spy(G);
title('G Matrix');
xlabel('x'); ylabel('y');
grid on;

[E, D] = eigs(g, 9, 'SM'); 
plot(nx, D); 
title('Eigenvalues');
grid on;

% convert diagonal matrix to square
Second_E = zeros(nx, ny);
count = 1;

for z = 1:nx
    for p = 1:ny
        Second_E(z, p) = E(count, count); 
        count = count + 1;
    end
end

surf(E);
title('Eigenvectors');