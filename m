Return-Path: <tmaimon77@gmail.com>
Return-path: <tmaimon77@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180708231507.GA26077@roeck-us.net>
References: <20180703232326.355718-3-tmaimon77@gmail.com> <20180708231507.GA26077@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 9 Jul 2018 17:00:44 +0300
Message-ID: <CAP6Zq1i8Owmp847HvgC5=WGHzSBOS7Ne2G2m8Gotmk8zHkJmKw@mail.gmail.com>
Subject: Re: [v8,2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>, Avi Fishman <avifishman70@gmail.com>,
	Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>,
	Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>,
	devicetree <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000927786057091707b"
List-ID: <linux-hwmon@vger.kernel.org>

--000000000000927786057091707b
Content-Type: text/plain; charset="UTF-8"

Great!

thanks a lot!

Tomer

On 9 July 2018 at 02:15, Guenter Roeck <linux@roeck-us.net> wrote:

> On Wed, Jul 04, 2018 at 02:23:26AM +0300, Tomer Maimon wrote:
> > Add Nuvoton BMC NPCM750/730/715/705 Pulse Width Modulation (PWM)
> > and Fan tacho driver.
> >
> > The Nuvoton BMC NPCM750/730/715/705 supports 8 PWM controller outputs
> > and 16 Fan controller inputs.
> >
> > The driver provides a sysfs entries through which the user can
> > configure the duty-cycle value from 0(off) and 255(full speed)
> > and read the fan tacho rpm value.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter
>

--000000000000927786057091707b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great!=C2=A0<div><br></div><div>thanks a lot!</div><div><b=
r></div><div>Tomer</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 9 July 2018 at 02:15, Guenter Roeck <span dir=3D"ltr">&lt;<=
a href=3D"mailto:linux@roeck-us.net" target=3D"_blank">linux@roeck-us.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Wed, Jul 04, 2018 at 02:23:26AM +0300, Tomer Maimon wrote:<br>
&gt; Add Nuvoton BMC NPCM750/730/715/705 Pulse Width Modulation (PWM)<br>
&gt; and Fan tacho driver.<br>
&gt; <br>
&gt; The Nuvoton BMC NPCM750/730/715/705 supports 8 PWM controller outputs<=
br>
&gt; and 16 Fan controller inputs.<br>
&gt; <br>
&gt; The driver provides a sysfs entries through which the user can<br>
&gt; configure the duty-cycle value from 0(off) and 255(full speed)<br>
&gt; and read the fan tacho rpm value.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt;<br>
<br>
</span>Applied to hwmon-next.<br>
<br>
Thanks,<br>
Guenter<br>
</blockquote></div><br></div>

--000000000000927786057091707b--
