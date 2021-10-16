Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2117DC433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 21:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECF9F60EE5
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 21:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhJPV2K (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Oct 2021 17:28:10 -0400
Received: from mout.gmx.net ([212.227.17.22]:37533 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230062AbhJPV2K (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Oct 2021 17:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634419544;
        bh=jgM+A5jgDzocR1lhSK7ZzMe1SeAMdw1fuvly1QiLNXk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=dp8O6E1vc6t51ohskcjGKgfZYXzV4CzNGjIGZnsvDLfHkuwTlY/mYDRSIqlD38Zxs
         ehwafIpLNr0w9njBblA/6rKJ6j4VaHZ5NLJrum+6AMpVbyfbjg6u9Cd/Bo0ThPSOXM
         +C7DxG61iCirWNmxEUI6aeyA2wKG93oq1Mcm1QSY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.42] ([91.137.126.34]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2Jt-1nFKjO44q9-00e2U6; Sat, 16
 Oct 2021 23:25:44 +0200
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
 <20211013185113.GA3336263@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <747f759b-22df-3f0f-f2a0-75ff56468853@gmx.de>
Date:   Sat, 16 Oct 2021 23:25:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211013185113.GA3336263@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:gbSHKgZqO9a3SKcFca/7YhMlWqw689c5A1z6L0cPJDNhQ0vj1fX
 WpD1PUEan+25931u3QZd+m2sfdu5HsDhcdhTUy6FhDrD/sI+Tzsg42Nmgh90RmIHU6otMtB
 TMs1fIZKjPVmN/nLnftlFngp67AxYDtLAnPkSDSE1zczoTsXeu7PUSZ4/IQU3/mBrAI+UeI
 7OMcc/A6tTJvOnepNr2vQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GNwrHG/ZF/Q=:GBea9TT2eiyHKv5YwAS+tZ
 Lnj9Aj2NnWERpgPzXvjmd54tMtBPIniurdpXo6uOJDKHZ4GmYL0fRDrGJbBsMrmMr9OozHVYs
 DFELdP2cDMC6tKMWcKgWBC+mclP006l86JKzVytLdQIU5EI4C0mXtkMF7SEA2kgqRjkCiXB5e
 kZeVuvwFh2nkK/fhwqvV13H9vohNi/Qm9AtZI7gIKQ9lZlI5r3HSDgkaZ6azDx7EnhaFW7xH8
 zTvVBj4jbEE0x2trQpMmVB2O5HAGHO/C9EvPmUjCEw+gXImJE+C6cVNI9DPnDCvpDeXiJ3HUG
 1BWJ4+H0mOGkngmiDxWWXWOtk/7y6lhMirpGNfWIpComUoDf4DBvRVWAvjnx1lGO9D37MtmYR
 YTGTuKWPG+198PrJbIUH+vjwpvAgKUVFWoRAeqT7UwkpzlXJq4YlT1ljjvxWWNeJz68USMDaM
 n8y2FT3exc2gsiorrS+rxG/lckMqzE2pdSl4ukKCGTSWctKgNedSw9U7ep2/ehGsNvz0M0bkp
 bn65L+iDvpuU8B+bGQRu0ag6wE+IDeeIU7PzQC5kCsjGIKthIp7crWGEsYLPm5FvY7EmmAL/B
 cU2rbHEAGMm6eVqYKFwuImb3RRMK/fZV3sUz3dOG+5Q4nuN+mdQ68CnMDb28mOF33fcHty9h+
 vvAsOw73VkMBSzuR9Z6H1BA7IYXwQPiKrjXXSysRM4YaRgICjvf8TDoUB9qP/uQPpEBpioPZj
 2gPVAZk+QAtFKxN958B0MzHw9BH7/EzWQ31PxTm5rxV5cETPks/d5DAU9WYFDlkHAHu+8RpiU
 etEbLmMMw4LkQsJT/1J2tZZuydrKyvU1my/25qKgb+YkA0d01PfeqdaYvAykFOaaEYUAuHcqV
 t7DH0GKsVge32KK5IfQqcomi1T5Ty1+o1IMPJscj+T0Ye+4p2rFaTb2f2V2PlnV9KDl5pQMo/
 r28UopEdL/00oW2DmyqIYzdCddM6OzZ46vGG4D6zI+vRDMe1lgy4pATGKhtvHrNqVsNrAHyZ4
 Ib0VwAzpk5/pz+mtKn/jpjWIG80hpMnfL/MrT76/8Av6MfCzLvGqYbriVgK8aVG3hmcYon5No
 ffVHvAAZWIc5FY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 13.10.21 um 20:51 schrieb Guenter Roeck:
> On Mon, Sep 27, 2021 at 12:10:43AM +0200, W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> The nominal speed of each fan can be obtained with
>> i8k_get_fan_nominal_speed(), however the result is not available
>> from userspace.
>> Change that by adding fanX_min, fanX_max and fanX_target attributes.
>> All are RO since fan control happens over pwm.
>>
>> Tested on a Dell Inspiron 3505 and a Dell Latitude C600.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
> Applied.
>
> Thanks,
> Guenter
>
>> ---
>>   Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
>>   drivers/hwmon/dell-smm-hwmon.c         | 61 +++++++++++++++++++++++--=
-
>>   2 files changed, 58 insertions(+), 6 deletions(-)
>>
>> --
>> 2.20.1
>>
>> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwm=
on/dell-smm-hwmon.rst
>> index 3bf77a5df995..beec88491171 100644
>> --- a/Documentation/hwmon/dell-smm-hwmon.rst
>> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
>> @@ -34,6 +34,9 @@ Name				Perm	Description
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>   fan[1-3]_input                  RO      Fan speed in RPM.
>>   fan[1-3]_label                  RO      Fan label.
>> +fan[1-3]_min                    RO      Minimal Fan speed in RPM
>> +fan[1-3]_max                    RO      Maximal Fan speed in RPM
>> +fan[1-3]_target                 RO      Expected Fan speed in RPM
>>   pwm[1-3]                        RW      Control the fan PWM duty-cycl=
e.
>>   pwm1_enable                     WO      Enable or disable automatic B=
IOS fan
>>                                           control (not supported on all=
 laptops,
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hw=
mon.c
>> index 774c1b0715d9..476f2a74bd8c 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -76,6 +76,7 @@ struct dell_smm_data {
>>   	int temp_type[DELL_SMM_NO_TEMP];
>>   	bool fan[DELL_SMM_NO_FANS];
>>   	int fan_type[DELL_SMM_NO_FANS];
>> +	int *fan_nominal_speed[DELL_SMM_NO_FANS];
>>   };
>>
>>   MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>> @@ -673,6 +674,13 @@ static umode_t dell_smm_is_visible(const void *drv=
data, enum hwmon_sensor_types
>>   			if (data->fan[channel] && !data->disallow_fan_type_call)
>>   				return 0444;
>>
>> +			break;
>> +		case hwmon_fan_min:
>> +		case hwmon_fan_max:
>> +		case hwmon_fan_target:
>> +			if (data->fan_nominal_speed[channel])
>> +				return 0444;
>> +
>>   			break;
>>   		default:
>>   			break;
>> @@ -740,6 +748,25 @@ static int dell_smm_read(struct device *dev, enum =
hwmon_sensor_types type, u32 a
>>
>>   			*val =3D ret;
>>
>> +			return 0;
>> +		case hwmon_fan_min:
>> +			*val =3D data->fan_nominal_speed[channel][0];
>> +
>> +			return 0;
>> +		case hwmon_fan_max:
>> +			*val =3D data->fan_nominal_speed[channel][data->i8k_fan_max];
>> +
>> +			return 0;
>> +		case hwmon_fan_target:
>> +			ret =3D i8k_get_fan_status(data, channel);
>> +			if (ret < 0)
>> +				return ret;
>> +
>> +			if (ret > data->i8k_fan_max)
>> +				ret =3D data->i8k_fan_max;
>> +
>> +			*val =3D data->fan_nominal_speed[channel][ret];
>> +
>>   			return 0;
>>   		default:
>>   			break;
>> @@ -889,9 +916,12 @@ static const struct hwmon_channel_info *dell_smm_i=
nfo[] =3D {
>>   			   HWMON_T_INPUT | HWMON_T_LABEL
>>   			   ),
>>   	HWMON_CHANNEL_INFO(fan,
>> -			   HWMON_F_INPUT | HWMON_F_LABEL,
>> -			   HWMON_F_INPUT | HWMON_F_LABEL,
>> -			   HWMON_F_INPUT | HWMON_F_LABEL
>> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +			   HWMON_F_TARGET,
>> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +			   HWMON_F_TARGET,
>> +			   HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_MIN | HWMON_F_MAX |
>> +			   HWMON_F_TARGET
>>   			   ),
>>   	HWMON_CHANNEL_INFO(pwm,
>>   			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> @@ -910,7 +940,7 @@ static int __init dell_smm_init_hwmon(struct device=
 *dev)
>>   {
>>   	struct dell_smm_data *data =3D dev_get_drvdata(dev);
>>   	struct device *dell_smm_hwmon_dev;
>> -	int i, err;
>> +	int i, state, err;
>>
>>   	for (i =3D 0; i < DELL_SMM_NO_TEMP; i++) {
>>   		data->temp_type[i] =3D i8k_get_temp_type(i);
>> @@ -926,8 +956,27 @@ static int __init dell_smm_init_hwmon(struct devic=
e *dev)
>>   		err =3D i8k_get_fan_status(data, i);
>>   		if (err < 0)
>>   			err =3D i8k_get_fan_type(data, i);
>> -		if (err >=3D 0)
>> -			data->fan[i] =3D true;
>> +
>> +		if (err < 0)
>> +			continue;
>> +
>> +		data->fan[i] =3D true;
>> +		data->fan_nominal_speed[i] =3D devm_kmalloc_array(dev, data->i8k_fan=
_max + 1,
>> +								sizeof(*data->fan_nominal_speed[i]),
>> +								GFP_KERNEL);
>> +		if (!data->fan_nominal_speed[i])
>> +			continue;
>> +
>> +		for (state =3D 0; state <=3D data->i8k_fan_max; state++) {
>> +			err =3D i8k_get_fan_nominal_speed(data, i, state);
>> +			if (err < 0) {
>> +				/* Mark nominal speed table as invalid in case of error */
>> +				devm_kfree(dev, data->fan_nominal_speed[i]);
>> +				data->fan_nominal_speed[i] =3D NULL;
>> +				break;
>> +			}
>> +			data->fan_nominal_speed[i][state] =3D err;
>> +		}
>>   	}
>>
>>   	dell_smm_hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "de=
ll_smm", data,
After looking at hwmon-next today, i noticed that this patch was
apparently removed.
Is there a issue with this patch causing the revert?
