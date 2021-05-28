Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1420AC47087
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 21:01:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DED276128D
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 21:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhE1VCs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 17:02:48 -0400
Received: from mout.gmx.net ([212.227.17.22]:40953 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229481AbhE1VCs (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 17:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622235656;
        bh=vvMTB4hwNtJhtEs4TIKIVJsSyBv5EFTQHJ77REhYXBk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=HomB2XTG2fkvgK0boBCJ+Y6BFSNYQ9aZt47QhW79m/MmHJJ7qCmFxDhh+BdwgXqx5
         mABaqvSnyxpenfeMA5TfGiMTQYIqdKSG1UK3AXGGcn1/eMIGL94jDga/I2ubujxpZL
         983+TWYBwOFli3WG4l13BHe3cVXa8XiPpBirAiJM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.140] ([79.242.180.99]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8mb-1lA5X03F5x-00f6r9; Fri, 28
 May 2021 23:00:55 +0200
Subject: Re: [PATCH v2 1/6] hwmon: (dell-smm-hwmon) Use platform device
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528173716.10975-2-W_Armin@gmx.de>
 <20210528185343.zxpmxqh7a2qtodhh@pali>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <ffeb79b4-d94a-b898-65e6-7c1308541e9d@gmx.de>
Date:   Fri, 28 May 2021 23:00:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210528185343.zxpmxqh7a2qtodhh@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:hAsqc+/FPFZR9oXG5BAwEd6IGkD+LQqPwXGtJPmn1+zOfSZQqDc
 Z8Iglq8WqRpDo9OX0sUhSfeZuDrt7mv9AYFV+84rz6hd64YTTuCDwerq7E2gD7baG4bEbQM
 lIQ2slAC8a/Lc9FZAJqo1nY34oITIA0kqiKComn7jqqO53yXUC8+ZcZUrKYMSIB2czaFKAT
 Ey8EX/jMCQqy7t4saPEXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YAi+yGGMnKc=:EvaQi9G8j0tcGgjymP2VRX
 F1pwfDzacmoltCPQcaSsIpisTMbJ1iKWQ4GPRyASAmP5aiU0er20tCTUxAnrUsynegznqmYRu
 jFvq90iMIpGka2ZYTivai9W08oRhRRmDnR2bO/yjVCcyAUyFIQ+ns60NkT1prdyD1MrwvM1QN
 WDlNaS/riO1Ls1CuxMSLEIKDyMYo3maNsX9UckHeT4ICfdW6Ys3eWwxktIbmADUBirV5HPIfp
 vgcybk1DWnWoh7hh75lguPRm1fsCS6VOO2ockdWqJCFgweeAydIq58DMkSvuToPLByCzcq5WN
 /6O34olZLH87J06BXUKyKRklrn4XIDnpz1og85Av+PskTXuq+tDSpFJWGokz841g7nra9DVmQ
 F+uH2GDxN19qTOZTocbvqY9dHFU62O9xe4azZE2QvBiTWXwDBnhMO0CDudKhDW435VME4oOI0
 AawWm/6HLkoHMfj1lnQQU301PM0gPcGbDI8duSJ7p/wSrRNwUiOHa6KPDvk5NNHbPZjY2vZZ3
 kyMX9dElskUdBTRiGAvrNbAl9wCt2jqgveM/JsEhSacP5H7OlbjMLbl2pWuXxje0H7OkCZNYb
 SBqvsU3XCP6ECob8VFn5rTcRdSCvoiov64QykoCEjPpFUo3Ox0OjL29AmQsQoAfiHpnckCi4M
 s2HfDv1EgfX1l4Tn32pQ5YqVN5lAYhrrSw87IF2fSU1aRA8QdtetD8P/6PSDTkiazhOPHGrR+
 HEszTcV+i1Y0BnXx+DdyZALN6RYPlLTM9gk2cYgbhacAKNZJl+XX9JboHp0znqRvv9Vv+kCeC
 4iRE0eRmU9MsHLNt08SHYGjicJL6uuviSN/pdZQyyqbsu5hB7FePmYIviAIcXMYT2Qpz9ZvLi
 2N4pQkup4q9xzXcVMx8hz9TWAsgNGg29fTBb8FNcRSJXLGHYv6KdCXTgn+Iip3Nr/zBFw1J/r
 UNWv5EzCC6gvvNdaGDjYmAm385XnN17FzeqTi/aD8FfUMGIs+JYMCDwvcZnEMpXWcWQ/sMEmy
 aw/xIJIb/NG+6nAs7X9AqRLtn8UQuZwqH71fqPHPeUf+nsOxSnKtR6etc0DS8U2kHvQ9UDa/P
 uO8oV/I2axDOQDlGcOpii6C/SQas21ma9y66Gfoj3jtgG/cmDhUsPBwxUmc0rU0TyFnl8VHAU
 7+cpSKGxMEcvKeNosAAW9YG/VpZ8c2ryXxOSxuHQxCFAATd55pIYgJxFAfk73+3tzEXQ0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 28.05.21 20:53 Pali Roh=C3=A1r wrote:

> On Friday 28 May 2021 19:37:11 W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> Register a platform device for usage with
>> devm_hwmon_device_register_with_groups.
>> Also the platform device is necessary for
>> future changes.
> This patch changes output in 'sensors' utility:
>
> Without this patch it prints:
>    dell_smm-virtual-0
>    Adapter: Virtual device
>
> And with patch it prints:
>    dell_smm-isa-0000
>    Adapter: ISA adapter
>
> Interesting is that in this patch there is no reference to ISA and
> neither to Virtual.
>
> I think it needs to be related to symlinks in /sys/class/hwmon hierarchy
> as this patch changes it:
>
> (prior)
> $ ll /sys/class/hwmon/hwmon1
> lrwxrwxrwx 1 root root 0 m=C3=A1j 28 20:42 /sys/class/hwmon/hwmon1 -> ..=
/../devices/virtual/hwmon/hwmon1/
>
> (after)
> $ ll /sys/class/hwmon/hwmon1
> lrwxrwxrwx 1 root root 0 m=C3=A1j 28 20:42 /sys/class/hwmon/hwmon1 -> ..=
/../devices/platform/dell_smm_hwmon/hwmon/hwmon1/
>
> But I'm not sure what is correct to print in 'Adapter' section. Both
> Virtual and ISA looks like bogus values for which I do not care.
>
> Guenter, I will this part up to you, what you want to have in output.
>
> Other comments are below.
>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 115 ++++++++++++++++++--------------=
-
>>   1 file changed, 63 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hw=
mon.c
>> index f2221ca0aa7b..2038f2a50e11 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -14,7 +14,9 @@
>>
>>   #include <linux/cpu.h>
>>   #include <linux/delay.h>
>> +#include <linux/err.h>
>>   #include <linux/module.h>
>> +#include <linux/platform_device.h>
>>   #include <linux/types.h>
>>   #include <linux/init.h>
>>   #include <linux/proc_fs.h>
>> @@ -896,7 +898,7 @@ static const struct attribute_group i8k_group =3D {
>>   };
>>   __ATTRIBUTE_GROUPS(i8k);
>>
>> -static int __init i8k_init_hwmon(void)
>> +static int __init dell_smm_init_hwmon(struct device *dev)
>>   {
>>   	int err;
>>
>> @@ -956,15 +958,9 @@ static int __init i8k_init_hwmon(void)
>>   	if (err >=3D 0)
>>   		i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;
>>
>> -	i8k_hwmon_dev =3D hwmon_device_register_with_groups(NULL, "dell_smm",
>> -							  NULL, i8k_groups);
>> -	if (IS_ERR(i8k_hwmon_dev)) {
>> -		err =3D PTR_ERR(i8k_hwmon_dev);
>> -		i8k_hwmon_dev =3D NULL;
>> -		pr_err("hwmon registration failed (%d)\n", err);
>> -		return err;
>> -	}
>> -	return 0;
>> +	i8k_hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, "dell_s=
mm", NULL, i8k_groups);
>> +
>> +	return PTR_ERR_OR_ZERO(i8k_hwmon_dev);
>>   }
>>
>>   struct i8k_config_data {
>> @@ -1221,28 +1217,11 @@ static struct dmi_system_id i8k_whitelist_fan_c=
ontrol[] __initdata =3D {
>>   	{ }
>>   };
>>
>> -/*
>> - * Probe for the presence of a supported laptop.
>> - */
>> -static int __init i8k_probe(void)
>> +static int __init dell_smm_probe(struct platform_device *pdev)
>>   {
>>   	const struct dmi_system_id *id, *fan_control;
>>   	int fan, ret;
>>
>> -	/*
>> -	 * Get DMI information
>> -	 */
>> -	if (!dmi_check_system(i8k_dmi_table)) {
>> -		if (!ignore_dmi && !force)
>> -			return -ENODEV;
>> -
>> -		pr_info("not running on a supported Dell system.\n");
>> -		pr_info("vendor=3D%s, model=3D%s, version=3D%s\n",
>> -			i8k_get_dmi_data(DMI_SYS_VENDOR),
>> -			i8k_get_dmi_data(DMI_PRODUCT_NAME),
>> -			i8k_get_dmi_data(DMI_BIOS_VERSION));
>> -	}
>> -
>>   	if (dmi_check_system(i8k_blacklist_fan_support_dmi_table)) {
>>   		pr_warn("broken Dell BIOS detected, disallow fan support\n");
>>   		if (!force)
>> @@ -1255,21 +1234,11 @@ static int __init i8k_probe(void)
>>   			disallow_fan_type_call =3D true;
>>   	}
>>
>> -	strlcpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
>> +	strscpy(bios_version, i8k_get_dmi_data(DMI_BIOS_VERSION),
>>   		sizeof(bios_version));
>> -	strlcpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
>> +	strscpy(bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
>>   		sizeof(bios_machineid));
> It is intentional to replace strlcpy by strscpy? If yes then I think it
> should be part of other change as this replacement is not related nor
> not needed by platform device registration.

It was because of a checkpatch warning, i will add that to the commit desc=
ription
in the next version.

>> -	/*
>> -	 * Get SMM Dell signature
>> -	 */
>> -	if (i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG1) &&
>> -	    i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG2)) {
>> -		pr_err("unable to get SMM Dell signature\n");
>> -		if (!force)
>> -			return -ENODEV;
>> -	}
>> -
>>   	/*
>>   	 * Set fan multiplier and maximal fan speed from dmi config
>>   	 * Values specified in module parameters override values from dmi
>> @@ -1277,13 +1246,14 @@ static int __init i8k_probe(void)
>>   	id =3D dmi_first_match(i8k_dmi_table);
>>   	if (id && id->driver_data) {
>>   		const struct i8k_config_data *conf =3D id->driver_data;
>> +
>>   		if (!fan_mult && conf->fan_mult)
>>   			fan_mult =3D conf->fan_mult;
>>   		if (!fan_max && conf->fan_max)
>>   			fan_max =3D conf->fan_max;
>>   	}
>>
>> -	i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH;	/* Must not be 0 */
>> +	i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH; /* Must not be 0 */
> This is empty change?
>
> Hm... now I see tab with 1 char size is replaced by space. Quite hard to
> detect this change as it was not mentioned in commit message and such
> tab is visible in most editors in the same way as as space.

My bad, i removed that empty change.

>>   	i8k_pwm_mult =3D DIV_ROUND_UP(255, i8k_fan_max);
>>
>>   	fan_control =3D dmi_first_match(i8k_whitelist_fan_control);
>> @@ -1313,29 +1283,70 @@ static int __init i8k_probe(void)
>>   		i8k_fan_mult =3D fan_mult;
>>   	}
>>
>> +	ret =3D dell_smm_init_hwmon(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	i8k_init_procfs();
>> +
>>   	return 0;
>>   }
>>
>> +static int dell_smm_remove(struct platform_device *pdev)
>> +{
>> +	i8k_exit_procfs();
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver dell_smm_driver =3D {
>> +	.driver		=3D {
>> +		.name	=3D KBUILD_MODNAME,
>> +	},
>> +	.remove		=3D dell_smm_remove,
>> +};
>> +
>> +static struct platform_device *dell_smm_device;
>> +
>> +/*
>> + * Probe for the presence of a supported laptop.
>> + */
>>   static int __init i8k_init(void)
>>   {
>> -	int err;
>> +	/*
>> +	 * Get DMI information
>> +	 */
>> +	if (!dmi_check_system(i8k_dmi_table)) {
>> +		if (!ignore_dmi && !force)
>> +			return -ENODEV;
>>
>> -	/* Are we running on an supported laptop? */
>> -	if (i8k_probe())
>> -		return -ENODEV;
>> +		pr_info("not running on a supported Dell system.\n");
>> +		pr_info("vendor=3D%s, model=3D%s, version=3D%s\n",
>> +			i8k_get_dmi_data(DMI_SYS_VENDOR),
>> +			i8k_get_dmi_data(DMI_PRODUCT_NAME),
>> +			i8k_get_dmi_data(DMI_BIOS_VERSION));
>> +	}
>>
>> -	err =3D i8k_init_hwmon();
>> -	if (err)
>> -		return err;
>> +	/*
>> +	 * Get SMM Dell signature
>> +	 */
>> +	if (i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG1) &&
>> +	    i8k_get_dell_signature(I8K_SMM_GET_DELL_SIG2)) {
>> +		pr_err("unable to get SMM Dell signature\n");
>> +		if (!force)
>> +			return -ENODEV;
>> +	}
>>
>> -	i8k_init_procfs();
>> -	return 0;
>> +	dell_smm_device =3D platform_create_bundle(&dell_smm_driver, dell_smm=
_probe, NULL, 0, NULL,
>> +						 0);
>> +
>> +	return PTR_ERR_OR_ZERO(dell_smm_device);
>>   }
>>
>>   static void __exit i8k_exit(void)
>>   {
>> -	hwmon_device_unregister(i8k_hwmon_dev);
>> -	i8k_exit_procfs();
>> +	platform_device_unregister(dell_smm_device);
>> +	platform_driver_unregister(&dell_smm_driver);
>>   }
>>
>>   module_init(i8k_init);
>> --
>> 2.20.1
>>

