clear
close all
clc
pkg load signal;
cd /home/etf/Desktop/octave
csi_trace = read_bf_file('/home/etf/Desktop/2304-br6.dat');

t=[1:length(csi_trace)];
antena1 = ones(1,length(csi_trace));
antena2 = ones(1,length(csi_trace));
antena3 = ones(1,length(csi_trace));
faza1_5 = ones(1,length(csi_trace));
faza1_10 = ones(1,length(csi_trace));
faza1_15 = ones(1,length(csi_trace));
faza1_20 = ones(1,length(csi_trace));
faza1_25 = ones(1,length(csi_trace));
faza2_5 = ones(1,length(csi_trace));
faza2_10 = ones(1,length(csi_trace));
faza2_15 = ones(1,length(csi_trace));
faza2_20 = ones(1,length(csi_trace));
faza2_25 = ones(1,length(csi_trace));
faza3_5 = ones(1,length(csi_trace));
faza3_10 = ones(1,length(csi_trace));
faza3_15 = ones(1,length(csi_trace));
faza3_20 = ones(1,length(csi_trace));
faza3_25 = ones(1,length(csi_trace));

for i = 1 : length(csi_trace)
  
  csi_entry = csi_trace{i};
  csi = get_scaled_csi(csi_entry);
  csi = csi(1, :, :);
  csi_temp = squeeze(csi);
  
  angle1 = sanitize_phase(angle(csi_temp(1,:)));
  angle2 = sanitize_phase(angle(csi_temp(2,:)));
  angle3 = sanitize_phase(angle(csi_temp(3,:)));
  
  faza1_5(i) = angle1(5);
  faza1_10(i) = angle1(10);
  faza1_15(i) = angle1(15);
  faza1_20(i) = angle1(20);
  faza1_25(i) = angle1(25);
  
  faza2_5(i) = angle2(5);
  faza2_10(i) = angle2(10);
  faza2_15(i) = angle2(15);
  faza2_20(i) = angle2(20);
  faza2_25(i) = angle2(25);
  
  faza3_5(i) = angle3(5);
  faza3_10(i) = angle3(10);
  faza3_15(i) = angle3(15);
  faza3_20(i) = angle3(20);
  faza3_25(i) = angle3(25);
end
 
for j = 5:5:25
  for i = 1:length(csi_trace)
    
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    csi = csi(1, :, :);
    csi_temp = squeeze(csi);
    
    antena1(i) = csi(:,1,j);
    antena2(i) = csi(:,2,j);
    antena3(i) = csi(:,3,j);
  end
  
  antena1 = medfilt1(abs(antena1),4);
  antena2 = medfilt1(abs(antena2),4);
  antena3 = medfilt1(abs(antena3),4);

  faza1_5 = medfilt1(faza1_5,4);
  faza1_10 = medfilt1(faza1_10,4);
  faza1_15 = medfilt1(faza1_15,4);
  faza1_20 = medfilt1(faza1_20,4);
  faza1_25 = medfilt1(faza1_25,4);
  faza2_5 = medfilt1(faza2_5,4);
  faza2_10 = medfilt1(faza2_10,4);
  faza2_15 = medfilt1(faza2_15,4);
  faza2_20 = medfilt1(faza2_20,4);
  faza2_25 = medfilt1(faza2_25,4);
  faza3_5 = medfilt1(faza3_5,4);
  faza3_10 = medfilt1(faza3_10,4);
  faza3_15 = medfilt1(faza3_15,4);
  faza3_20 = medfilt1(faza3_20,4);
  faza3_25 = medfilt1(faza3_25,4);
  
  figure
  subplot (2,1,1);
  plot(t,(db(abs(antena1))))
  hold on
  plot(t,(db(abs(antena2))))
  hold on
  plot(t,(db(abs(antena3))))
  legend('Anthena 1', 'Anthena 2', 'Anthena 3');
  xlim([1 length(csi_trace)])
  ylim([-10 30])
  ylabel("SNR [dB]")
  grid on
  subplot(2,1,2);
  
  if j == 5
    plot(t,faza1_5)
    hold on
    plot(t,faza2_5)
    hold on
    plot(t,faza3_5)
    legend('Anthena 1', 'Anthena 2', 'Anthena 3');
  end
  
  if j == 10
    plot(t,faza1_10)
    hold on
    plot(t,faza2_10)
    hold on
    plot(t,faza3_10)
    legend('Anthena 1', 'Anthena 2', 'Anthena 3');
  end
  
  if j == 15
    plot(t,faza1_15)
    hold on
    plot(t,faza2_15)
    hold on
    plot(t,faza3_15)
    legend('Anthena 1', 'Anthena 2', 'Anthena 3');
  end
  
  if j == 20
    plot(t,faza1_20)
    hold on
    plot(t,faza2_20)
    hold on
    plot(t,faza3_20)
    legend('Anthena 1', 'Anthena 2', 'Anthena 3');
  end
  
  if j == 25
    plot(t,faza1_25)
    hold on
    plot(t,faza2_25)
    hold on
    plot(t,faza3_25)
    legend('Anthena 1', 'Anthena 2', 'Anthena 3');
  end
  
  xlim([1 length(csi_trace)])
  ylabel("Phase [rad]")
  grid on
end
 