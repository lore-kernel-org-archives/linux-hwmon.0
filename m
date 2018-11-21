Return-Path: <Stefan.Bruens@rwth-aachen.de>
Return-path: <Stefan.Bruens@rwth-aachen.de>
From: =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens@rwth-aachen.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [RFC][PATCH] hwmon: (ina2xx) Improve current and power reading
 precision
Date: Wed, 21 Nov 2018 22:16:09 +0000
Message-ID: <1717545.GXSegKtrMu@sbruens-linux.lcs.intern>
References: <20181121012629.5432-1-nicoleotsuka@gmail.com>
 <2863036.QIPGp1Eqjm@sbruens-linux.lcs.intern>
 <20181121194051.GA8902@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20181121194051.GA8902@Asurada-Nvidia.nvidia.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CA6EB60E46892E4F93344B5E046B6A91@rwth-ad.de>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On Mittwoch, 21. November 2018 20:40:52 CET Nicolin Chen wrote:=0A=
> (Removing "m.purski@samsung.com" since it's not reachable any more)=0A=
> =0A=
> Hi Stefan,=0A=
> =0A=
> Thank you for the comments.=0A=
> =0A=
> On Wed, Nov 21, 2018 at 04:13:01PM +0000, Br=FCns, Stefan wrote:=0A=
> > > =3D=3D=3D Problem =3D=3D=3D=0A=
> > > Both methods simplify software routine by fixing one factor, which=0A=
> > > sacrifices the precision of the hardware measurement results.=0A=
> > > =0A=
> > > Using ina226 for example, with method A, the current scale was 1mA=0A=
> > > and the power scale was 25mA.=0A=
> > > =0A=
> > > With method B, calibration value is fixed at 2048 so the precision=0A=
> > > is decided by shunt resistor value. It sounds reasonable since the=0A=
> > > hardware engineers can use a larger shunt resistor when they need=0A=
> > > higher resolution. However, they often concern power burning across=
=0A=
> > > the resistor as well, so the resistor usually won't be so large: a=0A=
> > > typical value 1000 micro-ohms, which results in a current scale at=0A=
> > > 2.5 mA and a power sacle at 62.5 mW.=0A=
> > =0A=
> > Power loss surely is a concern, but figures should be kept reasonable.=
=0A=
> > =0A=
> > 1. You mention 1.8V bus voltage, and currents in the 30mA range. Using =
the=0A=
> > 1mOhm current shunt:=0A=
> > =0A=
> > U_S =3D R_S * I_S 1e-3 Ohm * 30e-3 A =3D 30e-6 V  (30uV)=0A=
> > P_S =3D U_S * I_S =3D 30e-6V * 30e-3 A =3D 900e-9W =3D 0.9 uW=0A=
> > =0A=
> > INA219 Power Supply (Datasheet)=0A=
> > Min operating Voltage: 3V=0A=
> > Quiescent Current: 0.7mA=0A=
> > -> Min power: 2.1mW=0A=
> > =0A=
> > So the INA219 alone uses 2.1mW, 1000 times more than the shunt.=0A=
> =0A=
> Chip can enter power-down or one-shot mode. Though this upstream=0A=
> driver doesn't have these two mode supports yet, I am working on=0A=
> it so they'll be added.=0A=
=0A=
The power-down current is 6uA, so even if you never leave power-down mode, =
you =0A=
are down to 18uW. But on top of that, you need power for the conversion, an=
d =0A=
you need power for communication.=0A=
=0A=
> > Another concern may be voltage drop over the shunt, but for this case y=
ou=0A=
> > have a nominal voltage of 1.8V, so 30uV are 0.001%.=0A=
> > =0A=
> > > When measuring a 1.8v voltage running a small current (e.g. 33 mA),=
=0A=
> > > the power value (that's supposed to be 59.4 mW) becomes inaccurate=0A=
> > > due to the larger scale (25mA for method A; 62.5 mA for method B).=0A=
> =0A=
> Just found out that I have typos here: 25mW and 62.5mW.=0A=
> =0A=
> > Another look into the datasheet reveals, even at full gain (PGA=3D1), t=
he=0A=
> > LSB is 40mV / 2^12 =3D 40mV / 4096 ~ 10uV. So when the current ADC read=
s=0A=
> > out as 3*LSB, this anything between 25mA and 35mA. This is the best cas=
e=0A=
> > figure.=0A=
> Current read doesn't get affected a lot actually, since hwmon ABI=0A=
> also reports current value in unit mA. However, the power read is=0A=
> the matter here. With a 62.5mW power_lsb, power results are kinda=0A=
> useless on my system.=0A=
=0A=
The reported current does not matter here, actually. Internally, the ADC va=
lue =0A=
will have an uncertainty of 10mA (at PGA=3D1). At 1.8V, your uncertainty is=
 =0A=
18mW. And thats *only* the quantization noise. It wont get better than that=
.=0A=
=0A=
Also note, you are apparently using the ina2xx hwmon driver - I strongly =
=0A=
advise against it, you should either use the ina2xx driver from the IIO =0A=
subsystem directly, or use the IIO driver via iio-hwmon.=0A=
=0A=
1. INA219 is not properly supported by the hwmon driver, see the changes in=
 =0A=
the IIO driver.=0A=
2. The IIO driver has many more features:=0A=
  - setting the PGA (INA219)=0A=
  - setting the bus voltage range (INA219)=0A=
  - selecting the conversion time (INA219/226)=0A=
=0A=
There is also always the possibility to read the bus and shunt voltage =0A=
registers and calculate the power manually.=0A=
=0A=
Regards,=0A=
=0A=
Stefan=0A=
