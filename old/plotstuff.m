%% Make purdy
figures = sort(findobj('MenuBar','figure'));
lines = sort(findobj(gca,'Type','line'));
screen_size = get(0,'ScreenSize');
sw = screen_size(3);    % Screen Width
sh = screen_size(4);    % Screen Height
fw = 750;               % Figure Width
fh = 500;               % Figure Height
mh = 90;                % Estimated Menu Height
cd('plots')
for ii=1:length(figures)

    figure(ii)
set(gcf,'Color',[1 1 1], 'Position',[10 (sh-fh-mh)  750 500])
 set(lines,  'LineWidth',2)
grid on
   txtobjs = unique(findall(findall(gcf),'Type','text','Units','data','-not','String',''));
 set(txtobjs,   'Color',[75 75 75]./256,...
                                            'FontName','Century Gothic',...
                                            'FontWeight','bold',...
                                            'FontUnits','pixels',...
                                            'FontSize',16)
                                        
       
      saveas(gcf,num2str(ii),'png')
      
end
cd ..