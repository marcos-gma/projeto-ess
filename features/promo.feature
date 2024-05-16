Cenário 1: Notificação de promoções para usuário comum
Given que uma promoção está ativa no sistema.
And o usuário comum está registrado no sistema com notificações habilitadas.
When uma nova promoção é criada ou uma promoção existente é atualizada.
Then o sistema envia uma notificação para o usuário comum via email e/ou notificações.
