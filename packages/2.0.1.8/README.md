# Automa Excel Add-in 2.0.1.8

A aba IEC61850_VLANs gerada a partir do SCD apresenta uma linha por IED e SubNetwork, com filtro por rede.

- Relés presentes em Station Bus e Process Bus aparecem em linhas distintas.
- Cada linha reúne somente as VLANs e os control blocks da respectiva sub-rede.
- As assinaturas GOOSE/SMV consideram o bloco publicador, seu logical device e a participação do assinante na rede.
- Quando o SCD não informa as redes, a consolidação existente usa a identificação "Não identificada".

Validação: compilação Release x64 concluída sem erros, assinaturas dos manifestos VSTO válidas e testes de separação por rede aprovados.
