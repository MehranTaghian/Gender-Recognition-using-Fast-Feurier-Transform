function test()

folder='C:\Users\Mehran\Desktop\Desktop Files\Courses\6th Term\Signals and Systems\project_g2\voices';
audio_files=dir(fullfile(folder,'*.mp3'));

for k=1:numel(audio_files)
    filename = audio_files(k).name;
    [signal, fs] = audioread(filename);
    disp(filename);
    
    l = length(signal);
    NFFT = 2^nextpow2(l);
    disp(NFFT);
    f = fs/2*linspace(0,1,floor(NFFT/2) +1);
    xf = abs(fft(signal, NFFT));
    
    temp = floor(length(audio_files) / 3) + 1;
%     subplot(temp,3, k);
    
    if(k == 2) 
        plot(f, xf(1:floor(NFFT/2) + 1));
    end
    xIndex = find(xf == max(xf), 1, 'first');
    maxfValue = f(xIndex);
    disp(maxfValue);
    is_male = abs(maxfValue - 122);
    is_female = abs(maxfValue - 212);
    
    if(is_male > is_female)
%         list(k, 2) = 'female';
        if(k==2)
            title('female');
        end
        disp('female');
    else
%         list(k, 2) = 'male';
        if(k==2)
            title('male');
        end
        disp('male');
    end
    disp('#####################################################################');
end

% save('result', list);




% l = length(signal);
% NFFT = 2^nextpow2(l);
% f = fs/2*linspace(0,1,floor(NFFT/2) +1);
% xf = abs(fft(signal, NFFT));
% plot(xf);
% plot(f, xf(1:floor(NFFT/2) + 1));
% % disp(xf(1:5000));
% 
% xIndex = find(xf == max(xf), 1, 'first');
% maxXValue = f(xIndex);
% disp(maxXValue);



% srate = fs;
% npnts = srate*2;
% % npnts = size(signal, 1);
% time = (0:npnts-1)/srate;
% 
% disp(fs)
% % 
% % frex = [12 18 30];
% % 
% % signal = zeros(size(time));
% % 
% % for fi=1:length(frex)
% %    signal = signal + fi*sin(2*pi*frex(fi)*time); 
% % end
% 
% % signal = signal + randn(size(signal));
% 
% % signalX = fft(signal);
% signalX = periodogram(signal);
% 
% signalAmp = abs(signalX)/(npnts);
% 
% hz = linspace(0, srate, npnts);
% % hz = linspace(0, srate, floor(npnts/2)+1);
% % hz = linspace(0, 1000, floor(npnts/2)+1);
% 
% 
% % figure(1), clf
% % subplot(211)
% % plot(time, signal)
% % xlabel('Time(s)'), ylabel('Amplitude');
% % title('Time domain');
% 
% % subplot(212)
% % stem(hz, signalAmp(1:length(hz)), 'ks', 'linew', 2, 'markersize' , 10);
% bar(hz, signalAmp(1:length(hz)));
% % set(gca, 'xlim', [0 max(frex) * 3]);
% xlabel('Frequency (Hz)'), ylabel('Amplitude')
% title('Frequency domain')
% 
% % subplot(211), hold on
% % plot(time, ifft(signalX), 'ro');
% % legend({'Original';'IFFT reconstructed'});




% srate = 1234;
% npnts = srate*2;
% time = (0:npnts-1)/srate;
% 
% 
% frex = [12 18 30];
% 
% signal = zeros(size(time));
% 
% for fi=1:length(frex)
%    signal = signal + fi*sin(2*pi*frex(fi)*time); 
% end
% 
% signal = signal + randn(size(signal));
% 
% signalX = fft(signal);
% signalAmp = 2*abs(signalX)/npnts;
% 
% hz = linspace(0, srate/2, floor(npnts/2)+1);
% 
% figure(1), clf
% subplot(211)
% plot(time, signal)
% xlabel('Time(s)'), ylabel('Amplitude');
% title('Time domain');
% 
% subplot(212)
% % stem(hz, signalAmp(1:length(hz)), 'ks', 'linew', 2, 'markersize' , 10);
% bar(hz, signalAmp(1:length(hz)));
% set(gca, 'xlim', [0 max(frex) * 3]);
% xlabel('Frequency (Hz)'), ylabel('Amplitude')
% title('Frequency domain')
% 
% subplot(211), hold on
% plot(time, ifft(signalX), 'ro');
% legend({'Original';'IFFT reconstructed'});


end

