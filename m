Return-Path: <tmaimon77@gmail.com>
Return-path: <tmaimon77@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180625171417.GA16379@rob-hp-laptop>
References: <20180624124155.82412-1-tmaimon77@gmail.com> <20180624124155.82412-2-tmaimon77@gmail.com>
 <20180625171417.GA16379@rob-hp-laptop>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 26 Jun 2018 01:20:50 +0300
Message-ID: <CAP6Zq1h-M6YDS67pkgHy-GMmiVk1D-RScLgDyG65JQM+S35rEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-binding: hwmon: Add NPCM7xx PWM and Fan
 controller documentation
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, jdelvare@suse.com,
	Guenter Roeck <linux@roeck-us.net>, Avi Fishman <avifishman70@gmail.com>,
	Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>,
	Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>,
	devicetree <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004dfa06056f7ecba6"
List-ID: <linux-hwmon@vger.kernel.org>

--0000000000004dfa06056f7ecba6
Content-Type: text/plain; charset="UTF-8"

Hi Rob,


On 25 June 2018 at 20:14, Rob Herring <robh@kernel.org> wrote:

> On Sun, Jun 24, 2018 at 03:41:54PM +0300, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM7xx Pulse Width Modulation (PWM)  and Fan tach controller.
> > The PWM controller can support upto 8 PWM output ports.
> > The Fan tach controller can support upto 16 tachometer inputs.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  | 84
> ++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-
> fan.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> > new file mode 100644
> > index 000000000000..a9eacda34f92
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> > @@ -0,0 +1,84 @@
> > +Nuvoton NPCM7xx PWM and Fan Tacho controller device driver
>
> Bindings are for h/w, not drivers.
>
> > +
> > +The NPCM7xx has two identical Pulse-width modulation (PWM) controller
> modules,
> > +Each PWM module has four PWM controller outputs, Totally 8 PWM
> controller outputs.
> > +
> > +The NPCM7xx has eight identical Fan tachometer controller modules,
> > +Each Fan module has two Fan controller inputs, Totally 16 Fan
> controller inputs.
>
> Have you looked at other fan ctrlr bindings?f This looks like similar
> h/w to ASpeed. Really, I'd like to see a common doc that describes the
>

We do not have the same H/W as Aspeed, I believe in the near future we will
need to add
more DT properties that will used only in the NPCM7xx module.

structure and common properties.
>

what do you mean by common structure and common properties?


> > +
> > +Required properties for pwm-fan node:
> > +- compatible : "nuvoton,npcm750-pwm-fan" for Poleg NPCM7XX.
> > +- reg                        : specifies physical base address and size
> of the registers.
> > +- reg-names  : must contain:
> > +                                     * "pwm-base" for the PWM registers.
> > +                                     * "fan-base" for the Fan registers.
>
> '-base' is redundant. And your example doesn't match.
>
> > +- clocks             : phandle of reference clocks.
> > +- clock-names        : must contain
> > +                                     * "clk_apb3" for clock of PWM
> controller.
> > +                                     * "clk_apb4" for clock of Fan
> controller.
> > +- interrupts : contain the Fan interrupts with flags for falling edge.
> > +- pinctrl-names      : a pinctrl state named "default" must be defined.
> > +- pinctrl-0  : phandle referencing pin configuration of the PWM and Fan
> > +                                     controller ports.
> > +
> > +pwm subnode format:
> > +===================
> > +Under pwm subnode can be upto 8 child nodes, each child node
> representing a PWM channel.
> > +Each pwm subnode must have one PWM channel and atleast one Fan tach
> channel.
> > +
> > +For PWM channel can be configured cooling-levels to create cooling
> device.
> > +Cooling device could be bound to a thermal zone for the thermal control.
> > +
> > +Required properties for each child node:
> > +- pwm-ch : specify the PWM output channel.
> > +                     integer value in the range 0 through 7, that
> represent
> > +                     the PWM channel number that used.
> > +
> > +- fan-ch : specify the Fan input channel.
> > +                     integer value in the range 0 through 15, that
> represent
> > +                     the Fan channel number that used.
>
> This is really the tach channel.
>
>
> > +
> > +                     At least one Fan tach input channel is required
> > +
> > +Optional property for each child node:
> > +- cooling-levels: PWM duty cycle values in a range from 0 to 255
> > +                  which correspond to thermal cooling states.
> > +
> > +Examples:
> > +
> > +pwm_fan:pwm_fan_controller@103000 {
>
> fan-controller@...
>
> > +     compatible = "nuvoton,npcm750-pwm-fan";
> > +     reg = <0x103000 0x2000>,
> > +             <0x180000 0x8000>;
> > +     reg-names = "pwm_base", "fan_base";
> > +     clocks = <&clk NPCM7XX_CLK_APB3>,
> > +             <&clk NPCM7XX_CLK_APB4>;
> > +     clock-names = "clk_apb3","clk_apb4";
> > +     interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pwm0_pins &pwm1_pins &pwm2_pins
> > +                     &fanin0_pins &fanin1_pins &fanin2_pins
> > +                     &fanin3_pins &fanin4_pins>;
> > +
> > +                     pwm@0 {
>
> The sub-nodes should be "fan" nodes.
>
> A unit-address without reg property is not valid.
>
> > +                             pwm-ch = /bits/ 8 <0x00>;
>
> Use 'reg' like ASpeed binding.
>
> > +                             fan-ch = /bits/ 8 <0x00 0x01>;
> > +                             cooling-levels = <127 255>;
> > +                             };
> > +                     pwm@1 {
> > +                             pwm-ch = /bits/ 8 <0x01>;
> > +                             fan-ch = /bits/ 8 <0x02 0x03>;
> > +                             };
> > +                     pwm@2 {
> > +                             pwm-ch = /bits/ 8 <0x02>;
> > +                             fan-ch = /bits/ 8 <0x04>;
> > +                             };
> > +
> > +};
> > \ No newline at end of file
>
> ^^^
>
> > --
> > 2.14.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html


Thanks!

Tomer

--0000000000004dfa06056f7ecba6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rob,<div><br></div><div><br></div><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote">On 25 June 2018 at 20:14, Rob Herring <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:robh@kernel.org" target=3D"_blank">robh=
@kernel.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On Sun, Jun 24, 2018 at 03:41:54PM +0300, Tomer Maimon wrote:<br>
&gt; Added device tree binding documentation for Nuvoton BMC<br>
&gt; NPCM7xx Pulse Width Modulation (PWM)=C2=A0 and Fan tach controller.<br=
>
&gt; The PWM controller can support upto 8 PWM output ports.<br>
&gt; The Fan tach controller can support upto 16 tachometer inputs.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/hwmon/<wbr>npcm750-pwm-fan.txt=C2=A0 | 8=
4 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 84 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/hwmon/=
npcm750-pwm-<wbr>fan.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/hwmon/npcm750-pwm-=
<wbr>fan.txt b/Documentation/devicetree/<wbr>bindings/hwmon/npcm750-pwm-<wb=
r>fan.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..a9eacda34f92<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/hwmon/npcm750-pwm-<wbr>fa=
n.txt<br>
&gt; @@ -0,0 +1,84 @@<br>
&gt; +Nuvoton NPCM7xx PWM and Fan Tacho controller device driver<br>
<br>
</span>Bindings are for h/w, not drivers.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +The NPCM7xx has two identical Pulse-width modulation (PWM) controller=
 modules,<br>
&gt; +Each PWM module has four PWM controller outputs, Totally 8 PWM contro=
ller outputs.<br>
&gt; +<br>
&gt; +The NPCM7xx has eight identical Fan tachometer controller modules,<br=
>
&gt; +Each Fan module has two Fan controller inputs, Totally 16 Fan control=
ler inputs.<br>
<br>
</span>Have you looked at other fan ctrlr bindings?f This looks like simila=
r <br>
h/w to ASpeed. Really, I&#39;d like to see a common doc that describes the =
<br></blockquote><div>=C2=A0</div><div>

<div style=3D"font-size:small;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial">We do not have the same H=
/W as Aspeed, I believe in the near future we will need to add=C2=A0</div><=
div style=3D"font-size:small;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial">more DT properties that wi=
ll used only in the NPCM7xx module.=C2=A0=C2=A0</div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
structure and common properties.<br></blockquote><div><br></div>

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">what do you mean by common=C2=A0</span><span style=3D"font-size:small;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">structure and common properties?=
</span>

<div><span style=3D"font-size:small;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline"><br></span></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br=
>
&gt; +<br>
&gt; +Required properties for pwm-fan node:<br>
&gt; +- compatible : &quot;nuvoton,npcm750-pwm-fan&quot; for Poleg NPCM7XX.=
<br>
&gt; +- reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 : specifies physical base address and size of the regi=
sters.<br>
&gt; +- reg-names=C2=A0 : must contain:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;pwm-=
base&quot; for the PWM registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;fan-=
base&quot; for the Fan registers.<br>
<br>
</span>&#39;-base&#39; is redundant. And your example doesn&#39;t match.<br=
>
<div><div class=3D"h5"><br>
&gt; +- clocks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: phandle of =
reference clocks.<br>
&gt; +- clock-names=C2=A0 =C2=A0 =C2=A0 =C2=A0 : must contain<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;clk_=
apb3&quot; for clock of PWM controller.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;clk_=
apb4&quot; for clock of Fan controller.<br>
&gt; +- interrupts : contain the Fan interrupts with flags for falling edge=
.<br>
&gt; +- pinctrl-names=C2=A0 =C2=A0 =C2=A0 : a pinctrl state named &quot;def=
ault&quot; must be defined.<br>
&gt; +- pinctrl-0=C2=A0 : phandle referencing pin configuration of the PWM =
and Fan<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0controller p=
orts.<br>
&gt; +<br>
&gt; +pwm subnode format:<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +Under pwm subnode can be upto 8 child nodes, each child node represen=
ting a PWM channel.<br>
&gt; +Each pwm subnode must have one PWM channel and atleast one Fan tach c=
hannel.<br>
&gt; +<br>
&gt; +For PWM channel can be configured cooling-levels to create cooling de=
vice.<br>
&gt; +Cooling device could be bound to a thermal zone for the thermal contr=
ol.<br>
&gt; +<br>
&gt; +Required properties for each child node:<br>
&gt; +- pwm-ch : specify the PWM output channel.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0integer value in the range 0 through 7, that represent<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0the PWM channel number that used.<br>
&gt; +<br>
&gt; +- fan-ch : specify the Fan input channel.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0integer value in the range 0 through 15, that represent<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0the Fan channel number that used.<br>
<br>
</div></div>This is really the tach channel.<br>
<span class=3D""><br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0At least one Fan tach input channel is required<br>
&gt; +<br>
&gt; +Optional property for each child node:<br>
&gt; +- cooling-levels: PWM duty cycle values in a range from 0 to 255<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 which =
correspond to thermal cooling states.<br>
&gt; +<br>
&gt; +Examples:<br>
&gt; +<br>
&gt; +pwm_fan:pwm_fan_controller@<wbr>103000 {<br>
<br>
</span>fan-controller@...<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-pwm-fan&quot=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x103000 0x2000&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0x180000 0x8000&g=
t;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-names =3D &quot;pwm_base&quot;, &quot;fan_bas=
e&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;clk NPCM7XX_CLK_APB3&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&amp;clk NPCM7XX_=
CLK_APB4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clock-names =3D &quot;clk_apb3&quot;,&quot;clk_ap=
b4&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH=
&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&lt;GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&lt;GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&lt;GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&lt;GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&lt;GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&lt;GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&lt;GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pwm0_pins &amp;pwm1_pins &=
amp;pwm2_pins<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp;fanin0_pins &amp;fanin1_pins &amp;fanin2_pins<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp;fanin3_pins &amp;fanin4_pins&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pwm@0 {<br>
<br>
</span>The sub-nodes should be &quot;fan&quot; nodes.<br>
<br>
A unit-address without reg property is not valid.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm-ch =3D /bits/ 8 &lt;0x00&gt;;<br>
<br>
</span>Use &#39;reg&#39; like ASpeed binding. <br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-ch =3D /bits/ 8 &lt;0x00 0x01&gt;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cooling-levels =3D &lt;127 255&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pwm@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm-ch =3D /bits/ 8 &lt;0x01&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-ch =3D /bits/ 8 &lt;0x02 0x03&gt;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pwm@2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm-ch =3D /bits/ 8 &lt;0x02&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-ch =3D /bits/ 8 &lt;0x04&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +};<br>
&gt; \ No newline at end of file<br>
<br>
</span>^^^<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
&gt; -- <br>
&gt; 2.14.1<br>
&gt; <br>
&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe devicet=
ree&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">=
majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordo=
mo-info.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/<=
wbr>majordomo-info.html</a></font></span></blockquote><div><br></div><div>T=
hanks!</div><div><br></div><div>Tomer=C2=A0</div></div><br></div></div>

--0000000000004dfa06056f7ecba6--
