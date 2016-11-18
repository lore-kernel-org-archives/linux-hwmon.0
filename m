Return-path: <tom.levens@cern.ch>
Date: Fri, 18 Nov 2016 16:36:53 +0100
From: Tom Levens <tom.levens@cern.ch>
To: Rob Herring <robh@kernel.org>
CC: Tom Levens <tom.levens@cern.ch>, <linux@roeck-us.net>,
	<jdelvare@suse.com>, <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] hwmon: ltc2990: add devicetree binding
In-Reply-To: <20161118145035.ir46ohk5uqaln6kp@rob-hp-laptop>
Message-ID: <alpine.LRH.2.20.1611181604150.26466@pcbe13573-vm.dyndns.cern.ch>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch> <1479384616-12479-2-git-send-email-tom.levens@cern.ch> <20161118145035.ir46ohk5uqaln6kp@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"; format=flowed
List-ID: <linux-hwmon@vger.kernel.org>

Hi Rob,

Thanks for taking the time to look at this patch.

On Fri, 18 Nov 2016, Rob Herring wrote:
> On Thu, Nov 17, 2016 at 01:10:15PM +0100, Tom Levens wrote:
>> Add a devicetree binding for the ltc2990 hwmon driver.
>>
>> Signed-off-by: Tom Levens <tom.levens@cern.ch>
>> ---
>>  .../devicetree/bindings/hwmon/ltc2990.txt          |   28 ++++++++++++++++++++
>>  1 files changed, 28 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/hwmon/ltc2990.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/ltc2990.txt b/Documentation/devicetree/bindings/hwmon/ltc2990.txt
>> new file mode 100644
>> index 0000000..e4040e0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/ltc2990.txt
>> @@ -0,0 +1,28 @@
>> +ltc2990
>> +
>> +Required properties:
>> +- compatible: Must be "lltc,ltc2990"
>> +- reg: I2C slave address
>> +
>> +Optional properties:
>> +- lltc,mode:
>
> What determines the mode? If this is something a user will want to
> control, then it should be a sysfs attr rather than DT prop. If the
> board design dictates then DT is the right place.

It is based on the external connections of the chip. So, I would say that 
it is board specific.

> 'mode' is a bit vague, 'lltc,meas-mode' perhaps.

Sure thing.

There is also one question which came up in the thread for the patch 3 of 
this patchset. The full mode for this chip is actually made of two logical 
values which are written to the bits 4..3 and 2..0 of the register. This 
version of the patch only configures one of the values, but for the next 
version we would like to configure both. While combining them into a 
single integer value would be possible, they are defined as two values in 
the datasheet. Therefore, I propose using an array, such as:

lltc,meas-mode = <7 3>;

This would set the mode[2..0]=7 and mode[4..3]=3.

What do you think of this? Or should this be split into two properties? 
However, in this case I struggle come up with names for the properties. 
The datasheet, helpfully, calls both the fields "mode" and there is no 
clear difference in their function as both control which measurements are 
available.

Thanks,

>> +A	Sets the chip's measurement mode, defaults to <6> if unset.
>> +
>> +	The following measurements are available in each mode:
>> +
>> +	0: V1, V2, TR2
>> +	1: V1-V2, TR2
>> +	2: V1-V2, V3, V4
>> +	3: TR1, V3, V4
>> +	4: TR1, V3-V4
>> +	5: TR1, TR2
>> +	6: V1-V2, V3-V4
>> +	7: V1, V2, V3, V4
>> +
>> +Example:
>> +
>> +ltc2990@4c {
>> +	compatible = "lltc,ltc2990";
>> +	reg = <0x4c>;
>> +	lltc,mode = <7>;
>> +};
>> --
>> 1.7.1
>>
>
