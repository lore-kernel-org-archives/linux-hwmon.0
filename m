Return-path: <venture@google.com>
MIME-Version: 1.0
In-Reply-To: <CAO=notwamYHt-hkqicuaN08Tsm1_idm8_mn0vDVzr4v_NDoaHQ@mail.gmail.com>
References: <20170530202739.31508-1-venture@google.com> <20170530222556.GA10520@roeck-us.net>
 <CAO=notwamYHt-hkqicuaN08Tsm1_idm8_mn0vDVzr4v_NDoaHQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 30 May 2017 18:16:32 -0700
Message-ID: <CAO=notys7OMk3yfyffgqVLFP=aiQMM_kdLT-PbprsUvB2nU-pg@mail.gmail.com>
Subject: Re: hwmon: (aspeed-pwm-tacho) Enable both edge measurement.
To: Guenter Roeck <linux@roeck-us.net>, Rick Altherr <raltherr@google.com>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Type: multipart/alternative; boundary="94eb2c1bc594b956950550c7ab1f"
List-ID: <linux-hwmon@vger.kernel.org>

--94eb2c1bc594b956950550c7ab1f
Content-Type: text/plain; charset="UTF-8"

I have a version of this driver that pulls the tune-able values from a
device tree that I'd ultimately like to upstream. For that version to work
properly it does rely on the both edge support, just in case a platform
uses that setting.

Would it make sense to push that patch up now as there is an overall theme
to my patches.

Patrick

On May 30, 2017 5:11 PM, "Patrick Venture" <venture@google.com> wrote:

> On Tue, May 30, 2017 at 01:27:39PM -0700, Patrick Venture wrote:
> >> The aspeed-pwm-tacho controller supports measuring the fan tach by using
> >> leading, falling, or both edges.  This change allows the driver to
> >> support either of the three configurations and will appropriately modify
> >> the returned tach data.
> >
> >> I tested this and found the number returned matched what I expected.
> >
> >> Signed-off-by: Patrick Venture <venture@google.com>
> >> ---
> >>  drivers/hwmon/aspeed-pwm-tacho.c | 24 +++++++++++++++++++++---
> >>  1 file changed, 21 insertions(+), 3 deletions(-)
> >
> >> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
> b/drivers/hwmon/aspeed-pwm-tacho.c
> >> index 48403a2115be..f288928b5e8a 100644
> >> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> >> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> >> @@ -145,11 +145,20 @@
> >
> >>  #define PWM_MAX 255
> >
> >> +#define BOTH_EDGES 0x02 /* 10b */
> >> +
> >>  #define M_PWM_DIV_H 0x00
> >>  #define M_PWM_DIV_L 0x05
> >>  #define M_PWM_PERIOD 0x5F
> >>  #define M_TACH_CLK_DIV 0x00
> >> -#define M_TACH_MODE 0x00
> >> +/*
> >> + * 5:4 Type N fan tach mode selection bit:
> >> + * 00: falling
> >> + * 01: rising
> >> + * 10: both
> >> + * 11: reserved.
> >> + */
> >> +#define M_TACH_MODE 0x10
>
> > That seems wrong. The above is a bit mask, this is an already shifted
> value.
>
> Good catch.  That's a reading bits, writing nibbles bug.  I did my
> testing in a branch that uses the device tree to control these knobs
> to get better tuning.  I have a series of tweaks to improve the
> responsiveness of this code.  Originally the driver author was told to
> modify the driver to remove the knobs by upstream.  For my platform,
> I've found the knobs are critical, and there are other changes
> associated with them.  I'm making an effort to get these changes in
> ahead of trying to re-enable the device-tree patch.
>
> Different systems using this aspeed driver may actually need different
> values, but for a few systems, I have found higher performing values.
>
> The data sheet is light on details, so some information is gleaned
> from the aspeed reference driver.
>
> >>  #define M_TACH_UNIT 0x1000
>
> > ... and this one seems wrong too, since it is passed to
> aspeed_set_tacho_type_values() which shifts it left by 16 bit.
>
> That seems wonky however, I believe the compiler is promoting the
> values to 32-bits before shifting them.  That's something I've
> definitely seen before.  However, I can manually cast them if you're
> weary of it.
>
> #define ASPEED_PTCR_TYPEM_CTRL          0x10
> #define ASPEED_PTCR_TYPEM_CTRL1         0x14
> #define TYPE_CTRL_FAN_PERIOD            16
> #define TYPE_CTRL_FAN_MODE              4
> #define TYPE_CTRL_FAN_DIVISION          1
> #define M_TACH_CLK_DIV 0x00
>
> Offset: 10h PTCR10: Type M Control 0 Register Init = X
> 31:16 RW Type M fan tach period bit [15:0] (in unit of type M PWM clock)
> 5 :4 RW Type M fan tach mode selection bit [1:0]
>   00: falling edge
>   01: rising edge
>   10: both edges
>   11: reserved
> 3 :1 RW Type M fan tach clock division bit [1:0]
>   000: divide 4
>   001: divide 16
>   010: divide 64
>   011: divide 256 ...
>   111: divide 65536
> 0 RW Enable fan tach of type M 0: disable 1: enable
>
> Offset: 14h PTCR14: Type M Control 1 Register Init = X
> Bit R/W Description
> 31:16 RW Type M fan tach falling point bit [15:0] of period
> 15:0 RW Type M fan tach rising point bit [15:0] of period
>
> 0x1000 << 16 | 0x02 << 4 | M_TACH_CLK_DIV << 1
>
>         u32 reg_value = ((mode << TYPE_CTRL_FAN_MODE) |
>                          (unit << TYPE_CTRL_FAN_PERIOD) |
>                          (division << TYPE_CTRL_FAN_DIVISION));
>
>         regmap_update_bits(regmap, type_params[type].ctrl_reg,
> TYPE_CTRL_FAN_MASK, reg_value);
>         regmap_update_bits(regmap, type_params[type].ctrl_reg1,
> TYPE_CTRL_FAN1_MASK, unit << 16);
>
> For type M Control 0 Register they're setting the fan tach period to
> 0x1000.  Presumably the compiler is promoting the value to 32-bits.
>
> For Type M Control 1 Register they're setting the fan tach falling
> point to 0x1000 and the rising point to 0.  Presumably the compiler is
> promoting unit to 32 bits.  I'm completely comfortable casting it to
> address this.
>
> >>  #define INIT_FAN_CTRL 0xFF
> >
> >> @@ -162,6 +171,7 @@ struct aspeed_pwm_tacho_data {
> >>       u8 type_pwm_clock_division_h[3];
> >>       u8 type_pwm_clock_division_l[3];
> >>       u8 type_fan_tach_clock_division[3];
> >> +     u8 type_fan_tach_mode[3];
> >>       u16 type_fan_tach_unit[3];
> >>       u8 pwm_port_type[8];
> >>       u8 pwm_port_fan_ctrl[8];
> >> @@ -498,7 +508,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct
> aspeed_pwm_tacho_data *priv,
> >>                                     u8 fan_tach_ch)
> >>  {
> >>       u32 raw_data, tach_div, clk_source, sec, val;
> >> -     u8 fan_tach_ch_source, type;
> >> +     u8 fan_tach_ch_source, type, mode, both;
> >
> >>       regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
> >>       regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0x1 <<
> fan_tach_ch);
> >> @@ -512,7 +522,14 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct
> aspeed_pwm_tacho_data *priv,
> >>       regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
> >>       raw_data = val & RESULT_VALUE_MASK;
> >>       tach_div = priv->type_fan_tach_clock_division[type];
> >> -     tach_div = 0x4 << (tach_div * 2);
> >> +     /*
> >> +      * We need the mode to determine if the raw_data is double (from
> >> +      * counting both edges).
> >> +      */
> >> +     mode = priv->type_fan_tach_mode[type];
> >> +     both = (mode & BOTH_EDGES) ? 1 : 0;
>
> > BOTH_EDGES is 0x02. Mode is 0x10. ???
>
> Bit -> nibble bug.
>
> >> +
> >> +     tach_div = (0x4 << both) << (tach_div * 2);
> >>       clk_source = priv->clk_freq;
> >
> >>       if (raw_data == 0)
> >> @@ -696,6 +713,7 @@ static void aspeed_create_type(struct
> aspeed_pwm_tacho_data *priv)
> >>       aspeed_set_tacho_type_enable(priv->regmap, TYPEM, true);
> >>       priv->type_fan_tach_clock_division[TYPEM] = M_TACH_CLK_DIV;
> >>       priv->type_fan_tach_unit[TYPEM] = M_TACH_UNIT;
> >> +     priv->type_fan_tach_mode[TYPEM] = M_TACH_MODE;
>
> > type_fan_tach_mode[] is always M_TACH_MODE or 0x10, and BOTH_EDGES
> (0x02) is never set.
>
> > What am I missing here ? Not sure what you are trying to accomplish.
> > Even if the bit mask is corrected, what is the benefit of changing the
> mode ?
>
> The benefit of changing the mode is that I can tune down (I was
> planning a series of these patches but I'm still new to upstreaming to
> linux and didn't want to get mixed up, too late) the time it takes for
> the controller to provide the fan speeds.
>
> At present this driver takes 1s per fan.  The controller itself
> appears to cache the speeds every 0.08s seconds, so with this and a
> few other tweaks I can get the individual read speed down to 0.017
> seconds each and get a fresh value more than 10x per second.  Which is
> something I need for a PID based fan controller.
>
> One of the ways I improved this was reducing the fan tach period.  I'm
> able to get reliable numbers with a lower period, but I'd rather
> people be able to tune that.  However, I can update the driver to have
> better defaults.
>
> > Guenter
>
> >>       aspeed_set_tacho_type_values(priv->regmap, TYPEM, M_TACH_MODE,
> >>                                    M_TACH_UNIT, M_TACH_CLK_DIV);
> >>  }
>

--94eb2c1bc594b956950550c7ab1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have a version of this driver that pulls the tune-able =
values from a device tree that I&#39;d ultimately like to upstream. For tha=
t version to work properly it does rely on the both edge support, just in c=
ase a platform uses that setting.<div dir=3D"auto"><br></div><div dir=3D"au=
to">Would it make sense to push that patch up now as there is an overall th=
eme to my patches.<br><div dir=3D"auto"><br></div><div dir=3D"auto">Patrick=
</div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On May 30, 2017 5:11 PM, &quot;Patrick Venture&quot; &lt;<a href=3D"mailto=
:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br=
 type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, May 30, 2017 a=
t 01:27:39PM -0700, Patrick Venture wrote:<br>
&gt;&gt; The aspeed-pwm-tacho controller supports measuring the fan tach by=
 using<br>
&gt;&gt; leading, falling, or both edges.=C2=A0 This change allows the driv=
er to<br>
&gt;&gt; support either of the three configurations and will appropriately =
modify<br>
&gt;&gt; the returned tach data.<br>
&gt;<br>
&gt;&gt; I tested this and found the number returned matched what I expecte=
d.<br>
&gt;<br>
&gt;&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@googl=
e.com">venture@google.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 drivers/hwmon/aspeed-pwm-<wbr>tacho.c | 24 +++++++++++++++++=
++++---<br>
&gt;&gt;=C2=A0 1 file changed, 21 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt;&gt; diff --git a/drivers/hwmon/aspeed-pwm-<wbr>tacho.c b/drivers/hwmon=
/aspeed-pwm-<wbr>tacho.c<br>
&gt;&gt; index 48403a2115be..f288928b5e8a 100644<br>
&gt;&gt; --- a/drivers/hwmon/aspeed-pwm-<wbr>tacho.c<br>
&gt;&gt; +++ b/drivers/hwmon/aspeed-pwm-<wbr>tacho.c<br>
&gt;&gt; @@ -145,11 +145,20 @@<br>
&gt;<br>
&gt;&gt;=C2=A0 #define PWM_MAX 255<br>
&gt;<br>
&gt;&gt; +#define BOTH_EDGES 0x02 /* 10b */<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #define M_PWM_DIV_H 0x00<br>
&gt;&gt;=C2=A0 #define M_PWM_DIV_L 0x05<br>
&gt;&gt;=C2=A0 #define M_PWM_PERIOD 0x5F<br>
&gt;&gt;=C2=A0 #define M_TACH_CLK_DIV 0x00<br>
&gt;&gt; -#define M_TACH_MODE 0x00<br>
&gt;&gt; +/*<br>
&gt;&gt; + * 5:4 Type N fan tach mode selection bit:<br>
&gt;&gt; + * 00: falling<br>
&gt;&gt; + * 01: rising<br>
&gt;&gt; + * 10: both<br>
&gt;&gt; + * 11: reserved.<br>
&gt;&gt; + */<br>
&gt;&gt; +#define M_TACH_MODE 0x10<br>
<br>
&gt; That seems wrong. The above is a bit mask, this is an already shifted =
value.<br>
<br>
Good catch.=C2=A0 That&#39;s a reading bits, writing nibbles bug.=C2=A0 I d=
id my<br>
testing in a branch that uses the device tree to control these knobs<br>
to get better tuning.=C2=A0 I have a series of tweaks to improve the<br>
responsiveness of this code.=C2=A0 Originally the driver author was told to=
<br>
modify the driver to remove the knobs by upstream.=C2=A0 For my platform,<b=
r>
I&#39;ve found the knobs are critical, and there are other changes<br>
associated with them.=C2=A0 I&#39;m making an effort to get these changes i=
n<br>
ahead of trying to re-enable the device-tree patch.<br>
<br>
Different systems using this aspeed driver may actually need different<br>
values, but for a few systems, I have found higher performing values.<br>
<br>
The data sheet is light on details, so some information is gleaned<br>
from the aspeed reference driver.<br>
<br>
&gt;&gt;=C2=A0 #define M_TACH_UNIT 0x1000<br>
<br>
&gt; ... and this one seems wrong too, since it is passed to aspeed_set_tac=
ho_type_values() which shifts it left by 16 bit.<br>
<br>
That seems wonky however, I believe the compiler is promoting the<br>
values to 32-bits before shifting them.=C2=A0 That&#39;s something I&#39;ve=
<br>
definitely seen before.=C2=A0 However, I can manually cast them if you&#39;=
re<br>
weary of it.<br>
<br>
#define ASPEED_PTCR_TYPEM_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<br>
#define ASPEED_PTCR_TYPEM_CTRL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x14<br>
#define TYPE_CTRL_FAN_PERIOD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br=
>
#define TYPE_CTRL_FAN_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
4<br>
#define TYPE_CTRL_FAN_DIVISION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
#define M_TACH_CLK_DIV 0x00<br>
<br>
Offset: 10h PTCR10: Type M Control 0 Register Init =3D X<br>
31:16 RW Type M fan tach period bit [15:0] (in unit of type M PWM clock)<br=
>
5 :4 RW Type M fan tach mode selection bit [1:0]<br>
=C2=A0 00: falling edge<br>
=C2=A0 01: rising edge<br>
=C2=A0 10: both edges<br>
=C2=A0 11: reserved<br>
3 :1 RW Type M fan tach clock division bit [1:0]<br>
=C2=A0 000: divide 4<br>
=C2=A0 001: divide 16<br>
=C2=A0 010: divide 64<br>
=C2=A0 011: divide 256 ...<br>
=C2=A0 111: divide 65536<br>
0 RW Enable fan tach of type M 0: disable 1: enable<br>
<br>
Offset: 14h PTCR14: Type M Control 1 Register Init =3D X<br>
Bit R/W Description<br>
31:16 RW Type M fan tach falling point bit [15:0] of period<br>
15:0 RW Type M fan tach rising point bit [15:0] of period<br>
<br>
0x1000 &lt;&lt; 16 | 0x02 &lt;&lt; 4 | M_TACH_CLK_DIV &lt;&lt; 1<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 reg_value =3D ((mode &lt;&lt; TYPE_CTRL_FAN=
_MODE) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(unit &lt;&lt; TYPE_CTRL_FAN_PERIOD) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(division &lt;&lt; TYPE_CTRL_FAN_DIVISION));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(regmap, type_params[type].ct=
rl_reg,<br>
TYPE_CTRL_FAN_MASK, reg_value);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(regmap, type_params[type].ct=
rl_reg1,<br>
TYPE_CTRL_FAN1_MASK, unit &lt;&lt; 16);<br>
<br>
For type M Control 0 Register they&#39;re setting the fan tach period to<br=
>
0x1000.=C2=A0 Presumably the compiler is promoting the value to 32-bits.<br=
>
<br>
For Type M Control 1 Register they&#39;re setting the fan tach falling<br>
point to 0x1000 and the rising point to 0.=C2=A0 Presumably the compiler is=
<br>
promoting unit to 32 bits.=C2=A0 I&#39;m completely comfortable casting it =
to<br>
address this.<br>
<br>
&gt;&gt;=C2=A0 #define INIT_FAN_CTRL 0xFF<br>
&gt;<br>
&gt;&gt; @@ -162,6 +171,7 @@ struct aspeed_pwm_tacho_data {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 type_pwm_clock_division_h[3];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 type_pwm_clock_division_l[3];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 type_fan_tach_clock_division[<wbr>3];=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0u8 type_fan_tach_mode[3];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 type_fan_tach_unit[3];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_port_type[8];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_port_fan_ctrl[8];<br>
&gt;&gt; @@ -498,7 +508,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(<wbr>str=
uct aspeed_pwm_tacho_data *priv,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 fan_ta=
ch_ch)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 raw_data, tach_div, clk_source, sec,=
 val;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0u8 fan_tach_ch_source, type;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0u8 fan_tach_ch_source, type, mode, both;<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(priv-&gt;regmap, ASPEED_PTC=
R_TRIGGER, 0);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(priv-&gt;regmap, ASPEED_PTC=
R_TRIGGER, 0x1 &lt;&lt; fan_tach_ch);<br>
&gt;&gt; @@ -512,7 +522,14 @@ static u32 aspeed_get_fan_tach_ch_rpm(<wbr>st=
ruct aspeed_pwm_tacho_data *priv,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(priv-&gt;regmap, ASPEED_PTCR=
_RESULT, &amp;val);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0raw_data =3D val &amp; RESULT_VALUE_MASK=
;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tach_div =3D priv-&gt;type_fan_tach_cloc=
k_<wbr>division[type];<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0tach_div =3D 0x4 &lt;&lt; (tach_div * 2);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 * We need the mode to determine if the raw_d=
ata is double (from<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 * counting both edges).<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0mode =3D priv-&gt;type_fan_tach_mode[type]<wb=
r>;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0both =3D (mode &amp; BOTH_EDGES) ? 1 : 0;<br>
<br>
&gt; BOTH_EDGES is 0x02. Mode is 0x10. ???<br>
<br>
Bit -&gt; nibble bug.<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0tach_div =3D (0x4 &lt;&lt; both) &lt;&lt; (ta=
ch_div * 2);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_source =3D priv-&gt;clk_freq;<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (raw_data =3D=3D 0)<br>
&gt;&gt; @@ -696,6 +713,7 @@ static void aspeed_create_type(struct aspeed_p=
wm_tacho_data *priv)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_tacho_type_enable(<wbr>priv-&=
gt;regmap, TYPEM, true);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;type_fan_tach_clock_<wbr>divisi=
on[TYPEM] =3D M_TACH_CLK_DIV;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;type_fan_tach_unit[<wbr>TYPEM] =
=3D M_TACH_UNIT;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;type_fan_tach_mode[<wbr>TYPEM] =3D M=
_TACH_MODE;<br>
<br>
&gt; type_fan_tach_mode[] is always M_TACH_MODE or 0x10, and BOTH_EDGES (0x=
02) is never set.<br>
<br>
&gt; What am I missing here ? Not sure what you are trying to accomplish.<b=
r>
&gt; Even if the bit mask is corrected, what is the benefit of changing the=
 mode ?<br>
<br>
The benefit of changing the mode is that I can tune down (I was<br>
planning a series of these patches but I&#39;m still new to upstreaming to<=
br>
linux and didn&#39;t want to get mixed up, too late) the time it takes for<=
br>
the controller to provide the fan speeds.<br>
<br>
At present this driver takes 1s per fan.=C2=A0 The controller itself<br>
appears to cache the speeds every 0.08s seconds, so with this and a<br>
few other tweaks I can get the individual read speed down to 0.017<br>
seconds each and get a fresh value more than 10x per second.=C2=A0 Which is=
<br>
something I need for a PID based fan controller.<br>
<br>
One of the ways I improved this was reducing the fan tach period.=C2=A0 I&#=
39;m<br>
able to get reliable numbers with a lower period, but I&#39;d rather<br>
people be able to tune that.=C2=A0 However, I can update the driver to have=
<br>
better defaults.<br>
<br>
&gt; Guenter<br>
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_tacho_type_values(<wbr>priv-&=
gt;regmap, TYPEM, M_TACH_MODE,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 M_TACH_UNIT, M_=
TACH_CLK_DIV);<br>
&gt;&gt;=C2=A0 }<br>
</blockquote></div></div>

--94eb2c1bc594b956950550c7ab1f--
