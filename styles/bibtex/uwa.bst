%%% ====================================================================
%%%  @BibTeX-style-file{
%%%     filename = "uwa.bst",
%%%     version  = "1.1",
%%%     date     = "1998/07/15",
%%%     time     = "14:37:33 EST",
%%%     checksum = "38973 1474 4577 33560" 
%%%     author   = "Greg Gamble",
%%%     address  = "Centre for Discrete Mathematics & Computing,
%%%                 Department of Computer Science
%%%                       & Electrical Engineering,
%%%                 The University of Queensland,
%%%                 Queensland 4072,
%%%                 Australia",
%%%     telephone = "+61 7 336 51195",
%%%     FAX       = "+61 7 336 51999",
%%%     copyright = "Copyright (C) 1998 Greg Gamble,
%%%                  all rights reserved.  Copying of this file is
%%%                  authorised only if either:
%%%                   (1) you make absolutely no changes to your copy,
%%%                       including name; OR
%%%                   (2) if you do make changes, you first rename it
%%%                       to some other name.",
%%%     email     = "gregg@csee.uq.edu.au (Internet)",
%%%     keywords  = "bibtex, bibliography, latex,",
%%%     supported = "yes",
%%%     abstract  = "BibTeX bibliography style `uwa' for BibTeX
%%%                  versions 0.99a or later and LaTeX version 2e,
%%%                  a significantly modified version of the American 
%%%                  Mathematical Society's `amsplain', incorporating
%%%                  many features of `abbrv'. Versions 1.0 and 1.0a
%%%                  of the style were written (and modified) while
%%%                  the author was at the University of Western
%%%                  Australia - hence the style name `uwa'. Note,
%%%                  that the style `uwab' provides an identical
%%%                  style except that it does not use \bysame
%%%                  (a horizontal line in place of the author(s)
%%%                  of a bibitem, indicating the author(s) are the
%%%                  same as the previous bibitem).
%%%                    Briefly the style produces bibitems that are 
%%%                  either one or two (if there is both a note and 
%%%                  other information) sentences. Functions are provided 
%%%                  to emphasize, embolden, slantify and parenthesize. 
%%%                    The general philosophy is titles (including 
%%%                  booktitles and series) are either set in quotes 
%%%                  (article type titles) or emphasized; prepositions 
%%%                  like `in' are included to provide breaks between 
%%%                  fields of similar typeface and set either in upshape 
%%%                  or slanted to set it off from adjacent text; 
%%%                    * volume is set in bold unless it would clash 
%%%                      with a cross-reference (where the style is: 
%%%                      `vol. ... of ...'); 
%%%                    * number is treated as if it is a volume unless 
%%%                      both exist (in which case it is set as:
%%%                      `,no. ...' following the volume); 
%%%                    * organization, address, edition, year are set 
%%%                      together separated by commas in parentheses; 
%%%                      and in many places, e.g. before a left 
%%%                      parenthesis and before volume, the comma that
%%%                      is set by most styles is suppressed (the function
%%%                      no.comma is used in most places this has been done
%%%                      - a comma can be inserted, if this is desired, 
%%%                      usually by simply removing the `no.comma'
%%%                      - please ... if you modify the style in this
%%%                      or any other way, heed the copyright warning
%%%                      by changing the name of the file); 
%%%                    * name(s) and month(s) are set as in the `abbrv' style.
%%%                  Peculiar to the style is the use of \bysame in place
%%%                  of the authors names for succeeding bibitems by the
%%%                  same authors. If this feature is not desirable (i.e.
%%%                  explicit author lists for all papers is required),
%%%                  use the `uwab' style instead.
%%%                    The `ize' endings for many function names have been 
%%%                  retained ... it would be too confusing to change such 
%%%                  American spelling to English (even though, personally 
%%%                  I prefer the English usage: `ise').
%%%                    Changes:
%%%                  - Version 1.0 [1996/02/26]: first release of `uwa.bst'
%%%                  - Version 1.0a [1996/05/24]: added field: 
%%%                    * editiontype, so that technical documentation 
%%%                      could use the MANUAL type and have `Version No.'
%%%                      instead of `No. ed.'
%%%                  - Version 1.1 [1998/07/15]: added fields: 
%%%                    * url. It is typeset before the note field (if 
%%%                      there is one) using LaTeX's \verb with | delimiters 
%%%                      (by default). For the rare situation, where a | 
%%%                      actually appears in the URL, the delimiter may be 
%%%                      changed by setting the field verbdelim;
%%%                    * verbdelim (see description for url field).
%%%                    Examples of usage (including some that demonstrate
%%%                  `editiontype', `url' and `verbdelim') are provided in
%%%                  `uwaxampl.bib'",
%%%     docstring = "The checksum field above contains a CRC-16
%%%                  checksum as the first value, followed by the
%%%                  equivalent of the standard UNIX wc (word
%%%                  count) utility output of lines, words, and
%%%                  characters.  This is produced by Robert
%%%                  Solovay's checksum utility.",
%%%  }
%%% ====================================================================

% See the file btxbst.doc for extra documentation other than
% what is included here.  And see btxhak.tex for a description
% of the BibTeX language and how to use it.

% This defines the types of fields that can occur in a database entry
% for this particular bibliography style.  Except for `language',
% this is the standard list from plain.bst.

%% Types of entries currently allowed in a BibTeX file:
%%
%% ARTICLE -- An article from a journal or magazine.
%%
%% BOOK -- A book with an explicit publisher.
%%
%% BOOKLET -- A work that is printed and bound,
%% but without a named publisher or sponsoring institution.
%%
%% CONFERENCE -- The same as INPROCEEDINGS,
%% included for Scribe compatibility.
%%
%% INBOOK -- A part of a book,
%% which may be a chapter (or section or whatever) and/or a range of pages.
%%
%% INCOLLECTION -- A part of a book having its own title.
%%
%% INPROCEEDINGS -- An article in a conference proceedings.
%%
%% MANUAL -- Technical documentation.
%%
%% MASTERSTHESIS -- A Master's thesis.
%%
%% MISC -- Use this type when nothing else fits.
%%
%% PHDTHESIS -- A PhD thesis.
%%
%% PROCEEDINGS -- The proceedings of a conference.
%%
%% TECHREPORT -- A report published by a school or other institution,
%% usually numbered within a series.
%%
%% UNPUBLISHED -- A document having an author and title, but not formally
%% published.

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editiontype
    editor
    howpublished
    institution
    journal
    key
    language
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    url
    verbdelim
    volume
    year
  }
  {}
  { label extra.label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block 
	   mid.sentence.nocomma
	 }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'mid.sentence.nocomma :=
}

% Scratch variables:

STRINGS { s t }

% Utility functions

FUNCTION {shows}
{ duplicate$ "::::  `" swap$ * "'" * top$
}

FUNCTION {showstack}
{"STACK====================================================================="
top$
stack$
"ENDSTACK=================================================================="
top$
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

% Standard warning message for a missing or empty field. For the user
% we call any such field `missing' without respect to the distinction
% made by BibTeX between missing and empty.

FUNCTION {missing.warning}
{ "missing " swap$ * " in " * cite$ * warning$ }

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {field.or.null.check}
{ 't :=
  duplicate$ empty$
    { pop$ "" t missing.warning }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}

FUNCTION {embolden}
{ duplicate$ empty$
    { pop$ "" }
    { "\textbf{" swap$ * "}" * }
  if$
}

FUNCTION {slantify}
{ duplicate$ empty$
    { pop$ "" }
    { "\textsl{" swap$ * "}" * }
  if$
}

FUNCTION {parenthesize}
{ duplicate$ empty$
    { pop$ "" }
    { "(" swap$ * ")" * }
  if$
}

% n.dashify is used to make sure page ranges get the TeX code
% (two hyphens) for en-dashes.

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

% tie.or.space.connect connects two items with a ~ if the
% second item is less than 3 letters long, otherwise it just puts an
% ordinary space.

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {add.space.if.necessary}
{ duplicate$ "" =
    'skip$
    { " " * }
  if$
}

% either.or.check gives a warning if two mutually exclusive fields
% were used in the database.

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

% output.nonnull is called by output.

FUNCTION {output.nonnull}
% remove the top item from the stack because it's in the way.
{ 's :=
  output.state mid.sentence.nocomma =
% If we're in mid-sentence, but no comma is required append a space to the new
% top item and write it ... and then restore the normal mid-sentence state
    { " " * write$
      mid.sentence 'output.state :=
    }
    { output.state mid.sentence =
% If we're in mid-sentence, add a comma to the new top item and write it
        { ", " * write$ }
        { output.state after.block =
% If we are finishing a block add a period and take this opportunity to
% start a new line and thus avoid extra long lines in the .bbl file
            { add.period$ write$
              newline$
              "\newblock " write$
            }
% Otherwise, if we're at the beginning of a bibitem,
            { output.state before.all =
% just write out the top item from the stack;
                'write$
% and the last alternative is that we're at the end of the current
% bibitem, so we add a period to the top stack item and write it out.
                { add.period$ " " * write$ }
              if$
              mid.sentence 'output.state :=
            }
          if$
	}
      if$
    }
  if$
% Put the top item back on the stack that we removed earlier.
  s
}

% Output checks to see if the stack top is empty; if not, it
% calls output.nonnull to write it out.

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

% Output.check is like output except that it gives a warning on-screen
% if the given field in the database entry is empty.  t is the field
% name.

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ t missing.warning }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
% This empty string is the first thing that will be written
% the next time write$ is called.  Done this way because each
% item is saved on the stack until we find out what punctuation
% should be added after it.  Therefore we need an empty first item.
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

% The three append functions are like the corresponding output 
% functions ...
% append.nonnull concatenates the top 2 elements on the stack 
% putting the string append.conjuction in between if both are
% non-empty ... the result is left on top of the stack

STRINGS { append.conjunction }

FUNCTION {append.nonnull}
% remove the top item from the stack because it's in the way.
{ 's :=
   duplicate$ empty$
     { pop$ s }
     { append.conjunction * s * }
   if$
}

% append does exactly what append.nonnull was described to do ...
% if the top element is non-empty it calls append.nonnull to 
% concatenate the top 2 stack elements ... otherwise it just
% throws away the top element.

FUNCTION {append}
{ duplicate$ empty$
    'pop$
    'append.nonnull
  if$
}

% append.check is like append except that it gives a warning on-screen
% if the given field in the database entry is empty.  t is the field
% name ... analogous to output.check.

FUNCTION {append.check}
{ 't :=
  duplicate$ empty$
    { pop$ t missing.warning }
    'append.nonnull
  if$
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

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {no.comma}
{ duplicate$ empty$
    'skip$
    { output.state before.all =
	'skip$
	{ mid.sentence.nocomma 'output.state := }
      if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }

% The extra section to write out a language field was added
% for AMSPLAIN.BST.  Not present in plain.bst.

FUNCTION {format.language}
{ language no.comma parenthesize
}

FUNCTION {format.note}
{ note empty$
    { "" }
    { note new.block }
  if$
}

% The url field is formatted in a similar fashion to the note field
% but appears before it. We use LaTeX's \verb with | delimiters
% by default, i.e. \verb|<URL>| is how it appears in the output.
% For the rare situations where a | appears in the URL, the user
% can set the verbdelim field to a different character.

FUNCTION {format.url}
{ url empty$
    { "" }
    { verbdelim empty$
        { "\verb|" url * "|" * new.block }
        { "\verb" verbdelim * url * verbdelim * new.block }
      if$
    }
  if$
}

% This version of format.names puts names in the format
%
% Initials von Last, Jr.

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #2 >
		{ "," * }
		'skip$
	      if$
	      t "others" =
		{ " et~al." * }
		{ " and " * t * }
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

FUNCTION {format.authors}
{ author empty$
    { "" }
    { extra.label "\bysame" =
         {"\bysame"}
         { author format.names }
     if$
    }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
	{ " (eds.)" * }
	{ " (ed.)" * }
      if$
    }
  if$
}

FUNCTION {format.nonauthor.editors}
{ editor empty$
    { "" }
    { editor num.names$ #1 >
        { "Eds." slantify }
        { "Ed." slantify }
      if$
      editor format.names tie.or.space.connect
    }
  if$
}

% This is the only place we set anything in quotes ... so we don't
% provide a special function like: emphasize, embolden, slantify
% and parenthesize

FUNCTION {format.atitle}
{ title empty$
    { "" }
    { " `" title "t" change.case$ * "'" * }
  if$
}

FUNCTION {format.btitle}
{ title empty$
    { "" }
    { title "t" change.case$ emphasize }
  if$
}

% format.title ... treat as an article if pages are empty
% or as if whole book otherwise

FUNCTION {format.title}
{ pages empty$
    'format.btitle
    'format.atitle
  if$
}

% For formatting the volume number for a journal or book of a series

FUNCTION {format.journal.vol.year}
{ " " 'append.conjunction :=
  ""
  journal emphasize "journal name" append.check
  volume embolden append
  year parenthesize "year" append.check
}

% For formatting the issue number for a journal article.

FUNCTION {format.number}
{ number empty$
    { "" }
    { "no.~" number * }
  if$
}

FUNCTION {format.series}
{ series emphasize
}

FUNCTION {format.series.volume.number}
{ format.series
  " " 'append.conjunction :=
  volume embolden
  duplicate$ empty$
    { pop$ number embolden append }
    { append.nonnull
      number empty$
        'skip$
        { ", no.~" * number * 
	  series empty$
            { "doesn't make sense to use both volume and number if series info is missing"
              warning$
              "in BibTeX entry type `" type$ * "'" * top$
            }
	    'skip$
	  if$
	}
      if$
    }
  if$
}

FUNCTION {format.in.series.volume.number}
{ series empty$
    { "" }
    { "in " }
  if$
  format.series.volume.number *
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { editiontype empty$ 
	{ output.state mid.sentence =
	    { edition "l" change.case$ " ed." * }
	    { edition "t" change.case$ " ed." * }
          if$
	}
        { editiontype " " * edition * }
        if$
    }
  if$
}

% For formatting miscellaneous dates ... builds the date on top of the stack

FUNCTION {format.date}
{ month empty$
    { year field.or.null }
    { month
      year empty$
	{ "there's a month but no year in " cite$ * warning$ }
	{ " " * year * }
      if$
    }
  if$
}

FUNCTION {format.edition.date}
{ ", " 'append.conjunction :=
  ""
  format.edition append
  format.date "year" append.check
  parenthesize
}

FUNCTION {format.howpublished.address.date}
{ ", " 'append.conjunction :=
  ""
  howpublished append
  address append
  format.date append
  parenthesize
}
   
FUNCTION {format.publisher.address.edition.date}
{ ", " 'append.conjunction :=
  ""
  publisher "publisher" append.check
  address append
  format.edition append
  format.date "year" append.check
  parenthesize
}
   
FUNCTION {format.org.publisher.address.date}
{ ", " 'append.conjunction :=
  ""
  organization append
  publisher append
  address append
  format.date "year" append.check
  parenthesize
}
   
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "vol.~" volume *
      series empty$
        'skip$
        { " of " * format.series * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

% format.booktitle formats the booktitle field of types incollection
% and inproceedings

FUNCTION {format.booktitle}
{ booktitle empty$
    { "" }
    { title empty$
	{ "" }
	{ "in " }
      if$
      booktitle emphasize * 
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
    { pages n.dashify }
  if$
}

FUNCTION {format.book.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
	{ "pp.~" pages n.dashify * }
	{ "p.~" pages * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.book.pages
    { type empty$
	{ "ch.~" }
	{ type "l" change.case$ " " * }
      if$
      chapter *
      pages empty$
	'skip$
	{ ", " * format.book.pages * }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
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

FUNCTION {format.techrep.type.number}
{ type empty$
    { "Tech. Report" }
    'type
  if$
  emphasize
  " " 'append.conjunction :=
  number embolden append
}

% Now we have a number of format.crossref functions 

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
	{ "need key or journal for " cite$ * " to crossref " * crossref *
	  warning$
	  ""
	}
	{ "in" journal emphasize tie.or.space.connect }
      if$
    }
    { "in" key tie.or.space.connect }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
	'skip$
	{ editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { " et~al." * }
	    { " and " * editor #2 "{vv~}{ll}" format.name$ * }
	  if$
	}
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "in "
    }
    { "vol.~" volume * " of " * }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ series empty$
	    { "need editor, key, or series for " cite$ * " to crossref " *
	      crossref * warning$
	      "" *
	    }
	    { format.series * }
	  if$
	}
	{ key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ booktitle empty$
	    { "need editor, key, or booktitle for " cite$ * " to crossref " *
	      crossref * warning$
	      ""
	    }
	    { "in " booktitle emphasize * }
	  if$
	}
	{ "in" slantify key tie.or.space.connect }
      if$
    }
    { "in" slantify format.crossref.editor tie.or.space.connect }
  if$
  " \cite{" * crossref * "}" *
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The main functions for each entry type.

% journal, vol and year are formatted together because they are
% not separated by commas.

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  format.atitle "title" output.check
  crossref missing$
    { format.journal.vol.year output
      format.number output
      format.pages "pages" output.check
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.in.series.volume.number output
      format.publisher.address.edition.date no.comma output
    }
    { format.book.crossref output.nonnull 
      format.edition.date no.comma output
    }
  if$
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  format.btitle "title" output.check
  format.howpublished.address.date no.comma output
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.in.series.volume.number output
      format.chapter.pages "chapter and pages" output.check
      format.publisher.address.edition.date no.comma output
    }
    { format.book.crossref output.nonnull
      format.chapter.pages "chapter and pages" output.check
      format.edition.date no.comma output
    }
  if$
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check 
  crossref missing$
    { format.booktitle "booktitle" output.check
      format.nonauthor.editors output
      format.in.series.volume.number output
      format.chapter.pages "chapter and pages" output.check
      format.publisher.address.edition.date no.comma output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages "chapter and pages" output.check
      format.edition.date no.comma output
    }
  if$
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  crossref missing$
    { format.booktitle "booktitle" output.check
      format.nonauthor.editors output
      format.series.volume.number output
      format.org.publisher.address.date no.comma output
    }
    { format.incoll.inproc.crossref output.nonnull
    }
  if$
  format.pages output
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
	'skip$
	{ organization output.nonnull }
      if$
    }
    { format.authors output.nonnull }
  if$
  format.btitle "title" output.check
  ", " 'append.conjunction :=
  ""
  author empty$
    { organization append }
    'skip$
  if$
  address append
  format.edition append
  format.date "year" append.check
  parenthesize no.comma output
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  ", " 'append.conjunction :=
  ""
  "Master's thesis" format.thesis.type append.nonnull
  school "school" append.check
  address append
  format.date "year" append.check
  parenthesize no.comma output
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  format.btitle output
  format.howpublished.address.date no.comma output
  format.pages output
  format.language output
  format.url output
  format.note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  ", " 'append.conjunction :=
  ""
  "Ph.D. thesis" format.thesis.type append.nonnull
  school "school" append.check
  address append
  format.date "year" append.check
  parenthesize no.comma output
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  format.btitle "title" output.check
  format.in.series.volume.number output
  ", " 'append.conjunction :=
  ""
  editor empty$
    { organization append }
    'skip$
  if$
  publisher append
  format.date "year" append.check
  parenthesize no.comma output
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  format.atitle "title" output.check
  format.techrep.type.number output.nonnull
  ", " 'append.conjunction :=
  ""
  institution "institution" append.check
  address append
  format.date "year" append.check
  parenthesize no.comma output
  format.language output
  format.url output
  format.note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  format.date parenthesize no.comma output
  format.language output
  format.url output
  format.note "note" output.check
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"Jan."}

MACRO {feb} {"Feb."}

MACRO {mar} {"Mar."}

MACRO {apr} {"Apr."}

MACRO {may} {"May"}

MACRO {jun} {"Jun."}

MACRO {jul} {"Jul."}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sep."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}

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

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ "   " * }
	'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
	{ "et~al." * }
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

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
	{ key empty$
	    { "to sort, need author, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
	{ key empty$
	    { "to sort, need editor, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.organization.sort
	{ type$ "manual" =
	    'author.organization.sort
	    'author.sort
	  if$
	}
      if$
    }
  if$
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
}

ITERATE {presort}

SORT

STRINGS { longest.label prev.author this.author }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
  "abcxyz" 'prev.author :=
  "" 'this.author :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
  author empty$
    { editor empty$
      { "" }
      'editor
      if$
    }
    'author
  if$
  'this.author :=
  this.author prev.author =
    { "\bysame" 'extra.label := }
    { "" 'extra.label :=
      this.author "" =
        { "abcxyz" }
        'this.author
      if$
      'prev.author :=
    }
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\providecommand{\bysame}{\leavevmode\hbox to3em{\hrulefill}\thinspace}"
       write$ newline$
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
