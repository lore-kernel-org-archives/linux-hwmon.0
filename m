Return-Path: <tmaimon77@gmail.com>
Return-path: <tmaimon77@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180703164503.GA25357@rob-hp-laptop>
References: <20180703094701.255662-1-tmaimon77@gmail.com> <20180703094701.255662-2-tmaimon77@gmail.com>
 <20180703164503.GA25357@rob-hp-laptop>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 4 Jul 2018 02:22:54 +0300
Message-ID: <CAP6Zq1iYt8wUG17cejOUv8p9ScJ-ffJ5r8Y+RnC1-105RHX4jA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-binding: hwmon: Add NPCM7xx PWM and Fan
 controller documentation
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Avi Fishman <avifishman70@gmail.com>,
	Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>,
	Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>,
	devicetree <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000ffbb6905702097b7"
List-ID: <linux-hwmon@vger.kernel.org>

--000000000000ffbb6905702097b7
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your review

On 3 July 2018 at 19:45, Rob Herring <robh@kernel.org> wrote:

> On Tue, Jul 03, 2018 at 12:47:00PM +0300, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM7xx Pulse Width Modulation (PWM)  and Fan tach controller.
> > The PWM controller can support upto 8 PWM output ports.
> > The Fan tach controller can support upto 16 tachometer inputs.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  | 87
> ++++++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-
> fan.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> > new file mode 100644
> > index 000000000000..c56d72d03717
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> > @@ -0,0 +1,87 @@
> > +Nuvoton NPCM7xx PWM and Fan Tacho controller device
> > +
> > +The NPCM7xx has two identical Pulse-width modulation (PWM) controller
> modules,
> > +Each PWM module has four PWM controller outputs, Totally 8 PWM
> controller outputs.
>
> Kind of sounds like this should be 2 nodes then?
>

we preferred one node, I think the channel description it little
confusing... i will rewrite it to
" The Nuvoton BMC NPCM7XX supports 8 Pulse-width modulation (PWM)
controller outputs and 16 Fan tachometer controller inputs."


> > +
> > +The NPCM7xx has eight identical Fan tachometer controller modules,
> > +Each Fan module has two Fan controller inputs, Totally 16 Fan
> controller inputs.
> > +
> > +Required properties for pwm-fan node
> > +- #address-cells : should be 1.
> > +- #size-cells        : should be 0.
> > +- compatible : "nuvoton,npcm750-pwm-fan" for Poleg NPCM7XX.
> > +- reg                        : specifies physical base address and size
> of the registers.
> > +- reg-names  : must contain:
> > +                                     * "pwm" for the PWM registers.
> > +                                     * "fan" for the Fan registers.
> > +- clocks             : phandle of reference clocks.
> > +- clock-names        : must contain
> > +                                     * "clk_apb3" for clock of PWM
> controller.
> > +                                     * "clk_apb4" for clock of Fan
> controller.
>
> The "clk_" part is redundant.
>
> Also, this should be the names of the clocks in the module, not the name
> of the source clocks. It seems like these may be the latter?
>
will change to "pwm" and "fan"

>
> > +- interrupts : contain the Fan interrupts with flags for falling edge.
> > +- pinctrl-names      : a pinctrl state named "default" must be defined.
> > +- pinctrl-0  : phandle referencing pin configuration of the PWM and Fan
> > +                                     controller ports.
> > +
> > +fan subnode format:
> > +===================
> > +Under fan subnode can be upto 8 child nodes, each child node
> representing a fan.
> > +Each fan subnode must have one PWM channel and atleast one Fan tach
> channel.
> > +
> > +For PWM channel can be configured cooling-levels to create cooling
> device.
> > +Cooling device could be bound to a thermal zone for the thermal control.
> > +
> > +Required properties for each child node:
> > +- reg : specify the PWM output channel.
> > +     integer value in the range 0 through 7, that represent
> > +     the PWM channel number that used.
> > +
> > +- fan-tach-ch : specify the Fan tach input channel.
> > +             integer value in the range 0 through 15, that represent
> > +             the fan tach channel number that used.
> > +
> > +             At least one Fan tach input channel is required
> > +
> > +Optional property for each child node:
> > +- cooling-levels: PWM duty cycle values in a range from 0 to 255
> > +                  which correspond to thermal cooling states.
> > +
> > +Examples:
> > +
> > +pwm_fan:pwm-fan-controller@103000 {
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +     compatible = "nuvoton,npcm750-pwm-fan";
> > +     reg = <0x103000 0x2000>,
> > +             <0x180000 0x8000>;
> > +     reg-names = "pwm", "fan";
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
> > +     fan@0 {
> > +             reg = <0x00>;
> > +             fan-ch = /bits/ 8 <0x00 0x01>;
>
> Doesn't match the doc.
>
> > +             cooling-levels = <127 255>;
> > +     };
> > +     fan@1 {
> > +             reg = <0x01>;
> > +             fan-ch = /bits/ 8 <0x02 0x03>;
> > +     };
> > +     fan@2 {
> > +             reg = <0x02>;
> > +             fan-ch = /bits/ 8 <0x04>;
> > +     };
> > +
> > +};
> > \ No newline at end of file
> > --
> > 2.14.1
> >
>

Thanks a lot

Tomer

--000000000000ffbb6905702097b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rob,<div><br></div><div>Thanks for your review</div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 3 July 2018 at 19=
:45, Rob Herring <span dir=3D"ltr">&lt;<a href=3D"mailto:robh@kernel.org" t=
arget=3D"_blank">robh@kernel.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail-">On Tue, Jul 03, 201=
8 at 12:47:00PM +0300, Tomer Maimon wrote:<br>
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
7 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 87 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/hwmon/=
npcm750-pwm-<wbr>fan.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/hwmon/npcm750-pwm-=
<wbr>fan.txt b/Documentation/devicetree/<wbr>bindings/hwmon/npcm750-pwm-<wb=
r>fan.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..c56d72d03717<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/hwmon/npcm750-pwm-<wbr>fa=
n.txt<br>
&gt; @@ -0,0 +1,87 @@<br>
&gt; +Nuvoton NPCM7xx PWM and Fan Tacho controller device<br>
&gt; +<br>
&gt; +The NPCM7xx has two identical Pulse-width modulation (PWM) controller=
 modules,<br>
&gt; +Each PWM module has four PWM controller outputs, Totally 8 PWM contro=
ller outputs.<br>
<br>
</span>Kind of sounds like this should be 2 nodes then?<br></blockquote><di=
v><br></div><div>we preferred one node, I think the channel description it =
little confusing... i will rewrite it to</div><div>&quot; The Nuvoton BMC N=
PCM7XX supports 8 Pulse-width modulation (PWM)</div><div>controller outputs=
 and 16 Fan tachometer controller inputs.&quot;</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +The NPCM7xx has eight identical Fan tachometer controller modules,<br=
>
&gt; +Each Fan module has two Fan controller inputs, Totally 16 Fan control=
ler inputs.<br>
&gt; +<br>
&gt; +Required properties for pwm-fan node<br>
&gt; +- #address-cells : should be 1.<br>
&gt; +- #size-cells=C2=A0 =C2=A0 =C2=A0 =C2=A0 : should be 0.<br>
&gt; +- compatible : &quot;nuvoton,npcm750-pwm-fan&quot; for Poleg NPCM7XX.=
<br>
&gt; +- reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 : specifies physical base address and size of the regi=
sters.<br>
&gt; +- reg-names=C2=A0 : must contain:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;pwm&=
quot; for the PWM registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;fan&=
quot; for the Fan registers.<br>
&gt; +- clocks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: phandle of =
reference clocks.<br>
&gt; +- clock-names=C2=A0 =C2=A0 =C2=A0 =C2=A0 : must contain<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;clk_=
apb3&quot; for clock of PWM controller.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;clk_=
apb4&quot; for clock of Fan controller.<br>
<br>
</span>The &quot;clk_&quot; part is redundant.<br>
<br>
Also, this should be the names of the clocks in the module, not the name <b=
r>
of the source clocks. It seems like these may be the latter?<br></blockquot=
e><div>will change to &quot;pwm&quot; and &quot;fan&quot;</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<div><div class=3D"gmail-h5"><br>
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
&gt; +fan subnode format:<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +Under fan subnode can be upto 8 child nodes, each child node represen=
ting a fan.<br>
&gt; +Each fan subnode must have one PWM channel and atleast one Fan tach c=
hannel.<br>
&gt; +<br>
&gt; +For PWM channel can be configured cooling-levels to create cooling de=
vice.<br>
&gt; +Cooling device could be bound to a thermal zone for the thermal contr=
ol.<br>
&gt; +<br>
&gt; +Required properties for each child node:<br>
&gt; +- reg : specify the PWM output channel.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0integer value in the range 0 through 7, that repr=
esent<br>
&gt; +=C2=A0 =C2=A0 =C2=A0the PWM channel number that used.<br>
&gt; +<br>
&gt; +- fan-tach-ch : specify the Fan tach input channel.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0integer value in the =
range 0 through 15, that represent<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the fan tach channel =
number that used.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0At least one Fan tach=
 input channel is required<br>
&gt; +<br>
&gt; +Optional property for each child node:<br>
&gt; +- cooling-levels: PWM duty cycle values in a range from 0 to 255<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 which =
correspond to thermal cooling states.<br>
&gt; +<br>
&gt; +Examples:<br>
&gt; +<br>
&gt; +pwm_fan:pwm-fan-controller@<wbr>103000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-pwm-fan&quot=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x103000 0x2000&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0x180000 0x8000&g=
t;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-names =3D &quot;pwm&quot;, &quot;fan&quot;;<b=
r>
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
&gt; +=C2=A0 =C2=A0 =C2=A0fan@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x00&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-ch =3D /bits/ 8 &=
lt;0x00 0x01&gt;;<br>
<br>
</div></div>Doesn&#39;t match the doc.<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cooling-levels =3D &l=
t;127 255&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fan@1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x01&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-ch =3D /bits/ 8 &=
lt;0x02 0x03&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fan@2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x02&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-ch =3D /bits/ 8 &=
lt;0x04&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +};<br>
&gt; \ No newline at end of file<br>
&gt; -- <br>
&gt; 2.14.1<br>
&gt; <br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks =
a lot</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Tomer</div></div>

--000000000000ffbb6905702097b7--
