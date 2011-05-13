%%
%% This is file `oxford_se.bst', version 0.4
%% It was first generated with the docstrip utility in custom-bib
%% and then heavily hacked by Peter Antman.
%% 
%% This file must still bee considered beta.
%%
%% This version is for swedish citation, to get other languages to work
%% rename it and insert the right bbl.xxx funcions and MACROS from
%% the right mbd-file, availible with custom-bib. There are two new such
%% commands, bbl.lq (leftquote) and bbl.rq (rightquote). Here you give
%% your languages way of quoting titles.
%%
%% The original source files were:
%%
%% merlin.mbs  (with options: `head,exlang,ay,har,harnm,vonx,nm-revf,ed-rev,dt-end,yr-col,note-yr,tit-qq,atit-u,vnum-nr,volp-com,jwdvol,add-pub,pub-date,pre-edn,edpar,blk-com,svenska,pp,ed,abr,amper,and-xcom,etal-it,{}')
%% svenska.mbs  (with options: `exlang,ay,har,harnm,vonx,nm-revf,ed-rev,dt-end,yr-col,note-yr,tit-qq,atit-u,vnum-nr,volp-com,jwdvol,add-pub,pub-date,pre-edn,edpar,blk-com,svenska,pp,ed,abr,amper,and-xcom,etal-it,{}')
%% merlin.mbs  (with options: `tail,exlang,ay,har,harnm,vonx,nm-revf,ed-rev,dt-end,yr-col,note-yr,tit-qq,atit-u,vnum-nr,volp-com,jwdvol,add-pub,pub-date,pre-edn,edpar,blk-com,svenska,pp,ed,abr,amper,and-xcom,etal-it,{}')
%% ----------------------------------------
%% ***  ***
%% 
 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{merlin.mbs}[1996/12/16 3.82 (PWD)]
 %
 % NOTICE:
 % This file may be used for non-profit purposes.
 % It may not be distributed in exchange for money,
 %   other than distribution costs.
 %
 % The author provides it `as is' and does not guarantee it in any way.
 %
 % Copyright (C) 1994, 1995, 1996 Patrick W. Daly
 % Copyright (C) 1997 Peter Antman, peter.antman@abc.se
 %-------------------------------------------------------------------
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 %
 % This is an Oxford style bibliography. As such, it is
 % non-standard LaTeX, and requires a special package file to function properly.
 % Such a package is  oxford.sty by Peter Antman
 % 
 % The form of the bibitem entries is
 %   \harvarditem[Jones, New thesis]{Howard Jones, FULL ENTRY}{1990}{key}
 %		Jones, Howard, FULL ENTRY
 %
 % The style gives the full reference att the first citation and then a
 % abrevated one.
 %
 % The file suports an additional entry in the bib-file, stitle. It is
 % for all but the first citation, when only lastname, and if there are
 % more lastnames that are the same, title (and if there is a stitle that
 % instead).
 % 
 % oxford.sty also inserts an ibid. if the current citation is the same
 % as the last one.
 %---------------------------------------------------------------------
 %
 % Hacked by Peter Antman to provide Oxford citation style.
 % FIX: Year cite not correct everywhere ???
 % changes version 0.2: 
 %	moved note in article
 %	editor and key right in short.ref
 % changes version 0.3:
 %	fixed editors in cite, now orde Firstname Lastname
 %	removed ( and ) around ed.
 %	removed comma before nr. if volume empty
 %	removed comma before year in article, misc and unpub
 % changes version 0.4
 % 	fixed ", " error produced in ouput.bibitem (thanks to
 %	Oren  Patashnik for telling me how to do it)

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    stitle
    title
    type
    URL
    volume
    year
  }
  {}
  { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

% BY Peter Antman, special function to get rid of comma before
% year in article, misc and unpub, se also output.check.special
FUNCTION {output.nonnull.special}
{ 's :=
  output.state mid.sentence =
    { " " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}
FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check.special}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull.special
  if$
}


FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  skip$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {non.stop}
{ duplicate$
   "}" * add.period$
   #-1 #1 substring$ "." =
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "\/}" * }
  if$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }

 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{svenska.mbs}[1995/08/07 1.0 (RL/PWD)]
 % Copyright (C) 1997, Peter Antman
 %-------------------------------------------------------------------

 % The language selected here is SVENSKA

FUNCTION {bbl.and}
{ "och"}

FUNCTION {bbl.editors}
{ "red." }

FUNCTION {bbl.editor}
{ "red." }

FUNCTION {bbl.edby}
{ "redigerad av" }

FUNCTION {bbl.edition}
{ "uppl." }

FUNCTION {bbl.volume}
{ "vol." }

FUNCTION {bbl.of}
{ "av" }

FUNCTION {bbl.number}
{ "nr." }

FUNCTION {bbl.nr}
{ "nr." }

FUNCTION {bbl.in}
{ "i" }

FUNCTION {bbl.pages}
{ "ss." }

FUNCTION {bbl.page}
{ "s." }

FUNCTION {bbl.chapter}
{ "kap." }

FUNCTION {bbl.techrep}
{ "Tekn. rap." }

FUNCTION {bbl.mthesis}
{ "Licenciatavgandling" }

FUNCTION {bbl.phdthesis}
{ "Doktorgradsavhandling" }

FUNCTION {bbl.first}
{ "F^^f6rsta" }

FUNCTION {bbl.second}
{ "Andra" }

FUNCTION {bbl.third}
{ "Tredje" }

FUNCTION {bbl.fourth}
{ "Fj^^e4rde" }

FUNCTION {bbl.fifth}
{ "Femte" }

FUNCTION {bbl.th}
{ "." }

% BY Peter Antman, new functions bbl.lq bbl.rq
FUNCTION {bbl.lq}
{ "''" }

FUNCTION {bbl.rq}
{ "''" }

MACRO {jan} {"Jan."}

MACRO {feb} {"Feb."}

MACRO {mar} {"Mar."}

MACRO {apr} {"Apr."}

MACRO {may} {"Maj"}

MACRO {jun} {"Jun."}

MACRO {jul} {"Jul."}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sep."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}

 % End of language definition file

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

FUNCTION {write.url}
{ URL empty$
    { skip$ }
    { "\newline\harvardurl{" URL * "}" * write$ newline$ }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}{, jj}{, ff}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " " * "et~al." emphasize * }
                { " \harvardand\ " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.names.ed}
{ format.names }

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    {
      author format.names
    }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    {
      editor format.names
      editor num.names$ #1 >
        { " " * bbl.editors * "" * }
        { " " * bbl.editor * "" * }
      if$
    }
  if$
}

FUNCTION {format.in.editors}
{ editor empty$
    { "" }
    { editor format.names.ed
      editor num.names$ #1 >
        { " " * bbl.editors * "" * }
        { " " * bbl.editor * "" * }
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title
       bbl.lq swap$ *   % BY Peter Antman, uses bbl.lq
      non.stop
        { bbl.rq * ", " * } % BY Peter Antman, uses bbl.rq
        { bbl.rq * " " * } % PROBLEM: comma after title in book
      if$
    }
  if$
}

FUNCTION {end.quote.title}
{ title empty$
    'skip$
    { before.all 'output.state := }
  if$
}

FUNCTION {format.full.names}
{'s :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " " * "et~al." emphasize * }
                { " \harvardand\ " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.key.full}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.key.full}
{ author empty$
    { key empty$
         { cite$ #1 #3 substring$ }
          'key
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {editor.key.full}
{ editor empty$
    { key empty$
         { cite$ #1 #3 substring$ }
          'key
      if$
    }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.full
    { type$ "proceedings" =
        'editor.key.full
        'author.key.full
      if$
    }
  if$
}

% BY Peter Antman, function to format long cite
FUNCTION {format.firstname}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ff }{jj }{vv }{ll}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " " * "et~al." emphasize * }
                { " \harvardand\ " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

% BY Peter Antman, function to format lastname
FUNCTION {format.lastname}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ll}{}{}{}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " " * "et~al." emphasize * }
                { " \harvardand\ " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

% By Peter Antman, to format eds as Firstname Lastname
FUNCTION {format.r.editors}
{ editor empty$
    { "" }
    {
      editor format.firstname
      editor num.names$ #1 >
        { " " * bbl.editors * "" * }
        { " " * bbl.editor * "" * }
      if$
    }
  if$
}

% BY Peter Antman, editors in Firstname Lastname
FUNCTION {format.in.r.editors}
{ editor empty$
    { "" }
    { editor format.firstname
      editor num.names$ #1 >
        { " " * bbl.editors * "" * }
        { " " * bbl.editor * "" * }
      if$
    }
  if$
}

FUNCTION {format.au}
{ author empty$
    { "" }
    {
      author format.firstname
    }
  if$
}
FUNCTION {format.auth}
{ author empty$
    { editor empty$ 
    		{author format.key}
    		{editor format.lastname}
    	if$
    }	
    {
      author format.lastname
    }
  if$
}

% BY Peter Antman, the repeated
% should contain name if no other name of the same
% if more names of the same, then stitle
% if no stitle, then title
FUNCTION {short.ref}
{
%	format.auth  
%	", " *
%	extra.label write$
	extra.label "" =
	        {
%		format.auth
		short.list % PANIC this is a bad bypas of not having solved ed.
		"" * extra.label
		}
		{ stitle empty$
			{
			format.auth
			", " * title
			} 
			{
			format.auth
			", " * stitle
			} 
		if$
		}
	if$	
}

FUNCTION {output.bibitem}
{ newline$
  "\harvarditem[" write$
%  short.ref duplicate$ label =
  "" short.ref * "]" * write$ 
  pop$ "" 
  "{" write$
%  pop$	% ERROR, does the right thing but produces error
 before.all 'output.state :=	
}

FUNCTION {end.bibitem}
{ "}{" * write$
  year duplicate$ empty$
    { pop$ "????" }
    'skip$
  if$
  extra.label * "}{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in
  " " * }

FUNCTION {format.date}
{ year duplicate$ empty$
    { "empty year in " cite$ * "; set to ????" * warning$
       pop$ "????" }
    'skip$
  if$
%  extra.label * % BY Peter Antman, removed, not needed in Oxford
  " (" swap$ * ")" *
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.connect
      series empty$
        'skip$
        { bbl.of space.word * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { bbl.number }
            { bbl.number capitalize }
          if$
          number tie.or.space.connect
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { bbl.in space.word * series * }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bbl.first 't := }
    { s "second" = s "2" = or
        { bbl.second 't := }
        { s "third" = s "3" = or
            { bbl.third 't := }
            { s "fourth" = s "4" = or
                { bbl.fourth 't := }
                { s "fifth" = s "5" = or
                    { bbl.fifth 't := }
                    { s #1 #1 substring$ is.num
                        { s bbl.th * 't := }
                        { edition 't := }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  t
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { convert.edition "l" change.case$ " " * bbl.edition * }
        { convert.edition "t" change.case$ " " * bbl.edition * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { bbl.pages pages n.dashify tie.or.space.connect }
        { bbl.page pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.journal.pages}
{
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ", " * pages n.dashify * }
      if$
    }
  if$
}

% BY Peter Antman, removed comma before bbl.nr if volume empty
FUNCTION {format.vol.num.pages}
{ volume field.or.null
  volume empty$
    'skip$
    { bbl.volume "~" * swap$ * }
  if$
  number empty$
    'skip$
    {
%      " " bbl.nr * number tie.or.space.connect *
      volume empty$
        { " " bbl.nr * number tie.or.space.connect * }
        { ", " bbl.nr * number tie.or.space.connect * }
      if$
    }
  if$
  format.journal.pages
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

% By Peter Antman, editors in Firstname Lastname order
FUNCTION {format.in.r.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { word.in booktitle emphasize * }
        { word.in format.in.r.editors * ", " *
          booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { word.in booktitle emphasize * }
        { word.in format.in.editors * ", " *
          booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { bbl.techrep }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{
  word.in
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      word.in
    }
    { bbl.volume volume tie.or.space.connect
      bbl.of space.word *
    }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{
  word.in
  " \cite{" * crossref * "}" *
}

FUNCTION {format.publisher}
{ publisher empty$
   %  "empty publisher in " cite$ * warning$ %dont like this warning
   'skip$ 
    'skip$
  if$
  ""
      add.blank "(" *
      address empty$
        'skip$
        { address * }
      if$
      publisher empty$
        'skip$
        { address empty$
            'skip$
            { ": " * }
          if$
          publisher *
        }
      if$
      year duplicate$ empty$
        { "empty year in " cite$ * "; set to ????" * warning$
          pop$ "????" }
        'skip$
      if$
      publisher empty$ address empty$ and
        { * }
        { ", " swap$ * * }
      if$
      ")" *
  output
}

% BY Peter Antman, all types includes full ref
FUNCTION {article}
{ output.bibitem
%  pop$ 	 % to get rid of ,
  format.au "author" output.check % output instead of output check
  author format.key output
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { journal
      emphasize
      "journal" output.check
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  format.date "year" output.check.special
  note output
  end.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { journal
      emphasize
      "journal" output.check
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
 format.date "year" output.check.special
  note output
  fin.entry
  write.url
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.r.editors "author and editor" output.check
      editor format.key output
    }
    { format.au output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.number.series output
      format.edition output
      note output
      format.publisher
    }
    {
      format.book.crossref output.nonnull
    }
  if$
  end.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.number.series output
      format.edition output
      note output
      format.publisher
    }
    {
      format.book.crossref output.nonnull
    }
  if$
%  note output
  fin.entry
  write.url
}

FUNCTION {booklet}
{ output.bibitem
   format.au output
  author format.key output
  format.title "title" output.check
  end.quote.title
  howpublished output
%  address output
  note output
%  format.date "year" output.check
  format.publisher
  end.bibitem
  format.authors output
  author format.key output
  format.title "title" output.check
  end.quote.title
  howpublished output
%  address output
  note output
%  format.date "year" output.check
  format.publisher
  fin.entry
  write.url
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.r.editors "author and editor" output.check
      editor format.key output
    }
    { format.au output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    {
      format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      format.number.series output
      format.edition output
      note output
      format.publisher
    }
    {
      format.chapter.pages "chapter and pages" output.check
      format.book.crossref output.nonnull
    }
  if$
  end.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    {
      format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      format.number.series output
      format.edition output
      note output
      format.publisher
    }
    {
      format.chapter.pages "chapter and pages" output.check
      format.book.crossref output.nonnull
    }
  if$
%  note output %note moved
  fin.entry
  write.url
}

FUNCTION {incollection}
{ output.bibitem
  format.au "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { format.in.r.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.edition output
      format.chapter.pages output
      note output
      format.publisher
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  end.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.edition output
      format.chapter.pages output
      note output
      format.publisher
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
%  note output %note moved
  fin.entry
  write.url
}

FUNCTION {inproceedings}
{ output.bibitem
  format.au "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { format.in.r.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.pages output
      note output
      publisher empty$
        { organization output
%          address output
%          format.date "year" output.check
	   format.publisher
        }
        { organization output
          format.publisher
        }
      if$
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  end.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.pages output
      note output
      publisher empty$
        { organization output
%          address output
%          format.date "year" output.check
	   format.publisher
        }
        { organization output
          format.publisher
        }
      if$
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
%  note output % note moved
  fin.entry
  write.url
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  format.au output
  author format.key output
  format.btitle "title" output.check
  organization output
%  address output
  format.edition output
  note output
%  format.date "year" output.check
  format.publisher
  end.bibitem
  format.authors output
  author format.key output
  format.btitle "title" output.check
  organization output
%  address output
  format.edition output
  note output
%  format.date "year" output.check
  format.publisher
  fin.entry
  write.url
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.au "author" output.check
  author format.key output
  format.btitle "title" output.check
  bbl.mthesis format.thesis.type output.nonnull
  school "school" output.check
%  address output
  note output
%  format.date "year" output.check
  format.publisher
  end.bibitem
  format.authors "author" output.check
  author format.key output
  format.btitle "title" output.check
  bbl.mthesis format.thesis.type output.nonnull
  school "school" output.check
%  address output
  note output
%  format.date "year" output.check
  format.publisher
  fin.entry
  write.url
}

FUNCTION {misc}
{ output.bibitem
  format.au output
  author format.key output
  format.title output
  end.quote.title
  howpublished output
  note output
  format.date "year" output.check.special
  end.bibitem
  format.authors output
  author format.key output
  format.title output
  end.quote.title
  howpublished output
  note output
  format.date "year" output.check.special
  fin.entry
  write.url
}

FUNCTION {phdthesis}
{ output.bibitem
  format.au "author" output.check
  author format.key output
  format.btitle "title" output.check
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" output.check
%  address output
  note output
%  format.date "year" output.check
  format.publisher
  end.bibitem
  format.authors "author" output.check
  author format.key output
  format.btitle "title" output.check
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" output.check
%  address output
  note output
%  format.date "year" output.check
  format.publisher
  fin.entry
  write.url
}

FUNCTION {proceedings}
{ output.bibitem
  format.r.editors output
  editor format.key output
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
%  address output
  organization output
%  publisher output
  note output
%  format.date "year" output.check
  format.publisher
  end.bibitem
  format.editors output
  editor format.key output
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
%  address output
  organization output
%  publisher output
  note output
%  format.date "year" output.check
  format.publisher
  fin.entry
  write.url
}

FUNCTION {techreport}
{ output.bibitem
  format.au "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  format.tr.number output.nonnull
  institution "institution" output.check
%  address output
  note output
%  format.date "year" output.check
  format.publisher
  end.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  format.tr.number output.nonnull
  institution "institution" output.check
%  address output
  note output
%  format.date "year" output.check
  format.publisher
  fin.entry
  write.url
}

FUNCTION {unpublished}
{ output.bibitem
  format.au "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  note "note" output.check
  format.date "year" output.check.special
  end.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  end.quote.title
  note "note" output.check
  format.date "year" output.check.special
  fin.entry
  write.url
}

FUNCTION {default.type} { misc }

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ " " * "et~al." emphasize * }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " " * "et~al." emphasize * }
            { " \harvardand\ " * s #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.label
        'author.key.label
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  ", "
  *
  year duplicate$ empty$
     { pop$ "????" }
     'skip$
  if$
  *
  'label :=
}

FUNCTION {calc.short.label}
{ calc.short.authors short.list
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ll{ }}{  ff{ }}{  jj{ }}"
      format.name$ 't :=
      nameptr #1 >
        {
          "   "  *
          namesleft #1 = t "others" = and
            { "aaaaa" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.sort}
{ editor empty$
    { key empty$
        { "to sort, need editor or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.sort
        'author.sort
      if$
    }
  if$
  #1 entry.max$ substring$
  'sort.label :=
  sort.label
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { last.label next.extra }

INTEGERS { last.extra.num number.label }

FUNCTION {initialize.extra.label.stuff}
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {not.uniq.forw}
{ last.label short.list =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      short.list 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
%  label write$
}

FUNCTION {not.uniq.rew}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "" swap$ * "" * }
  if$
  'extra.label :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
%  label write$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "" swap$ * "" * }
  if$
  'extra.label :=
}

EXECUTE {initialize.extra.label.stuff}

%ITERATE {forward.pass}

ITERATE {not.uniq.forw}

REVERSE {not.uniq.rew}

%REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
  calc.short.label
}

ITERATE {bib.sort.order}

SORT

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
%  "\newcommand{\enquote}[1]{``#1''}"
%  write$ newline$
%  "\expandafter\ifx\csname natexlab\endcsname\relax\def\natexlab#1{#1}\fi"
%  write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
%% End of customized bst file
%%
%% End of file `svenska.bst'.
