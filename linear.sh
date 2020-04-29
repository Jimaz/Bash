# Miramos dos líneas, si no contiene ">" borramos la nueba línea entre ellas y se repite. Si cualquiera de las dos líneas contiene ">" entonces se imprime y se borra el salto de la primera de ellas y se repite.

sed ':a;N;/>/!s/\n//;ta;P;D' nt_w_taxid.fas > seqs_formatted.fasta

awk '/^>/ { printf("%s%s\t",(N>0?"\n":""),$0);N++;next; } { printf("%s",$0);} END { printf("\n");}' < <tuarchivo.fna>
