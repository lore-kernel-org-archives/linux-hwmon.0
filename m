Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49026 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754866AbcIMO2g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Sep 2016 10:28:36 -0400
Subject: Re: [PATCH] hwmon: (ibmpowernv) Fix label for cores numbers not
 threads
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        Michael Neuling <mikey@neuling.org>
References: <1473745661-11890-1-git-send-email-mikey@neuling.org>
 <f5dfed7e-9d43-42b9-fd44-baf0fafacdbc@kaod.org>
Cc: linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        me@neuling.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <eb3c82f9-daec-fb81-a016-7a137a2d4bcf@roeck-us.net>
Date: Tue, 13 Sep 2016 07:28:28 -0700
MIME-Version: 1.0
In-Reply-To: <f5dfed7e-9d43-42b9-fd44-baf0fafacdbc@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/12/2016 11:07 PM, Cédric Le Goater wrote:
> On 09/13/2016 07:47 AM, Michael Neuling wrote:
>> Currently the label says "Core" but lists the thread numbers. This
>> ends up looking like this:
>>     # cat /sys/class/hwmon/hwmon0/temp[1-4]_label
>>     Core 0-7
>>     Core 8-15
>>     Core 16-23
>>     Core 24-31
>>
>> This is misleading as it looks like it's cores 0-7 when it's actually
>> threads 0-7.
>>
>> This changes the print to just give the core number, so the output now
>> looks like this:
>>     # cat /sys/class/hwmon/hwmon0/temp[1-4]_label
>>     Core 0
>>     Core 8
>>     Core 16
>>     Core 24
>>
>> Signed-off-by: Michael Neuling <mikey@neuling.org>
>
> Yes. This looks better. The DTS are related to the core so we don't
> really care about the threads.
>
> Acked-by: Cédric Le Goater <clg@kaod.org>
>
>
Applied to -next.

Guenter

>
> Side question, should we use the Physical ID and not the Linux
> logical one ? I don't know if it is exposed elsewhere in user space.
>
> Thanks,
>
> C.
>
>
>> ---
>>  drivers/hwmon/ibmpowernv.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
>> index 55b5a8ff1c..6d2e660575 100644
>> --- a/drivers/hwmon/ibmpowernv.c
>> +++ b/drivers/hwmon/ibmpowernv.c
>> @@ -143,13 +143,11 @@ static void __init make_sensor_label(struct device_node *np,
>>  		if (cpuid >= 0)
>>  			/*
>>  			 * The digital thermal sensors are associated
>> -			 * with a core. Let's print out the range of
>> -			 * cpu ids corresponding to the hardware
>> -			 * threads of the core.
>> +			 * with a core.
>>  			 */
>>  			n += snprintf(sdata->label + n,
>> -				      sizeof(sdata->label) - n, " %d-%d",
>> -				      cpuid, cpuid + threads_per_core - 1);
>> +				      sizeof(sdata->label) - n, " %d",
>> +				      cpuid);
>>  		else
>>  			n += snprintf(sdata->label + n,
>>  				      sizeof(sdata->label) - n, " phy%d", id);
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

