function features = PML(img,options)
%PML	Pyramid Multi-Level features
%% SE Bekhouche, A Ouafi, F Dornaika,A Taleb-Ahmed and A Hadid, “Pyramid Multi-Level Features for Facial Demographic Estimation”, In press.
% 
%	Usage:
%             descriptor = PML(img)
%             descriptor = PML(img, options)
%       Written by Salah Eddine Bekhouche (salah@bekhouche.com)
%

numPatterns = 256;

if (~isfield(options, 'level'))
    options.level = 4;
end



%% Descriptor
if (isfield(options, 'descriptor'))
    if(strcmp(options.descriptor,'LPQ'))
        if (~isfield(options, 'winSize'))
            options.winSize = 3;
        end
        
        if (~isfield(options, 'decorr'))
            options.decorr = 1;
        end
        
        if (~isfield(options, 'freqestim'))
            options.freqestim = 1;
        end
        
        im = lpq(img,options.winSize,options.decorr,options.freqestim,'im');
        
    elseif (strcmp(options.descriptor,'BSIF'))
        if (~isfield(options, 'filter'))
            error('Filter.');
        end
        numPatterns = 2^size(options.filter,3);
        im = bsif(img,options.filter,'im');
    else
        error('Error. \nWrong descriptor name (%s).',options.descriptor);
    end
else
    im = img;
end

%% Representation
[m,n] = size(im);
for i=1:options.level
    pml_im{i} = imresize(im, [m*(i/options.level),n*(i/options.level)]);
end


counter = 0;
features = zeros(sum((1:options.level).^2)*numPatterns,1);
for lvl=1:options.level
    [md,nd] = size(pml_im{lvl});
    h = floor(md/lvl);
    w = floor(nd/lvl);        
    hl = mod(md,h);
    wl = mod(nd,w);
    
    for mm = 1:h:md-hl
        for nn = 1:w:nd-wl
            sub_block = pml_im{lvl}(mm:mm+h-1,nn:nn+w-1,:);
            features((counter*numPatterns)+1:(counter+1)*(numPatterns)) = hist(sub_block(:),0:numPatterns-1);  
            counter = counter + 1;
        end
    end
    
end

end

