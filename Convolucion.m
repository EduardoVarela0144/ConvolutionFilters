function Convolucion (I,index)

%imshow(I)
%%Gris(I)
A=double(I)./255;
[m,n,p]=size(A);
B=zeros(m,n);
try
        switch index
            %Edge
            case 2
            h=[-1 -1 -1;-1 8 -1;-1 -1 -1];

            %Prewitt
            case 3
%             h=[-1 0 1;-1 0 1;-1 0 1];
              h=[-1 -1 -1;0 0 0;1 1 1];

            %Sobel
            case 4
            h=[-1 -2 -1;0 0 0;1 2 1];

            %Sharp
            case 5
            h=[-1 -1 -1;-1 9 -1;-1 -1 -1];

            %Blur
            case 6
            h=[1/9 1/9 1/9;1/9 1/9 1/9;1/9 1/9 1/9];

            %Repujado
            case 7
            h=[-2 -1 0;-1 1 1;0 1 2];

            %Suavizado Gaussiano
            case 8
            h=[1/16 2/16 1/16;2/16 4/16 2/16;1/16 2/16 1/16];
            
        end
        f = waitbar(0,'Cargando...');
        pause(.5)

        waitbar(.33,f,'Procesando imagen');
        pause(1)
         for i=2:m-1
            for j=2:n-1
                
                B(i,j)=h(1,1).*A(i-1,j-1)+h(1,2).*A(i-1,j)+h(1,3).*A(i-1,j+1) ...
                      +h(2,1).*A(i,j-1) +h(2,2).*A(i,j) + h(2,3).*A(i,j+1) ...
                      +h(3,1).*A(i+1,j+1)+h(3,2).*A(i+1,j)+h(3,3).*A(i+1,j+1);
                  
            end
         end
         waitbar(.67,f,'Aplicando filtro');
         pause(1)

         waitbar(1,f,'Terminando');
         pause(1)

         close(f)
        
        imshow(B);
catch
     warndlg('Seleccione una opción','Warning');
     
end

   





end


