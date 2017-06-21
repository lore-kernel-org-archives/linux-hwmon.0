Return-Path: <venture@google.com>
Return-path: <venture@google.com>
MIME-Version: 1.0
In-Reply-To: <9643df56-af69-ea5e-ce94-0609e6a9d70f@roeck-us.net>
References: <20170621011228.25128-1-venture@google.com> <20170621011228.25128-2-venture@google.com>
 <9643df56-af69-ea5e-ce94-0609e6a9d70f@roeck-us.net>
From: Patrick Venture <venture@google.com>
Date: Tue, 20 Jun 2017 18:42:14 -0700
Message-ID: <CAO=notzKsE_vASYJDTtKtC4gGdDbtjWAweZf9wXgt49MmjmUnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (aspeed-pwm-tacho) Poll for fan_tach instead
 of sleep
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	Rick Altherr <raltherr@google.com>, Emily Shaffer <emilyshaffer@google.com>,
	Peter Hanson <peterh@google.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Jun 20, 2017 at 6:32 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 06/20/2017 06:12 PM, Patrick Venture wrote:
>>
>> The reference driver polled but mentioned it was possible to sleep
>> for a computed period to know when it's ready to read.  However, polling
>> is quick and works.  This also improves responsiveness from the driver.
>>
>> Testing: tested on ast2400 on quanta-q71l
>>
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>>   drivers/hwmon/aspeed-pwm-tacho.c | 23 +++++++++++++++++------
>>   1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
>> b/drivers/hwmon/aspeed-pwm-tacho.c
>> index b2ab5612d8a4..a31d2648fb3a 100644
>> --- a/drivers/hwmon/aspeed-pwm-tacho.c
>> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
>> @@ -163,6 +163,9 @@
>>   #define M_TACH_UNIT 0x00c0
>>   #define INIT_FAN_CTRL 0xFF
>>   +/* How many times we poll the fan_tach controller for rpm data. */
>> +#define FAN_TACH_RPM_TIMEOUT 25
>> +
>
>
> Not such a good idea. It means that the poll timeout depends on the local
> CPU speed.
> At some point, with some CPUs, this is going to fail.
>
>
>>   struct aspeed_pwm_tacho_data {
>>         struct regmap *regmap;
>>         unsigned long clk_freq;
>> @@ -508,7 +511,7 @@ static u32
>> aspeed_get_fan_tach_ch_measure_period(struct aspeed_pwm_tacho_data
>>   static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data
>> *priv,
>>                                       u8 fan_tach_ch)
>>   {
>> -       u32 raw_data, tach_div, clk_source, sec, val;
>> +       u32 raw_data, tach_div, clk_source, sec, val, timeout;
>>         u8 fan_tach_ch_source, type, mode, both;
>>         regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
>> @@ -517,12 +520,20 @@ static int aspeed_get_fan_tach_ch_rpm(struct
>> aspeed_pwm_tacho_data *priv,
>>         fan_tach_ch_source = priv->fan_tach_ch_source[fan_tach_ch];
>>         type = priv->pwm_port_type[fan_tach_ch_source];
>>   -     sec = (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
>> -       msleep(sec);
>> -
>>         regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
>> -       if (!(val & RESULT_STATUS_MASK))
>> -               return -ETIMEDOUT;
>> +       /*
>> +        * Instead of sleeping first, poll register for result.
>> +        * This is based on the reference driver's approach which expects
>> to
>> +        * receive a value quickly.
>> +        */
>> +       timeout = 0;
>> +       while (!(val & RESULT_STATUS_MASK)) {
>> +               timeout++;
>> +               if (timeout > FAN_TACH_RPM_TIMEOUT)
>> +                       return -ETIMEDOUT;
>> +
>> +               regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
>> +       }
>
>
> No hot loop, please. Please use usleep_range() or similar within the loop,
> and a well defined timeout.
>

Thanks, that's a good call.

I'll implement a variation in the morning and test it to see if there
are any subtle changes required and try to pick good ranges or
something similar.  We need responsiveness down to under 0.0125s so
eight can be read sequentially ten times per second.  The controller
itself actually seems to internally cache a value and only gets
updated once ever 0.08s.  Just as an aside.

I'll check out "regmap_read_poll_timeout" as well per follow-on email.

> Guenter
>
>
>>         raw_data = val & RESULT_VALUE_MASK;
>>         tach_div = priv->type_fan_tach_clock_division[type];
>>
>
