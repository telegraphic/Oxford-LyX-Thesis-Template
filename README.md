# OCIAM Thesis for LyX - readme

These files form a LyX skeleton structure for the OCIAM Thesis class by Keith A. Gillow <gillow@maths.ox.ac.uk>, which is available online at http://www.maths.ox.ac.uk/help/faqs/latex/thesisclass. Here, I have modified the class file slightly and transposed it into a version that plays nicely with LyX.

I give no license to do anything with it, warranty or guarantee that it will work. Use at your own risk. Enjoy responsibly. Oxford's "visual identity" is legally protected, the logo is a trademark, and they have very specific branding rules, which can be found at http://www.ox.ac.uk/branding_toolkit/. That's all the issues I can think of, so onto installation...

## Installation

Firstly, you'll need to have a working copy of LaTeX and LyX. Next

1. Copy the ociamthesis-lyx.cls into your LaTex installation directory
2. Refresh your TeX installation so it finds the new file
3. Copy the ociamthesis-lyx.layout file into your LyX userdir layouts directory
4. Open LyX and run the 'reconfigure' command.
5. Restart LyX and you should be ready to go.

The steps will vary depending on your operating system and LaTeX setup. For example, for me on my Mac:

### Mac OS X

1. Copy over the ociamthesis-lyx.cls to
    ```
	/Users/danny/Library/texmf/tex/latex
	```
     
2. From the terminal run 
    ```
    sudo texhash
	```
    
3. Copy over the ociamthesis-lyx.layout to
    ```
    /Users/[username]/Library/Application Support/LyX-1.6/layouts
    ```
     
4. Go to menu LyX > reconfigure
5. Restart and you'll be ready

### Ubuntu (Linux)

Linux directions courtesy @NDavidBrown:

1. Copy over ociamthesis-lyx.cls:
    ```
    mkdir -p ~/texmf/tex/latex
    cp ~/path/to/files_to_copy/ociamthesis-lyx.cls ~/texmf/tex/latex
    ```
    
2. From the terminal run
    ```
    sudo texhash
    ```
    
3. Copy over the ociamthesis.lyx layout to
    ```
    cp /path/to/files_to_copy/ociamthesis-lyx.layout ~/.lyx/layouts/
    ```

4. Then in lyx:
    ```
    Tools -> Reconfigure
    Document -> Settings -> Document Class -> ociamthesis-lyx
    ```
    You will then need to restart lyx.
    
### Windows

Directions courtesy @NDavidBrown:

1. Copy `ociamthesis-lyx.layout` to `C:\Users\<username>\AppData\Roaming\LyX<version>\layouts`.

2. Copy `ociamthesis-lyx.cls` to `C:\Users\<username>\AppData\Roaming\MiKTeX\<version>\tex\latex`. 
   You may need to create this directory manually, though the parent `tex` directory should already be present.

Run `Start` -> `MikTex` -> `Settings` (or on Windows 8: `<Press Windows Key>`, Type 'settings', choose the non-admin 
   `Settings` item with MikTex icon) then click `Refresh FNDB`.

Now load Lyx and run: `Tools` -> `Reconfigure`. Once complete you'll receive a notification to restart Lyx. Do so then load your `thesis.lyx` and go to `Document` -> `Settings`. In `Document Class` (item in left sidebar list) In the `Document class` dropdown choose `ociamthesis-lyx` (items are in alphabetical order).

## Frequently Asked Questions

#### Q. How do I know if I installed the document class correctly?
The 'litmus test' is simply going to Document -> Settings -> Document Class and seeing that ociamthesis-lyx is available for selection.

#### Q. How do I change the logo on the titlepage to my university?
A. First, get a copy of your logo in PDF format, preferably square, and put it into titlepage/mylogo.pdf. Then, go into Document > settings > Latex preamble and change the line:
    ```
    \def\crest{{\includegraphics{titlepage/beltcrest.pdf}}}
	```
    
to point to your new logo file. 

#### Q. Where is my LyX user directory?
A. The location of the LyX user directory depends upon the system LyX is installed on. Some common locations are below.
    * Linux and other Unix-like systems: usually found at ~/.lyx, where ~ is your home directory.
    * Mac OS X: ~/Library/Application Support/LyX-<VERSION>/
    * Windows Vista / Windows 7: usually at C:\Users\[your username]\AppData\Roaming\lyx<VERSION>\ (note: this is if you installed LyX for all users)
(from http://wiki.lyx.org/LyX/UserDir)

#### Q. What are the main differences between the ociamthesis-lyx.cls and the original one?
A. I've edited the ociamthesis.cls and removed all the metafont definitions because from experience they complicate things -- and hey, who uses metafonts nowadays? I also moved the titlepage logo definition to the document preamble. I felt these changes made it a derivative so appended -lyx to the filename.

#### Q. Is there an equivalent ociamthesis.cls for Humanities?
A. Yes, there is a latex class out there: S. Evans has modified the ociamthesis.cls to make it conform to the regulations for Humanities. This can be found online at http://samuelevansresearch.org/main/2010/05/oxford-thesis-latex-template/. He's added a definition to ociamthesis.cls called 'frontpages' which adds a few necessary bells and whistles.

#### Q. How can I change the title page to my requirements?
A. This isn't particularly easy: https://github.com/telegraphic/Oxford-LyX-Thesis-Template/wiki/Custom-titlepages

Good luck, email me with any questions at danny.price@astro.ox.ac.uk and I'll try and help out!
