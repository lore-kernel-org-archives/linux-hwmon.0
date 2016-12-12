Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55175 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751640AbcLLOOT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Dec 2016 09:14:19 -0500
Subject: Re: [PATCH v2] hwmon: (nct7802) Fix overflows seen when writing into
 limit attributes
To: Jean Delvare <jdelvare@suse.de>
References: <1481316062-4999-1-git-send-email-linux@roeck-us.net>
 <20161212110355.7907737e@endymion>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <73ac82c8-8fc3-0def-aa5d-0bcab714cc4b@roeck-us.net>
Date: Mon, 12 Dec 2016 06:14:14 -0800
MIME-Version: 1.0
In-Reply-To: <20161212110355.7907737e@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Jean,

On 12/12/2016 02:03 AM, Jean Delvare wrote:
> On Fri,  9 Dec 2016 12:41:02 -0800, Guenter Roeck wrote:
>> Fix overflows seen when writing voltage and temperature limit attributes.
>>
>> The value passed to DIV_ROUND_CLOSEST() needs to be clamped, and the
>> value parameter passed to nct7802_write_fan_min() is an unsigned long.
>>
>> Also, writing values larger than 2700000 into a limit attribute results
>> in writing 0 into the chip's limit registers.
>
> You are only talking about _fan_ limits, right?
>
Yes. I'll clarify.

>> The exact behavior when
>> writing this value is unspecified. For consistency, report a limit of
>> 1350000 if the chip register reads 0.  This may be wrong, and the chip
>> behavior should be verified with the actual chip, but it is better than
>> reporting a value of 0 (which, if written, results in writing a value
>> of 0x1fff into the chip register).
>
> This fix is good by doesn't seem to be related with the overflows?
>
Writing a limit larger than 2700000 results in writing 0 into the register,
which is reported back as 0. 2699999 -> 1 -> 1350000, 2700000 -> 0 -> 0.
I consider that an overflow situation.

Thanks,
Guenter

>>
>> Fixes: 3434f3783580 ("hwmon: Driver for Nuvoton NCT7802Y")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: When reading a register value of 0 from a limit register,
>>     report it as speed of 1350000.
>>     Avoid overflow due to different variable types passed to
>>     nct7802_write_fan_min().
>>     Fix low limit in store_temp (-128, not -127 as in v1).
>>
>>  drivers/hwmon/nct7802.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
>> index 3ce33d244cc0..12b94b094c0d 100644
>> --- a/drivers/hwmon/nct7802.c
>> +++ b/drivers/hwmon/nct7802.c
>> @@ -259,13 +259,15 @@ static int nct7802_read_fan_min(struct nct7802_data *data, u8 reg_fan_low,
>>  		ret = 0;
>>  	else if (ret)
>>  		ret = DIV_ROUND_CLOSEST(1350000U, ret);
>> +	else
>> +		ret = 1350000U;
>>  abort:
>>  	mutex_unlock(&data->access_lock);
>>  	return ret;
>>  }
>>
>>  static int nct7802_write_fan_min(struct nct7802_data *data, u8 reg_fan_low,
>> -				 u8 reg_fan_high, unsigned int limit)
>> +				 u8 reg_fan_high, unsigned long limit)
>>  {
>>  	int err;
>>
>> @@ -326,8 +328,8 @@ static int nct7802_write_voltage(struct nct7802_data *data, int nr, int index,
>>  	int shift = 8 - REG_VOLTAGE_LIMIT_MSB_SHIFT[index - 1][nr];
>>  	int err;
>>
>> +	voltage = clamp_val(voltage, 0, 0x3ff * nct7802_vmul[nr]);
>>  	voltage = DIV_ROUND_CLOSEST(voltage, nct7802_vmul[nr]);
>> -	voltage = clamp_val(voltage, 0, 0x3ff);
>>
>>  	mutex_lock(&data->access_lock);
>>  	err = regmap_write(data->regmap,
>> @@ -402,7 +404,7 @@ static ssize_t store_temp(struct device *dev, struct device_attribute *attr,
>>  	if (err < 0)
>>  		return err;
>>
>> -	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
>> +	val = DIV_ROUND_CLOSEST(clamp_val(val, -128000, 127000), 1000);
>>
>>  	err = regmap_write(data->regmap, nr, val & 0xff);
>>  	return err ? : count;
>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>

