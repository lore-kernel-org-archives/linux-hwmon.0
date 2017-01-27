Return-path: <jaghu@google.com>
MIME-Version: 1.0
In-Reply-To: <20170113162106.k63lmnaizhrnrety@rob-hp-laptop>
References: <20170109215935.30067-1-jaghu@google.com> <20170109215935.30067-2-jaghu@google.com>
 <20170113162106.k63lmnaizhrnrety@rob-hp-laptop>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Fri, 27 Jan 2017 01:32:59 -0800
Message-ID: <CANsWYUXFzUewaM21cfk8k1CFP=oVyWHC06vZLqkV-ZrFmbwVtQ@mail.gmail.com>
Subject: Re: [PATCH linux v1 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 pwm and fan tach controller device driver
To: Rob Herring <robh@kernel.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, jdelvare@suse.com,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org
Content-Type: multipart/alternative; boundary=001a11461b96094f2b05471028e8
List-ID: <linux-hwmon@vger.kernel.org>

--001a11461b96094f2b05471028e8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2017 at 8:21 AM, Rob Herring <robh@kernel.org> wrote:

> On Mon, Jan 09, 2017 at 01:59:34PM -0800, Jaghathiswari Rankappagounder
> Natarajan wrote:
> > This binding provides interface for adding values related to ASPEED
> > AST2400/2500 PWM and Fan tach controller support.
> > The PWM controller can support upto 8 PWM output ports.
> > The Fan tach controller can support upto 16 tachometer inputs.
> > PWM clock types M, N and 0 are three types just to have three independe=
nt
> > PWM sources.
> >
> > Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.co=
m
> >
> > ---
> >  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 153
> +++++++++++++++++++++
>
> Perhaps bindings/pwm/... even though this is more than just PWM.
>
The corresponding hwmon driver is present in /drivers/hwmon/. So would it
make more

sense to include the devicetree document for that driver in
/devicetree/bindings/hwmon/.

In future if there any more hwmon related functionalities are added to this
driver then /devicetree/bindings/hwmon/ would be more relevant.


>
> >  1 file changed, 153 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-
> tacho.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.t=
xt
> b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> > new file mode 100644
> > index 000000000000..8f346409ee8c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> > @@ -0,0 +1,153 @@
> > +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
> > +
> > +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED
> Fan Tacho
> > +controller can support upto 16 tachometer inputs. The PWM controller
> supports
> > +3 types of frequency mode PWM for fan speed control. PWM clock types M=
,
> N and 0
> > +are 3 types of frequency mode PWM just to have 3 independent PWM
> sources.
> > +
> > +Required properties for pwm_tacho node:
> > +- #address-cells : should be 1.
> > +
> > +- #size-cells : should be 1.
> > +
> > +- reg : address and length of the register set for the device.
> > +
> > +- pinctrl-names : a pinctrl state named "default" must be defined.
> > +
> > +- pinctrl-0 : phandle referencing pin configuration of the
> AST2400/AST2500 PWM
> > +           ports.
> > +
> > +- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400 or
> > +            "aspeed,aspeed2500-pwm-tacho" for AST2500.
> > +
> > +- clocks : a fixed clock providing input clock frequency(PWM
> > +        and Fan Tach clock)
> > +
> > +type_values subnode format:
>
> Don't use '_' in node or property names.
>
Done.

>
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +Under type_values subnode there can be upto 3 child nodes indicating
> type M/N/O
> > +values. Atleast one child node is required.
> > +
> > +Required properties for the child node(type M/N/O):
> > +- pwm_period : indicates type M/N/O PWM period, as per the
> AST2400/AST2500
> > +            datasheet. integer value in the range 0 to 255.
>
>
> > +
> > +- pwm_clock_division_l : indicates type M/N/O PWM clock division L
> value,
> > +                      as per the AST2400/AST2500 datasheet.
> > +                      integer value in the range 0 to 15.
> > +                      0 here indicates divide 1, 1 indicates divide 2,
> > +                      2 indicates divide 4, 3 indicates divide 6, and
> so on
> > +                      till 15 indicates divide 30.
> > +
> > +- pwm_clock_division_h : indicates type M/N/O PWM clock division H
> value,
> > +                      as per the AST2400/AST2500 datasheet.
> > +                      integer value in the range 0 to 15.
> > +                      0 here indicates divide 1, 1 indicates divide 2,
> > +                      2 indicates divide 4, 3 indicates divide 8, and
> so on
> > +                      till 15 indicates divide 32768.
>
> Can't you have a single divider value and driver convert to register
> values? Really, you should specify the PWM period in ns/us and calculate
> the divider based on the input clock freq. (i.e. use the clock binding).
> There's already PWM binding to specify the period.
>
> I think you should have a node for the fan using the PWM binding and
> perhaps moving some of these properties to the fan node.
>

There are three different types M, N, O. These three types are just to have


different PWM/Fan Tach settings. Each type can have the following settings:

PWM related:

              1) PWM period


              2) PWM clock division high


              3) PWM clock division low


Fan Tach related:

              1) Fan Tach type enable


              2) Fan Tach clock division


              3) Fan Tach mode selection


              4) Fan Tach period




Each PWM port should be assigned a type which can be type M, N or O.




Each Fan Tach channel should be assigned a PWM source, which can be PWM
port A
through H. The Fan Tach channel implicitly gets the type (M, N or O), from
the type assigned to its PWM source.

If the clock type is type M then :
The PWM frequency =3D 24MHz / (type M clock division L value * type M
clock division H value *

(type M PWM period value + 1))

Because of this formula, I thought I could use properties to specify
type clock division High and Low and

 type period values so that the desired PWM frequency be achieved.


> > +
> > +- fan_tach_enable : indicates fan tach enable of type M/N/O as per the
> > +                 AST2400/AST2500 datasheet. boolean value.
> > +
> > +- fan_tach_clock_division : indicates fan tach clock division as per t=
he
> > +                         AST2400/AST2500 datasheet.
> > +                         integer value in the range 0 to 7.
> > +                         0 indicates divide 4, 1 indicates divide 16,
> > +                         2 indicates divide 64, 3 indicates divide 256
> > +                         and so on till 7 indicates divide 65536.
> > +
> > +- fan_tach_mode_selection : indicates fan tach mode mode selection as
> per the
> > +                         AST2400/AST2500 datasheet. integer value in t=
he
> > +                         range 0 to 2. 0 indicates falling edge, 1
> indicates
> > +                         rising edge and 2 indicates both edges.
> > +
> > +- fan_tach_period : indicates fan tach period as per the AST2400/AST25=
00
> > +                 datasheet. integer value (can be upto 16 bits long).
> > +
> > +pwm_port subnode format:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +Under pwm_port subnode there can upto 8 child nodes each indicating
> values
> > +for one of the 8 PWM output ports.
> > +
> > +Required properties for each child node(starting from PWM A through PW=
M
> H):
> > +- enable : enable PWM #X port, X ranges from A through H. boolean valu=
e.
>
> A connection in the PWM binding would imply this.
>
Had to change this property to indicate PWM port number.


>
> > +
> > +- type : indicates type selection value of PWM #X port, X ranges from =
A
> > +      through H. integer value in the range 0 to 2;
> > +      0 indicates type M, 1 indicates type N, 2 indicates type O.
>
> This is meaningless to me.
>

Each PWM port should be assigned a type which can be type M, N or O.



>
> > +- fan_ctrl : set the PWM fan control initial value. integer value
> between
> > +          0(off) and 255(full speed).
> > +
> > +fan_tach_channel subnode format:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Under fan_tach_channel subnode there can be upto 16 child nodes each
> indicating
> > +values for one of the 16 fan tach channels.
> > +
> > +Required properties for each child node(starting from fan tach #0
> through
> > +fan tach #16):
> > +- fan-ctrl-gpios : should specify the tachometer input pin on the
> hardware.
>
> I don't understand the connection here. You have a tach block with 16
> inputs on the SoC, so why the GPIOs? If the GPIOs go to the fan, then a
> fan node should have the GPIO properties.
>
This property specifies the tachometer input GPIO pin on the hardware.
Fan Tachometer function

 can only work when GPIO is in =E2=80=9Dinput mode=E2=80=9D .


> > +
> > +- enable : enable fan tach #X, X ranges from 0 through 16. boolean
> value.
>
> 'status' property is the standard way to enable a node or not. Not sure
> if that makes sense here though.
>
Had to change this property to indicate Fan tach channel number.


>
> > +
> > +- pwm_source : indicates PWM source of fan tach #X, X ranges from 0
> through 16.
> > +            integer value in the range 0 to 7. 0 indicates PWM port A,
> > +            1 indicates PWM port B and so on till 7 indicates PWM port
> H.
>

--001a11461b96094f2b05471028e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"arial, helvetica, sans-serif"><br></font><di=
v class=3D"gmail_extra"><font face=3D"arial, helvetica, sans-serif"><br></f=
ont><div class=3D"gmail_quote"><font face=3D"arial, helvetica, sans-serif">=
On Fri, Jan 13, 2017 at 8:21 AM, Rob Herring <span dir=3D"ltr">&lt;<a href=
=3D"mailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt;</span=
> wrote:<br></font><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><font =
face=3D"arial, helvetica, sans-serif"><span class=3D"gmail-">On Mon, Jan 09=
, 2017 at 01:59:34PM -0800, Jaghathiswari Rankappagounder Natarajan wrote:<=
br>
&gt; This binding provides interface for adding values related to ASPEED<br=
>
&gt; AST2400/2500 PWM and Fan tach controller support.<br>
&gt; The PWM controller can support upto 8 PWM output ports.<br>
&gt; The Fan tach controller can support upto 16 tachometer inputs.<br>
&gt; PWM clock types M, N and 0 are three types just to have three independ=
ent<br>
&gt; PWM sources.<br>
&gt;<br>
&gt; Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"=
mailto:jaghu@google.com">jaghu@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/hwmon/<wbr>aspeed-pwm-tacho.txt | 153 ++=
+++++++++++++++++++<br>
<br>
</span>Perhaps bindings/pwm/... even though this is more than just PWM.<br>=
</font></blockquote><span id=3D"gmail-docs-internal-guid-925fcd73-df36-67e8=
-06c5-2d11df420ef6"><font face=3D"arial, helvetica, sans-serif"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"vertical-align:baseline;white-space:pre-wrap">The corresponding hwmon d=
river is present in /drivers/hwmon/. So would it make more</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"vertical-align:baseline;white-space:pre-wrap">sense to include the=
 devicetree document for that driver in /devicetree/bindings/hwmon/.</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"vertical-align:baseline;white-space:pre-wrap">In future =
if there any more hwmon related functionalities are added to this driver th=
en </span><span style=3D"white-space:pre-wrap">/devicetree/bindings/hwmon/ =
would be more relevant.</span></p></font></span><div><font face=3D"arial, h=
elvetica, sans-serif">=C2=A0</font></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<div><div class=3D"gmail-h5"><font face=3D"arial, helvetica, sans-serif"><b=
r>
&gt;=C2=A0 1 file changed, 153 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/hwmon/=
aspeed-pwm-<wbr>tacho.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/hwmon/aspeed-pwm-<=
wbr>tacho.txt b/Documentation/devicetree/<wbr>bindings/hwmon/aspeed-pwm-<wb=
r>tacho.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..8f346409ee8c<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/hwmon/aspeed-pwm-<wbr>tac=
ho.txt<br>
&gt; @@ -0,0 +1,153 @@<br>
&gt; +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver<br>
&gt; +<br>
&gt; +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED =
Fan Tacho<br>
&gt; +controller can support upto 16 tachometer inputs. The PWM controller =
supports<br>
&gt; +3 types of frequency mode PWM for fan speed control. PWM clock types =
M, N and 0<br>
&gt; +are 3 types of frequency mode PWM just to have 3 independent PWM sour=
ces.<br>
&gt; +<br>
&gt; +Required properties for pwm_tacho node:<br>
&gt; +- #address-cells : should be 1.<br>
&gt; +<br>
&gt; +- #size-cells : should be 1.<br>
&gt; +<br>
&gt; +- reg : address and length of the register set for the device.<br>
&gt; +<br>
&gt; +- pinctrl-names : a pinctrl state named &quot;default&quot; must be d=
efined.<br>
&gt; +<br>
&gt; +- pinctrl-0 : phandle referencing pin configuration of the AST2400/AS=
T2500 PWM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ports.<br>
&gt; +<br>
&gt; +- compatible : should be &quot;aspeed,aspeed2400-pwm-tacho&quot; for =
AST2400 or<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;aspeed,aspeed2500-pwm=
-tacho&quot; for AST2500.<br>
&gt; +<br>
&gt; +- clocks : a fixed clock providing input clock frequency(PWM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and Fan Tach clock)<br>
&gt; +<br>
&gt; +type_values subnode format:<br>
<br>
</font></div></div><font face=3D"arial, helvetica, sans-serif">Don&#39;t us=
e &#39;_&#39; in node or property names.<br></font></blockquote><div><font =
face=3D"arial, helvetica, sans-serif">Done.=C2=A0</font></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<font face=3D"arial, helvetica, sans-serif"><span class=3D"gmail-"><br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt; +Under type_values subnode there can be upto 3 child nodes indicating =
type M/N/O<br>
&gt; +values. Atleast one child node is required.<br>
&gt; +<br>
&gt; +Required properties for the child node(type M/N/O):<br>
&gt; +- pwm_period : indicates type M/N/O PWM period, as per the AST2400/AS=
T2500<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 datasheet. integer value in=
 the range 0 to 255.<br>
<br>
<br>
&gt; +<br>
&gt; +- pwm_clock_division_l : indicates type M/N/O PWM clock division L va=
lue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 as per the AST2400/AST2500 datasheet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 integer value in the range 0 to 15.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0 here indicates divide 1, 1 indicates divide 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 2 indicates divide 4, 3 indicates divide 6, and so on<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 till 15 indicates divide 30.<br>
&gt; +<br>
&gt; +- pwm_clock_division_h : indicates type M/N/O PWM clock division H va=
lue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 as per the AST2400/AST2500 datasheet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 integer value in the range 0 to 15.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0 here indicates divide 1, 1 indicates divide 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 2 indicates divide 4, 3 indicates divide 8, and so on<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 till 15 indicates divide 32768.<br>
<br>
</span>Can&#39;t you have a single divider value and driver convert to regi=
ster<br>
values? Really, you should specify the PWM period in ns/us and calculate<br=
>
the divider based on the input clock freq. (i.e. use the clock binding).<br=
>
There&#39;s already PWM binding to specify the period.<br>
<br>
I think you should have a node for the fan using the PWM binding and<br>
perhaps moving some of these properties to the fan node.<br></font></blockq=
uote><div><font face=3D"arial, helvetica, sans-serif"><br></font></div><spa=
n id=3D"gmail-docs-internal-guid-925fcd73-df37-2aff-2c4c-3847b2a5c22c"><fon=
t face=3D"arial, helvetica, sans-serif"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"vertical-align:basel=
ine;white-space:pre-wrap">There are three different types M, N, O. These th=
ree types are just to have =C2=A0=C2=A0=C2=A0</span></p><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"vert=
ical-align:baseline;white-space:pre-wrap">different PWM/Fan Tach settings. =
Each type can have the following settings:</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"verti=
cal-align:baseline;white-space:pre-wrap">PWM related: =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"vertical-align:b=
aseline;white-space:pre-wrap"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01) PWM period =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"vertical-align:baseline;white-space:pre-wrap"> =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02) PWM cl=
ock division high =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"vertical-align:baseline;white-spac=
e:pre-wrap"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A03) PWM clock division low =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"vertical-align:baseline;white-space:pre-wrap"> Fan Tach related: =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"vertical-align:baseline;whit=
e-space:pre-wrap"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01) Fan Tach type enable =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"vertical-align:baseline;white-space:pre-wrap"> =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A02) Fan Tach clock division =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"vertical-align:baselin=
e;white-space:pre-wrap"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03) Fan Tach mode selection =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"vertical-align:baseline;white-space:pre-wrap"> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04) Fan=
 Tach period =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"vertical-align:baseline;white-space:pre-wrap"> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"vertical-align:baseline;white-space:pre-wrap">=
Each PWM port should be assigned a type which can be type M, N or O. =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"vertical-align:baseline;white-space:pre-wrap"> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"vertical-align:baseline;white-space:pre-wrap">Each F=
an Tach channel should be assigned a PWM source, which can be PWM port A </=
span></p></font></span><div><font face=3D"arial, helvetica, sans-serif"><sp=
an style=3D"white-space:pre-wrap">through H. The Fan Tach channel implicitl=
y gets the type (M, N or O), from the type assigned to its PWM source.</spa=
n>=C2=A0</font></div><div><pre style=3D"color:rgb(0,0,0)"><font face=3D"ari=
al, helvetica, sans-serif">If the clock type is type M then :              =
                           =20
The PWM frequency =3D 24MHz / (type M clock division L value * type M clock=
 division H value * </font></pre><pre style=3D"color:rgb(0,0,0)"><font face=
=3D"arial, helvetica, sans-serif">(type M PWM period value + 1))</font></pr=
e><pre style=3D"color:rgb(0,0,0)"><font face=3D"arial, helvetica, sans-seri=
f">Because of this formula, I thought I could use properties to specify typ=
e clock division High and Low and</font></pre><pre style=3D"color:rgb(0,0,0=
)"><font face=3D"arial, helvetica, sans-serif"> type period values so that =
the desired PWM frequency be achieved.</font></pre></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<div><div class=3D"gmail-h5"><font face=3D"arial, helvetica, sans-serif"><b=
r>
&gt; +<br>
&gt; +- fan_tach_enable : indicates fan tach enable of type M/N/O as per th=
e<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AST2400=
/AST2500 datasheet. boolean value.<br>
&gt; +<br>
&gt; +- fan_tach_clock_division : indicates fan tach clock division as per =
the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0AST2400/AST2500 datasheet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0integer value in the range 0 to 7.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00 indicates divide 4, 1 indicates divide 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A02 indicates divide 64, 3 indicates divide 256<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0and so on till 7 indicates divide 65536.<br>
&gt; +<br>
&gt; +- fan_tach_mode_selection : indicates fan tach mode mode selection as=
 per the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0AST2400/AST2500 datasheet. integer value in the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0range 0 to 2. 0 indicates falling edge, 1 indicates<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0rising edge and 2 indicates both edges.<br>
&gt; +<br>
&gt; +- fan_tach_period : indicates fan tach period as per the AST2400/AST2=
500<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0datashe=
et. integer value (can be upto 16 bits long).<br>
&gt; +<br>
&gt; +pwm_port subnode format:<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt; +Under pwm_port subnode there can upto 8 child nodes each indicating v=
alues<br>
&gt; +for one of the 8 PWM output ports.<br>
&gt; +<br>
&gt; +Required properties for each child node(starting from PWM A through P=
WM H):<br>
&gt; +- enable : enable PWM #X port, X ranges from A through H. boolean val=
ue.<br>
<br>
</font></div></div><font face=3D"arial, helvetica, sans-serif">A connection=
 in the PWM binding would imply this.<br></font></blockquote><span id=3D"gm=
ail-docs-internal-guid-925fcd73-df37-f22f-d84a-e6ea2b376107"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"vertical-align:baseline;white-space:pre-wrap"><font face=3D"arial, helveti=
ca, sans-serif">Had to change this property to indicate PWM port number.</f=
ont></span></p></span><div><font face=3D"arial, helvetica, sans-serif">=C2=
=A0</font></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<font face=3D"arial, helvetica, sans-serif"><span class=3D"gmail-"><br>
&gt; +<br>
&gt; +- type : indicates type selection value of PWM #X port, X ranges from=
 A<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 through H. integer value in the range 0 to 2;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 0 indicates type M, 1 indicates type N, 2 indica=
tes type O.<br>
<br>
</span>This is meaningless to me.<br></font></blockquote><div><font face=3D=
"arial, helvetica, sans-serif"><br></font></div><span id=3D"gmail-docs-inte=
rnal-guid-925fcd73-df37-b1ad-757a-5b688520a46f"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"vertical-ali=
gn:baseline;white-space:pre-wrap"><font face=3D"arial, helvetica, sans-seri=
f">Each PWM port should be assigned a type which can be type M, N or O. =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</font></span></p>=
</span><div><font face=3D"arial, helvetica, sans-serif">=C2=A0</font></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<font face=3D"arial, helvetica, sans-serif"><span class=3D"gmail-"><br>
&gt; +- fan_ctrl : set the PWM fan control initial value. integer value bet=
ween<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0(off) and 255(full speed).<br>
&gt; +<br>
&gt; +fan_tach_channel subnode format:<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D<br>
&gt; +Under fan_tach_channel subnode there can be upto 16 child nodes each =
indicating<br>
&gt; +values for one of the 16 fan tach channels.<br>
&gt; +<br>
&gt; +Required properties for each child node(starting from fan tach #0 thr=
ough<br>
&gt; +fan tach #16):<br>
&gt; +- fan-ctrl-gpios : should specify the tachometer input pin on the har=
dware.<br>
<br>
</span>I don&#39;t understand the connection here. You have a tach block wi=
th 16<br>
inputs on the SoC, so why the GPIOs? If the GPIOs go to the fan, then a<br>
fan node should have the GPIO properties.<br></font></blockquote><pre style=
=3D"color:rgb(0,0,0)"><font face=3D"arial, helvetica, sans-serif">This prop=
erty specifies the tachometer input GPIO pin on the hardware. Fan Tachomete=
r function</font></pre><pre style=3D"color:rgb(0,0,0)"><font face=3D"arial,=
 helvetica, sans-serif"> can only work when GPIO is in=C2=A0=E2=80=9Dinput =
mode=E2=80=9D<span style=3D"color:rgb(34,34,34)">=C2=A0.</span></font></pre=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<font face=3D"arial, helvetica, sans-serif"><span class=3D"gmail-"><br>
&gt; +<br>
&gt; +- enable : enable fan tach #X, X ranges from 0 through 16. boolean va=
lue.<br>
<br>
</span>&#39;status&#39; property is the standard way to enable a node or no=
t. Not sure<br>
if that makes sense here though.<br></font></blockquote><span id=3D"gmail-d=
ocs-internal-guid-925fcd73-df39-d239-17ce-36025c23f350"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"vert=
ical-align:baseline;white-space:pre-wrap"><font face=3D"arial, helvetica, s=
ans-serif">Had to change this property to indicate Fan tach channel number.=
 </font></span></p></span><div><font face=3D"arial, helvetica, sans-serif">=
=C2=A0</font></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><font face=3D"arial, he=
lvetica, sans-serif"><br>
&gt; +<br>
&gt; +- pwm_source : indicates PWM source of fan tach #X, X ranges from 0 t=
hrough 16.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 integer value in the range =
0 to 7. 0 indicates PWM port A,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 indicates PWM port B and =
so on till 7 indicates PWM port H.<br>
</font></div></div></blockquote></div><br></div></div>

--001a11461b96094f2b05471028e8--
