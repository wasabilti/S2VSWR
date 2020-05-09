clear all
close all

%  convert serveral solumn S11 to VSWR

%  set some const
FROM_dB_UNIT = 1;		% If S11 is in dB unit, set this as 1

PLOT_RESULT = 1;		% If need plot result, set this as 1

LOG_FRACTOR = 20;		% dB = LOG_FRACTOR*log(S)

FILENAME=input('S filename(Need postfix:.csv\nAssume the first column are freq): ', 's');

S = csvread(FILENAME, 1);

[D1 D2] = size(S);

VSWR = zeros(D1, D2);
VSWR(:, 1) = S(:, 1);

if FROM_dB_UNIT
	disp('Convert unit from dB to abs')
	disp(['LOG_FRACTOR is', num2str(LOG_FRACTOR)])
	S(:, 2:end) = 10.^(S(:, 2:end)/LOG_FRACTOR);
end

for t = 2:D2
	VSWR(:, t) = S2VSWR(S(:, t));
end

csvwrite('VSWR_OUT.csv', VSWR)

if PLOT_RESULT
	for t = 2:D2
		figure
		plot(VSWR(:, 1), VSWR(:, t))
		grid on
		title(['VSWR # ', num2str(t-1)])
	end
end
