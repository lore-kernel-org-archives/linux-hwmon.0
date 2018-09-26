Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43710 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbeIZJvv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Sep 2018 05:51:51 -0400
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add ina3221 documentation
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180925225930.31886-1-nicoleotsuka@gmail.com>
 <20180925225930.31886-2-nicoleotsuka@gmail.com>
 <4f16baf7-b1bc-c7d2-3dd9-ed10b78d59b6@roeck-us.net>
 <20180926030857.GA458@Asurada-Nvidia.nvidia.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7896d6d6-c7c0-b462-3150-5ceff906bae0@roeck-us.net>
Date: Tue, 25 Sep 2018 20:40:59 -0700
MIME-Version: 1.0
In-Reply-To: <20180926030857.GA458@Asurada-Nvidia.nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/25/2018 08:08 PM, Nicolin Chen wrote:
> Hello Guenter,
> 
> On Tue, Sep 25, 2018 at 06:52:29PM -0700, Guenter Roeck wrote:
> 
>>> +2) child nodes
>>> +  Required properties:
>>> +  - reg: Must be 0, 1 or 2, corresponding to IN1, IN2 or IN3 port of INA3221
>>> +
>>> +  Optional properties:
>>> +  - label: Name of the input source
>>> +  - shunt-resistor-micro-ohms: Shunt resistor value in micro-Ohm
>>> +  - status: Should be "disabled" if no input source
>>> +
>>> +  Example:
>>> +
>>> +  input@0 {
>>> +          reg = <0x0>;
>>> +          status = "disabled";
>>
>> I kind of feel embarrassed that I asked for the reg change ... especially while
>> saying at the same time that I would like to see this work for other chips
>> as well.
> 
> Well, though I didn't mention it, yet I changed it to "reg" is more
> likely an agreement than a compromise: I searched in the mail list
> and then found this mail (a year ago though):
>      https://www.spinics.net/lists/kernel/msg2455439.html
> 
> I feel it very similar to my case. So rather than betting Rob won't
> tell me the same, changing to "reg" may reduce a turnaround time :)
> 
>> Other chips have different kinds of sensors. Voltage, current, power, temperature,
>> and others. Whatever we come up with should support that.
>>
>> I see two possibilities right now. We can stick with reg and add a "type" property,
>> or we can make the index something like
>> 	{voltage,current,power,temperature,humidity}-{id,index}
> 
> One small concern is a case of being multi-type. For example, I saw
> ina2xx driver having voltage, current and power at the same time...
> 
Yes, with that we would have something like

	voltage@0 {
		type = "voltage";
		reg = <0>;
	};
	current@0 {
		type = "current";
		reg = <0>;
	};
	...

or

	voltage@0 {
		voltage-id = <0>;
	};
	current@0 {
		current-id = <0>;
	};
	...

>> I personally prefer "type", but I don't really have a strong opinion.
>> What do you think ?
> 
> I also like this over "reg" -- "reg" requires two extra properties,
> and itself sounds slightly unnatural to me for situations like this
> one where we don't use it as a register address, although I know it
> is convenient and common to use.
> 

With "type", we would still need two properties.

	reg = <0>;
	type = "voltage";

and type could be optional or not required for a chip only supporting
a single sensor type (like the ina3221).

This would be equivalent to, say,
	voltage-index = <0>;
when using a single property.

With the "reg" approach, we would be ok for now - however, I would like
to get feedback from Rob if introducing a "type" property will be
acceptable when the time comes to do so.

>> Or maybe we should really wait for feedback from Rob.
> 
> Personally I don't mind it all to change the doc and code and then
> send a v6. But eventually we'll still need the final Acked-by from
> Rob right? Then I guess it's the only option.
> 

Yes. At this point I'd rather have input from Rob than moving forward
with v6.

> By the way, I have two ina3221 hwmon patches that rebase upon this
> binding series. And I'd like to send them out to go through review
> first, but I am not sure if you'd be okay for it -- I don't really
> like to change their rebase order as it might mess up something.
> 
Are those bug fixes or further enhancements ? For enhancements,
it is your call when to send them; I am fine either way. If they are
bug fixes, they should come first so we can apply them to -stable.

Thanks,
Guenter
