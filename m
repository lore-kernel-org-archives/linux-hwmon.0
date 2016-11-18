Return-path: <tom.levens@cern.ch>
Date: Fri, 18 Nov 2016 09:18:44 +0100
From: Tom Levens <tom.levens@cern.ch>
To: Guenter Roeck <linux@roeck-us.net>
CC: Tom Levens <tom.levens@cern.ch>, <jdelvare@suse.com>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] hwmon: ltc2990: refactor value conversion
In-Reply-To: <1eff12d5-e0f9-aaa0-010d-1ddcccdd6ec9@roeck-us.net>
Message-ID: <alpine.LRH.2.20.1611171955330.14972@pcbe13573-vm.dyndns.cern.ch>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch> <86c28b4f-c78b-8d3e-5c48-fa42ca614ba4@roeck-us.net> <alpine.LRH.2.20.1611171613250.12237@pcbe13573-vm.dyndns.cern.ch> <1eff12d5-e0f9-aaa0-010d-1ddcccdd6ec9@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"; format=flowed
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Thu, 17 Nov 2016, Guenter Roeck wrote:

> On 11/17/2016 08:23 AM, Tom Levens wrote:
>>  Hi Guenter,
>>
>>  Thanks for taking the time to review the patch.
>>
>>  On Thu, 17 Nov 2016, Guenter Roeck wrote:
>> 
>> >  Hi Tom,
>> > 
>> >  On 11/17/2016 04:10 AM, Tom Levens wrote:
>> > >   Conversion from raw values to signed integers has been refactored 
>> > >   using
>> > >   the macros in bitops.h.
>> > > 
>> >  Please also mention that this fixes a bug in negative temperature 
>> >  conversions.
>>
>>  Yes, of course, I will include the information in v3.
>> 
>> > 
>> > >   Signed-off-by: Tom Levens <tom.levens@cern.ch>
>> > >   ---
>> > >    drivers/hwmon/ltc2990.c |   27 ++++++++++-----------------
>> > >    1 files changed, 10 insertions(+), 17 deletions(-)
>> > > 
>> > >   diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
>> > >   index 8f8fe05..0ec4102 100644
>> > >   --- a/drivers/hwmon/ltc2990.c
>> > >   +++ b/drivers/hwmon/ltc2990.c
>> > >   @@ -9,8 +9,12 @@
>> > >     * This driver assumes the chip is wired as a dual current monitor, 
>> > >     and
>> > >     * reports the voltage drop across two series resistors. It also 
>> > >     reports
>> > >     * the chip's internal temperature and Vcc power supply voltage.
>> > >   + *
>> > >   + * Value conversion refactored
>> > >   + * by Tom Levens <tom.levens@cern.ch>
>> > 
>> >  Kind of unusual to do that for minor changes like this. Imagine if 
>> >  everyone would do that.
>> >  The commit log is what gives you credit.
>>
>>  Good point, thanks for the hint. I will remove it from v3.
>> 
>> > >     */
>> > > 
>> > >   +#include <linux/bitops.h>
>> > >    #include <linux/err.h>
>> > >    #include <linux/hwmon.h>
>> > >    #include <linux/hwmon-sysfs.h>
>> > >   @@ -34,19 +38,10 @@
>> > >    #define LTC2990_CONTROL_MODE_CURRENT    0x06
>> > >    #define LTC2990_CONTROL_MODE_VOLTAGE    0x07
>> > > 
>> > >   -/* convert raw register value to sign-extended integer in 16-bit 
>> > >   range */
>> > >   -static int ltc2990_voltage_to_int(int raw)
>> > >   -{
>> > >   -    if (raw & BIT(14))
>> > >   -        return -(0x4000 - (raw & 0x3FFF)) << 2;
>> > >   -    else
>> > >   -        return (raw & 0x3FFF) << 2;
>> > >   -}
>> > >   -
>> > >   /* Return the converted value from the given register in uV or mC */
>> > >   -static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int 
>> > >   *result)
>> > >   +static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, s32 
>> > >   *result)
>> > >   {
>> > >   -    int val;
>> > >   +    s32 val;
>> > 
>> >  Please just leave the variable type alone. it is also used for the 
>> >  return value
>> >  from i2c_smbus_read_word_swapped(), which is an int, and changing it to 
>> >  s32 doesn't really make the code better.
>>
>>  According to i2c.h the return type for i2c_smbus_read_word_swapped() is
>>  s32, which is why I modified it here. But it could be changed back if you
>>  think it is better to leave it as an int.
>> 
> Ah, ok. Good to know. Please leave it anyway, reason being that there is no 
> real
> reason to change it. Effectively those are just whitespace changes (unlike 
> the rest,
> which is part bug fix, part cleanup).
>
>> >  Can you send me a register map for the chip ? I would like to write a 
>> >  module test.
>>
>>  Here is an example register dump:
>
> I meant the output of i2cdump (something like "i2cdump -y -f <bus> 
> <i2c-address> w").
>

The register map wraps at 0x0F, so I only sent you the first 16 bytes. But 
the fully expanded form is:

      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
10: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
20: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
30: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
40: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
50: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
60: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
70: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
80: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
90: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
a0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
b0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
c0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
d0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
e0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00
f0: 00 00 00 00 01 90 07 d0 2c cd 7d 80 7c 29 20 00

Cheers,

> Thanks,
> Guenter
>
>>
>>  00 00 00 00
>>  01 90 07 d0
>>  2c cd 7d 80
>>  7c 29 20 00
>>
>>  The expected values in this case are:
>>
>>  in0_input     5000
>>  in1_input    610
>>  in2_input    3500
>>  in3_input    -195
>>  in4_input    -299
>>  temp1_input     25000
>>  temp2_input     125000
>>  temp3_input    -40000
>>  curr1_input    38840
>>  curr2_input    -12428
>>
>>  Testing with lltc,mode set to <5>, <6> and <7> should give you all
>>  measurements.
>> 
>> >  Thanks,
>> >  Guenter
>>
>>  Cheers,
>> 
>
>
