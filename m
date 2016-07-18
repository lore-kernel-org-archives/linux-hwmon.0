Return-path: <thilo@cestona.ro>
Subject: Re: [PATCH v7] hwmon: added kernel module for FTS BMC chip "Teutates"
To: Guenter Roeck <linux@roeck-us.net>,
  Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
References: <1468842689-31582-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
 <578CEA7D.6000704@roeck-us.net>
Cc: linux-hwmon <linux-hwmon@vger.kernel.org>
From: Thilo Cestonaro <thilo@cestona.ro>
Message-ID: <578CF7CC.7070904@cestona.ro>
Date: Mon, 18 Jul 2016 17:37:48 +0200
MIME-Version: 1.0
In-Reply-To: <578CEA7D.6000704@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Am 18.07.2016 um 16:41 schrieb Guenter Roeck:
> On 07/18/2016 04:51 AM, Thilo Cestonaro wrote:
>> From: Thilo Cestonaro <thilo@cestona.ro>
>>
>> This driver implements support for the FTS BMC Chip "Teutates".
>>
>> Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>
>> ---
>
> [ ... ]
>
>> +
>> +/*****************************************************************************/
>>
>> +/* Module initialization / remove functions                     */
>> +/*****************************************************************************/
>>
>> +static int fts_remove(struct i2c_client *client)
>> +{
>> +    struct fts_data *data = dev_get_drvdata(&client->dev);
>> +
>> +    watchdog_unregister_device(&data->wdd);
>> +    return 0;
>> +}
>> +
>> +static int fts_probe(struct i2c_client *client, const struct
>> i2c_device_id *id)
>> +{
>> +    u8 revision;
>> +    struct fts_data *data;
>> +    int err;
>> +    s8 deviceid;
>
> One (hopefully) last question: Effectively this means that any device
> ID >=0x80
> will be identified as error. Is this on purpose ? It is quite unusual.
The driver looks especially for 0x11, which means 0x10 - Baseboard
Management Controller and 0x01 Teutates. (spec. page 8, Page 0 Offset 0)
So anything not 1Xh will be an error ENODEV and then the switch filters
for X1h and all not 01h will be an error ENODEV, as this driver isn't
written for anything different to 0x11.
So "s8" is ok here.

Thanks!

Cheers,
Thilo
>
> Thanks,
> Guenter
>
