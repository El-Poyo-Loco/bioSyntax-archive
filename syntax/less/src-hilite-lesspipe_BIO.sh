#! /bin/bash

for source in "$@"; do
    case $source in
	*ChangeLog|*changelog) 
        source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=esc.style -i "$source" ;;
	*Makefile|*makefile) 
        source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=esc.style -i "$source" ;;
	*.tar|*.tgz|*.gz|*.bz2|*.xz)
        lesspipe "$source" ;;
	*.fasta|*.fa|*.mfa)
	source-highlight -f esc --lang-def=fasta.lang --outlang-def=bioSyntax.outlang --style-file=fasta.style -i "$source" ;;
	*.sam)
	source-highlight -f esc --lang-def=sam.lang --outlang-def=bioSyntax.outlang --style-file=sam.style -i "$source" ;;
	*.vcf)
	source-highlight -f esc --lang-def=vcf.lang --outlang-def=bioSyntax-vcf.outlang --style-file=vcf.style -i "$source" ;;
        *)
	source-highlight --failsafe --infer-lang -f esc --style-file=esc.style -i "$source" ;;
    esac
done