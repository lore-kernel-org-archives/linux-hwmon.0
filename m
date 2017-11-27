Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:33914 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752280AbdK0XwG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Nov 2017 18:52:06 -0500
Received: by mail-qt0-f196.google.com with SMTP id 33so32636127qtv.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2017 15:52:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171127221135.GB3848@roeck-us.net>
References: <20171122220843.18309-1-rlippert@google.com> <20171127213914.141687-1-rlippert@google.com>
 <20171127221135.GB3848@roeck-us.net>
From: Rob Lippert <rlippert@google.com>
Date: Mon, 27 Nov 2017 15:51:45 -0800
Message-ID: <CAFRv3wzeREHGHx3RkLCggb2heNQWLVEN1UWT1LqN94F1m1MmVQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (pmbus) Use 64bit math for DIRECT format values
To: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Lippert <roblip@gmail.com>, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, linux-kernel@vger.kernel.org,
        Xo Wang <xow@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 27, 2017 at 2:11 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Nov 27, 2017 at 01:39:14PM -0800, Robert Lippert wrote:
>> Power values in the 100s of watt range can easily blow past
>> 32bit math limits when processing everything in microwatts.
>>
>> Use 64bit math instead to avoid these issues on common 32bit ARM
>> BMC platforms.
>>
>> Signed-off-by: Robert Lippert <rlippert@google.com>
>> ---
>>  drivers/hwmon/pmbus/pmbus_core.c | 23 ++++++++++++++---------
>>  1 file changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 52a58b8b6e1b..ff701502974a 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -21,6 +21,7 @@
>>
>>  #include <linux/debugfs.h>
>>  #include <linux/kernel.h>
>> +#include <linux/math64.h>
>>  #include <linux/module.h>
>>  #include <linux/init.h>
>>  #include <linux/err.h>
>> @@ -499,8 +500,9 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
>>  static long pmbus_reg2data_direct(struct pmbus_data *data,
>>                                 struct pmbus_sensor *sensor)
>>  {
>> -     long val = (s16) sensor->data;
>> -     long m, b, R;
>> +     s64 val = (s16) sensor->data;
>> +     s64 b, R;
>
> Do b and R have to be s64 ? Seems excessive.

b has a range of -32767 to 32768 and is multiplied in the code below
by 1,000,000 for a power sensor so I think needs to be 64bit to avoid
overflow.
R has limited range so changed in v3 to s32 type.

>
>> +     s32 m;
>>
>>       m = data->info->m[sensor->class];
>>       b = data->info->b[sensor->class];
>> @@ -528,11 +530,12 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
>>               R--;
>>       }
>>       while (R < 0) {
>> -             val = DIV_ROUND_CLOSEST(val, 10);
>> +             val = div_s64(val + 5LL, 10L);  // round closest

(also fixed up in v3 this C++ style comment that slipped in...)

>>               R++;
>>       }
>>
>> -     return (val - b) / m;
>> +     val = div_s64(val - b, m);
>> +     return clamp_val(val, LONG_MIN, LONG_MAX);
>>  }
>>
>>  /*
>> @@ -656,7 +659,9 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
>>  static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>>                                struct pmbus_sensor *sensor, long val)
>>  {
>> -     long m, b, R;
>> +     s64 b, R;
>
> Same question as above - do those have to be s64 ?
>
>> +     s32 m;
>> +     s64 val64 = val;
>>
>>       m = data->info->m[sensor->class];
>>       b = data->info->b[sensor->class];
>> @@ -673,18 +678,18 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>>               R -= 3;         /* Adjust R and b for data in milli-units */
>>               b *= 1000;
>>       }
>> -     val = val * m + b;
>> +     val64 = val64 * m + b;
>>
>>       while (R > 0) {
>> -             val *= 10;
>> +             val64 *= 10;
>>               R--;
>>       }
>>       while (R < 0) {
>> -             val = DIV_ROUND_CLOSEST(val, 10);
>> +             val64 = div_s64(val64 + 5LL, 10L);  // round closest
>>               R++;
>>       }
>>
>> -     return val;
>> +     return (u16) clamp_val(val64, S16_MIN, S16_MAX);
>>  }
>>
>>  static u16 pmbus_data2reg_vid(struct pmbus_data *data,
>> --
>> 2.15.0.417.g466bffb3ac-goog
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
