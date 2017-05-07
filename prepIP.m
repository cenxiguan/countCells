function prepIP()
%% Function name: prepIP
%
% This function prepare the conditions needed for run CountCell.m
%
% Input arguments: N/A
%
% Output argument: N/A 
%
% Format of call: prepIP()
%
% Authors: Amauris Ferreira, Rong Guan
% Date: May 2, 2017

%% Clean
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
workspace;  % Make sure the workspace panel is showing.
	
%% Check that user has the Image Processing Toolbox installed
statusIPT = license('test', 'image_toolbox');
if ~statusIPT 
	% User does not have the toolbox installed
	message = sprintf('Sorry! You need to install the Image Processing Toolbox.\nDo you want to try to continue anyway?');
	reply = questdlg(message, 'Toolbox missing', 'Yes', 'No', 'Yes');
	if strcmpi(reply, 'No')
		% Exit
		return;
	end
end

%% Check that user has the Parallel Computing Toolbox installed
statusPCT = license('test', 'Distrib_Computing_Toolbox');
if ~statusPCT
	% User does not have the toolbox installed
	message = sprintf('Sorry! You need to install the Parallel Computing Toolbox.\nDo you want to try to continue anyway?');
	reply = questdlg(message, 'Toolbox missing', 'Yes', 'No', 'Yes');
	if strcmpi(reply, 'No')
		% Exit
		return;
	end
end

end
