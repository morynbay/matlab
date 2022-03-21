%************************************              Sural                ****************************************
% pCS30 = parallelplot(cs_ss_be_du_af_30_train_Sural(:,1:2),'MarkerStyle','o','MarkerSize',6,'LineStyle','-','Color',[0 0 1],...
%     'CoordinateTickLabels',{'before','during','after'},'CoordinateLabel','10Hz train stimulation','DataLabel','CS mean rates (Hz)','Title',...
%     'Complex spikes activity at 30uA, Sural stimulation (200ms)','FontName','Helvetica','FontSize',8,'DataNormalization','none','Jitter',0);
%
% % 
% pSS30 = parallelplot(cs_ss_be_du_af_30_train_Sural(:,4:5),'MarkerStyle','^','MarkerSize',6,'LineStyle','-','Color',[1 0 0],...
%     'CoordinateTickLabels',{'before','during','after'},'CoordinateLabel','10Hz train stimulation','DataLabel','SS mean rates (Hz)','Title',...
%     'Simple spikes activity at 30uA, Sural stimulation (200ms)','FontName','Helvetica','FontSize',8,'DataNormalization','none','Jitter',0);

% 
% bar(1,CS_neg_pos_percent(1,1),'FaceColor',[0 0 1])
% % text(1:length(CS_neg_pos_percent),CS_neg_pos_percent,num2str(CS_neg_pos_percent(1,1)),'vert','bottom','horiz','center');
% 
% hold on;
% bar(2,CS_neg_pos_percent(1,2),'FaceColor',[1 0 0]);
% text(1:length(CS_neg_pos_percent),CS_neg_pos_percent,num2str(CS_neg_pos_percent(1,:)),'vert','bottom','horiz','center'); 
% ylim([0, 80]);
% title('Complex spikes at 30uA, Sural stimulation');
% ylabel('Count/total, %');

% h1 = bar(1,SS_neg_pos_percent(1,1),'FaceColor',[0 0 1]);
% % text(1:length(SS_neg_pos_percent),SS_neg_pos_percent,num2str(SS_neg_pos_percent(1,1)),'vert','bottom','horiz','center');
% 
% hold on;
% h2 = bar(2,SS_neg_pos_percent(1,2),'FaceColor',[1 0 0]);
% text(1:length(SS_neg_pos_percent),SS_neg_pos_percent,num2str(SS_neg_pos_percent(1,:)),'vert','bottom','horiz','center'); 
% ylim([0, 80]);
% title('Simple spikes at 30uA, Sural stimulation');
% ylabel('Count/total, %');
%****************************************************************************************************************************




%********************************             Tibial                 ***********************************
% pCS30 = parallelplot(cs_ss_be_du_af_30_train_Tibial(:,1:2),'MarkerStyle','o','MarkerSize',6,'LineStyle','-','Color',[0 0 1],...
%     'CoordinateTickLabels',{'before','during','after'},'CoordinateLabel','10Hz train stimulation','DataLabel','CS mean rates (Hz)','Title',...
%     'Complex spikes activity at 30uA, Tibial stimulation (200ms)','FontName','Helvetica','FontSize',8,'DataNormalization','none','Jitter',0);

% 
% pSS30 = parallelplot(cs_ss_be_du_af_30_train_Tibial(:,4:5),'MarkerStyle','^','MarkerSize',6,'LineStyle','-','Color',[1 0 0],...
%     'CoordinateTickLabels',{'before','during','after'},'CoordinateLabel','10Hz train stimulation','DataLabel','SS mean rates (Hz)','Title',...
%     'Simple spikes activity at 30uA, Tibial stimulation (200ms)','FontName','Helvetica','FontSize',8,'DataNormalization','none','Jitter',0);

% % 
% bar(1,CS_neg_pos_percent(1,1),'FaceColor',[0 0 1])
% % text(1:length(CS_neg_pos_percent),CS_neg_pos_percent,num2str(CS_neg_pos_percent(1,1)),'vert','bottom','horiz','center');
% 
% hold on;
% bar(2,CS_neg_pos_percent(1,2),'FaceColor',[1 0 0]);
% text(1:length(CS_neg_pos_percent),CS_neg_pos_percent,num2str(CS_neg_pos_percent(1,:)),'vert','bottom','horiz','center'); 
% ylim([0, 80]);
% title('Complex spikes at 30uA, Tibial stimulation');
% ylabel('Count/total, %');
% 
% 

% h1 = bar(1,SS_neg_pos_percent(1,1),'FaceColor',[0 0 1]);
% % text(1:length(SS_neg_pos_percent),SS_neg_pos_percent,num2str(SS_neg_pos_percent(1,1)),'vert','bottom','horiz','center');
% 
% hold on;
% h2 = bar(2,SS_neg_pos_percent(1,2),'FaceColor',[1 0 0]);
% text(1:length(SS_neg_pos_percent),SS_neg_pos_percent,num2str(SS_neg_pos_percent(1,:)),'vert','bottom','horiz','center'); 
% ylim([0, 80]);
% title('Simple spikes at 30uA, Tibial stimulation');
% ylabel('Count/total, %');
% 



%*********************************************       CP         ***************************************

% pCS30 = parallelplot(cs_ss_be_du_af_30_train_CP(:,1:2),'MarkerStyle','o','MarkerSize',6,'LineStyle','-','Color',[0 0 1],...
%     'CoordinateTickLabels',{'before','during','after'},'CoordinateLabel','10Hz train stimulation','DataLabel','CS mean rates (Hz)','Title',...
%     'Complex spikes activity at 30uA, CP stimulation (200ms)','FontName','Helvetica','FontSize',8,'DataNormalization','none','Jitter',0);
% 

% pSS30 = parallelplot(cs_ss_be_du_af_30_train_CP(:,4:5),'MarkerStyle','^','MarkerSize',6,'LineStyle','-','Color',[1 0 0],...
%     'CoordinateTickLabels',{'before','during','after'},'CoordinateLabel','10Hz train stimulation','DataLabel','SS mean rates (Hz)','Title',...
%     'Simple spikes activity at 30uA, CP stimulation (200ms)','FontName','Helvetica','FontSize',8,'DataNormalization','none','Jitter',0);


% bar(1,CS_neg_pos_percent(1,1),'FaceColor',[0 0 1])
% % text(1:length(CS_neg_pos_percent),CS_neg_pos_percent,num2str(CS_neg_pos_percent(1,1)),'vert','bottom','horiz','center');
% 
% hold on;
% bar(2,CS_neg_pos_percent(1,2),'FaceColor',[1 0 0]);
% text(1:length(CS_neg_pos_percent),CS_neg_pos_percent,num2str(CS_neg_pos_percent(1,:)),'vert','bottom','horiz','center'); 
% ylim([0, 80]);
% title('Complex spikes at 30uA, CP stimulation');
% ylabel('Count/total, %');
% 

% h1 = bar(1,SS_neg_pos_percent(1,1),'FaceColor',[0 0 1]);
% % text(1:length(SS_neg_pos_percent),SS_neg_pos_percent,num2str(SS_neg_pos_percent(1,1)),'vert','bottom','horiz','center');
% 
% hold on;
% h2 = bar(2,SS_neg_pos_percent(1,2),'FaceColor',[1 0 0]);
% text(1:length(SS_neg_pos_percent),SS_neg_pos_percent,num2str(SS_neg_pos_percent(1,:)),'vert','bottom','horiz','center'); 
% ylim([0, 80]);
% title('Simple spikes at 30uA, CP stimulation');
% ylabel('Count/total, %');
%***************************************************************************************************************







