library ieee; use ieee.std_logic_1164.all;
entity MUX_41a is port (
	S1, S0: in bit;
	D3, D2, D1, D0: in bit;
	Y: out bit
);
end MUX_41a;
architecture logic OF MUX_41a IS
begin
	Y <= 	(D0 and (not S1) and (not S0)) or
		(D1 and (not S1) and 	S0 ) or
		(D2 and 	S1	and (not S0)) or
		(D3 and		S1 	and 	S0 ) ;
	end logic; 