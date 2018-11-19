Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:59492 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731902AbeKTIVV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Nov 2018 03:21:21 -0500
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add binding documentation for
 adt7475
Date: Mon, 19 Nov 2018 21:55:37 +0000
Message-ID: <6326b60e84c04339823e816801445120@svr-chch-ex1.atlnz.lc>
References: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
 <20181108225607.7521-2-chris.packham@alliedtelesis.co.nz>
 <20181117152949.GA31247@bogus>
 <f3a29bc9-dbfc-bfb8-8707-2b67d96c2e04@roeck-us.net>
 <CAL_JsqKgBkR4WN+aTKdHSfCZ8EH39yLCeLwXwmf+nd0_cAy+mw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 20/11/18 10:40 AM, Rob Herring wrote:=0A=
> On Sun, Nov 18, 2018 at 4:56 PM Guenter Roeck <linux@roeck-us.net> wrote:=
=0A=
>>=0A=
>> On 11/17/18 7:29 AM, Rob Herring wrote:=0A=
>>> On Fri, Nov 09, 2018 at 11:56:06AM +1300, Chris Packham wrote:=0A=
>>>> With the addition of the invert-pwm property the adt7475 needs its own=
=0A=
>>>> binding documentation rather being captured under trivial-devices.txt.=
=0A=
>>>>=0A=
>>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>>>> ---=0A=
>>>> Changes in v2:=0A=
>>>> - use pwm-polarity attiribute to indicate normal or inverted polarity.=
=0A=
>>>>=0A=
>>>>    .../devicetree/bindings/hwmon/adt7475.txt     | 24 ++++++++++++++++=
+++=0A=
>>>>    .../devicetree/bindings/trivial-devices.txt   |  4 ----=0A=
>>>>    2 files changed, 24 insertions(+), 4 deletions(-)=0A=
>>>>    create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.=
txt=0A=
>>>>=0A=
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Doc=
umentation/devicetree/bindings/hwmon/adt7475.txt=0A=
>>>> new file mode 100644=0A=
>>>> index 000000000000..d9212b5e9036=0A=
>>>> --- /dev/null=0A=
>>>> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt=0A=
>>>> @@ -0,0 +1,24 @@=0A=
>>>> +*ADT7475 hwmon sensor.=0A=
>>>> +=0A=
>>>> +Required properties:=0A=
>>>> +- compatible: One of=0A=
>>>> +    "adi,adt7473"=0A=
>>>> +    "adi,adt7475"=0A=
>>>> +    "adi,adt7476"=0A=
>>>> +    "adi,adt7490"=0A=
>>>> +=0A=
>>>> +- reg: I2C address=0A=
>>>> +=0A=
>>>> +optional properties:=0A=
>>>> +=0A=
>>>> +- pwm-polarity: This configures the polarity of the PWM. 0=0A=
>>>> +            (PWM_POLARITY_NORMAL) uses logic high for 100% duty cycle=
. 1=0A=
>>>> +                (PWM_POLARITY_INVERSED) uses logic low for 100% duty =
cycle.=0A=
>>>=0A=
>>> So we're using part of the PWM binding, but none of the rest of it? Wha=
t=0A=
>>> is the PWM connection here?=0A=
>>> The chip has a built-in PWM controller to control fan speeds. PWM frequ=
ency=0A=
>> as well as PWM polarity are configurable. I had suggested to use the ter=
minology=0A=
>> from Documentation/devicetree/bindings/pwm/pwm.txt. Other than terminolo=
gy there=0A=
>> is no connection to a standard pwm controller.=0A=
> =0A=
> Ah, a fan controller. Please make that clear.=0A=
> =0A=
> The fan related bindings need a bit of work IMO. We have the start of=0A=
> something somewhat common with aspeed and npcm bindings, but they=0A=
> could use a bit more work. We need the fan and controller bindings to=0A=
> be somewhat separate where a fan node for a given type of fan doesn't=0A=
> depend on the controller node.=0A=
> =0A=
> AIUI, all fans are not the same, so does this controller only work=0A=
> with 1 type of fan and not need any more board level config? Isn't fan=0A=
> speed not linear with PWM duty cycle and need some sort of map.=0A=
=0A=
That level of configuration is done in userland via the sysfs API (e.g =0A=
lm-sensors). I could have added the pwm output inversion via sysfs but I =
=0A=
erred on the side of the polarity being an artifact of the hardware =0A=
design that is fairly static.=0A=
=0A=
Things like what thresholds to configure and whether to use automatic =0A=
pwm control tend to be much more fluid. Then theres pathological cases =0A=
where other external factors need to be included in the fan control (my =0A=
particular use case is a network switch acting as a PoE PSE so I not =0A=
only need to take into account the ambient temperature but how much PoE =0A=
power is being delivered to connected PDs),=0A=
=0A=
>> Another option/possibility would be to use a boolean, such as pwm-polari=
ty-inverted.=0A=
>> We are open to suggestions.=0A=
>>=0A=
>>> It sounds like this is common for sensors, so this should be documented=
=0A=
>>> somewhere common.=0A=
>>>=0A=
>> Sure, no problem. Any suggestion where ?=0A=
> =0A=
> hwmon/fan.txt (that doesn't exist yet.)=0A=
> =0A=
> Probably all of bindings/hwmon/ should be split up by class of device.=0A=
=0A=
Most of the hwmon chips I've been dealing with lately tend to be multi =0A=
function (e.g. temperature, voltage, fan tach and fan control). The =0A=
single function devices tend to land in trivial-devices.txt because =0A=
there's not much to document other than the compatible string.=0A=
=0A=
