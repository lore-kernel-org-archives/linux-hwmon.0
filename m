Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41936 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750873AbdGVPJM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Jul 2017 11:09:12 -0400
Subject: Re: [PATCHv4 3/4] dt-bindings: mfd: da9052: support TSI as ADC
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>,
        Lee Jones <lee.jones@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20170630143506.10541-1-sebastian.reichel@collabora.co.uk>
 <20170630143506.10541-4-sebastian.reichel@collabora.co.uk>
 <20170717104945.6qn6to7s3mlepxgj@dell>
 <20170717112711.eskydrt4pu32v74g@earth>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b0d58a26-d0b4-a6ec-811a-159bbb8b44d1@roeck-us.net>
Date: Sat, 22 Jul 2017 08:09:08 -0700
MIME-Version: 1.0
In-Reply-To: <20170717112711.eskydrt4pu32v74g@earth>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/17/2017 04:27 AM, Sebastian Reichel wrote:
> Hi Lee,
> 
> On Mon, Jul 17, 2017 at 11:49:45AM +0100, Lee Jones wrote:
>> On Fri, 30 Jun 2017, Sebastian Reichel wrote:
>>
>>> DA9052 allows using the touchscreen input pins as general purpose
>>> analogue input pin by wiring analogue inputs to X+, X-, Y+ and Y-
>>> and providing a reference voltage at TSIREF pin.
>>>
>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
>>> ---
>>>   Documentation/devicetree/bindings/mfd/da9052-i2c.txt | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt b/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
>>> index 9554292dc6cb..57fa74e65664 100644
>>> --- a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
>>> +++ b/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
>>> @@ -4,6 +4,14 @@ Required properties:
>>>   - compatible : Should be "dlg,da9052", "dlg,da9053-aa",
>>>   			 "dlg,da9053-ab", or "dlg,da9053-bb"
>>>   
>>> +Optional properties:
>>> +- dlg,tsi-as-adc : Boolean, if set the X+, X-, Y+, Y- touchscreen
>>> +                    input lines are used as general purpose analogue
>>> +					input.
>>> +- tsiref-supply: Phandle to the regulator, which provides the reference
>>> +                 voltage for the TSIREF pin. Must be provided when the
>>> +			     touchscreen pins are used for ADC purposes.
>>> +
>>
>> DT Ack please.
> 
> There is a v5 of this series, which has Acked-by from Rob already
> and got positive feedback from Guenter Roeck for the hwmon parts:
> 
> http://lkml.iu.edu/hypermail/linux/kernel/1707.0/00518.html
> 
> (if you received v4, v5 should also be in your INBOX)
> 

Yes, but you dropped all the Acks in v6. That is supposed to mean that there
was a substantial change to the patch, and that it needs to be re-reviewed.
For the hwmon patches, I ran a diff against v5 and noticed that there was no
change between v5 and v6, yet you dropped my Acks. Do you really expect us
to do all that work on your behalf ?

Sorry if I sound a bit annoyed. That is because I _am_ a bit annoyed.
Please keep in mind that you are taking our time.

Thanks,
Guenter
