Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f171.google.com ([209.85.214.171]:43233 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbeIWFzV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Sep 2018 01:55:21 -0400
Subject: Re: [PATCH v3 2/2] hwmon: ina3221: Read channel input source info
 from DT
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20180921223216.634-1-nicoleotsuka@gmail.com>
 <20180921223216.634-3-nicoleotsuka@gmail.com>
 <a7e6c311-eba4-e9b2-df64-9d02882a1dcb@roeck-us.net>
 <20180922184650.GB9092@Asurada>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f8e017c4-10dd-2d0d-84df-b05d3ed03bbf@roeck-us.net>
Date: Sat, 22 Sep 2018 16:59:55 -0700
MIME-Version: 1.0
In-Reply-To: <20180922184650.GB9092@Asurada>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/22/2018 11:46 AM, Nicolin Chen wrote:
>>> This patch adds a new structure of input source specific
>>> information including input source label, shunt resistor
>>> value and its connection status. It exposes these labels
>>> via sysfs and also disables those channels where there's
>>> no input source being connected.
>>>
>>
>> I see you have decided to just display the disconnected channels.
>> This is misleading, and I can not accept it. Please either use the
>> is_visible callback to not display those channels at all, or have
> 
> I will add is_visible. I have almost finished it while waiting for
> the v3's review comments. Will test it and include in the v4.
> 
>> the _input attribute of disabled channels return -ENODATA (see
>> 'in[0-*]_enable' attribute in the ABI). If you implement the latter,
>> I would suggest to also implement the _enable attribute.
> 
> I will also add one separate patch for in[0-*]_enable after these
> two changes pass the review and get applied.
> 
>> As mentioned in patch 1, I can not accept an implicitly mandatory
>> label attribute. The property defining the label attribute will
>> have to be optional and well defined to ensure that it matches
>> the ABI.
> 
> I replied this in the PATCH-1. Let's discuss this topic there.
> 
>>> +	/* Disable channels if their inputs are disconnected */
>>> +	for (i = 0, mask = 0; i < INA3221_NUM_CHANNELS; i++) {
>>> +		if (ina->inputs[i].disconnected)
>>> +			mask |= INA3221_CONFIG_CHx_EN(i);
>>> +	}
>>
>> Consequently, you should also _enable_ channels which are not explicitly disabled.
> 
> The register has enabled all channels by default. So I felt it'd
> be neat to have disabling code only. My v1 actually had enabling
> part as well, but I can add it back if you think it'd be better.
> 
>> This can be tricky since you'll have to distinguish non-DT and DT configuration
>> and retain the original configuration if no channel configuration data is available
>> from devicetree.
> 
> I don't quite understand this comments. Would you please elaborate
> it?
> 
> For non-DT configurations, input->disconnected is always false by
> default unless someone adds config for it (through platform_data).
> If regmap_update_bits only does disabling like this version does,
> non-DT configurations will not get affected since mask = 0. Or if
> we change it to do both enabling and disabling, regmap_update_bits
> will still ignore since there's no register value changed, though
> it won't really hurt even if regmap writes correct configurations
> to the register.
> 
> For DT configurations (without channel input source defined), it's
> like the same as non-DT configurations. As we have platforms only
> enabled ina3221 via DT while they don't have this new DT binding,
> the driver has to be backward compatible, so my change only sets
> input->disconnected=true when a status="disabled" is present, i.e.
> those platforms are treated as all channels getting enabled until
> they update their DTs.
> 

I think your assumption may be that the chip is always in its reset state
when Linux is loaded. This is not necessarily the case; it may be
preconfigured by BIOS or ROMMON, or even by someone using i2cset before
loading the driver. If you add enable/disable functionality, you can
not make an assumption about the original state of the chip at probe time;
you have to read it from the chip itself.

Thanks,
Guenter
