clc;
import mlreportgen.dom.*
import mlreportgen.report.*

xMostEntries = 100;
topXentries = 20;

% Report type and name
rpt_type = "html-file";
rpt = Report("test", rpt_type);

rpt_wcImg = createRptWcImage_Fcn(tableTweetsPerAuthor, rpt, xMostEntries);
rpt_barPlotImg = createRptBarhImage_Fcn(tableTweetsPerAuthor, rpt, topXentries);

rpt_figCaption = [...
            strjoin([xMostEntries " Most Used Hashtags"], ""),...
            strjoin(["Top " topXentries " Hashtags by Tweet Count"], "")];
rpt_figTableCaption = {rpt_figCaption(1), rpt_figCaption(2)};
rpt_figTableContent = {rpt_wcImg, rpt_barPlotImg};

% Create the mlreportgen formal table    
rpt_tblOfFigures = FormalTable(rpt_figTableCaption, rpt_figTableContent);
% Format the formal table
rpt_tblOfFigures = formatRptTableWGraphs_Fcn(rpt_tblOfFigures);

open(rpt)
add(rpt, TableOfContents())
add(rpt, rpt_tblOfFigures)
close(rpt)

rptview(rpt)
