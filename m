Return-Path: <andrey.gusakov@cogentembedded.com>
Return-path: <andrey.gusakov@cogentembedded.com>
MIME-Version: 1.0
In-Reply-To: <1521650366-32506-1-git-send-email-andrey.gusakov@cogentembedded.com>
References: <1521650366-32506-1-git-send-email-andrey.gusakov@cogentembedded.com>
From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Date: Wed, 21 Mar 2018 19:40:35 +0300
Message-ID: <CAFmnZc2azrwbLj6=KbHPi2oRaaob9jSR+uKyQOCZA2F_WhNkqQ@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: MC13783: add uid and die temperature sensor inputs
To: jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee.jones@linaro.org>,
	Chris Healy <cphealy@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Content-Type: multipart/alternative; boundary="94eb2c072d76b692df0567eed9aa"
List-ID: <linux-hwmon@vger.kernel.org>

--94eb2c072d76b692df0567eed9aa
Content-Type: text/plain; charset="UTF-8"

Sorry, incompletely fixed patch. Please ignore that noise.

On Wed, Mar 21, 2018 at 7:39 PM, Andrey Gusakov <
andrey.gusakov@cogentembedded.com> wrote:

> The uid and die temperature can be read out on the ADIN7 using
> input mux. Map uid and die temperature sensor to channels 16
> and 17.
>
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> ---
> Changes in v3:
> - comment style fixes
> Changes in v2:
> - suport both mc13783 and mc13892
> - uid_input renamed to in16_input
> - style fixes
> ---
>  drivers/hwmon/mc13783-adc.c | 59 ++++++++++++++++++++++++++++++
> +++++++++++++++
>  drivers/mfd/mc13xxx-core.c  | 15 +++++++++++-
>  include/linux/mfd/mc13xxx.h |  2 ++
>  3 files changed, 75 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/mc13783-adc.c b/drivers/hwmon/mc13783-adc.c
> index 960a1db..840d8fc 100644
> --- a/drivers/hwmon/mc13783-adc.c
> +++ b/drivers/hwmon/mc13783-adc.c
> @@ -63,6 +63,10 @@ static int mc13783_adc_read(struct device *dev,
>         if (ret)
>                 return ret;
>
> +       /* ADIN7 subchannels */
> +       if (channel >= 16)
> +               channel = 7;
> +
>         channel &= 0x7;
>
>         *val = (sample[channel % 4] >> (channel > 3 ? 14 : 2)) & 0x3ff;
> @@ -111,6 +115,56 @@ static ssize_t mc13783_adc_read_gp(struct device *dev,
>         return sprintf(buf, "%u\n", val);
>  }
>
> +static ssize_t mc13783_adc_read_uid(struct device *dev,
> +               struct device_attribute *devattr, char *buf)
> +{
> +       unsigned int val;
> +       struct platform_device *pdev = to_platform_device(dev);
> +       kernel_ulong_t driver_data = platform_get_device_id(pdev)->
> driver_data;
> +       int ret = mc13783_adc_read(dev, devattr, &val);
> +
> +       if (ret)
> +               return ret;
> +
> +       if (driver_data & MC13783_ADC_BPDIV2)
> +               /* MC13892 have 1/2 divider, input range is [0, 4.800V] */
> +               val = DIV_ROUND_CLOSEST(val * 4800, 1024);
> +       else
> +               /* MC13783 have 0.9 divider, input range is [0, 2.555V] */
> +               val = DIV_ROUND_CLOSEST(val * 2555, 1024);
> +
> +       return sprintf(buf, "%u\n", val);
> +}
> +
> +static ssize_t mc13783_adc_read_temp(struct device *dev,
> +               struct device_attribute *devattr, char *buf)
> +{
> +       unsigned int val;
> +       struct platform_device *pdev = to_platform_device(dev);
> +       kernel_ulong_t driver_data = platform_get_device_id(pdev)->
> driver_data;
> +       int ret = mc13783_adc_read(dev, devattr, &val);
> +
> +       if (ret)
> +               return ret;
> +
> +       if (driver_data & MC13783_ADC_BPDIV2) {
> +               /*
> +                * MC13892:
> +                * Die Temperature Read Out Code at 25C 680
> +                * Temperature change per LSB +0.4244C
> +                */
> +               ret = DIV_ROUND_CLOSEST(-2635920 + val * 4244, 10);
> +       } else {
> +               /* MC13783:
> +                * Die Temperature Read Out Code at 25C 282
> +                * Temperature change per LSB -1.14C
> +                */
> +               ret = 346480 - 1140 * val;
> +       }
> +
> +       return sprintf(buf, "%d\n", ret);
> +}
> +
>  static DEVICE_ATTR_RO(name);
>  static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, mc13783_adc_read_bp, NULL,
> 2);
>  static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, mc13783_adc_read_gp, NULL,
> 5);
> @@ -124,6 +178,9 @@ static ssize_t mc13783_adc_read_gp(struct device *dev,
>  static SENSOR_DEVICE_ATTR(in13_input, S_IRUGO, mc13783_adc_read_gp, NULL,
> 13);
>  static SENSOR_DEVICE_ATTR(in14_input, S_IRUGO, mc13783_adc_read_gp, NULL,
> 14);
>  static SENSOR_DEVICE_ATTR(in15_input, S_IRUGO, mc13783_adc_read_gp, NULL,
> 15);
> +static SENSOR_DEVICE_ATTR(in16_input, S_IRUGO, mc13783_adc_read_uid,
> NULL, 16);
> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
> +                         mc13783_adc_read_temp, NULL, 17);
>
>  static struct attribute *mc13783_attr_base[] = {
>         &dev_attr_name.attr,
> @@ -131,6 +188,8 @@ static ssize_t mc13783_adc_read_gp(struct device *dev,
>         &sensor_dev_attr_in5_input.dev_attr.attr,
>         &sensor_dev_attr_in6_input.dev_attr.attr,
>         &sensor_dev_attr_in7_input.dev_attr.attr,
> +       &sensor_dev_attr_in16_input.dev_attr.attr,
> +       &sensor_dev_attr_temp1_input.dev_attr.attr,
>         NULL
>  };
>
> diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
> index d7f54e4..c63e331 100644
> --- a/drivers/mfd/mc13xxx-core.c
> +++ b/drivers/mfd/mc13xxx-core.c
> @@ -279,8 +279,21 @@ int mc13xxx_adc_do_conversion(struct mc13xxx
> *mc13xxx, unsigned int mode,
>         adc0 = MC13XXX_ADC0_ADINC1 | MC13XXX_ADC0_ADINC2;
>         adc1 = MC13XXX_ADC1_ADEN | MC13XXX_ADC1_ADTRIGIGN |
> MC13XXX_ADC1_ASC;
>
> -       if (channel > 7)
> +       /*
> +        * Channels mapped through ADIN7:
> +        * 7  - General purpose ADIN7
> +        * 16 - UID
> +        * 17 - Die temperature
> +        */
> +       if (channel > 7 && channel < 16) {
>                 adc1 |= MC13XXX_ADC1_ADSEL;
> +       } else if (channel == 16) {
> +               adc0 |= MC13XXX_ADC0_ADIN7SEL_UID;
> +               channel = 7;
> +       } else if (channel == 17) {
> +               adc0 |= MC13XXX_ADC0_ADIN7SEL_DIE;
> +               channel = 7;
> +       }
>
>         switch (mode) {
>         case MC13XXX_ADC_MODE_TS:
> diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
> index 638222e..54a3cd8 100644
> --- a/include/linux/mfd/mc13xxx.h
> +++ b/include/linux/mfd/mc13xxx.h
> @@ -243,6 +243,8 @@ struct mc13xxx_platform_data {
>  #define MC13XXX_ADC0_LICELLCON         (1 << 0)
>  #define MC13XXX_ADC0_CHRGICON          (1 << 1)
>  #define MC13XXX_ADC0_BATICON           (1 << 2)
> +#define MC13XXX_ADC0_ADIN7SEL_DIE      (1 << 4)
> +#define MC13XXX_ADC0_ADIN7SEL_UID      (2 << 4)
>  #define MC13XXX_ADC0_ADREFEN           (1 << 10)
>  #define MC13XXX_ADC0_TSMOD0            (1 << 12)
>  #define MC13XXX_ADC0_TSMOD1            (1 << 13)
> --
> 1.9.1
>
>

--94eb2c072d76b692df0567eed9aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, incompletely fixed patch. Please ignore that noise.=
<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed,=
 Mar 21, 2018 at 7:39 PM, Andrey Gusakov <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:andrey.gusakov@cogentembedded.com" target=3D"_blank">andrey.gusakov@c=
ogentembedded.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">T=
he uid and die temperature can be read out on the ADIN7 using<br>
input mux. Map uid and die temperature sensor to channels 16<br>
and 17.<br>
<br>
Signed-off-by: Andrey Gusakov &lt;<a href=3D"mailto:andrey.gusakov@cogentem=
bedded.com">andrey.gusakov@<wbr>cogentembedded.com</a>&gt;<br>
---<br>
Changes in v3:<br>
- comment style fixes<br>
Changes in v2:<br>
- suport both mc13783 and mc13892<br>
- uid_input renamed to in16_input<br>
- style fixes<br>
---<br>
=C2=A0drivers/hwmon/mc13783-adc.c | 59 ++++++++++++++++++++++++++++++<wbr>+=
++++++++++++++<br>
=C2=A0drivers/mfd/mc13xxx-core.c=C2=A0 | 15 +++++++++++-<br>
=C2=A0include/linux/mfd/mc13xxx.h |=C2=A0 2 ++<br>
=C2=A03 files changed, 75 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/hwmon/mc13783-adc.c b/drivers/hwmon/mc13783-adc.c<br>
index 960a1db..840d8fc 100644<br>
--- a/drivers/hwmon/mc13783-adc.c<br>
+++ b/drivers/hwmon/mc13783-adc.c<br>
@@ -63,6 +63,10 @@ static int mc13783_adc_read(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ADIN7 subchannels */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (channel &gt;=3D 16)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D 7;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 channel &amp;=3D 0x7;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D (sample[channel % 4] &gt;&gt; (channel=
 &gt; 3 ? 14 : 2)) &amp; 0x3ff;<br>
@@ -111,6 +115,56 @@ static ssize_t mc13783_adc_read_gp(struct device *dev,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, &quot;%u\n&quot;, val);<br>
=C2=A0}<br>
<br>
+static ssize_t mc13783_adc_read_uid(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attri=
bute *devattr, char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_de=
vice(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_ulong_t driver_data =3D platform_get_dev=
ice_id(pdev)-&gt;<wbr>driver_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D mc13783_adc_read(dev, devattr, &amp=
;val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver_data &amp; MC13783_ADC_BPDIV2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* MC13892 have 1/2=
 divider, input range is [0, 4.800V] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D DIV_ROUND_C=
LOSEST(val * 4800, 1024);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* MC13783 have 0.9=
 divider, input range is [0, 2.555V] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D DIV_ROUND_C=
LOSEST(val * 2555, 1024);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%u\n&quot;, val);<br>
+}<br>
+<br>
+static ssize_t mc13783_adc_read_temp(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attri=
bute *devattr, char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_de=
vice(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_ulong_t driver_data =3D platform_get_dev=
ice_id(pdev)-&gt;<wbr>driver_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D mc13783_adc_read(dev, devattr, &amp=
;val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver_data &amp; MC13783_ADC_BPDIV2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * MC13892:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Die Temperature =
Read Out Code at 25C 680<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Temperature chan=
ge per LSB +0.4244C<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D DIV_ROUND_C=
LOSEST(-2635920 + val * 4244, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* MC13783:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Die Temperature =
Read Out Code at 25C 282<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Temperature chan=
ge per LSB -1.14C<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 346480 - 11=
40 * val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%d\n&quot;, ret);<br>
+}<br>
+<br>
=C2=A0static DEVICE_ATTR_RO(name);<br>
=C2=A0static SENSOR_DEVICE_ATTR(in2_input, S_IRUGO, mc13783_adc_read_bp, NU=
LL, 2);<br>
=C2=A0static SENSOR_DEVICE_ATTR(in5_input, S_IRUGO, mc13783_adc_read_gp, NU=
LL, 5);<br>
@@ -124,6 +178,9 @@ static ssize_t mc13783_adc_read_gp(struct device *dev,<=
br>
=C2=A0static SENSOR_DEVICE_ATTR(in13_input, S_IRUGO, mc13783_adc_read_gp, N=
ULL, 13);<br>
=C2=A0static SENSOR_DEVICE_ATTR(in14_input, S_IRUGO, mc13783_adc_read_gp, N=
ULL, 14);<br>
=C2=A0static SENSOR_DEVICE_ATTR(in15_input, S_IRUGO, mc13783_adc_read_gp, N=
ULL, 15);<br>
+static SENSOR_DEVICE_ATTR(in16_input, S_IRUGO, mc13783_adc_read_uid, NULL,=
 16);<br>
+static SENSOR_DEVICE_ATTR(temp1_<wbr>input, S_IRUGO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mc13783_adc_read_temp, NULL, 17);<br>
<br>
=C2=A0static struct attribute *mc13783_attr_base[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dev_attr_name.attr,<br>
@@ -131,6 +188,8 @@ static ssize_t mc13783_adc_read_gp(struct device *dev,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sensor_dev_attr_in5_input.<wbr>dev_attr.at=
tr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sensor_dev_attr_in6_input.<wbr>dev_attr.at=
tr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sensor_dev_attr_in7_input.<wbr>dev_attr.at=
tr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_in16_input.<wbr>dev_attr.a=
ttr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_input.<wbr>dev_attr.=
attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL<br>
=C2=A0};<br>
<br>
diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c<br>
index d7f54e4..c63e331 100644<br>
--- a/drivers/mfd/mc13xxx-core.c<br>
+++ b/drivers/mfd/mc13xxx-core.c<br>
@@ -279,8 +279,21 @@ int mc13xxx_adc_do_conversion(<wbr>struct mc13xxx *mc1=
3xxx, unsigned int mode,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adc0 =3D MC13XXX_ADC0_ADINC1 | MC13XXX_ADC0_ADI=
NC2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adc1 =3D MC13XXX_ADC1_ADEN | MC13XXX_ADC1_ADTRI=
GIGN | MC13XXX_ADC1_ASC;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (channel &gt; 7)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Channels mapped through ADIN7:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7=C2=A0 - General purpose ADIN7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 16 - UID<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 17 - Die temperature<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (channel &gt; 7 &amp;&amp; channel &lt; 16) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc1 |=3D MC13XXX_A=
DC1_ADSEL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (channel =3D=3D 16) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adc0 |=3D MC13XXX_A=
DC0_ADIN7SEL_UID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D 7;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (channel =3D=3D 17) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adc0 |=3D MC13XXX_A=
DC0_ADIN7SEL_DIE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D 7;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (mode) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case MC13XXX_ADC_MODE_TS:<br>
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h<br>
index 638222e..54a3cd8 100644<br>
--- a/include/linux/mfd/mc13xxx.h<br>
+++ b/include/linux/mfd/mc13xxx.h<br>
@@ -243,6 +243,8 @@ struct mc13xxx_platform_data {<br>
=C2=A0#define MC13XXX_ADC0_LICELLCON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &l=
t;&lt; 0)<br>
=C2=A0#define MC13XXX_ADC0_CHRGICON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &l=
t;&lt; 1)<br>
=C2=A0#define MC13XXX_ADC0_BATICON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 &lt;&lt; 2)<br>
+#define MC13XXX_ADC0_ADIN7SEL_DIE=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 4)<br>
+#define MC13XXX_ADC0_ADIN7SEL_UID=C2=A0 =C2=A0 =C2=A0 (2 &lt;&lt; 4)<br>
=C2=A0#define MC13XXX_ADC0_ADREFEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 &lt;&lt; 10)<br>
=C2=A0#define MC13XXX_ADC0_TSMOD0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(1 &lt;&lt; 12)<br>
=C2=A0#define MC13XXX_ADC0_TSMOD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(1 &lt;&lt; 13)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c072d76b692df0567eed9aa--
