Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40837 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbeKGOgp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Nov 2018 09:36:45 -0500
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add binding documentation for
 adt7475
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20181107040010.27436-1-chris.packham@alliedtelesis.co.nz>
 <20181107040010.27436-2-chris.packham@alliedtelesis.co.nz>
 <64720b73-dddf-783c-a3a4-3f32a748bf5d@roeck-us.net>
 <1ed7434bfded41bfba3b739f58f69102@svr-chch-ex1.atlnz.lc>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <213614fb-1b7a-a06c-6f9f-f3d497750ca6@roeck-us.net>
Date: Tue, 6 Nov 2018 21:07:57 -0800
MIME-Version: 1.0
In-Reply-To: <1ed7434bfded41bfba3b739f58f69102@svr-chch-ex1.atlnz.lc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/6/18 8:27 PM, Chris Packham wrote:
> On 7/11/18 5:24 PM, Guenter Roeck wrote:
>> On 11/6/18 8:00 PM, Chris Packham wrote:
>>> With the addition of the invert-pwm property the adt7475 needs its own
>>> binding documentation rather being captured under trivial-devices.txt.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>     .../devicetree/bindings/hwmon/adt7475.txt     | 22 +++++++++++++++++++
>>>     .../devicetree/bindings/trivial-devices.txt   |  4 ----
>>>     2 files changed, 22 insertions(+), 4 deletions(-)
>>>     create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Documentation/devicetree/bindings/hwmon/adt7475.txt
>>> new file mode 100644
>>> index 000000000000..79255439e157
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
>>> @@ -0,0 +1,22 @@
>>> +*ADT7475 hwmon sensor.
>>> +
>>> +Required properties:
>>> +- compatible: One of
>>> +	"adi,adt7473"
>>> +	"adi,adt7475"
>>> +	"adi,adt7476"
>>> +	"adi,adt7490"
>>> +
>>> +- reg: I2C address
>>> +
>>> +optional properties:
>>> +
>>> +- invert-pwm: This configures the PWM to use logic low for 100% duty cycle.
>>> +
>>> +Example:
>>> +
>>> +hwmon@2e {
>>> +	compatible = ;
>>> +	reg = <0x2e>;
>>> +	invert-pwm;
>>
>> If I understand correctly, the flag is set per pwm channel. A single global
>> property seems inappropriate.
> 
> Yes it is per-channel. But I was having a hard time imagining a hardware
> design that would use both inverted and non-inverted at the same time.
> 

People can be inventive. Sometimes too much so.

> Do you have a preference for how the properties should look?
> 
>     invert-pwm[123]?
> 
>     invert-pwm = <0x7>;?
>
Ultimately we'll have to find a generic way of defining devicetree properties for
hardware monitoring devices, not just for pwm but for all sensor types. A sub-node
per channel seems to be the most likely answer, but I think that is a long way off
(and will require lengthy discussions about acceptable properties).

I was looking into pwm DT properties, but they define a set of flags
(PWM_POLARITY_INVERTED, PWM_POLARITY_NORMAL).

The g762 driver uses "pwm_polarity". Underscore - hmm. Other drivers use module
parameters, sysfs attributes (pwmX_invert in asc7621 driver), or platform data
(g762, max6639).

Maybe pwm-polarity = <PWM_POLARITY_NORMAL | PWM_POLARITY_INVERTED> ?
No idea if that makes sense. Or just a boolean pwm-polarity-inverted.

Thinking about it per channel vs. per chip ... other drivers also seem to
use a single property / attribute for the entire chip, so that is fine here
as well. We can always extend it if needed.

Anyway, I am fine with whatever Rob accepts.

Guenter

>>
>> Guenter
>>
>>> +};
>>> diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
>>> index 69c934aec13b..4f29100d6bbf 100644
>>> --- a/Documentation/devicetree/bindings/trivial-devices.txt
>>> +++ b/Documentation/devicetree/bindings/trivial-devices.txt
>>> @@ -14,10 +14,6 @@ ad,ad7414		SMBus/I2C Digital Temperature Sensor in 6-Pin SOT with SMBus Alert an
>>>     ad,adm9240		ADM9240:  Complete System Hardware Monitor for uProcessor-Based Systems
>>>     adi,adt7461		+/-1C TDM Extended Temp Range I.C
>>>     adt7461			+/-1C TDM Extended Temp Range I.C
>>> -adi,adt7473		+/-1C TDM Extended Temp Range I.C
>>> -adi,adt7475		+/-1C TDM Extended Temp Range I.C
>>> -adi,adt7476		+/-1C TDM Extended Temp Range I.C
>>> -adi,adt7490		+/-1C TDM Extended Temp Range I.C
>>>     adi,adxl345		Three-Axis Digital Accelerometer
>>>     adi,adxl346		Three-Axis Digital Accelerometer (backward-compatibility value "adi,adxl345" must be listed too)
>>>     ams,iaq-core		AMS iAQ-Core VOC Sensor
>>>
>>
>>
> 
> 
