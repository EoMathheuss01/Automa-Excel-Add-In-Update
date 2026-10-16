# Automa Excel Add-in 2.0.1.9

A leitura do SCD agora gera uma aba de VLANs por SubNetwork, além do resumo geral IEC61850_VLANs.

- Exemplos: IEC61850_VLANs_Station_Bus e IEC61850_VLANs_Process_Bus.
- Cada aba apresenta somente os relés, VLANs e control blocks da respectiva rede.
- Um relé nas duas redes aparece nas duas abas, com os blocos correspondentes a cada uma.
- Os filtros, indicadores e a seleção HEX/DEC são independentes em cada aba.
- Os nomes das abas respeitam o limite e os caracteres permitidos pelo Excel, evitando nomes duplicados.
- Na próxima geração, abas de sub-redes que deixaram de existir são removidas somente quando identificadas como geradas pelo add-in.

Validação: compilação Release x64 sem erros; assinaturas dos manifestos VSTO válidas; testes de separação de redes, assinaturas e nomes de abas aprovados.
