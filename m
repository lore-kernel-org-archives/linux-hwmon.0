Return-path: <matthew.weber@rockwellcollins.com>
MIME-Version: 1.0
In-Reply-To: <51b82f69-d06e-8a3f-e142-cf1c45e2387e@roeck-us.net>
References: <1471579867-16553-1-git-send-email-matthew.weber@rockwellcollins.com>
 <51b82f69-d06e-8a3f-e142-cf1c45e2387e@roeck-us.net>
From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 19 Aug 2016 11:15:37 -0500
Message-ID: <CANQCQpZ1ZiwBaV7+83UvZ5E2KzSky0XRvVFGLeSArpR0GaJX=Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Enabled device tree for generic pmbus devices
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
	Ronak Desai <ronak.desai@rockwellcollins.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

Guenter,

On Thu, Aug 18, 2016 at 11:39 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 08/18/2016 09:11 PM, Matt Weber wrote:
>>
>> This patch adds device tree based enumeration support for generic pmbus
>> sensors  ADP4000, BMR453, BMR454, MDT040, NCP4200, NCP4208,
>> PDT003, PDT006, PDT012, TPS40400, TPS544B20, TPS544B25, TPS544C20,
>> TPS544C25, and UDT020.
>>
>
> Are you sure this is needed ?

Good point, always thought it was and just tested and it works
without.  Was there a point where this didn't work in the same way?

I'll drop the patches in patchworks and submit a v2 for the ucd90160
sensor addition patch.

>
> Guenter
>
>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
>> ---
>>  drivers/hwmon/pmbus/pmbus.c | 82
>> ++++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 63 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
>> index 0a74991..d09c0bb 100644
>> --- a/drivers/hwmon/pmbus/pmbus.c
>> +++ b/drivers/hwmon/pmbus/pmbus.c
>> @@ -26,6 +26,34 @@
>>  #include <linux/mutex.h>
>>  #include <linux/i2c.h>
>>  #include "pmbus.h"
>> +#ifdef CONFIG_OF
>> +#include <linux/of.h>
>> +#endif
>> +
>> +enum chips { pmbus, generic_sensor };
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id generic_pmbus_dt_match[] = {
>> +       { .compatible = "on,adp4000", .data = (void *)generic_sensor },
>> +       { .compatible = "ericsson,bmr453", .data = (void *)generic_sensor
>> },
>> +       { .compatible = "ericsson,bmr454", .data = (void *)generic_sensor
>> },
>> +       { .compatible = "lineage,mdt040", .data = (void *)generic_sensor
>> },
>> +       { .compatible = "on,ncp4200", .data = (void *)generic_sensor },
>> +       { .compatible = "on,ncp4208", .data = (void *)generic_sensor },
>> +       { .compatible = "lineage,pdt003", .data = (void *)generic_sensor
>> },
>> +       { .compatible = "lineage,pdt006", .data = (void *)generic_sensor
>> },
>> +       { .compatible = "lineage,pdt012", .data = (void *)generic_sensor
>> },
>> +       { .compatible = "general,pmbus", .data = (void *)pmbus },
>> +       { .compatible = "ti,tps40400", .data = (void *)generic_sensor },
>> +       { .compatible = "ti,tps544b20", .data = (void *)generic_sensor },
>> +       { .compatible = "ti,tps544b25", .data = (void *)generic_sensor },
>> +       { .compatible = "ti,tps544c20", .data = (void *)generic_sensor },
>> +       { .compatible = "ti,tps544c25", .data = (void *)generic_sensor },
>> +       { .compatible = "lineage,udt020", .data = (void *)generic_sensor
>> },
>> +       { }
>> +};
>> +#endif
>> +
>>
>>  /*
>>   * Find sensor groups and status registers on each page.
>> @@ -163,6 +191,19 @@ abort:
>>         return ret;
>>  }
>>
>> +static inline int generic_pmbus_get_driver_data(struct i2c_client *i2c,
>> +               const struct i2c_device_id *id)
>> +{
>> +#ifdef CONFIG_OF
>> +       if (i2c->dev.of_node) {
>> +               const struct of_device_id *match;
>> +               match = of_match_node(generic_pmbus_dt_match,
>> i2c->dev.of_node);
>> +               return (int)match->data;
>> +       }
>> +#endif
>> +       return (int)id->driver_data;
>> +}
>> +
>>  static int pmbus_probe(struct i2c_client *client,
>>                        const struct i2c_device_id *id)
>>  {
>> @@ -173,7 +214,7 @@ static int pmbus_probe(struct i2c_client *client,
>>         if (!info)
>>                 return -ENOMEM;
>>
>> -       info->pages = id->driver_data;
>> +       info->pages = generic_pmbus_get_driver_data(client, id);
>>         info->identify = pmbus_identify;
>>
>>         return pmbus_do_probe(client, id, info);
>> @@ -183,22 +224,22 @@ static int pmbus_probe(struct i2c_client *client,
>>   * Use driver_data to set the number of pages supported by the chip.
>>   */
>>  static const struct i2c_device_id pmbus_id[] = {
>> -       {"adp4000", 1},
>> -       {"bmr453", 1},
>> -       {"bmr454", 1},
>> -       {"mdt040", 1},
>> -       {"ncp4200", 1},
>> -       {"ncp4208", 1},
>> -       {"pdt003", 1},
>> -       {"pdt006", 1},
>> -       {"pdt012", 1},
>> -       {"pmbus", 0},
>> -       {"tps40400", 1},
>> -       {"tps544b20", 1},
>> -       {"tps544b25", 1},
>> -       {"tps544c20", 1},
>> -       {"tps544c25", 1},
>> -       {"udt020", 1},
>> +       {"adp4000", generic_sensor},
>> +       {"bmr453", generic_sensor},
>> +       {"bmr454", generic_sensor},
>> +       {"mdt040", generic_sensor},
>> +       {"ncp4200", generic_sensor},
>> +       {"ncp4208", generic_sensor},
>> +       {"pdt003", generic_sensor},
>> +       {"pdt006", generic_sensor},
>> +       {"pdt012", generic_sensor},
>> +       {"pmbus", pmbus},
>> +       {"tps40400", generic_sensor},
>> +       {"tps544b20", generic_sensor},
>> +       {"tps544b25", generic_sensor},
>> +       {"tps544c20", generic_sensor},
>> +       {"tps544c25", generic_sensor},
>> +       {"udt020", generic_sensor},
>>         {}
>>  };
>>
>> @@ -207,8 +248,11 @@ MODULE_DEVICE_TABLE(i2c, pmbus_id);
>>  /* This is the driver that will be inserted */
>>  static struct i2c_driver pmbus_driver = {
>>         .driver = {
>> -                  .name = "pmbus",
>> -                  },
>> +               .name = "pmbus",
>> +#ifdef CONFIG_OF
>> +               .of_match_table = of_match_ptr(generic_pmbus_dt_match),
>> +#endif
>> +       },
>>         .probe = pmbus_probe,
>>         .remove = pmbus_do_remove,
>>         .id_table = pmbus_id,
>>
>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber@corp.rockwellcollins.com.
