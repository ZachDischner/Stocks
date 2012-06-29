% Use this fuction to store information/global specs throughout app


function output = params(input)

switch input
    case 'Start Date'
        output = datestr('2008/01/01');
    case 'debug'
        output = true;
        
        
end
