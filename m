Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35630 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756378AbcHDNZh (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Aug 2016 09:25:37 -0400
Subject: Re: [PATCH] hwmon: (nct6775) Do not accept force_id unless chip is
 found
To: Jean Delvare <jdelvare@suse.de>
References: <1470287737-1212-1-git-send-email-linux@roeck-us.net>
 <20160804130048.5a33f1fb@endymion>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57A341FB.2090308@roeck-us.net>
Date: Thu, 4 Aug 2016 06:24:11 -0700
MIME-Version: 1.0
In-Reply-To: <20160804130048.5a33f1fb@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/04/2016 04:00 AM, Jean Delvare wrote:
> Hi Guenter,
>
> On Wed,  3 Aug 2016 22:15:37 -0700, Guenter Roeck wrote:
>> Since commit 698a7c24a544 ("hwmon: (nct6775) Support two SuperIO chips
>> in the same system"), the driver supports two Super-IO chips. This has
>> the undesirable side effect that force_id always detects a second chip
>> at address 0xfff8, even if no chip exists at that address.
>>
>> nct6775: Found NCT6793D or compatible chip at 0x4e:0xfff8
>>
>> If no chip at all is found at a given SIO address, it does not make sense
>> to instantiate it. Limit force_id to only work if some chip is found,
>> that is if the chip ID returns a value other than 0xffff.
>
> Agreed, good catch.
>
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/hwmon/nct6775.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
>> index d087a8e00cf5..7859a30ce31e 100644
>> --- a/drivers/hwmon/nct6775.c
>> +++ b/drivers/hwmon/nct6775.c
>> @@ -4232,11 +4232,11 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
>>   	if (err)
>>   		return err;
>>
>> -	if (force_id)
>> +	val = (superio_inb(sioaddr, SIO_REG_DEVID) << 8) |
>> +		superio_inb(sioaddr, SIO_REG_DEVID + 1);
>> +	if (force_id && val != 0xffff)
>>   		val = force_id;
>> -	else
>> -		val = (superio_inb(sioaddr, SIO_REG_DEVID) << 8)
>> -		    | superio_inb(sioaddr, SIO_REG_DEVID + 1);
>> +
>>   	switch (val & SIO_ID_MASK) {
>>   	case SIO_NCT6106_ID:
>>   		sio_data->kind = nct6106;
>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>
Thanks!

Guenter

