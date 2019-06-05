# IMSLab thesis template

適用於成功大學資訊工程研究所碩博論文使用的模板，讓需要的同學可以直接 fork 後做使用。

## Author 

* NCKU CSIE - IMSLab (智慧化行動服務實驗室) 的前輩們、及台灣的先進們。
* Kevin Cyu, kevinbird61@gmail.com (IMSLab 108 級資訊碩)

## Layout 

> 解釋 layout 中各個資料夾的類別、與各個檔案各自代表的意義與功能。

* back
    * `back_reference.tex`:     定義 citations、references 的位置，由外層主要的 main.tex 引入使用。 本檔案主要呼叫 `.bib` 來引入論文的 citations、references。 這也是為何編譯需要以 `pdflatex->bibtex->pdflatex->pdflatex` 的繁瑣程序的原因。 
        * 經過首次編譯產生對應的 `main.aux` 後給 bibtex 作為 input 後編譯來更新 `.bib` 內提供的資訊，才能完成 references/citations 的引入。
    * `ncku_thesis_bib.bib`:    主要 citation 格式放置的位置，可以在各大論文下載網站上選擇欲下載的 citation 格式後，依據格式放到這個檔案內，給予對應的 "citation 變數名稱" 後即可使用。
    * `back_appendix.tex`:      放置論文所需的附件 (對於該題目額外探討的內容)。(目前沒用到)
    * `back_vita.tex`:          目前沒用到。
* body
    * 放置主要的 sections/chapters 的內容，提供 `body/main.tex` 來呼叫使用。
    * `main.tex`:               有別於外層的 main.tex，這邊主要是管理所有的章節順序，將其他位於 `body/` 下的 `.tex` 引入做使用， 並且定義各章節的 index。
    * 可以依據個人需要來調整章節的順序以及使用。
    * `example/`:               放了實驗室學長的作品以供格式參考使用。
* class
    * `ncku_class.cls`:         自定義文檔的 class，在 main.tex 引入 (作為 documentclass 引入)。
    * `ncku_style.sty`:         自定義的 package，在 main.tex 引入， 主要的姓名、標題等等訊息都在這邊，適當更改後做使用。 (之後便引用這邊的定義，來將對應的字串套入到需要的空格中)
* frontpages
    * `ncku_frontpages.tex`:    摘要、介紹。並呼叫其他 `front_*.tex` 來使用，為 frontpages 的進入點。
    * `front_cabstract.tex`:    中文版摘要、簡介。
    * `front_eabstract.tex`:    英文版摘要、簡介。
    * `front_ackn.tex`:         英文版致謝。
    * `front_symbols.tex`:      數學符號之使用說明。(目前沒用到)
* header
    * `ncku_definitions.tex`:   定義檔
    * `ncku_watermark.tex`:     浮水印，呼叫 ncku_watermark.jpg (FIXME: 是否丟進 images 做管理?)
    * `header_footer.tex`:      定義 footer 樣式 (目前沒用到)
* images 
    * 論文當中圖檔放置處

主要檔案: `main.tex` (透過呼叫其他 .tex 來組成)

## Helper script

* 提供腳本來執行 `安裝、編譯、清理` 等作業。
    * 提供 ubuntu `16.04 LTS`, `18.04 LTS` 一鍵安裝。
    * 提供一鍵編譯。
    * 提供一鍵清除。
* 或者可以使用 vscode plugin - `LaTeX Workshop` 來幫忙做 `編譯` 的動作 (抓取 `ctrl+s` "save" event 來做一次編譯)。