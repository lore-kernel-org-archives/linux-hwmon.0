Return-Path: <joel.stan@gmail.com>
Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <20171102145406.GA9240@roeck-us.net>
References: <20171102035349.1902-1-joel@jms.id.au> <20171102035349.1902-3-joel@jms.id.au>
 <20171102145406.GA9240@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Nov 2017 13:32:10 +1100
Message-ID: <CACPK8Xc3Hsj9TD8L2A6e-iCMZp5=HG9aan5m0YsWV-CZHFPo5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <philipp.zabel@gmail.com>,
	Mykola Kostenok <c_mykolak@mellanox.com>,
	Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, Patrick Venture <venture@google.com>, Andrew Jeffery <andrew@aj.id.au>,
	devicetree <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Nov 3, 2017 at 1:54 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Thu, Nov 02, 2017 at 02:53:48PM +1100, Joel Stanley wrote:
>> The ASPEED SoC must deassert a reset in order to use the PWM/tach
>> peripheral.
>>
> Again, you claim that the current driver would not work at all, which
> is simply not correct. It doesn't work if the chip wasn't taken out
> of reset by other means. This doesn't take into account situations and
> hardware where the chip is taken out of reset automatically at boot, h
> or by the ROM monitor/BIOS. It assumes that the reset pin can _always_
> be controlled by software.

The reset is internal to the SoC. There is no pin to speak of, just a
wire inside the SoC, so it can always be controlled by software.

There's SoC does not release any resets automatically; the default
value on boot is for the reset to be asserted and this is not
configurable.

> Similar, it forces the chip into reset when the driver is removed,
> which is even worse. Unload the driver, and no more fan control ?
> Really ? Then why is there an autonomous chip for fan control
> to start with ? This is questionable even if the reset pin is
> optional.

Similarly, the PWM/Tach unit is inside the SoC; it's not an external device.

It would be strange to remove the driver and expect the system to keep
operating normally.

> You'll have to make reset handling optional for me to accept it.
> I am quite sure that I said that before.

Please reconsider in light of the details above. It does not make any
sense to build a system without this reset.

Cheers,

Joel

>
> Guenter
>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> v2:
>>  - Correct horrible mistakes
>>  - Boot tested and hwmon sysfs files checked
>> ---
>>  drivers/hwmon/aspeed-pwm-tacho.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
>> index 63a95e23ca81..77bb7a4bbed4 100644
>> --- a/drivers/hwmon/aspeed-pwm-tacho.c
>> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/regmap.h>
>> +#include <linux/reset.h>
>>  #include <linux/sysfs.h>
>>  #include <linux/thermal.h>
>>
>> @@ -181,6 +182,7 @@ struct aspeed_cooling_device {
>>
>>  struct aspeed_pwm_tacho_data {
>>       struct regmap *regmap;
>> +     struct reset_control *rst;
>>       unsigned long clk_freq;
>>       bool pwm_present[8];
>>       bool fan_tach_present[16];
>> @@ -931,6 +933,15 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>>                       &aspeed_pwm_tacho_regmap_config);
>>       if (IS_ERR(priv->regmap))
>>               return PTR_ERR(priv->regmap);
>> +
>> +     priv->rst = devm_reset_control_get_exclusive(dev, NULL);
>> +     if (IS_ERR(priv->rst)) {
>> +             dev_err(dev,
>> +                     "missing or invalid reset controller device tree entry");
>> +             return PTR_ERR(priv->rst);
>> +     }
>> +     reset_control_deassert(priv->rst);
>> +
>>       regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE, 0);
>>       regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE_EXT, 0);
>>
>> @@ -960,6 +971,15 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>>       return PTR_ERR_OR_ZERO(hwmon);
>>  }
>>
>> +static int aspeed_pwm_tacho_remove(struct platform_device *pdev)
>> +{
>> +     struct aspeed_pwm_tacho_data *priv = platform_get_drvdata(pdev);
>> +
>> +     reset_control_assert(priv->rst);
>> +
>> +     return 0;
>> +}
>> +
>>  static const struct of_device_id of_pwm_tacho_match_table[] = {
>>       { .compatible = "aspeed,ast2400-pwm-tacho", },
>>       { .compatible = "aspeed,ast2500-pwm-tacho", },
>> @@ -969,6 +989,7 @@ MODULE_DEVICE_TABLE(of, of_pwm_tacho_match_table);
>>
>>  static struct platform_driver aspeed_pwm_tacho_driver = {
>>       .probe          = aspeed_pwm_tacho_probe,
>> +     .remove         = aspeed_pwm_tacho_remove,
>>       .driver         = {
>>               .name   = "aspeed_pwm_tacho",
>>               .of_match_table = of_pwm_tacho_match_table,
>> --
>> 2.14.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
