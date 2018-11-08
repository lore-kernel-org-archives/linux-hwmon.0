Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:43970 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbeKIFcr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Nov 2018 00:32:47 -0500
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add binding documentation for
 adt7475
Date: Thu, 8 Nov 2018 19:55:39 +0000
Message-ID: <46001dee3a224ac3b01ceb11421af83d@svr-chch-ex1.atlnz.lc>
References: <20181107040010.27436-1-chris.packham@alliedtelesis.co.nz>
 <20181107040010.27436-2-chris.packham@alliedtelesis.co.nz>
 <64720b73-dddf-783c-a3a4-3f32a748bf5d@roeck-us.net>
 <1ed7434bfded41bfba3b739f58f69102@svr-chch-ex1.atlnz.lc>
 <213614fb-1b7a-a06c-6f9f-f3d497750ca6@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 7/11/18 6:08 PM, Guenter Roeck wrote:=0A=
> On 11/6/18 8:27 PM, Chris Packham wrote:=0A=
>> On 7/11/18 5:24 PM, Guenter Roeck wrote:=0A=
>>> On 11/6/18 8:00 PM, Chris Packham wrote:=0A=
>>>> With the addition of the invert-pwm property the adt7475 needs its own=
=0A=
>>>> binding documentation rather being captured under trivial-devices.txt.=
=0A=
>>>>=0A=
>>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>>>> ---=0A=
>>>>      .../devicetree/bindings/hwmon/adt7475.txt     | 22 ++++++++++++++=
+++++=0A=
>>>>      .../devicetree/bindings/trivial-devices.txt   |  4 ----=0A=
>>>>      2 files changed, 22 insertions(+), 4 deletions(-)=0A=
>>>>      create mode 100644 Documentation/devicetree/bindings/hwmon/adt747=
5.txt=0A=
>>>>=0A=
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Doc=
umentation/devicetree/bindings/hwmon/adt7475.txt=0A=
>>>> new file mode 100644=0A=
>>>> index 000000000000..79255439e157=0A=
>>>> --- /dev/null=0A=
>>>> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt=0A=
>>>> @@ -0,0 +1,22 @@=0A=
>>>> +*ADT7475 hwmon sensor.=0A=
>>>> +=0A=
>>>> +Required properties:=0A=
>>>> +- compatible: One of=0A=
>>>> +	"adi,adt7473"=0A=
>>>> +	"adi,adt7475"=0A=
>>>> +	"adi,adt7476"=0A=
>>>> +	"adi,adt7490"=0A=
>>>> +=0A=
>>>> +- reg: I2C address=0A=
>>>> +=0A=
>>>> +optional properties:=0A=
>>>> +=0A=
>>>> +- invert-pwm: This configures the PWM to use logic low for 100% duty =
cycle.=0A=
>>>> +=0A=
>>>> +Example:=0A=
>>>> +=0A=
>>>> +hwmon@2e {=0A=
>>>> +	compatible =3D ;=0A=
>>>> +	reg =3D <0x2e>;=0A=
>>>> +	invert-pwm;=0A=
>>>=0A=
>>> If I understand correctly, the flag is set per pwm channel. A single gl=
obal=0A=
>>> property seems inappropriate.=0A=
>>=0A=
>> Yes it is per-channel. But I was having a hard time imagining a hardware=
=0A=
>> design that would use both inverted and non-inverted at the same time.=
=0A=
>>=0A=
> =0A=
> People can be inventive. Sometimes too much so.=0A=
> =0A=
>> Do you have a preference for how the properties should look?=0A=
>>=0A=
>>      invert-pwm[123]?=0A=
>>=0A=
>>      invert-pwm =3D <0x7>;?=0A=
>>=0A=
> Ultimately we'll have to find a generic way of defining devicetree proper=
ties for=0A=
> hardware monitoring devices, not just for pwm but for all sensor types. A=
 sub-node=0A=
> per channel seems to be the most likely answer, but I think that is a lon=
g way off=0A=
> (and will require lengthy discussions about acceptable properties).=0A=
> =0A=
> I was looking into pwm DT properties, but they define a set of flags=0A=
> (PWM_POLARITY_INVERTED, PWM_POLARITY_NORMAL).=0A=
> =0A=
> The g762 driver uses "pwm_polarity". Underscore - hmm. Other drivers use =
module=0A=
> parameters, sysfs attributes (pwmX_invert in asc7621 driver), or platform=
 data=0A=
> (g762, max6639).=0A=
> =0A=
> Maybe pwm-polarity =3D <PWM_POLARITY_NORMAL | PWM_POLARITY_INVERTED> ?=0A=
> No idea if that makes sense. Or just a boolean pwm-polarity-inverted.=0A=
=0A=
That would allow undoing an earlier invert which is something my initial =
=0A=
implementation lacked.=0A=
=0A=
In the future we could also make this a list of values to deal with =0A=
multiple pwm outputs=0A=
=0A=
e.g. pwm-polarity =3D <PWM_POLARITY_NORMAL>, <PWM_POLARITY_NORMAL> =0A=
<PWM_POLARITY_INVERTED>;=0A=
=0A=
I'll look at a v2 that does the first part for now.=0A=
=0A=
> =0A=
> Thinking about it per channel vs. per chip ... other drivers also seem to=
=0A=
> use a single property / attribute for the entire chip, so that is fine he=
re=0A=
> as well. We can always extend it if needed.=0A=
> =0A=
> Anyway, I am fine with whatever Rob accepts.=0A=
> =0A=
> Guenter=0A=
> =0A=
>>>=0A=
>>> Guenter=0A=
>>>=0A=
>>>> +};=0A=
>>>> diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/D=
ocumentation/devicetree/bindings/trivial-devices.txt=0A=
>>>> index 69c934aec13b..4f29100d6bbf 100644=0A=
>>>> --- a/Documentation/devicetree/bindings/trivial-devices.txt=0A=
>>>> +++ b/Documentation/devicetree/bindings/trivial-devices.txt=0A=
>>>> @@ -14,10 +14,6 @@ ad,ad7414		SMBus/I2C Digital Temperature Sensor in =
6-Pin SOT with SMBus Alert an=0A=
>>>>      ad,adm9240		ADM9240:  Complete System Hardware Monitor for uProce=
ssor-Based Systems=0A=
>>>>      adi,adt7461		+/-1C TDM Extended Temp Range I.C=0A=
>>>>      adt7461			+/-1C TDM Extended Temp Range I.C=0A=
>>>> -adi,adt7473		+/-1C TDM Extended Temp Range I.C=0A=
>>>> -adi,adt7475		+/-1C TDM Extended Temp Range I.C=0A=
>>>> -adi,adt7476		+/-1C TDM Extended Temp Range I.C=0A=
>>>> -adi,adt7490		+/-1C TDM Extended Temp Range I.C=0A=
>>>>      adi,adxl345		Three-Axis Digital Accelerometer=0A=
>>>>      adi,adxl346		Three-Axis Digital Accelerometer (backward-compatibi=
lity value "adi,adxl345" must be listed too)=0A=
>>>>      ams,iaq-core		AMS iAQ-Core VOC Sensor=0A=
>>>>=0A=
>>>=0A=
>>>=0A=
>>=0A=
>>=0A=
> =0A=
> =0A=
=0A=
