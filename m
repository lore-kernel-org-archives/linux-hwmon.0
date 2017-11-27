Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:36727 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752275AbdK0VnN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Nov 2017 16:43:13 -0500
Received: by mail-qt0-f194.google.com with SMTP id a19so41130533qtb.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2017 13:43:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171122222809.GA2951@roeck-us.net>
References: <20171122220843.18309-1-rlippert@google.com> <20171122222809.GA2951@roeck-us.net>
From: Rob Lippert <rlippert@google.com>
Date: Mon, 27 Nov 2017 13:42:51 -0800
Message-ID: <CAFRv3wyCRTVEMTFFCa8_z6dsFHNR7U_9UixRTDHeoX1VN3cM4A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus) Use 64bit math for DIRECT format values
To: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Lippert <roblip@gmail.com>, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, linux-kernel@vger.kernel.org,
        Xo Wang <xow@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 22, 2017 at 2:28 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Nov 22, 2017 at 02:08:43PM -0800, Robert Lippert wrote:
>> Power values in the 100s of watt range can easily blow past
>> 32bit math limits when processing everything in microwatts.
>>
>> Use 64bit math instead to avoid these issues on common 32bit ARM
>> BMC platforms.
>>
>> Signed-off-by: Robert Lippert <rlippert@google.com>
>> ---
>>  drivers/hwmon/pmbus/pmbus_core.c | 21 ++++++++++++---------
>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 52a58b8b6e1b..f4efea9f282e 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -499,8 +499,8 @@ static long pmbus_reg2data_linear(struct pmbus_data *data,
>>  static long pmbus_reg2data_direct(struct pmbus_data *data,
>>                                 struct pmbus_sensor *sensor)
>>  {
>> -     long val = (s16) sensor->data;
>> -     long m, b, R;
>> +     s64 val = (s16) sensor->data;
>> +     s64 m, b, R;
>>
>>       m = data->info->m[sensor->class];
>>       b = data->info->b[sensor->class];
>> @@ -528,11 +528,13 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
>>               R--;
>>       }
>>       while (R < 0) {
>> -             val = DIV_ROUND_CLOSEST(val, 10);
>> +             do_div(val, 10);
>
> Any reason to not use DIV_ROUND_CLOSEST_ULL ?

That macro doesn't quite work for signed division.  v2 changes this to
use the signed 64bit division functions and I emulated the "round
closest" by just adding 5 before dividing.

>
>>               R++;
>>       }
>>
>> -     return (val - b) / m;
>> +     val = val - b;
>> +     do_div(val, m);
>> +     return val;
>
> Can this overflow ?

Added clamp() to the return values in v2 to prevent overflow when
returning a narrower type.

>
>>  }
>>
>>  /*
>> @@ -656,7 +658,8 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
>>  static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>>                                struct pmbus_sensor *sensor, long val)
>>  {
>> -     long m, b, R;
>> +     s64 m, b, R;
>> +     s64 val64 = val;
>>
>>       m = data->info->m[sensor->class];
>>       b = data->info->b[sensor->class];
>> @@ -673,18 +676,18 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
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
>> +             do_div(val64, 10);
>
> Same here.
>
>>               R++;
>>       }
>>
>> -     return val;
>> +     return (u16) val64;
>
> Can this overflow ?
>
>>  }
>>
>>  static u16 pmbus_data2reg_vid(struct pmbus_data *data,
>> --
>> 2.15.0.448.gf294e3d99a-goog
>>
