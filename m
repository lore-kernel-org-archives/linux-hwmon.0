Return-Path: <tom.levens@cern.ch>
Return-path: <tom.levens@cern.ch>
Date: Wed, 12 Jul 2017 00:03:02 +0200
From: Tom Levens <tom.levens@cern.ch>
To: Guenter Roeck <linux@roeck-us.net>
CC: Tom Levens <tom.levens@cern.ch>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, "Mike
 Looijmans" <mike.looijmans@topic.nl>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [v3,1/3] hwmon: ltc2990: refactor value conversion
In-Reply-To: <20170708154515.GA6358@roeck-us.net>
Message-ID: <alpine.LRH.2.20.1707120000520.28469@lxplus091.cern.ch>
References: <1499056140-6064-1-git-send-email-tom.levens@cern.ch> <20170708154515.GA6358@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="-1195575205-220907771-1499810582=:28469"
List-ID: <linux-hwmon@vger.kernel.org>

---1195575205-220907771-1499810582=:28469
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8BIT



On Sat, 8 Jul 2017, Guenter Roeck wrote:

> On Mon, Jul 03, 2017 at 06:28:58AM +0200, Tom Levens wrote:
>> Conversion from raw values to signed integers has been refactored using
>> bitops.h. This also fixes a bug where negative temperatures were
>> converted incorrectly.
>>
>
> Documentation/process/submitting-patches.rst, chapter 2: "Solve only one
> problem per patch.".
>
> I can understand the urge to merge two sets of changes here. However,
> that creates a problem for me: The fix should be applied to stable kernels,
> but not the refactoring.
>
> Please split the patch in two, one for the bug fix and one for the
> refactoring.

In reality the refactoring *is* the fix for this bug. I am not sure how to 
to fix it simply without using the bitops macro. Of course, I could fix 
only the temperature conversion in one patch and refactor the other two in 
a separate one if you prefer?

Cheers,

> Thanks,
> Guenter
>
>> Signed-off-by: Tom Levens <tom.levens@cern.ch>
>> ---
>>  drivers/hwmon/ltc2990.c | 18 ++++--------------
>>  1 file changed, 4 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
>> index 8f8fe05..e320d21 100644
>> --- a/drivers/hwmon/ltc2990.c
>> +++ b/drivers/hwmon/ltc2990.c
>> @@ -11,6 +11,7 @@
>>   * the chip's internal temperature and Vcc power supply voltage.
>>   */
>>
>> +#include <linux/bitops.h>
>>  #include <linux/err.h>
>>  #include <linux/hwmon.h>
>>  #include <linux/hwmon-sysfs.h>
>> @@ -34,15 +35,6 @@
>>  #define LTC2990_CONTROL_MODE_CURRENT	0x06
>>  #define LTC2990_CONTROL_MODE_VOLTAGE	0x07
>>
>> -/* convert raw register value to sign-extended integer in 16-bit range */
>> -static int ltc2990_voltage_to_int(int raw)
>> -{
>> -	if (raw & BIT(14))
>> -		return -(0x4000 - (raw & 0x3FFF)) << 2;
>> -	else
>> -		return (raw & 0x3FFF) << 2;
>> -}
>> -
>>  /* Return the converted value from the given register in uV or mC */
>>  static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
>>  {
>> @@ -55,18 +47,16 @@ static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
>>  	switch (reg) {
>>  	case LTC2990_TINT_MSB:
>>  		/* internal temp, 0.0625 degrees/LSB, 13-bit  */
>> -		val = (val & 0x1FFF) << 3;
>> -		*result = (val * 1000) >> 7;
>> +		*result = sign_extend32(val, 12) * 1000 / 16;
>>  		break;
>>  	case LTC2990_V1_MSB:
>>  	case LTC2990_V3_MSB:
>>  		 /* Vx-Vy, 19.42uV/LSB. Depends on mode. */
>> -		*result = ltc2990_voltage_to_int(val) * 1942 / (4 * 100);
>> +		*result = sign_extend32(val, 14) * 1942 / 100;
>>  		break;
>>  	case LTC2990_VCC_MSB:
>>  		/* Vcc, 305.18μV/LSB, 2.5V offset */
>> -		*result = (ltc2990_voltage_to_int(val) * 30518 /
>> -			   (4 * 100 * 1000)) + 2500;
>> +		*result = sign_extend32(val, 14) * 30518 / (100 * 1000) + 2500;
>>  		break;
>>  	default:
>>  		return -EINVAL; /* won't happen, keep compiler happy */
>
>
---1195575205-220907771-1499810582=:28469--
