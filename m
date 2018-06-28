Return-Path: <tmaimon77@gmail.com>
Return-path: <tmaimon77@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJCYPLw+jqx+7Cy=cXFFb-CNp=Ezew7FNT=cfAndqWe5A@mail.gmail.com>
References: <20180624124155.82412-1-tmaimon77@gmail.com> <20180624124155.82412-2-tmaimon77@gmail.com>
 <20180625171417.GA16379@rob-hp-laptop> <CAP6Zq1h-M6YDS67pkgHy-GMmiVk1D-RScLgDyG65JQM+S35rEQ@mail.gmail.com>
 <CAL_JsqJCYPLw+jqx+7Cy=cXFFb-CNp=Ezew7FNT=cfAndqWe5A@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 28 Jun 2018 14:01:07 +0300
Message-ID: <CAP6Zq1iWcpfP5h9GT0BRhdo-DQ3B_rZCi3FP-8xFRVMCsU-y=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-binding: hwmon: Add NPCM7xx PWM and Fan
 controller documentation
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Avi Fishman <avifishman70@gmail.com>,
	Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>,
	Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>,
	devicetree <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000fd04a9056fb1a57d"
List-ID: <linux-hwmon@vger.kernel.org>

--000000000000fd04a9056fb1a57d
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On 26 June 2018 at 18:03, Rob Herring <robh@kernel.org> wrote:

> On Mon, Jun 25, 2018 at 4:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Hi Rob,
> >
> >
> > On 25 June 2018 at 20:14, Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Sun, Jun 24, 2018 at 03:41:54PM +0300, Tomer Maimon wrote:
> >> > Added device tree binding documentation for Nuvoton BMC
> >> > NPCM7xx Pulse Width Modulation (PWM)  and Fan tach controller.
> >> > The PWM controller can support upto 8 PWM output ports.
> >> > The Fan tach controller can support upto 16 tachometer inputs.
> >> >
> >> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >> > ---
> >> >  .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  | 84
> ++++++++++++++++++++++
> >> >  1 file changed, 84 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/
> bindings/hwmon/npcm750-pwm-fan.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> >> > new file mode 100644
> >> > index 000000000000..a9eacda34f92
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> >> > @@ -0,0 +1,84 @@
> >> > +Nuvoton NPCM7xx PWM and Fan Tacho controller device driver
> >>
> >> Bindings are for h/w, not drivers.
> >>
> >> > +
> >> > +The NPCM7xx has two identical Pulse-width modulation (PWM)
> controller modules,
> >> > +Each PWM module has four PWM controller outputs, Totally 8 PWM
> controller outputs.
> >> > +
> >> > +The NPCM7xx has eight identical Fan tachometer controller modules,
> >> > +Each Fan module has two Fan controller inputs, Totally 16 Fan
> controller inputs.
> >>
> >> Have you looked at other fan ctrlr bindings?f This looks like similar
> >> h/w to ASpeed. Really, I'd like to see a common doc that describes the
> >
> >
> > We do not have the same H/W as Aspeed, I believe in the near future we
> will need to add
> > more DT properties that will used only in the NPCM7xx module.
>
> I didn't say it was the same. Both are multi-channel PWMs with tach
> inputs. Presumably, they can attach to the same types of fans as there
> are only a limited number of types of fans and none of them are
> specific to any fan controller.
>
> >> structure and common properties.
> >
> >
> > what do you mean by common structure and common properties?
>
> When we have multiple bindings for the same class of device/hw, we
> define all the common parts in a common binding doc. This often
> doesn't happen at first, so we end up with a variety of bindings until
> we see some commonality.
>
> In this case, for structure, having sub-nodes for fans. As fans are
> not specific to the controllers, their node should not be defined by
> the controller binding. It's also how you describe the fan type,
> number of fans, the PWM connections, the tach connections, etc.
>
> Rob
>

Thanks a lot for the clarification, indeed we can do a common binding doc.
is it O.K. for now to stay with the same binding document (V5 - that  i
will send toady),
and later on we will work on creating common binding document for the
fan-nodes.

also I will like to know how to represent the fan-nodes properties in
the common
binding document,
the property name "aspeed,fan-tach-ch" is something related Aspeed.

Do I need to ask the Aspeed hwmon maintainer to modify his driver to
use fan-tach-ch
property?
or to mention both fan-tach properties (NPCM and Aspeed) in the  common
binding document ?

Thanks,

Tomer

--000000000000fd04a9056fb1a57d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rob,<div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On 26 June 2018 at 18:03, Rob Herring <span dir=3D"ltr">&lt;<a href=
=3D"mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5">On Mon, Jun 25, 2018 at 4:20 PM Tomer Maimon &lt;<a href=3D"mailto:=
tmaimon77@gmail.com">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Rob,<br>
&gt;<br>
&gt;<br>
&gt; On 25 June 2018 at 20:14, Rob Herring &lt;<a href=3D"mailto:robh@kerne=
l.org">robh@kernel.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Jun 24, 2018 at 03:41:54PM +0300, Tomer Maimon wrote:<br>
&gt;&gt; &gt; Added device tree binding documentation for Nuvoton BMC<br>
&gt;&gt; &gt; NPCM7xx Pulse Width Modulation (PWM)=C2=A0 and Fan tach contr=
oller.<br>
&gt;&gt; &gt; The PWM controller can support upto 8 PWM output ports.<br>
&gt;&gt; &gt; The Fan tach controller can support upto 16 tachometer inputs=
.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@g=
mail.com">tmaimon77@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../devicetree/bindings/hwmon/<wbr>npcm750-pwm-fan.txt=
=C2=A0 | 84 ++++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 84 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindin=
gs/hwmon/npcm750-pwm-<wbr>fan.txt<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/Documentation/devicetree/<wbr>bindings/hwmon/npc=
m750-pwm-<wbr>fan.txt b/Documentation/devicetree/<wbr>bindings/hwmon/npcm75=
0-pwm-<wbr>fan.txt<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000000..a9eacda34f92<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/Documentation/devicetree/<wbr>bindings/hwmon/npcm750-pw=
m-<wbr>fan.txt<br>
&gt;&gt; &gt; @@ -0,0 +1,84 @@<br>
&gt;&gt; &gt; +Nuvoton NPCM7xx PWM and Fan Tacho controller device driver<b=
r>
&gt;&gt;<br>
&gt;&gt; Bindings are for h/w, not drivers.<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +The NPCM7xx has two identical Pulse-width modulation (PWM) c=
ontroller modules,<br>
&gt;&gt; &gt; +Each PWM module has four PWM controller outputs, Totally 8 P=
WM controller outputs.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +The NPCM7xx has eight identical Fan tachometer controller mo=
dules,<br>
&gt;&gt; &gt; +Each Fan module has two Fan controller inputs, Totally 16 Fa=
n controller inputs.<br>
&gt;&gt;<br>
&gt;&gt; Have you looked at other fan ctrlr bindings?f This looks like simi=
lar<br>
&gt;&gt; h/w to ASpeed. Really, I&#39;d like to see a common doc that descr=
ibes the<br>
&gt;<br>
&gt;<br>
&gt; We do not have the same H/W as Aspeed, I believe in the near future we=
 will need to add<br>
&gt; more DT properties that will used only in the NPCM7xx module.<br>
<br>
</div></div>I didn&#39;t say it was the same. Both are multi-channel PWMs w=
ith tach<br>
inputs. Presumably, they can attach to the same types of fans as there<br>
are only a limited number of types of fans and none of them are<br>
specific to any fan controller.<br>
<span class=3D""><br>
&gt;&gt; structure and common properties.<br>
&gt;<br>
&gt;<br>
&gt; what do you mean by common structure and common properties?<br>
<br>
</span>When we have multiple bindings for the same class of device/hw, we<b=
r>
define all the common parts in a common binding doc. This often<br>
doesn&#39;t happen at first, so we end up with a variety of bindings until<=
br>
we see some commonality.<br>
<br>
In this case, for structure, having sub-nodes for fans. As fans are<br>
not specific to the controllers, their node should not be defined by<br>
the controller binding. It&#39;s also how you describe the fan type,<br>
number of fans, the PWM connections, the tach connections, etc.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Rob<br></font></span></blockquote><div><br></div><div>Thanks a lot for the =
clarification, indeed we can do a common binding doc.</div><div>is it O.K. =
for now to stay with the same binding document (V5 - that=C2=A0 i will send=
 toady),<br></div><div>and later on we will work on creating=C2=A0<span sty=
le=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">common =
binding document for the fan-nodes.</span></div><div><span style=3D"font-si=
ze:small;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline"><br></span></div><di=
v>also I will like to know how to represent the=C2=A0<span style=3D"font-si=
ze:small;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">fan-nodes properties=
 in the=C2=A0<span style=3D"text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">common binding document,</span></sp=
an></div><div>the property name &quot;<font color=3D"#000000"><span style=
=3D"font-family:&quot;Ubuntu Mono&quot;,monospace;font-size:0.9em;white-spa=
ce:pre">aspeed,fan-tach-ch&quot; </span><font face=3D"arial, helvetica, san=
s-serif"><span style=3D"white-space:pre">is </span><span style=3D"white-spa=
ce:pre">something </span><span style=3D"white-space:pre">related Aspeed.</s=
pan></font></font></div><div><font color=3D"#000000" face=3D"Ubuntu Mono, m=
onospace"><span style=3D"font-size:0.9em;white-space:pre"><br></span></font=
></div><div><font color=3D"#000000"><font face=3D"arial, helvetica, sans-se=
rif"><span style=3D"white-space:pre">Do I need to ask the Aspeed hwmon main=
tainer to modify his driver to use  </span></font><span style=3D"background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><span style=3D"font-family:&quot;Ubuntu=
 Mono&quot;,monospace;font-size:11.7px;white-space:pre">fan-tach-ch </span>=
<span style=3D"white-space:pre"><font face=3D"arial, helvetica, sans-serif"=
>property?</font></span></span><font face=3D"arial, helvetica, sans-serif">=
=C2=A0</font></font></div><div><font color=3D"#000000"><span style=3D"white=
-space:pre"><font face=3D"arial, helvetica, sans-serif">or to mention both =
fan-tach</font><font face=3D"Ubuntu Mono, monospace"><span style=3D"font-si=
ze:11.7px"> </span></font></span><span style=3D"font-family:&quot;Ubuntu Mo=
no&quot;,monospace;font-size:0.9em;white-space:pre"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:small;white-space:normal=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">properties<span>=C2=A0(NPCM =
and Aspeed) in the=C2=A0

<span style=3D"font-size:small;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">common binding document</span>=C2=A0?</span></span></span></font></div><d=
iv><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:small;white-space:normal;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline"><s=
pan></span></span>

</div><div><span style=3D"font-size:small;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline"><br></span></div><div><span style=3D"font-size:small;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">Thanks,</span></div><div><span style=
=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline"><br></spa=
n></div><div><span style=3D"font-size:small;background-color:rgb(255,255,25=
5);text-decoration-style:initial;text-decoration-color:initial;float:none;d=
isplay:inline">Tomer</span></div><div><span style=3D"font-size:small;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline"><span style=3D"font-size:12.8px;tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline"><span>=C2=A0</span></span>

</span></div></div><br></div></div>

--000000000000fd04a9056fb1a57d--
