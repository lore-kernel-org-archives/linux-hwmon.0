Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:41468 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754859AbeDWNOY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Apr 2018 09:14:24 -0400
Received: by mail-pg0-f66.google.com with SMTP id m21so5387484pgv.8
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Apr 2018 06:14:23 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (nct6683) Enable EC access if disabled at boot
To: Jonathan Sims <jonathan.625266@earthlink.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
References: <1198239835.265.1524480794683@wamui-jasmine.atl.sa.earthlink.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <84e7c18c-9880-400c-35b8-d1f9653eed00@roeck-us.net>
Date: Mon, 23 Apr 2018 06:14:21 -0700
MIME-Version: 1.0
In-Reply-To: <1198239835.265.1524480794683@wamui-jasmine.atl.sa.earthlink.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 04/23/2018 03:53 AM, Jonathan Sims wrote:
> Thanks for the patch! Tested and working with 4.16.3 kernel on an Asrock Z370M Pro4 motherboard.
> 

I'll take that and make it a formal Tested-by:.

Thanks for reporting the problem and testing the fix.

Guenter

> Best regards,
> 
> Jonathan
> 
> -----Original Message-----
>> From: Guenter Roeck <linux@roeck-us.net>
>> Sent: Apr 22, 2018 9:27 PM
>> To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
>> Cc: Jonathan Sims <jonathan.625266@earthlink.net>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
>> Subject: [PATCH] hwmon: (nct6683) Enable EC access if disabled at boot
>>
>> On Asrock Z370M Pro4, it was observed that EC access was disabled after
>> initially booting the system. As a result, the driver failed to load
>> with
>> 	nct6683: EC is disabled
>> After a suspend/resume cycle, the driver loaded correctly.
>> 	nct6683: Found NCT6683D or compatible chip at 0x2e:0xa20
>> 	nct6683 nct6683.2592: NCT6683D EC firmware version 1.0 build 07/18/16
>>
>> Enable EC access after identifying the chip if disabled to fix the problem.
>> Warn the user that the data it reports may be unusable, similar to other
>> drivers for chips from Nuvoton.
>>
>> Fixes: 41082d66bfd6f ("hwmon: Driver for NCT6683D")
>> Reported-by: Jonathan Sims <jonathan.625266@earthlink.net>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> drivers/hwmon/nct6683.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
>> index 8b0bc4fc06e8..b0bc77bf2cd9 100644
>> --- a/drivers/hwmon/nct6683.c
>> +++ b/drivers/hwmon/nct6683.c
>> @@ -1380,8 +1380,8 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
>> 	/* Activate logical device if needed */
>> 	val = superio_inb(sioaddr, SIO_REG_ENABLE);
>> 	if (!(val & 0x01)) {
>> -		pr_err("EC is disabled\n");
>> -		goto fail;
>> +		pr_warn("Forcibly enabling EC access. Data may be unusable.\n");
>> +		superio_outb(sioaddr, SIO_REG_ENABLE, val | 0x01);
>> 	}
>>
>> 	superio_exit(sioaddr);
>> -- 
>> 2.7.4
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

