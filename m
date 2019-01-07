From: "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>
To: linux-hwmon@vger.kernel.org
Date: Sun, 06 Jan 2019 18:53:03 -0800
Subject: Re: [PATCH 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with driver_data
In-Reply-To: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
Message-ID: <0d61e25645bf457ebb55e4c3f64bcb63@HXTBJIDCEMVIW02.hxtcorp.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Hi, Guenter,
  Thanks for reply.

On 2019/1/4 22:54, Guenter Roeck wrote:
> On 1/4/19 12:55 AM, Xiaoting Liu wrote:
>> Current code compares device name with name in i2c_device_id to decide
>> whether PMBUS_SKIP_STATUS_CHECK should be set in pmbus_platform_data,
>> which makes adding new devices with PMBUS_SKIP_STATUS_CHECK should also
>> modify code in pmbus_probe().
>>
>> This patch adds pmbus_device_info to save pages and flags. Its pointer
>> is put in driver_data of i2c_device_id, which makes adding new device
>> more straightforward.
>>
> 
> Good idea, but I don't see at this time where the patch is needed.
> Maybe in patch 3/4 which is missing from the series ?

The reason we figure out this patch is that we want to add dps650ab to
pmbus_id[] in pmbus.c. As dps650ab has flag of PMBUS_SKIP_STATUS_CHECK
and we don't want to change pmbus_probe(), so make this patch as a
premise patch.
As you stated that adding both dps650ab in pmbus.c and adding a separate
dps650ab driver file is a conceptional mistake, I will work with
Xiaoting to decide which approach we should use.

> 
>> Signed-off-by: Shunyong Yang <shunyong.y...@hxt-semitech.com>
>> Signed-off-by: Xiaoting Liu <xiaoting....@hxt-semitech.com>
>> ---
>>   drivers/hwmon/pmbus/pmbus.c | 54 
>> +++++++++++++++++++++++++++------------------
>>   include/linux/pmbus.h       |  5 +++++
>>   2 files changed, 37 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
>> index 7688dab32f6e..aa4cf9636e99 100644
>> --- a/drivers/hwmon/pmbus/pmbus.c
>> +++ b/drivers/hwmon/pmbus/pmbus.c
>> @@ -172,13 +172,15 @@ static int pmbus_probe(struct i2c_client *client,
>>          struct pmbus_driver_info *info;
>>          struct pmbus_platform_data *pdata = NULL;
>>          struct device *dev = &client->dev;
>> +       struct pmbus_device_info *device_info;
>>
>>          info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), 
>> GFP_KERNEL);
>>          if (!info)
>>                  return -ENOMEM;
>>
>> -       if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps800") ||
>> -           !strcmp(id->name, "sgd009")) {
>> +       device_info = (struct pmbus_device_info *)id->driver_data;
>> +
>> +       if (device_info->flags & PMBUS_SKIP_STATUS_CHECK) {
>>                  pdata = devm_kzalloc(dev, sizeof(struct 
>> pmbus_platform_data),
>>                                       GFP_KERNEL);
>>                  if (!pdata)
>> @@ -187,36 +189,44 @@ static int pmbus_probe(struct i2c_client *client,
>>                  pdata->flags = PMBUS_SKIP_STATUS_CHECK;
>>          }
>>
>> -       info->pages = id->driver_data;
>> +       info->pages = device_info->pages;
>>          info->identify = pmbus_identify;
>>          dev->platform_data = pdata;
>>
>>          return pmbus_do_probe(client, id, info);
>>   }
>>
>> +static const struct pmbus_device_info default_pmbus_info = {1, 0};
>> +static const struct pmbus_device_info dps460_pmbus_info = {
>> +                               1, PMBUS_SKIP_STATUS_CHECK};
>> +static const struct pmbus_device_info dps800_pmbus_info = {
>> +                               1, PMBUS_SKIP_STATUS_CHECK};
>> +static const struct pmbus_device_info sgd009_pmbus_info = {
>> +                               1, PMBUS_SKIP_STATUS_CHECK};
> 
> Three structures with exactly the same content does not add value.
> Please merge into one with a common name that reflects its use.
>

Thanks. we will following you suggestion to use common name as
pmbus_info_one_skip.

>> +static const struct pmbus_device_info pmbus_info = {0, 0};
> 
> default_pmbus_info and pmbus_info are badly named and ordered.
> The name should reflect that one sets one page and that the other
> leaves the number of pages unset.
> 
> I would suggest three structures and names, such as
> 
> pmbus_info_one
> pmbus_info_one_skip
> pmbus_info_zero
> 
> though I am open to better names.

Thanks. We will change.

> 
>>   /*
>>    * Use driver_data to set the number of pages supported by the chip.
>>    */
>>   static const struct i2c_device_id pmbus_id[] = {
>> -       {"adp4000", 1},
>> -       {"bmr453", 1},
>> -       {"bmr454", 1},
>> -       {"dps460", 1},
>> -       {"dps800", 1},
>> -       {"mdt040", 1},
>> -       {"ncp4200", 1},
>> -       {"ncp4208", 1},
>> -       {"pdt003", 1},
>> -       {"pdt006", 1},
>> -       {"pdt012", 1},
>> -       {"pmbus", 0},
>> -       {"sgd009", 1},
>> -       {"tps40400", 1},
>> -       {"tps544b20", 1},
>> -       {"tps544b25", 1},
>> -       {"tps544c20", 1},
>> -       {"tps544c25", 1},
>> -       {"udt020", 1},
>> +       {"adp4000", (kernel_ulong_t)&default_pmbus_info},
>> +       {"bmr453", (kernel_ulong_t)&default_pmbus_info},
>> +       {"bmr454", (kernel_ulong_t)&default_pmbus_info},
>> +       {"dps460", (kernel_ulong_t)&dps460_pmbus_info},
>> +       {"dps800", (kernel_ulong_t)&dps800_pmbus_info},
>> +       {"mdt040", (kernel_ulong_t)&default_pmbus_info},
>> +       {"ncp4200", (kernel_ulong_t)&default_pmbus_info},
>> +       {"ncp4208", (kernel_ulong_t)&default_pmbus_info},
>> +       {"pdt003", (kernel_ulong_t)&default_pmbus_info},
>> +       {"pdt006", (kernel_ulong_t)&default_pmbus_info},
>> +       {"pdt012", (kernel_ulong_t)&default_pmbus_info},
>> +       {"pmbus", (kernel_ulong_t)&pmbus_info},
>> +       {"sgd009", (kernel_ulong_t)&sgd009_pmbus_info},
>> +       {"tps40400", (kernel_ulong_t)&default_pmbus_info},
>> +       {"tps544b20", (kernel_ulong_t)&default_pmbus_info},
>> +       {"tps544b25", (kernel_ulong_t)&default_pmbus_info},
>> +       {"tps544c20", (kernel_ulong_t)&default_pmbus_info},
>> +       {"tps544c25", (kernel_ulong_t)&default_pmbus_info},
>> +       {"udt020", (kernel_ulong_t)&default_pmbus_info},
>>          {}
>>   };
>>
>> diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
>> index ee3c2aba2a8e..3c05edad7666 100644
>> --- a/include/linux/pmbus.h
>> +++ b/include/linux/pmbus.h
>> @@ -46,4 +46,9 @@ struct pmbus_platform_data {
>>          struct regulator_init_data *reg_init_data;
>>   };
>>
>> +struct pmbus_device_info {
>> +       int pages;
>> +       u32 flags;
>> +};
>> +
> 
> This should not be needed here. The structure can be declared locally
> in pmbus.c (its use in patch 4/4 is wrong).
>

OK. We will move the structure back to pmbus.c. And we will decide
whether we need 4/4.

Thanks.
Shunyong.


>>   #endif /* _PMBUS_H_ */
>> --
>> 1.8.3.1
>>
>>
>>
>>
>> This email is intended only for the named addressee. It may contain 
>> information that is confidential/private, legally privileged, or 
>> copyright-protected, and you should handle it accordingly. If you are not 
>> the intended recipient, you do not have legal rights to retain, copy, or 
>> distribute this email or its contents, and should promptly delete the email 
>> and all electronic copies in your system; do not retain copies in any media. 
>> If you have received this email in error, please notify the sender promptly. 
>> Thank you.
>>
>>
>>
> 
> 
