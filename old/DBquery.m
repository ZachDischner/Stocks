function result = DBquery(q)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Month Day Year
%      +-------------------------+------------------------\    __      ____
%  {=  |     Zach Dischner,      | Email:   zach.dischner  \___| \____/ ___\___|
%  {=  |  Aerospace Engineering  |         @colorado.edu   /   ===---======)--->
%      +-------------------------+------------------------/                    |
%
%     Function  :
%
%     Purpose   :
%
%     Input     :
%
%     Output    :
%
%     Procedure :
%
%
%
%
%
%
%                                                 _
%                   ___                          (_)
%                 _/XXX\
%  _             /XXXXXX\_                                    __
%  X\__    __   /X XXXX XX\                          _       /XX\__      ___
%      \__/  \_/__       \ \                       _/X\__   /XX XXX\____/XXX\
%    \  ___   \/  \_      \ \               __   _/      \_/  _/  -   __  -  \
%   ___/   \__/   \ \__     \\__           /  \_//  _ _ \  \     __  /  \____/
%  /  __    \  /     \ \_   _//_\___    __/    //           \___/  \/     __/
%  __/_______\________\__\_/________\__/_/____/_____________/_______\____/____
%                                    ___
%                                   /L|0\
%                                  /  |  \
%                                 /       \
%                                /    |    \
%                               /           \
%                              /  __  | __   \
%                             /  __/    \__   \
%                            /  /__   |  __\   \
%                           /___________________\
%                          /          |         \
%                                /   _|_   \
%                        /      ____/___\____     \
%                        ___________[o0o]___________
%                                 O   O    O
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% q is a struct with fields corresponding to different parts of a db call
% q.table = tablename 
% q.type = ['select','insert','update']
% q.col  = ['columnname']
% q.where = where clause
% q.limit = limit for the query. 
% 
% ect

%% put in some error checking

%% build query
if strcmp(q.type,'select')
    cmd = 'SELECT'
elseif strcmp(q.type,'insert')
    cmd = 'INSERT';
elseif strcmp(q.type,'update')
    cmd = 'UPDATE';
end












end