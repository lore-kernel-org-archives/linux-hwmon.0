Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:40271 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727734AbeHMBLO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Aug 2018 21:11:14 -0400
Subject: Re: [PATCH] RFC: libata: Add hwmon support for SMART temperature
 sensors
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>,
        Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
References: <20180809222425.17304-1-linus.walleij@linaro.org>
 <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
Message-ID: <cf319e6a-59a9-d6de-79e2-91994177194c@roeck-us.net>
Date: Sun, 12 Aug 2018 15:31:43 -0700
MIME-Version: 1.0
In-Reply-To: <eef62afc-76bd-c9a5-6b12-6ba40b7eca66@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/09/2018 09:15 PM, Guenter Roeck wrote:
> On 08/09/2018 03:24 PM, Linus Walleij wrote:
>> S.M.A.R.T. temperature sensors have been supported for
>> years by userspace tools such as smarttools.
>>
>> The temperature readout is however also a good fit for
>> Linux' hwmon subsystem. By adding a hwmon interface to dig
>> out SMART parameter 194, we can expose the drive temperature
>> as a standard hwmon sensor.
>>
[ ... ]
>> +
>> +static int ata_hwmon_read_temp(struct ata_hwmon *ata, int *temp,
>> +                   int *min, int *max)
>> +{

[ ... ]

>> +        if (id == SMART_TEMP_PROP_194)
>> +            break;

231 also seems to report the temperature if available, as does 190.

Not sure if 190 is worth it, though - Samsung SSD 840 PRO Series supports
it but reports a static value of 28. And it seems to be either as
degrees C or as 100 - degrees C, depending on the drive manufacturer,
which makes it quite unreliable.

[ ... ]

>> +
>> +static int ata_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>> +              u32 attr, int channel, long *val)
>> +{
>> +    struct ata_hwmon *ata = dev_get_drvdata(dev);
>> +    int temp, min, max;
>> +    int ret;
>> +
>> +    if (type != hwmon_temp)
>> +        return -EINVAL;
>> +
>> +    ret = ata_hwmon_read_temp(ata, &temp, &min, &max);
>> +    if (ret)
>> +        return ret;
>> +
>> +    switch (attr) {
>> +    case hwmon_temp_input:
>> +        *val = temp;
>> +        break;
>> +    case hwmon_temp_min:
>> +        *val = min;
>> +        break;
>> +    case hwmon_temp_max:
>> +        *val = max;
>> +        break;

Those numbers need to be multiplied by 1,000 (hwmon ABI expects milli-degrees C).

Guenter
