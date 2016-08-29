Return-path: <alexander.kapshuk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160829123046.GA26130@roeck-us.net>
References: <20160829131823.776dd67b@endymion> <20160829123046.GA26130@roeck-us.net>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Mon, 29 Aug 2016 17:42:50 +0300
Message-ID: <CAJ1xhMVqj=ThmBkExHZk4uVh6zDB24HtPsGP-QCt3aqMuGAKiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (it87) Add missing sysfs attribute group terminator
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Aug 29, 2016 at 3:30 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Aug 29, 2016 at 01:18:23PM +0200, Jean Delvare wrote:
>> Attribute array it87_attributes_in lacks its NULL terminator,
>> causing random behavior when operating on the attribute group.
>>
>> Fixes: 52929715634a ("hwmon: (it87) Use is_visible for voltage sensors")
>> Signed-off-by: Jean Delvare <jdelvare@suse.de>
>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: stable@vger.kernel.org
>
> Applied.
>
> Thanks,
> Guenter
>
>> ---
>>  drivers/hwmon/it87.c |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- linux-4.7.orig/drivers/hwmon/it87.c       2016-07-04 08:01:00.000000000 +0200
>> +++ linux-4.7/drivers/hwmon/it87.c    2016-08-29 12:04:52.926911625 +0200
>> @@ -2015,6 +2015,7 @@ static struct attribute *it87_attributes
>>       &sensor_dev_attr_in10_input.dev_attr.attr,      /* 41 */
>>       &sensor_dev_attr_in11_input.dev_attr.attr,      /* 41 */
>>       &sensor_dev_attr_in12_input.dev_attr.attr,      /* 41 */
>> +     NULL
>>  };
>>
>>  static const struct attribute_group it87_group_in = {
>>
>>
>> --
>> Jean Delvare
>> SUSE L3 Support

Just a quick note to confirm that the above patch does fix the it87.ko
oops issue for me.

Thanks very much.

Alexander.
