function aStrFilePath = CreatePresentationFiles_NEW(strExpDevice, strSubjectID, strPermutationType, strLeftRight, strGroup, strRootFolder, strScriptFolderWM, bCreatePresentationFiles)

    viNumBitmapFlicker = [1];
    viEncodingTimes = [133];   
    % complete time span for encoding in ms
    viTotalEncodingTime = [133*3];
 
	strExpName = 'Working_Memory';               

    switch strExpDevice
        case 'MRI'
            if bCreatePresentationFiles
                vbExtraTrials = [0 1]; % generate no extra excercise trials in introduction scene file
                viSessionNumbers = [1];
                [strSubjectFolder] = CreateFolders(strRootFolder, strSubjectID, strPermutationType, strLeftRight, strGroup, strExpName, strExpDevice);
            end
        case 'MEG'
            if bCreatePresentationFiles
                vbExtraTrials = [0 1]; % generate extra excercise trials in introduction scene file
                viSessionNumbers = [1 2];
                [strSubjectFolderSession1, strSubjectFolderSession2] = CreateFoldersMEG(strRootFolder, strSubjectID, strPermutationType, strLeftRight, strGroup, strExpName, strExpDevice, viSessionNumbers);
            end
        case 'PSY';
            if bCreatePresentationFiles
                vbExtraTrials = [0 1]; % generate extra excercise trials in introduction scene file
                viSessionNumbers = [1];
                [strSubjectFolder] = CreateFolders(strRootFolder, strSubjectID, strPermutationType, strLeftRight, strGroup, strExpName, strExpDevice);
            end
    end
    
       
    for iSession = viSessionNumbers

        if strcmp(strExpDevice,'MEG')
            if iSession == 1
                filePath = strSubjectFolderSession1;   
            else
                filePath = strSubjectFolderSession2;   
            end
        else
        	filePath = strSubjectFolder;
        end
   
        aStrFilePath{iSession} = filePath;
        
        % If presentation for current experimental device (i.e. MEG or MRI)
        % should not be created, continue to next loop iteration without
        % creating any folders or files.
        if ~bCreatePresentationFiles
            continue
        end
        
        
        %%{
        for bCreateExtraTrials = vbExtraTrials 

            for iEncTime = 1:length(viTotalEncodingTime)

                totalEncodingTime = viTotalEncodingTime(iEncTime);

                strMessage = sprintf('Total encoding time = %d ms', totalEncodingTime);
                disp(strMessage);

                dbPercNonAlertedTargets = [];
                iCond{1} = 1; strCond{1} = 'Salient';    dbPercNonAlertedTargets(1) = 0.2; 
                iCond{2} = 2; strCond{2} = 'Nonsalient'; dbPercNonAlertedTargets(2) = 0.2; 

                for bIsUncued = [ true false]
                    for i=1:size(dbPercNonAlertedTargets,2)

                        strExpCondShort = sprintf('%s_%s_%s', strExpName, strExpDevice, strCond{i});
                        strExpCond = sprintf('%s_%s_%s_%s_%s', strExpName, strExpDevice, strPermutationType, strLeftRight, strCond{i});
                        strCondCode = strCond{i};
                        setupParadigm(strExpDevice, iSession, strLeftRight, filePath, strScriptFolderWM, bCreateExtraTrials, dbPercNonAlertedTargets(i), strCondCode, iCond{i}, ...
                        strExpCond, strExpCondShort, viNumBitmapFlicker, viEncodingTimes, viTotalEncodingTime, bIsUncued); % EXP5 cue before endcoding
                    end
                end
            end
        end
        %}
    end

end
