Return-path: <afd@ti.com>
Subject: Re: [PATCH] hwmon: (tmp401) Add support for TI TMP461
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
References: <20160531162720.460-1-afd@ti.com> <57525C13.3040601@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <57584E3D.8070501@ti.com>
Date: Wed, 8 Jun 2016 11:56:29 -0500
MIME-Version: 1.0
In-Reply-To: <57525C13.3040601@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

On 06/03/2016 11:41 PM, Guenter Roeck wrote:
> On 05/31/2016 09:27 AM, Andrew F. Davis wrote:
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>   Documentation/hwmon/tmp401 | 18 +++++++++--
>>   drivers/hwmon/Kconfig      |  2 +-
>>   drivers/hwmon/tmp401.c     | 81
>> ++++++++++++++++++++++++++++++++++++++++++----
>>   3 files changed, 92 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/hwmon/tmp401 b/Documentation/hwmon/tmp401
>> index 711f75e..eaa2d3b 100644
>> --- a/Documentation/hwmon/tmp401
>> +++ b/Documentation/hwmon/tmp401
>> @@ -22,6 +22,9 @@ Supported chips:
>>       Prefix: 'tmp435'
>>       Addresses scanned: I2C 0x48 - 0x4f
>>       Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp435.html
>> +  * Texas Instruments TMP461
>> +    Prefix: 'tmp461'
>> +    Datasheet: http://www.ti.com/product/tmp461
>>
>>   Authors:
>>            Hans de Goede <hdegoede@redhat.com>
>> @@ -31,8 +34,8 @@ Description
>>   -----------
>>
>>   This driver implements support for Texas Instruments TMP401, TMP411,
>> -TMP431, TMP432 and TMP435 chips. These chips implement one or two remote
>> -and one local temperature sensors. Temperature is measured in degrees
>> +TMP431, TMP432, TMP435, and TMP461 chips. These chips implement one
>> or two
>> +remote and one local temperature sensors. Temperature is measured in
>> degrees
>>   Celsius. Resolution of the remote sensor is 0.0625 degree. Local
>>   sensor resolution can be set to 0.5, 0.25, 0.125 or 0.0625 degree (not
>>   supported by the driver so far, so using the default resolution of 0.5
>> @@ -55,3 +58,14 @@ some additional features.
>>
>>   TMP432 is compatible with TMP401 and TMP431. It supports two external
>>   temperature sensors.
>> +
>> +TMP461 is compatible with TMP401. It supports offset and n-factor
>> correction
>> +that is applied to the remote sensor.
>> +
>> +* Sensor offset values are temperature values
>> +
>> +  Exported via sysfs attribute tempX_offset
>> +
>> +* n-factor correction, values are in raw form as described in the
>> datasheet
>> +
> 
> If you don't mind, I would prefer if you would drop this attribute, at
> least
> for now, for a number of reasons. It should not really be controlled by
> a sysfs
> attribute, but either with devicetree data or platform data. Exposing a raw
> register value through sysfs isn't really desirable; sysfs is supposed
> to provide some kind of abstraction. It enables setting the n-factor,
> but not beta-compensation which is probably equally desirable.
> Last but not least, other chips supported by this driver, as well as
> other chips
> supported by hwmon, also support  n-factor correction and
> beta-compensation.
> If we provide this functionality we should provide it for all chips in a
> generic way. In short, this needs more discussion.
> 

Makes sense, will drop this attribute for now.

> Couple of additional additional comments below.
> 
> Thanks,
> Guenter
> 
> 
>> +  Exported via sysfs attribute tempX_nfactor
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index ff94007..c571dcf 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1561,7 +1561,7 @@ config SENSORS_TMP401
>>       depends on I2C
>>       help
>>         If you say yes here you get support for Texas Instruments TMP401,
>> -      TMP411, TMP431, TMP432 and TMP435 temperature sensor chips.
>> +      TMP411, TMP431, TMP432, TMP435, and TMP461 temperature sensor
>> chips.
>>
>>         This driver can also be built as a module.  If so, the module
>>         will be called tmp401.
>> diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
>> index ccf4cff..280065b 100644
>> --- a/drivers/hwmon/tmp401.c
>> +++ b/drivers/hwmon/tmp401.c
>> @@ -47,7 +47,8 @@
>>   static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4c,
>> 0x4d,
>>       0x4e, 0x4f, I2C_CLIENT_END };
>>
>> -enum chips { tmp401, tmp411, tmp431, tmp432, tmp435 };
>> +enum chips { tmp401, tmp411, tmp431, tmp432, tmp435, tmp461 };
>> +
>>
> Please no double empty lines.
> 

ACK

>>   /*
>>    * The TMP401 registers, note some registers have different
>> addresses for
>> @@ -62,31 +63,37 @@ enum chips { tmp401, tmp411, tmp431, tmp432,
>> tmp435 };
>>   #define TMP401_MANUFACTURER_ID_REG        0xFE
>>   #define TMP401_DEVICE_ID_REG            0xFF
>>
>> -static const u8 TMP401_TEMP_MSB_READ[6][2] = {
>> +static const u8 TMP401_TEMP_MSB_READ[8][2] = {
>>       { 0x00, 0x01 },    /* temp */
>>       { 0x06, 0x08 },    /* low limit */
>>       { 0x05, 0x07 },    /* high limit */
>>       { 0x20, 0x19 },    /* therm (crit) limit */
>>       { 0x30, 0x34 },    /* lowest */
>>       { 0x32, 0x36 },    /* highest */
>> +    { 0, 0x11 },    /* offset */
>> +    { 0, 0x23 },    /* nfactor */
>>   };
>>
>> -static const u8 TMP401_TEMP_MSB_WRITE[6][2] = {
>> +static const u8 TMP401_TEMP_MSB_WRITE[8][2] = {
>>       { 0, 0 },    /* temp (unused) */
>>       { 0x0C, 0x0E },    /* low limit */
>>       { 0x0B, 0x0D },    /* high limit */
>>       { 0x20, 0x19 },    /* therm (crit) limit */
>>       { 0x30, 0x34 },    /* lowest */
>>       { 0x32, 0x36 },    /* highest */
>> +    { 0, 0x11 },    /* offset */
>> +    { 0, 0x23 },    /* nfactor */
>>   };
>>
>> -static const u8 TMP401_TEMP_LSB[6][2] = {
>> +static const u8 TMP401_TEMP_LSB[8][2] = {
>>       { 0x15, 0x10 },    /* temp */
>>       { 0x17, 0x14 },    /* low limit */
>>       { 0x16, 0x13 },    /* high limit */
>>       { 0, 0 },    /* therm (crit) limit (unused) */
>>       { 0x31, 0x35 },    /* lowest */
>>       { 0x33, 0x37 },    /* highest */
>> +    { 0, 0x12 },    /* offset */
>> +    { 0, 0 },    /* nfactor (unused) */
>>   };
>>
>>   static const u8 TMP432_TEMP_MSB_READ[4][3] = {
>> @@ -149,6 +156,7 @@ static const struct i2c_device_id tmp401_id[] = {
>>       { "tmp431", tmp431 },
>>       { "tmp432", tmp432 },
>>       { "tmp435", tmp435 },
>> +    { "tmp461", tmp461 },
> 
> Please also provide code in the detect function to auto-detect the chip.
> 

It looks like the ID reg has been removed (at least from the datasheet)
so I'm not sure there is any good way to ID this part.

Andrew

>>       { }
>>   };
>>   MODULE_DEVICE_TABLE(i2c, tmp401_id);
>> @@ -170,7 +178,7 @@ struct tmp401_data {
>>       /* register values */
>>       u8 status[4];
>>       u8 config;
>> -    u16 temp[6][3];
>> +    u16 temp[8][3];
>>       u8 temp_crit_hyst;
>>   };
>>
>> @@ -445,6 +453,44 @@ static ssize_t reset_temp_history(struct device
>> *dev,
>>       return count;
>>   }
>>
>> +static ssize_t show_nfactor(struct device *dev,
>> +                struct device_attribute *devattr, char *buf)
>> +{
>> +    int nr = to_sensor_dev_attr_2(devattr)->nr;
>> +    int index = to_sensor_dev_attr_2(devattr)->index;
>> +    struct tmp401_data *data = tmp401_update_device(dev);
>> +
>> +    if (IS_ERR(data))
>> +        return PTR_ERR(data);
>> +
>> +    return sprintf(buf, "%d\n", data->temp[nr][index]);
>> +}
>> +
>> +static ssize_t store_nfactor(struct device *dev,
>> +                 struct device_attribute *devattr,
>> +                 const char *buf, size_t count)
>> +{
>> +    int nr = to_sensor_dev_attr_2(devattr)->nr;
>> +    int index = to_sensor_dev_attr_2(devattr)->index;
>> +    struct tmp401_data *data = dev_get_drvdata(dev);
>> +    struct i2c_client *client = data->client;
>> +    long val;
>> +    u8 regaddr;
>> +
>> +    if (kstrtol(buf, 10, &val))
>> +        return -EINVAL;
>> +    val = clamp_val(val, -128, 127);
>> +
>> +    regaddr = TMP401_TEMP_MSB_WRITE[nr][index];
>> +
>> +    mutex_lock(&data->update_lock);
>> +    i2c_smbus_write_byte_data(client, regaddr, val);
>> +    data->temp[nr][index] = val;
>> +    mutex_unlock(&data->update_lock);
>> +
>> +    return count;
>> +}
>> +
>>   static ssize_t show_update_interval(struct device *dev,
>>                       struct device_attribute *attr, char *buf)
>>   {
>> @@ -613,6 +659,26 @@ static const struct attribute_group tmp432_group = {
>>   };
>>
>>   /*
>> + * Additional features of the TMP461 chip.
>> + * The TMP461 η-factor correction and temperature offset
>> + * for the remote channel.
>> + */
>> +static SENSOR_DEVICE_ATTR_2(temp2_offset, S_IWUSR | S_IRUGO, show_temp,
>> +                store_temp, 6, 1);
>> +static SENSOR_DEVICE_ATTR_2(temp2_nfactor, S_IWUSR | S_IRUGO,
>> show_nfactor,
>> +                store_nfactor, 7, 1);
>> +
>> +static struct attribute *tmp461_attributes[] = {
>> +    &sensor_dev_attr_temp2_offset.dev_attr.attr,
>> +    &sensor_dev_attr_temp2_nfactor.dev_attr.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group tmp461_group = {
>> +    .attrs = tmp461_attributes,
>> +};
>> +
>> +/*
>>    * Begin non sysfs callback code (aka Real code)
>>    */
>>
>> @@ -714,7 +780,7 @@ static int tmp401_probe(struct i2c_client *client,
>>               const struct i2c_device_id *id)
>>   {
>>       static const char * const names[] = {
>> -        "TMP401", "TMP411", "TMP431", "TMP432", "TMP435"
>> +        "TMP401", "TMP411", "TMP431", "TMP432", "TMP435", "TMP461"
>>       };
>>       struct device *dev = &client->dev;
>>       struct device *hwmon_dev;
>> @@ -745,6 +811,9 @@ static int tmp401_probe(struct i2c_client *client,
>>       if (data->kind == tmp432)
>>           data->groups[groups++] = &tmp432_group;
>>
>> +    if (data->kind == tmp461)
>> +        data->groups[groups++] = &tmp461_group;
>> +
>>       hwmon_dev = devm_hwmon_device_register_with_groups(dev,
>> client->name,
>>                                  data, data->groups);
>>       if (IS_ERR(hwmon_dev))
>>
> 
