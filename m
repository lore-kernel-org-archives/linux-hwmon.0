Return-path: <pab@pabigot.com>
Subject: Re: [PATCH] hwmon: (sht21) Add Electronic Identification Code
 retrieval
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <1482064465-9674-1-git-send-email-pab@pabigot.com>
 <4deb3188-af81-fde5-7b23-28efe7fe8725@roeck-us.net>
Cc: urs.fleisch@sensirion.com
From: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <dfcf75f0-4786-648a-dd28-6bbe138456c6@pabigot.com>
Date: Sun, 18 Dec 2016 12:35:27 -0600
MIME-Version: 1.0
In-Reply-To: <4deb3188-af81-fde5-7b23-28efe7fe8725@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Thanks for the very clear and helpful feedback.  I'll rework the patch, 
but have two style questions below.

On 12/18/2016 11:53 AM, Guenter Roeck wrote:
> On 12/18/2016 04:34 AM, Peter A. Bigot wrote:
>> @@ -165,15 +173,95 @@ static ssize_t sht21_show_humidity(struct 
>> device *dev,
>>      return sprintf(buf, "%d\n", sht21->humidity);
>>  }
>>
>> +/**
>> + * sht21_show_eic() - show Electronic Identification Code in sysfs
>> + * @dev: device
>> + * @attr: device attribute
>> + * @buf: sysfs buffer (PAGE_SIZE) where measurement values are 
>> written to
>> + *
>> + * Will be called on read access to eic1_input sysfs attribute.
>> + * Returns number of bytes written into buffer, negative errno on 
>> error.
>> + */
>> +static ssize_t sht21_show_eic(struct device *dev,
>> +    struct device_attribute *attr,
>> +    char *buf)
>
> Please follow multi-line alignment rules, and do not add unnecessary 
> line breaks.
>

I was intentionally matching the single-tab before 
one-parameter-per-line style present in the existing code.  Do you 
prefer that I do that, or that I change only my code, or that I change 
the style in the whole file?  If the latter, should that be a separate 
style-only commit?

>> +{
>> +    struct sht21 *sht21 = dev_get_drvdata(dev);
>> +    struct i2c_client *client = sht21->client;
>> +    int ret = 0;
>> +    int i;
>> +    char *bp = buf;
>
> Please consider passing your patch through checkpatch and fix reported 
> warnings and errors.

Apologies.  There's one I introduced which I'll fix, but there's also 
the warning about symbolic permissions S_IRUGO which matched 
pre-existing style.  May I ignore that warning, or should I change the 
old uses as well?

Peter
