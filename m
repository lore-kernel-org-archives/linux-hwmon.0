Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36062 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752963AbcLLOVw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Dec 2016 09:21:52 -0500
Subject: Re: [PATCH 12/17] hwmon: (dme1737) Fix overflows seen when writing
 into limit attributes
To: Jean Delvare <jdelvare@suse.de>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
 <1480913740-5678-12-git-send-email-linux@roeck-us.net>
 <20161212103314.64598e40@endymion>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Juerg Haefliger <juergh@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <dcc8760a-f850-93cb-fabf-70241c5996c1@roeck-us.net>
Date: Mon, 12 Dec 2016 06:21:50 -0800
MIME-Version: 1.0
In-Reply-To: <20161212103314.64598e40@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/12/2016 01:33 AM, Jean Delvare wrote:
> Hi Guenter,
>
> On Sun,  4 Dec 2016 20:55:35 -0800, Guenter Roeck wrote:
>> Writes into voltage limit, temperature limit, and temperature zone
>> attributes can overflow due to unchecked parameters to multiplications
>> and additions.
>>
>> Cc: Juerg Haefliger <juergh@gmail.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  drivers/hwmon/dme1737.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
>> index 8763c4a8280c..29d082c12c74 100644
>> --- a/drivers/hwmon/dme1737.c
>> +++ b/drivers/hwmon/dme1737.c
>> @@ -279,7 +279,8 @@ static inline int IN_FROM_REG(int reg, int nominal, int res)
>>
>>  static inline int IN_TO_REG(long val, int nominal)
>>  {
>> -	return clamp_val((val * 192 + nominal / 2) / nominal, 0, 255);
>> +	return DIV_ROUND_CLOSEST(clamp_val(val, 0, 255 * nominal / 192) * 192,
>> +				 nominal);
>>  }
>>
>>  /*
>> @@ -295,7 +296,7 @@ static inline int TEMP_FROM_REG(int reg, int res)
>>
>>  static inline int TEMP_TO_REG(long val)
>>  {
>> -	return clamp_val((val < 0 ? val - 500 : val + 500) / 1000, -128, 127);
>> +	return DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
>>  }
>>
>>  /* Temperature range */
>> @@ -1028,6 +1029,8 @@ static ssize_t set_zone(struct device *dev, struct device_attribute *attr,
>>  	if (err)
>>  		return err;
>>
>> +	val = clamp_val(val, -256000, 255000);
>
> Where do these values come from? I would have naively expected the
> auto-pwm temperature values to have the same range as the temperature
> channels themselves.

Not related to real limits, just a "basic" clamp since the real clamp happens later
anyway.

>
> Also in the case of SYS_ZONE_AUTO_POINT1_TEMP and
> SYS_ZONE_AUTO_POINT3_TEMP, TEMP_TO_REG() is called, which already
> performs the clamping, so it is redundant. So maybe it would be better
> to have a "dedicated" clamp for the SYS_ZONE_AUTO_POINT1_TEMP_HYST and
> SYS_ZONE_AUTO_POINT2_TEMP cases?
>
Yrd, I noticed. Makes sense. Let me think about it.

Thanks,
Guenter

>> +
>>  	mutex_lock(&data->update_lock);
>>  	switch (fn) {
>>  	case SYS_ZONE_AUTO_POINT1_TEMP_HYST:
>
>

