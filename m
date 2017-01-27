Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35152 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932433AbdA0JgO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Jan 2017 04:36:14 -0500
Received: by mail-wm0-f46.google.com with SMTP id r126so108672555wmr.0
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2017 01:36:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANsWYUXFzUewaM21cfk8k1CFP=oVyWHC06vZLqkV-ZrFmbwVtQ@mail.gmail.com>
References: <20170109215935.30067-1-jaghu@google.com> <20170109215935.30067-2-jaghu@google.com>
 <20170113162106.k63lmnaizhrnrety@rob-hp-laptop> <CANsWYUXFzUewaM21cfk8k1CFP=oVyWHC06vZLqkV-ZrFmbwVtQ@mail.gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Fri, 27 Jan 2017 01:35:51 -0800
Message-ID: <CANsWYUW3w+gH=ioDmbz0RX2nxPb84dGB6jiV529G-i+hsfpiAA@mail.gmail.com>
Subject: Re: [PATCH linux v1 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 pwm and fan tach controller device driver
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jan 27, 2017 at 1:32 AM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
>
>
> On Fri, Jan 13, 2017 at 8:21 AM, Rob Herring <robh@kernel.org> wrote:
>>
>> On Mon, Jan 09, 2017 at 01:59:34PM -0800, Jaghathiswari Rankappagounder
>> Natarajan wrote:
>> > This binding provides interface for adding values related to ASPEED
>> > AST2400/2500 PWM and Fan tach controller support.
>> > The PWM controller can support upto 8 PWM output ports.
>> > The Fan tach controller can support upto 16 tachometer inputs.
>> > PWM clock types M, N and 0 are three types just to have three
>> > independent
>> > PWM sources.
>> >
>> > Signed-off-by: Jaghathiswari Rankappagounder Natarajan
>> > <jaghu@google.com>
>> > ---
>> >  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 153
>> > +++++++++++++++++++++
>>
>> Perhaps bindings/pwm/... even though this is more than just PWM.
>
> The corresponding hwmon driver is present in /drivers/hwmon/. So would it
> make more
>
> sense to include the devicetree document for that driver in
> /devicetree/bindings/hwmon/.
>
> In future if there any more hwmon related functionalities are added to th=
is
> driver then /devicetree/bindings/hwmon/ would be more relevant.
>
>
>>
>>
>> >  1 file changed, 153 insertions(+)
>> >  create mode 100644
>> > Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>> >
>> > diff --git
>> > a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>> > b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>> > new file mode 100644
>> > index 000000000000..8f346409ee8c
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>> > @@ -0,0 +1,153 @@
>> > +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
>> > +
>> > +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED
>> > Fan Tacho
>> > +controller can support upto 16 tachometer inputs. The PWM controller
>> > supports
>> > +3 types of frequency mode PWM for fan speed control. PWM clock types =
M,
>> > N and 0
>> > +are 3 types of frequency mode PWM just to have 3 independent PWM
>> > sources.
>> > +
>> > +Required properties for pwm_tacho node:
>> > +- #address-cells : should be 1.
>> > +
>> > +- #size-cells : should be 1.
>> > +
>> > +- reg : address and length of the register set for the device.
>> > +
>> > +- pinctrl-names : a pinctrl state named "default" must be defined.
>> > +
>> > +- pinctrl-0 : phandle referencing pin configuration of the
>> > AST2400/AST2500 PWM
>> > +           ports.
>> > +
>> > +- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400 or
>> > +            "aspeed,aspeed2500-pwm-tacho" for AST2500.
>> > +
>> > +- clocks : a fixed clock providing input clock frequency(PWM
>> > +        and Fan Tach clock)
>> > +
>> > +type_values subnode format:
>>
>> Don't use '_' in node or property names.
>
> Done.
>>
>>
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> > +Under type_values subnode there can be upto 3 child nodes indicating
>> > type M/N/O
>> > +values. Atleast one child node is required.
>> > +
>> > +Required properties for the child node(type M/N/O):
>> > +- pwm_period : indicates type M/N/O PWM period, as per the
>> > AST2400/AST2500
>> > +            datasheet. integer value in the range 0 to 255.
>>
>>
>> > +
>> > +- pwm_clock_division_l : indicates type M/N/O PWM clock division L
>> > value,
>> > +                      as per the AST2400/AST2500 datasheet.
>> > +                      integer value in the range 0 to 15.
>> > +                      0 here indicates divide 1, 1 indicates divide 2=
,
>> > +                      2 indicates divide 4, 3 indicates divide 6, and
>> > so on
>> > +                      till 15 indicates divide 30.
>> > +
>> > +- pwm_clock_division_h : indicates type M/N/O PWM clock division H
>> > value,
>> > +                      as per the AST2400/AST2500 datasheet.
>> > +                      integer value in the range 0 to 15.
>> > +                      0 here indicates divide 1, 1 indicates divide 2=
,
>> > +                      2 indicates divide 4, 3 indicates divide 8, and
>> > so on
>> > +                      till 15 indicates divide 32768.
>>
>> Can't you have a single divider value and driver convert to register
>> values? Really, you should specify the PWM period in ns/us and calculate
>> the divider based on the input clock freq. (i.e. use the clock binding).
>> There's already PWM binding to specify the period.
>>
>> I think you should have a node for the fan using the PWM binding and
>> perhaps moving some of these properties to the fan node.
>
>
> There are three different types M, N, O. These three types are just to ha=
ve
>
> different PWM/Fan Tach settings. Each type can have the following setting=
s:
>
> PWM related:
>
>               1) PWM period
>
>               2) PWM clock division high
>
>               3) PWM clock division low
>
> Fan Tach related:
>
>               1) Fan Tach type enable
>
>               2) Fan Tach clock division
>
>               3) Fan Tach mode selection
>
>               4) Fan Tach period
>
>
>
> Each PWM port should be assigned a type which can be type M, N or O.
>
>
>
> Each Fan Tach channel should be assigned a PWM source, which can be PWM p=
ort
> A
>
> through H. The Fan Tach channel implicitly gets the type (M, N or O), fro=
m
> the type assigned to its PWM source.
>
> If the clock type is type M then :
> The PWM frequency =3D 24MHz / (type M clock division L value * type M clo=
ck
> division H value *
>
> (type M PWM period value + 1))
>
> Because of this formula, I thought I could use properties to specify type
> clock division High and Low and
>
>  type period values so that the desired PWM frequency be achieved.
>>
>>
>> > +
>> > +- fan_tach_enable : indicates fan tach enable of type M/N/O as per th=
e
>> > +                 AST2400/AST2500 datasheet. boolean value.
>> > +
>> > +- fan_tach_clock_division : indicates fan tach clock division as per
>> > the
>> > +                         AST2400/AST2500 datasheet.
>> > +                         integer value in the range 0 to 7.
>> > +                         0 indicates divide 4, 1 indicates divide 16,
>> > +                         2 indicates divide 64, 3 indicates divide 25=
6
>> > +                         and so on till 7 indicates divide 65536.
>> > +
>> > +- fan_tach_mode_selection : indicates fan tach mode mode selection as
>> > per the
>> > +                         AST2400/AST2500 datasheet. integer value in
>> > the
>> > +                         range 0 to 2. 0 indicates falling edge, 1
>> > indicates
>> > +                         rising edge and 2 indicates both edges.
>> > +
>> > +- fan_tach_period : indicates fan tach period as per the
>> > AST2400/AST2500
>> > +                 datasheet. integer value (can be upto 16 bits long).
>> > +
>> > +pwm_port subnode format:
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> > +Under pwm_port subnode there can upto 8 child nodes each indicating
>> > values
>> > +for one of the 8 PWM output ports.
>> > +
>> > +Required properties for each child node(starting from PWM A through P=
WM
>> > H):
>> > +- enable : enable PWM #X port, X ranges from A through H. boolean
>> > value.
>>
>> A connection in the PWM binding would imply this.
>
> Had to change this property to indicate PWM port number.
>
>
>>
>>
>> > +
>> > +- type : indicates type selection value of PWM #X port, X ranges from=
 A
>> > +      through H. integer value in the range 0 to 2;
>> > +      0 indicates type M, 1 indicates type N, 2 indicates type O.
>>
>> This is meaningless to me.
>
>
> Each PWM port should be assigned a type which can be type M, N or O.
>
>
>>
>>
>> > +- fan_ctrl : set the PWM fan control initial value. integer value
>> > between
>> > +          0(off) and 255(full speed).
>> > +
>> > +fan_tach_channel subnode format:
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +Under fan_tach_channel subnode there can be upto 16 child nodes each
>> > indicating
>> > +values for one of the 16 fan tach channels.
>> > +
>> > +Required properties for each child node(starting from fan tach #0
>> > through
>> > +fan tach #16):
>> > +- fan-ctrl-gpios : should specify the tachometer input pin on the
>> > hardware.
>>
>> I don't understand the connection here. You have a tach block with 16
>> inputs on the SoC, so why the GPIOs? If the GPIOs go to the fan, then a
>> fan node should have the GPIO properties.
>
> This property specifies the tachometer input GPIO pin on the hardware. Fa=
n
> Tachometer function
>
>  can only work when GPIO is in =E2=80=9Dinput mode=E2=80=9D .
>>
>>
>> > +
>> > +- enable : enable fan tach #X, X ranges from 0 through 16. boolean
>> > value.
>>
>> 'status' property is the standard way to enable a node or not. Not sure
>> if that makes sense here though.
>
> Had to change this property to indicate Fan tach channel number.
>
>
>>
>>
>> > +
>> > +- pwm_source : indicates PWM source of fan tach #X, X ranges from 0
>> > through 16.
>> > +            integer value in the range 0 to 7. 0 indicates PWM port A=
,
>> > +            1 indicates PWM port B and so on till 7 indicates PWM por=
t
>> > H.
>
>
