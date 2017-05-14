Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49887 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759154AbdENPmI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 May 2017 11:42:08 -0400
Subject: Re: [PATCH v3 4/4] hwmon: (adt7475) add high frequency support
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
 <20170511034524.22698-5-chris.packham@alliedtelesis.co.nz>
 <f5ac03eee3f54a04a73f08c16e68af52@svr-chch-ex1.atlnz.lc>
Cc: Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9c2bfb1e-0e26-a3de-66d6-6999afc69f30@roeck-us.net>
Date: Sun, 14 May 2017 08:42:05 -0700
MIME-Version: 1.0
In-Reply-To: <f5ac03eee3f54a04a73f08c16e68af52@svr-chch-ex1.atlnz.lc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/11/2017 02:31 PM, Chris Packham wrote:
> On 11/05/17 15:45, Chris Packham wrote:
>> Systems using 4-wire fans usually require high frequency (22.5kHz)
>> output on the pwm. Add 22500 as a valid option in the pwmfreq_table. In
>> high frequency mode the low-order bit are ignored so they can safely be
>> set to 0.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>> Changes in v3:
>> - New
>>
>>  drivers/hwmon/adt7475.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
>> index f7322330789c..f5a65d1166cd 100644
>> --- a/drivers/hwmon/adt7475.c
>> +++ b/drivers/hwmon/adt7475.c
>> @@ -936,7 +936,7 @@ static ssize_t set_pwmctrl(struct device *dev, struct device_attribute *attr,
>>
>>  /* List of frequencies for the PWM */
>>  static const int pwmfreq_table[] = {
>> -	11, 14, 22, 29, 35, 44, 58, 88
>> +	11, 14, 22, 29, 35, 44, 58, 88, 22500
>>  };
>>
>>  static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
>> @@ -944,9 +944,10 @@ static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
>>  {
>>  	struct adt7475_data *data = adt7475_update_device(dev);
>>  	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
>> +	int i = clamp_val(data->range[sattr->index] & 0xf, 0,
>> +			  sizeof(pwmfreq_table));
>
> Oops that should probably be
>
> +			  ARRAY_SIZE(pwmfreq_table) - 1);
>
> Guenter, do you want me to send a v4 or can you fix it up at your end?
>
Please resend together with patches 2 and 3.

Thanks,
Guenter

>>
>> -	return sprintf(buf, "%d\n",
>> -		       pwmfreq_table[data->range[sattr->index] & 7]);
>> +	return sprintf(buf, "%d\n", pwmfreq_table[i]);
>>  }
>>
>>  static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
>> @@ -967,7 +968,7 @@ static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
>>
>>  	data->range[sattr->index] =
>>  		adt7475_read(TEMP_TRANGE_REG(sattr->index));
>> -	data->range[sattr->index] &= ~7;
>> +	data->range[sattr->index] &= ~0xf;
>>  	data->range[sattr->index] |= out;
>>
>>  	i2c_smbus_write_byte_data(client, TEMP_TRANGE_REG(sattr->index),
>>
>
>

