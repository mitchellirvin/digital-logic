library ieee;
use ieee.std_logic_1164.all;

entity part2_1 is port (
	Q2, Q1, Q0, CW, EV, R: in bit;
	D2, D1, D0: out bit;
	Green, Yellow, Red: out bit
	);
end part2_1;

architecture logic OF part2_1 IS
begin

-- D2 == /Q2Q1Q0 + Q2/Q1/Q0EV
-- D1 == /Q2/Q1(EV + Q0) + /Q2Q1/Q0(EV + CW)
-- D0 == /Q2/Q1/Q0 + /Q2/Q1Q0EV + /Q2Q1/Q0(CW + EV)
-- GREEN == /Q2/Q1/Q0/EV + /Q2/Q1Q0/EV + /Q2Q1/Q0/EV
-- YELLOW == /Q2/Q1/Q0EV + /Q2/Q1Q0EV + /Q2Q1/Q0EV + Q2/Q1/Q0
-- RED == Q2/Q1/Q0

D2 <= (((not Q2) and Q1 and Q0) or
(Q2 and (not Q1) and (not Q0) and (not EV))) and R;

D1 <= (((not Q2) and (not Q1) and ((not EV) or Q0)) or
((not Q2) and Q1 and (not Q0) and ((not EV) or (not CW)))) and R;

D0 <= (((not Q2) and (not Q1) and (not Q0)) or
((not Q2) and (not Q1) and Q0 and (not EV)) or
(((not Q2) and Q1 and (not Q0)) and ((not CW) or (not EV)))) and R;

Green <= (((not Q2) and (not Q1) and (not Q0) and EV) or
((not Q2) and (not Q1) and Q0 and EV) or
((not Q2) and Q1 and (not Q0) and EV));

Yellow <= (((not Q2) and (not Q1) and (not Q0) and (not EV)) or
((not Q2) and (not Q1) and Q0 and (not EV)) or
((not Q2) and Q1 and (not Q0) and (not EV)) or
((not Q2) and Q1 and Q0));

Red <= (Q2 and (not Q1) and (not Q0));

end logic;

