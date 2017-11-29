Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:39687 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751596AbdK2CZW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Nov 2017 21:25:22 -0500
Subject: Re: [PATCH] hwmon: (pmbus/lm25066) Default coefficients for low
 current limit
To: Rob Lippert <rlippert@google.com>
Cc: Robert Lippert <roblip@gmail.com>, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, linux-kernel@vger.kernel.org,
        Xo Wang <xow@google.com>
References: <20171128002858.1821-1-rlippert@google.com>
 <40bff1ab-dd3f-0d70-5ca2-8132af350380@roeck-us.net>
 <CAFRv3wx-_RWu5A2jgOoV6vQzonzOfGbvSLrC3HH7MwASc8ScfA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <95229acf-f06b-b3f4-4ad7-aef454656051@roeck-us.net>
Date: Tue, 28 Nov 2017 18:25:19 -0800
MIME-Version: 1.0
In-Reply-To: <CAFRv3wx-_RWu5A2jgOoV6vQzonzOfGbvSLrC3HH7MwASc8ScfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/28/2017 10:39 AM, Rob Lippert wrote:
> On Mon, Nov 27, 2017 at 8:26 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 11/27/2017 04:28 PM, Robert Lippert wrote:
>>>
>>> There seems to be no way to detect the value of the CL/GAIN pin
>>> from the device using PMBus.
>>>
>>> Low current mode seems to be recommended (from LM5066 datasheet) for
>>> improved current reporting accuracy in a typical design.
>>>
>>> Assume the device is in low current mode unless the register override
>>> bit is set and indicates high current limit mode.
>>>
>>> Signed-off-by: Robert Lippert <rlippert@google.com>
>>
>>
>> Applied (silently fixed continuation line alignment).
>>
>> Looking at the most recent version of various datasheets for the chips
>> supported
>> by the driver, looks like TI changed the coefficients (again). Not the first
>> time.
>> Time to go through all chips and update coefficients. Might be worthwhile
>> to do that at least for the chips(s) which are of interest for you.
> 
> This patch also needs commit "hwmon: (pmbus/lm25066) Swap low/high
> current coefficients for LM5066(i)" to maintain the existing reporting
> behavior for LM5066 devices atleast.
> (as now it will be pulling from the _L values by default)
> 
> I spot checked the coeff values for lm25056 with the online datasheet
> and they also seem to be swapped although it is a little hard to be
> sure since the meaning of GAIN input seems to be opposite of CL input:
> GAIN=0 is low current and GAIN=1 is high current.
> 
> -Rob
> 
>>
>> Thanks,
>> Guenter
>>
>>
>>> ---
>>>    drivers/hwmon/pmbus/lm25066.c | 19 +++++++++++++------
>>>    1 file changed, 13 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
>>> index aa052f4449a9..f6ae7b4cf705 100644
>>> --- a/drivers/hwmon/pmbus/lm25066.c
>>> +++ b/drivers/hwmon/pmbus/lm25066.c
>>> @@ -43,6 +43,7 @@ enum chips { lm25056, lm25063, lm25066, lm5064, lm5066,
>>> lm5066i };
>>>    #define LM25066_READ_AVG_IIN          0xde
>>>    #define LM25066_READ_AVG_PIN          0xdf
>>>    +#define LM25066_DEV_SETUP_CL_CONFIG  BIT(2)  /* Use pin or SMBus values
>>> */
>>>    #define LM25066_DEV_SETUP_CL          BIT(4)  /* Current limit */
>>>      /* LM25056 only */
>>> @@ -526,16 +527,22 @@ static int lm25066_probe(struct i2c_client *client,
>>>          info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
>>>          info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
>>>          info->R[PSC_POWER] = coeff[PSC_POWER].R;
>>> -       if (config & LM25066_DEV_SETUP_CL) {
>>> -               info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
>>> -               info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
>>> -               info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
>>> -               info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
>>> -       } else {
>>> +
>>> +       /*
>>> +        * Assume chip is in low current limit/gain mode by default unless
>>> +        * the register override is asserted AND indicates high limit
>>> mode.
>>> +        */
>>> +       if ((config & LM25066_DEV_SETUP_CL_CONFIG) &&
>>> +               (config & LM25066_DEV_SETUP_CL)) {
>>>                  info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
>>>                  info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
>>>                  info->m[PSC_POWER] = coeff[PSC_POWER].m;
>>>                  info->b[PSC_POWER] = coeff[PSC_POWER].b;
>>> +       } else {
>>> +               info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
>>> +               info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
>>> +               info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
>>> +               info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
>>>          }

After looking into it more closely, turns out this is wrong.

The _L defines were supposed to be used if bit 4 is set, not if it is unset.
It wasn't supposed to mean "low" but "CL/GAIN=1" (ok, looking at it with 20/20
hindsight, that seems to be odd, but it is consistent with the code).

So the code should be something like

	if ((config & LM25066_DEV_SETUP_CL_CONFIG) &&
	    (config & LM25066_DEV_SETUP_CL)) {
		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
	} else {
		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
		info->m[PSC_POWER] = coeff[PSC_POWER].m;
		info->b[PSC_POWER] = coeff[PSC_POWER].b;
	}

Only that by itself is insufficient because not all chips support
bit 2 (at least lm25056 doesn't). We can work around that with
something like

	if (data->id == lm25056)
		config |= LM25066_DEV_SETUP_CL_CONFIG;

Can you do that ?

[ LM25063 doesn't have the bit either, but it looks like TI acquired
   National before LM25063 shipped, and the chip was never actually
   released. Dropping that will be a separate patch. ]

Thanks,
Guenter
