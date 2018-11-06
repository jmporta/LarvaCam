%%%% This file is only to "solve" a bug with the uigetdir function/widget in version
%%%% 2018a. Delete in other case to restablish the normal behavior.

% This function permits to use a java-widget instead of win-widget without
% doing any change in the whole code.


function [pathname] = uigetdir_workaround(start_path, dialog_title)

% Pick a directory with the Java widgets instead of uigetdir

import javax.swing.JFileChooser;

if nargin == 0 || isempty(start_path)

    start_path = pwd;

end

jchooser = javaObjectEDT('javax.swing.JFileChooser', start_path);

jchooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

if nargin > 1

    jchooser.setDialogTitle(dialog_title);

end

jchooser.setMultiSelectionEnabled(false);

status = jchooser.showOpenDialog([]);

if status == JFileChooser.APPROVE_OPTION

    pathname = jchooser.getSelectedFile();

    pathname = char(pathname);

elseif status == JFileChooser.CANCEL_OPTION

    pathname = [];

else

    error('An error occurred while choosing a directory.');

end 