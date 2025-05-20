# 定义编译器
LATEX = xelatex
# 定义需要清理的辅助文件扩展名
AUX_FILES = *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.synctex.gz *.fls *.fdb_latexmk *.run.xml *.nav *.snm *.vrb *.bcf *.idx *.ilg *.ind *.xdv

# 获取当前目录下所有 .tex 文件（排除带空格的文件名）
TEX_FILES = $(wildcard *.tex)
PDF_FILES = $(TEX_FILES:.tex=.pdf)

# 默认目标：编译所有 .tex 文件
all: $(PDF_FILES)
	@echo "编译完成！"

# 模式规则：从 .tex 生成 .pdf
%.pdf: %.tex
	$(LATEX) -interaction=nonstopmode -halt-on-error $<
	#@# 如果有参考文献，运行 biber 或 bibtex
	#@if [ -f $(basename $<).bcf ]; then biber $(basename $<); fi
	#@if [ -f $(basename $<).aux ]; then bibtex $(basename $<); fi
	@# 第二次编译确保交叉引用正确
	$(LATEX) -interaction=nonstopmode -halt-on-error $<
	#@# 第三次编译确保所有引用稳定
	#$(LATEX) -interaction=nonstopmode -halt-on-error $<

# 清理所有辅助文件
clean:
	@echo "正在清理辅助文件..."
	@rm -f $(AUX_FILES)
	@echo "清理完成！"

# 编译并清理（常用目标）
build: all clean

.PHONY: all clean build
