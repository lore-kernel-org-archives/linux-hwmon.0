Return-Path: <venture@google.com>
Return-path: <venture@google.com>
MIME-Version: 1.0
In-Reply-To: <03997192-9dca-965b-01fe-0d6c5661dcb3@roeck-us.net>
References: <20170623014637.99846-1-venture@google.com> <03997192-9dca-965b-01fe-0d6c5661dcb3@roeck-us.net>
From: Patrick Venture <venture@google.com>
Date: Fri, 23 Jun 2017 07:52:24 -0700
Message-ID: <CAO=notz3ObuhC_bcpuu5cv2vKQnW8ZUDUw4wuH5HA94h=E2ijA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] hwmon: (aspeed-pwm-tacho) Poll with short sleeps.
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org,
	Rick Altherr <raltherr@google.com>, Emily Shaffer <emilyshaffer@google.com>,
	Peter Hanson <peterh@google.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Jun 22, 2017 at 9:46 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 06/22/2017 06:46 PM, Patrick Venture wrote:
>>
>> The reference driver polled but mentioned it was possible to sleep
>> for a computed period to know when it's ready to read.  However, polling
>> with minimal sleeps is quick and works.  This also improves responsiveness
>> from the driver.
>>
>> Testing: tested on ast2400 on quanta-q71l
>>
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>>   drivers/hwmon/aspeed-pwm-tacho.c | 19 +++++++++++++------
>>   1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
>> b/drivers/hwmon/aspeed-pwm-tacho.c
>> index b2ab5612d8a4..b865541f4858 100644
>> --- a/drivers/hwmon/aspeed-pwm-tacho.c
>> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
>> @@ -163,6 +163,9 @@
>>   #define M_TACH_UNIT 0x00c0
>>   #define INIT_FAN_CTRL 0xFF
>>   +/* How long we sleep while waiting for an RPM result. */
>> +#define ASPEED_RPM_STATUS_SLEEP 500
>> +
>
>
> Please add units (us ? ms ? HZ ? hours ? days ?)
>
> ... for an RPM result, in <unit>
>
> Also please reflect the unit in the define, and use a tab before the number.
>

Will do.

> I don't see patch 1/2. Still coming ? And didn't we already have a v2 ?

I sent the 1/2 when this was sent as a 2/2.  The reason you were hit
with patch spam was because when I checked my gmail the subject was
managed to remove the 1/2, so it looked like it hadn't sent the
updated patch subject.  But gmail was bundling them on their message
id instead of subject.

I can re-send 1/2 when I send out the fixes prescribed.

So we had a v2 but that was when it was a separate patch instead of
grouped.  I was under the impression that this new grouping was
because those two original patches (originally) didn't depend on each
other.  But an update to the 1st one impacted the space of the 2nd
patch, so I had to rebase the second patch on top of the first and
send them as a group.

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
>> +       u32 raw_data, tach_div, clk_source, msec, usec, val;
>>         u8 fan_tach_ch_source, type, mode, both;
>>         regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
>> @@ -517,12 +520,16 @@ static int aspeed_get_fan_tach_ch_rpm(struct
>> aspeed_pwm_tacho_data *priv,
>>         fan_tach_ch_source = priv->fan_tach_ch_source[fan_tach_ch];
>>         type = priv->pwm_port_type[fan_tach_ch_source];
>>   -     sec = (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
>> -       msleep(sec);
>> +       msec = (1000 / aspeed_get_fan_tach_ch_measure_period(priv, type));
>> +       usec = msec * 1000;
>>   -     regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
>> -       if (!(val & RESULT_STATUS_MASK))
>> -               return -ETIMEDOUT;
>> +       regmap_read_poll_timeout(
>> +               priv->regmap,
>> +               ASPEED_PTCR_RESULT,
>> +               val,
>> +               (val & RESULT_STATUS_MASK),
>> +               ASPEED_RPM_STATUS_SLEEP,
>> +               usec);
>>
>
> Are you sure you want to ignore the return value ? No more timeout ? Why ?

I do not want to ignore the return value.  I'm not sure why, but when
I first looked over that macro it looked like it was returning
-ETIMEDOUT from the macro.  In such a way that it was returning from
the method -- but upon inspection this morning, I can see that's not
the case.

>
>
>>         raw_data = val & RESULT_VALUE_MASK;
>>         tach_div = priv->type_fan_tach_clock_division[type];
>>
>

I'll send out this update as 2/2 v3 and I'll also send 1/2 "with" it
and hopefully it'll show up.  I can edit the commit message and make
it 1/2 v2.  Maybe then my gmail won't mangle it.

Patrick
