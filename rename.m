%Program to rename videos in ascending order starting from 1
a ='C:\Users\91700\Desktop\Car-number-plate-detection\img\';                       %Path where the videos are stored
A =dir( fullfile(a, '*.jpg') );                         %Reading videos
fileNames = { A.name };
for iFile = 1 : numel( A )
  newName = fullfile(a, sprintf( '%d.jpg', iFile ) );
  movefile( fullfile(a, fileNames{ iFile }), newName );    
end
%End of code