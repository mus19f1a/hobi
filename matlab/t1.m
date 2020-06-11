% Başlangıç poligonunu oluşturuyoruz
bslngcX = [6, -6, -12, -6, 6, 12];
h = sqrt(108);
bslngcY = [h, h, 0, -h, -h, 0];

altgn = [bslngcX;bslngcY]';

% Figür çerçevesini ayarlıyoruz
figure('Position', [100, 100, 900, 900]);
axes
axis('square')

% Altıgenimizi figüre ekliyoruz
scatter(bslngcX,bslngcY);

% Başlangıç noktası belirliyoruz
% (Altıgen içerisinde herhangi bir nokta olabilir)
p0 = [3,4];

% Hesaplanacak nokta sayısını seçiyoruz
say = 100000;
% değişkenimiz için hafızada yer ayarlıyoruz
% (sıfırlardan oluşan bir matris)
snc = zeros(say,2);

for i = 1:say
    
  % rastgele bir sayı seçiyoruz, (0 ile 5 arasında)
    rst = randi(5)+randi(5);
  % seçilen sayıya göre bir kenar ve takip eden kenarı seçiyoruz
    p1 = altgn(mod(rst,6)+1,:);
    p2 = altgn(mod(rst+1,6)+1,:);
  % elde edilen üçgen kenarlarına göre merkez noktasını hesaplıyoruz
    p0 = mean([p0;p1;p2]);
  % hesaplanan merkez noktasını kaydediyoruz
    snc(i,:) = p0;
    
end

% Noktaları figüre eklemek için "hold on" seçeneğini aktifleştiriyoruz
hold on;
% Hesaplanan tüm merkez noktalarını çizdiriyoruz
scatter(snc(:,1),snc(:,2),'.');

