{smcl}
{* *! version 1.2  21jul2020}{...}

{title:Title}

{phang}
{bf:setpaths} {hline 2} Set do-file and data file paths


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:setpaths}
{it:dofile_path datafile_path}]
[, {cmdab:k:eepexisting}]


{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{it:dofile_path}} the path to your do-files.  This is typically in your 
local clone of the GitLab project. {p_end}
{synopt:{it:datafile_path}} the path to your data files.  For sensitive data, this
typically a folder in your encrypted drive, or a folder on the secure server. 

{synopt: } when either path is omitted, {cmdab:setpahts} produces a dialog box
to request the paths from the user. {p_end}

{synopt:{cmdab:k:eepexisting}}when present, if $dopath and $datapath already exist, do nothing.{p_end}
 

{marker description}{...}
{title:Description}

{pstd}
{cmd:setpaths} Creates two globals, $dopath and $datapath, which can be used in 
do-files for Stata projects.  This enables easy sharing of projects among  
analysts and across different computers.

{marker remarks}{...}
{title:Remarks}

{pstd}
Projects often involve working with files in multiple folders, and with 
multiple collaborators.  This command sets two global macros, $dopath and $datapath, 
that should be used in the code where a reference to a filepath is made, for
example when changing the present working directory or loading data files. {p_end}

{pstd}
Invoked without any arugments, {cmd:setpaths} will present a dialog box that 
asks the user to choose folders.  {p_end}

{pstd}
The {cmdab:k:eepexisting} option suppresses the dialog box when $dopath and
$datapath are already populated.  This allows for {cmd:ajicpath}, 
{cmdab:k:eepexisting} to be used repeatedly without annoyance.  It is the user's
responsibility to either clear the $dopath and $datapath globals when starting 
a different project in the same Stata session, or to quit/relaunch Stata when 
starting a new project.  {p_end}

{pstd}
Note:  Due to the way Stata deals with dialog boxes, {cmd:setpaths} must -break- 
execution of dofiles when invoked without the {cmdab:k:eepexisting} option.  
Dialog boxes do not pause execution of do-files.  Simply complete the dialog box and rerun
your do-file.
{p_end}

{marker Author}{...}
{title:Author}
{pstd}
Troy Payne {p_end}
{pstd}
Bauman Consulting Group {p_end}
{pstd}
{p_end}
{pstd}
troy@baumanconsultinggroup.com {p_end}

