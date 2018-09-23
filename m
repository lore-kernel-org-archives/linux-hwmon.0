Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40073 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbeIWICs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Sep 2018 04:02:48 -0400
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
 <f8e017c4-10dd-2d0d-84df-b05d3ed03bbf@roeck-us.net>
 <20180923003841.GA10071@Asurada-Nvidia.nvidia.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <80510b08-0e89-03ce-7d69-fe51f8b6a7b5@roeck-us.net>
Date: Sat, 22 Sep 2018 19:07:02 -0700
MIME-Version: 1.0
In-Reply-To: <20180923003841.GA10071@Asurada-Nvidia.nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/22/2018 05:38 PM, Nicolin Chen wrote:
> On Sat, Sep 22, 2018 at 04:59:55PM -0700, Guenter Roeck wrote:
> 
>>>>> +	/* Disable channels if their inputs are disconnected */
>>>>> +	for (i = 0, mask = 0; i < INA3221_NUM_CHANNELS; i++) {
>>>>> +		if (ina->inputs[i].disconnected)
>>>>> +			mask |= INA3221_CONFIG_CHx_EN(i);
>>>>> +	}
>>>>
>>>> Consequently, you should also _enable_ channels which are not explicitly disabled.
>>>
>>> The register has enabled all channels by default. So I felt it'd
>>> be neat to have disabling code only. My v1 actually had enabling
>>> part as well, but I can add it back if you think it'd be better.
>>>
>>>> This can be tricky since you'll have to distinguish non-DT and DT configuration
>>>> and retain the original configuration if no channel configuration data is available
>>>> from devicetree.
> 
>>> For non-DT configurations, input->disconnected is always false by
>>> default unless someone adds config for it (through platform_data).
>>> If regmap_update_bits only does disabling like this version does,
>>> non-DT configurations will not get affected since mask = 0. Or if
>>> we change it to do both enabling and disabling, regmap_update_bits
>>> will still ignore since there's no register value changed, though
>>> it won't really hurt even if regmap writes correct configurations
>>> to the register.
>>>
>>> For DT configurations (without channel input source defined), it's
>>> like the same as non-DT configurations. As we have platforms only
>>> enabled ina3221 via DT while they don't have this new DT binding,
>>> the driver has to be backward compatible, so my change only sets
>>> input->disconnected=true when a status="disabled" is present, i.e.
>>> those platforms are treated as all channels getting enabled until
>>> they update their DTs.
> 
>> I think your assumption may be that the chip is always in its reset state
>> when Linux is loaded. This is not necessarily the case; it may be
>> preconfigured by BIOS or ROMMON, or even by someone using i2cset before
>> loading the driver. If you add enable/disable functionality, you can
>> not make an assumption about the original state of the chip at probe time;
>> you have to read it from the chip itself.
> 
> I see. That made a point. In that case, I think the simplest way
> is probably to do software reset before having configurations.
> 
No. If the chip was configured by the BIOS/ROMMON, it is supposed
to be that way. We can not just override that.

Guenter

> The "disconnected" here is to describe the physical connection,
> not exact the switch control status because a channel could be
> connected but disabled. However, a channel would not be enabled
> if it's disconnected. So I think it'd be safe to just disable
> the disconnected channels here as this version does, meanwhile,
> I will add a soft reset to make sure all channels are enabled.
> 
> Thanks
> Nicolin
> 
