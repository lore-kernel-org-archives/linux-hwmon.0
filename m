Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:36114 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754798AbcJREe7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Oct 2016 00:34:59 -0400
MIME-Version: 1.0
In-Reply-To: <20161017172030.GA19820@roeck-us.net>
References: <20161017080853.7627-1-joel@jms.id.au> <20161017172030.GA19820@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 Oct 2016 15:04:38 +1030
Message-ID: <CACPK8XfJ_VQL1VaWE4-txc0PKJH+c4q+7D_bJ=C_FOctcxfv6w@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (adm1275) Enable adm1278 VOUT sampling
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, Yi Li <adamliyi@msn.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 18, 2016 at 3:50 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Oct 17, 2016 at 06:38:53PM +1030, Joel Stanley wrote:
>> From: Yi Li <adamliyi@msn.com>
>>
>> The adm1278 can optionally monitor the VOUT pin. This functioanltiy is
>> not enabled at reset, so PMON_CONFIG needs to be modified in order to
>> enable it.
>>
>> Signed-off-by: Yi Li <adamliyi@msn.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Applied to -next, after s/functioanltiy/functionality/

Thank you!

And thanks for fixing the grammar and spelling. The author is not a
native speaker, but I could have done a better job at checking.

Cheers,

Joel

>
> Thanks,
> Guenter
>
>> ---
>> v2:
>>  Return an error when unable to enable VOUT monitoring as suggestd by Guenter
>>
>>  drivers/hwmon/pmbus/adm1275.c | 20 ++++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
>> index 3baa4f4a8c5e..9940849351a1 100644
>> --- a/drivers/hwmon/pmbus/adm1275.c
>> +++ b/drivers/hwmon/pmbus/adm1275.c
>> @@ -499,15 +499,27 @@ static int adm1275_probe(struct i2c_client *client,
>>               pindex = 2;
>>               tindex = 3;
>>
>> -             info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT;
>> +             info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
>> +                     PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
>> +
>> +             /* By default when reset VOUT is not enabled */
>
> I also rephrased the comment a bit to make it easier to understand.
>
>> +             if (!(config & ADM1278_VOUT_EN)) {
>> +                     config |= ADM1278_VOUT_EN;
>> +                     ret = i2c_smbus_write_byte_data(client,
>> +                                                     ADM1275_PMON_CONFIG,
>> +                                                     config);
>> +                     if (ret < 0) {
>> +                             dev_err(&client->dev,
>> +                                     "Failed to enable VOUT monitoring\n");
>> +                             return -ENODEV;
>> +                     }
>> +             }
>> +
>>               if (config & ADM1278_TEMP1_EN)
>>                       info->func[0] |=
>>                               PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>>               if (config & ADM1278_VIN_EN)
>>                       info->func[0] |= PMBUS_HAVE_VIN;
>> -             if (config & ADM1278_VOUT_EN)
>> -                     info->func[0] |=
>> -                             PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
>>               break;
>>       case adm1293:
>>       case adm1294:
>> --
>> 2.9.3
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
