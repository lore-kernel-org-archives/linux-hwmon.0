Return-Path: <Stefan.Bruens@rwth-aachen.de>
Return-path: <Stefan.Bruens@rwth-aachen.de>
From: =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens@rwth-aachen.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"m.purski@samsung.com" <m.purski@samsung.com>
Subject: Re: [RFC][PATCH] hwmon: (ina2xx) Improve current and power reading
 precision
Date: Wed, 21 Nov 2018 16:13:01 +0000
Message-ID: <2863036.QIPGp1Eqjm@sbruens-linux.lcs.intern>
References: <20181121012629.5432-1-nicoleotsuka@gmail.com>
In-Reply-To: <20181121012629.5432-1-nicoleotsuka@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BCA2704DE6A397439FA7D327DA2C9E4F@rwth-ad.de>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On Mittwoch, 21. November 2018 02:26:29 CET Nicolin Chen wrote:=0A=
> =3D=3D=3D Background =3D=3D=3D=0A=
[...]=0A=
> =0A=
> =3D=3D=3D Problem =3D=3D=3D=0A=
> Both methods simplify software routine by fixing one factor, which=0A=
> sacrifices the precision of the hardware measurement results.=0A=
> =0A=
> Using ina226 for example, with method A, the current scale was 1mA=0A=
> and the power scale was 25mA.=0A=
> =0A=
> With method B, calibration value is fixed at 2048 so the precision=0A=
> is decided by shunt resistor value. It sounds reasonable since the=0A=
> hardware engineers can use a larger shunt resistor when they need=0A=
> higher resolution. However, they often concern power burning across=0A=
> the resistor as well, so the resistor usually won't be so large: a=0A=
> typical value 1000 micro-ohms, which results in a current scale at=0A=
> 2.5 mA and a power sacle at 62.5 mW.=0A=
=0A=
Power loss surely is a concern, but figures should be kept reasonable.=0A=
=0A=
1. You mention 1.8V bus voltage, and currents in the 30mA range. Using the =
=0A=
1mOhm current shunt:=0A=
=0A=
U_S =3D R_S * I_S 1e-3 Ohm * 30e-3 A =3D 30e-6 V  (30uV)=0A=
P_S =3D U_S * I_S =3D 30e-6V * 30e-3 A =3D 900e-9W =3D 0.9 uW=0A=
=0A=
INA219 Power Supply (Datasheet)=0A=
Min operating Voltage: 3V=0A=
Quiescent Current: 0.7mA=0A=
-> Min power: 2.1mW=0A=
=0A=
So the INA219 alone uses 2.1mW, 1000 times more than the shunt.=0A=
=0A=
Another concern may be voltage drop over the shunt, but for this case you h=
ave =0A=
a nominal voltage of 1.8V, so 30uV are 0.001%.=0A=
 =0A=
> When measuring a 1.8v voltage running a small current (e.g. 33 mA),=0A=
> the power value (that's supposed to be 59.4 mW) becomes inaccurate=0A=
> due to the larger scale (25mA for method A; 62.5 mA for method B).=0A=
=0A=
Another look into the datasheet reveals, even at full gain (PGA=3D1), the L=
SB is=0A=
40mV / 2^12 =3D 40mV / 4096 ~ 10uV. So when the current ADC reads out as 3*=
LSB, =0A=
this anything between 25mA and 35mA. This is the best case figure.=0A=
=0A=
On top of quantisation error, you have the ADC offset voltage (V_OS), which=
 is =0A=
given as (for PGA=3D1, best case): (+-) 10uV typical, (+-) 100uV max.=0A=
=0A=
=0A=
So, if you want to have meaningful readouts adjust your shunt to a reasonab=
le =0A=
value. Even 100 times the current value will have no measurable effect on y=
ou =0A=
system (power loss: 90uW, voltage drop: 3mV).=0A=
=0A=
Kind regards,=0A=
=0A=
Stefan=
