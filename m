Return-Path: <kunyi@google.com>
Return-path: <kunyi@google.com>
MIME-Version: 1.0
References: <20180928174500.18538-1-kunyi@google.com> <20180928183031.GA24293@roeck-us.net>
In-Reply-To: <20180928183031.GA24293@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Fri, 28 Sep 2018 13:01:23 -0700
Message-ID: <CAGMNF6WKoATKA4GAB-0kVaUDKOuAxTUe0Qvmfy3ZWL02N2qZtw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (adm1275): Add device tree param for shunt resistor
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Robert Lippert <rlippert@google.com>,
	Benjamin Fair <benjaminfair@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000010d9da0576f3ed9f"
List-ID: <linux-hwmon@vger.kernel.org>

--00000000000010d9da0576f3ed9f
Content-Type: text/plain; charset="UTF-8"

Thanks. I changed the documentation piece and submitted v2.

On Fri, Sep 28, 2018 at 11:30 AM Guenter Roeck <linux@roeck-us.net> wrote:

> On Fri, Sep 28, 2018 at 10:45:00AM -0700, Kun Yi wrote:
> > The ADM series of hotswap controllers support extending
> > the current measurement range by using a sensing resistor
> > value other than the typical 1 mOhm. For example, using a 0.5 mOhm
> > sensing resistor doubles the maximal current can be measured.
> >
> > Current driver assumes a shunt resistor value of 1 mOhm in calculation,
> > meaning for other resistor values, hwmon will report scaled
> > current/power measurements. This patch adds a device tree parameter so
> > that individual boards can configure its shunt resistor value.
> >
> Please copy DT maintainers for all DT changes.
>
> > Signed-off-by: Kun Yi <kunyi@google.com>
> > ---
> >  .../devicetree/bindings/hwmon/adm1275.txt     | 19 +++++++++++++++++++
> >  Documentation/hwmon/adm1275                   |  3 +++
> >  drivers/hwmon/pmbus/adm1275.c                 | 15 +++++++++++++--
> >  3 files changed, 35 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt
> b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> > new file mode 100644
> > index 000000000000..a182fa195ed1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> > @@ -0,0 +1,19 @@
> > +adm1275 properties
> > +
> > +Required properties:
> > +- compatible: Must be one of the supported compatible strings in
> > +  Documentation/hwmon/adm1275
>
> It would be more appropriate to list those here as devicetree properties.
> The information in Documentation/hwmon/adm1275 does not include the "adi,"
> prefix.
>
> Thanks,
> Guenter
>
> > +- reg: I2C address
> > +
> > +Optional properties:
> > +
> > +- shunt-resistor-micro-ohms
> > +     Shunt resistor value in micro-Ohm
> > +
> > +Example:
> > +
> > +adm1272@10 {
> > +     compatible = "adi,adm1272";
> > +     reg = <0x10>;
> > +     shunt-resistor-micro-ohms = <500>;
> > +};
> > diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275
> > index 39033538eb03..5e277b0d91ce 100644
> > --- a/Documentation/hwmon/adm1275
> > +++ b/Documentation/hwmon/adm1275
> > @@ -58,6 +58,9 @@ The ADM1075, unlike many other PMBus devices, does not
> support internal voltage
> >  or current scaling. Reported voltages, currents, and power are raw
> measurements,
> >  and will typically have to be scaled.
> >
> > +The shunt value in micro-ohms can be set via device tree at
> compile-time. Please
> > +refer to the Documentation/devicetree/bindings/hwmon/adm1275.txt for
> bindings
> > +if the device tree is used.
> >
> >  Platform data support
> >  ---------------------
> > diff --git a/drivers/hwmon/pmbus/adm1275.c
> b/drivers/hwmon/pmbus/adm1275.c
> > index 13600fa79e7f..f569372c9204 100644
> > --- a/drivers/hwmon/pmbus/adm1275.c
> > +++ b/drivers/hwmon/pmbus/adm1275.c
> > @@ -373,6 +373,7 @@ static int adm1275_probe(struct i2c_client *client,
> >       const struct coefficients *coefficients;
> >       int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
> >       int tindex = -1;
> > +     u32 shunt;
> >
> >       if (!i2c_check_functionality(client->adapter,
> >                                    I2C_FUNC_SMBUS_READ_BYTE_DATA
> > @@ -421,6 +422,13 @@ static int adm1275_probe(struct i2c_client *client,
> >       if (!data)
> >               return -ENOMEM;
> >
> > +     if (of_property_read_u32(client->dev.of_node,
> > +                              "shunt-resistor-micro-ohms", &shunt))
> > +             shunt = 1000; /* 1 mOhm if not set via DT */
> > +
> > +     if (shunt == 0)
> > +             return -EINVAL;
> > +
> >       data->id = mid->driver_data;
> >
> >       info = &data->info;
> > @@ -654,12 +662,15 @@ static int adm1275_probe(struct i2c_client *client,
> >               info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
> >       }
> >       if (cindex >= 0) {
> > -             info->m[PSC_CURRENT_OUT] = coefficients[cindex].m;
> > +             /* Scale current with sense resistor value */
> > +             info->m[PSC_CURRENT_OUT] =
> > +                     coefficients[cindex].m * shunt / 1000;
> >               info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
> >               info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
> >       }
> >       if (pindex >= 0) {
> > -             info->m[PSC_POWER] = coefficients[pindex].m;
> > +             info->m[PSC_POWER] =
> > +                     coefficients[pindex].m * shunt / 1000;
> >               info->b[PSC_POWER] = coefficients[pindex].b;
> >               info->R[PSC_POWER] = coefficients[pindex].R;
> >       }
> > --
> > 2.19.0.605.g01d371f741-goog
> >
>


-- 
Regards,
Kun

--00000000000010d9da0576f3ed9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks. I changed the documentation piece and submitted v2=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Sep 28, 2018=
 at 11:30 AM Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net">linux@=
roeck-us.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri,=
 Sep 28, 2018 at 10:45:00AM -0700, Kun Yi wrote:<br>
&gt; The ADM series of hotswap controllers support extending<br>
&gt; the current measurement range by using a sensing resistor<br>
&gt; value other than the typical 1 mOhm. For example, using a 0.5 mOhm<br>
&gt; sensing resistor doubles the maximal current can be measured.<br>
&gt; <br>
&gt; Current driver assumes a shunt resistor value of 1 mOhm in calculation=
,<br>
&gt; meaning for other resistor values, hwmon will report scaled<br>
&gt; current/power measurements. This patch adds a device tree parameter so=
<br>
&gt; that individual boards can configure its shunt resistor value.<br>
&gt; <br>
Please copy DT maintainers for all DT changes.<br>
<br>
&gt; Signed-off-by: Kun Yi &lt;<a href=3D"mailto:kunyi@google.com" target=
=3D"_blank">kunyi@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/hwmon/adm1275.txt=C2=A0 =C2=A0 =C2=A0| 1=
9 +++++++++++++++++++<br>
&gt;=C2=A0 Documentation/hwmon/adm1275=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 drivers/hwmon/pmbus/adm1275.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++--<br>
&gt;=C2=A0 3 files changed, 35 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/hwmon/adm12=
75.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Doc=
umentation/devicetree/bindings/hwmon/adm1275.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..a182fa195ed1<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt<br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +adm1275 properties<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- compatible: Must be one of the supported compatible strings in<br>
&gt; +=C2=A0 Documentation/hwmon/adm1275<br>
<br>
It would be more appropriate to list those here as devicetree properties.<b=
r>
The information in Documentation/hwmon/adm1275 does not include the &quot;a=
di,&quot;<br>
prefix.<br>
<br>
Thanks,<br>
Guenter<br>
<br>
&gt; +- reg: I2C address<br>
&gt; +<br>
&gt; +Optional properties:<br>
&gt; +<br>
&gt; +- shunt-resistor-micro-ohms<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Shunt resistor value in micro-Ohm<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; +adm1272@10 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;adi,adm1272&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x10&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shunt-resistor-micro-ohms =3D &lt;500&gt;;<br>
&gt; +};<br>
&gt; diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275=
<br>
&gt; index 39033538eb03..5e277b0d91ce 100644<br>
&gt; --- a/Documentation/hwmon/adm1275<br>
&gt; +++ b/Documentation/hwmon/adm1275<br>
&gt; @@ -58,6 +58,9 @@ The ADM1075, unlike many other PMBus devices, does n=
ot support internal voltage<br>
&gt;=C2=A0 or current scaling. Reported voltages, currents, and power are r=
aw measurements,<br>
&gt;=C2=A0 and will typically have to be scaled.<br>
&gt;=C2=A0 <br>
&gt; +The shunt value in micro-ohms can be set via device tree at compile-t=
ime. Please<br>
&gt; +refer to the Documentation/devicetree/bindings/hwmon/adm1275.txt for =
bindings<br>
&gt; +if the device tree is used.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Platform data support<br>
&gt;=C2=A0 ---------------------<br>
&gt; diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm12=
75.c<br>
&gt; index 13600fa79e7f..f569372c9204 100644<br>
&gt; --- a/drivers/hwmon/pmbus/adm1275.c<br>
&gt; +++ b/drivers/hwmon/pmbus/adm1275.c<br>
&gt; @@ -373,6 +373,7 @@ static int adm1275_probe(struct i2c_client *client=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct coefficients *coefficients;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int vindex =3D -1, voindex =3D -1, cindex =
=3D -1, pindex =3D -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int tindex =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 shunt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!i2c_check_functionality(client-&gt;adap=
ter,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I2C_FUNC_SMBUS_READ=
_BYTE_DATA<br>
&gt; @@ -421,6 +422,13 @@ static int adm1275_probe(struct i2c_client *clien=
t,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(client-&gt;dev.of_node,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shunt-resistor-micro-ohms&quot;, =
&amp;shunt))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shunt =3D 1000; /* 1 =
mOhm if not set via DT */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (shunt =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;id =3D mid-&gt;driver_data;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D &amp;data-&gt;info;<br>
&gt; @@ -654,12 +662,15 @@ static int adm1275_probe(struct i2c_client *clie=
nt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;R[PSC_V=
OLTAGE_OUT] =3D coefficients[voindex].R;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cindex &gt;=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;m[PSC_CURREN=
T_OUT] =3D coefficients[cindex].m;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Scale current with=
 sense resistor value */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;m[PSC_CURREN=
T_OUT] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0coefficients[cindex].m * shunt / 1000;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;b[PSC_C=
URRENT_OUT] =3D coefficients[cindex].b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;R[PSC_C=
URRENT_OUT] =3D coefficients[cindex].R;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pindex &gt;=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;m[PSC_POWER]=
 =3D coefficients[pindex].m;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;m[PSC_POWER]=
 =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0coefficients[pindex].m * shunt / 1000;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;b[PSC_P=
OWER] =3D coefficients[pindex].b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;R[PSC_P=
OWER] =3D coefficients[pindex].R;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -- <br>
&gt; 2.19.0.605.g01d371f741-goog<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div>

--00000000000010d9da0576f3ed9f--
