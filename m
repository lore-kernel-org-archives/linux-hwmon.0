Received: from mail-ej2-f26.google.com (mail-ej2-f26.google.com [74.125.228.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A3E50255F
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752255; cv=none; b=gjM8oxDePGmHy9w7a0Jfnx2L+zq4S/bUqMoOsFtnYCu8W1xVMK62M7fzX3K0KdxzY3IOg7AzLvPCLrHmGAxCjzG+naO8fIt4BN8RPPf7BqbbjEcy9HQa422zRwaCtjbtnO+TZXxvYIA0559AYTbO2Fdw6dsDjjW1gb0978Nre8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752255; c=relaxed/simple;
	bh=pMGpEi39BEyUo6zCUXVX6ESUaX/7PwRrk/NnMo1pLNs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=T93IJjfFNKzs5EvVEQ0X1tMfcQh1aRus8HqWylHzVLiea86yz4MPOfpohkVFlG0VARxp2sM93L2a944hSEugoEoll1Zdyhg6GA1/SwjVepceUYSYNKvNoK9/1nPEjlLg8ip1h8PajPye2PLfOCY+kVQefRCow2IfvQm1Q8hWyWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=AVPuxZE0; arc=none smtp.client-ip=74.125.228.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="AVPuxZE0"
Received: by mail-ej2-f26.google.com with SMTP id a640c23a62f3a-c2940ef15d3so136492266b.2
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789752251; x=1790357051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dvc/pEW/BAh9vZt3yE6d0wx7vktxXFNO+yS8WEG5HPw=;
        b=AVPuxZE0Go4ylLpuXCX1B+XCYbodO6AB3mz+9eFeOkDcI+468csgyql7g13BThueD8
         g3UQZNaKK0Qr51amDnZEiSKy0IHplH2YO36hEl47mL+KmkEfqot5jJDMgrNIuPudpi2J
         A1AwOjquwvtZiED3jkQDOd517Njk6ymSPK9Kk01leRj9Eoqb+dHX4oiir6l7j5b6BGuR
         oF8jhxSxCYCRw11ZX/mKPY96euvyYj+wIWVtnORZbRaLxx7dlQKkLssOoUBVIm6sQIZ8
         UVx69qCJX+8Blq64+jMQxh3JNBhkPu721thAGkC/mwdzeYW9nt1h0eZW9CVaFmwGnvm5
         yH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752251; x=1790357051;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dvc/pEW/BAh9vZt3yE6d0wx7vktxXFNO+yS8WEG5HPw=;
        b=nQP4Ef/9JGBjWFIvGPQARNFyFXEeazmudk82KiUEaHKCJM/lXLAiXEP9cZpTH5j8dc
         Q1hSMlmKsTj8veQ5v3/95nInFKi+j5u46vvG3dh6de9zt0Z6qt1rzyrYX5rPJm+VZnm/
         jW3yP5TQ/wZG/iIcs9ELP6kotmKVVgHUIfv6BpEliP3cGNtX3LMh9VrKdsXys/qTD1TK
         1rGArdW/1FUgfZ+WyddC/UOjvKYTgFNRrOcZOhqCO3EkQ5k8FjCRNuzjEXOgSmbHsUNd
         X1CX6rIxGIbzU2vIpAl/vNM6+ziZuOnzfAJE5ol4K1S4sjMi/0zigQERzvBLMlz3+aIb
         hgtA==
X-Gm-Message-State: AFuF++lclWY8VVjCN79xZzoq+Y/ZWyQiofG4izRbcVSZ1sWgAZDKW3Rs
	eIzHt3Dlgy3gdW8jVUblR+cG5nH1BOw3Xc1qqGoZHsMacIM71P04QjN5lI44lda8I8c=
X-Gm-Gg: AYBFou28psL4eMNRU8KREWcAU3n2Xf9Nadr92Lin+sL9M6hxEulCKszD3c1YETmk1Kg
	l+5EpMwuZ0TSfylVOODKYhaauohKqIip09tXAytSTDWMOtxWz84iwuuECyJ5L6BZ6ry22xkx29x
	NSnmwcBOm6mHI4bwno7Q8/eEH44wHjwql5irTD2Lbwfq9wVbIr02ilcc/16yi9VaMBCHBbORxlN
	+FD/JIWvAW2GF9ov+0WE5+M5rQu4ZcYhAeKZBr0DmevDTafkO5DUavb19TnnfBz4WswMXuKqSJN
	YHcVfxiCntmcNmy9kxaLDs7osiHBBkmEmG1PuXFXCSitvmsCPNUTfFs5fE4hl8Xj4KGvy+OBfhx
	+4j2Xj0PpWzVpO+Ag6G9N53gWvk7i2c4Z9ETWe3y6Otv9JdIIcNulLVptGpBTvby43FF24c/iyf
	6MxK/Pt2wEXz9gX7STE11hBpD3IaW+/99oj/oWNkHTATI5LiSBBPpNmopxpsouLAAVDQ6u5ISEZ
	r7xNrp4lCDnECPk+qHb7rZ3zXweFBgc0ZHNyRdEkTzlSizr2CojFVnFJ1+X1s8=
X-Received: by 2002:a17:906:9f87:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c2a152e3212mr337280966b.0.1789752251335;
        Fri, 18 Sep 2026 10:24:11 -0700 (PDT)
Received: from ehlo.thunderbird.net (ip-077-020-009-205.vkd66.pools.vodafone-ip.de. [77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm331666b.47.2026.09.18.10.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:24:10 -0700 (PDT)
Date: Fri, 18 Sep 2026 19:24:05 +0200
From: Conor <mail@conchuod.ie>
To: Guenter Roeck <linux@roeck-us.net>, Colin Huang <u8813345@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
CC: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, colin.huang2@amd.com,
 linux-doc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_2/2=5D_hwmon=3A_=28pmbus/tda38740=29?=
 =?US-ASCII?Q?_Add_driver_for_Infineon_TDA38740/TDA38725?=
User-Agent: K-9 Mail for Android
In-Reply-To: <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com> <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com> <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
Message-ID: <2646A11E-8D13-4587-8027-1370E0007F36@conchuod.ie>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 18 September 2026 17:02:38 GMT+02:00, Guenter Roeck <linux@roeck-us=2En=
et> wrote:
>On 9/18/26 03:23, Colin Huang wrote:
>> Add a PMBus driver for Infineon TDA38740 and TDA38725
>> single-voltage synchronous buck regulators=2E
>>=20
>> Signed-off-by: Colin Huang <u8813345@gmail=2Ecom>
>
>For my reference (waiting for DT patch approval):
>
>Reviewed-by: Guenter Roeck <linux@roeck-us=2Enet>

I'm on holiday and only have my phone, and cannot find the binding patch t=
o reply to=2E
I found it on lore and it looks okay=2E

Cheers,
Conor=20

>
>> ---
>>   Documentation/hwmon/index=2Erst    |  1 +
>>   Documentation/hwmon/tda38740=2Erst | 65 +++++++++++++++++++++++++++++=
+++++++++++
>>   drivers/hwmon/pmbus/Kconfig      |  9 ++++++
>>   drivers/hwmon/pmbus/Makefile     |  1 +
>>   drivers/hwmon/pmbus/tda38740=2Ec   | 64 +++++++++++++++++++++++++++++=
++++++++++
>>   5 files changed, 140 insertions(+)
>>=20
>> diff --git a/Documentation/hwmon/index=2Erst b/Documentation/hwmon/inde=
x=2Erst
>> index f07977a20271=2E=2Eaeff87b3d46d 100644
>> --- a/Documentation/hwmon/index=2Erst
>> +++ b/Documentation/hwmon/index=2Erst
>> @@ -265,6 +265,7 @@ Hardware Monitoring Kernel Drivers
>>      sy7636a-hwmon
>>      tc654
>>      tc74
>> +   tda38740
>>      thmc50
>>      tmp102
>>      tmp103
>> diff --git a/Documentation/hwmon/tda38740=2Erst b/Documentation/hwmon/t=
da38740=2Erst
>> new file mode 100644
>> index 000000000000=2E=2E55ce12f14914
>> --- /dev/null
>> +++ b/Documentation/hwmon/tda38740=2Erst
>> @@ -0,0 +1,65 @@
>> +=2E=2E SPDX-License-Identifier: GPL-2=2E0-only
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Kernel driver tda38740
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Supported chips:
>> +  * Infineon TDA38740
>> +  * Infineon TDA38725
>> +
>> +    Prefix: 'tda38740'
>> +
>> +    Addresses scanned: -
>> +
>> +    Datasheet:
>> +      https://www=2Einfineon=2Ecom/row/public/documents/24/49/infineon=
-tda38740-tda38725-datasheet-en=2Epdf
>> +
>> +Author: Colin Huang <u8813345@gmail=2Ecom>
>> +
>> +Description
>> +-----------
>> +
>> +The TDA38740 and TDA38725 are single-output synchronous buck regulator=
s with a
>> +PMBus interface=2E They expose basic voltage, current, power and tempe=
rature
>> +telemetry through the standard PMBus hwmon interfaces=2E
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +curr1_alarm		Input current alarm
>> +curr1_input		Measured input current
>> +curr1_label		"iin"
>> +
>> +curr2_crit		Critical maximum output current
>> +curr2_crit_alarm	Output current critical high alarm
>> +curr2_input		Measured output current
>> +curr2_label		"iout"
>> +
>> +in1_crit		Critical maximum input voltage
>> +in1_crit_alarm		Input voltage critical high alarm
>> +in1_input		Measured input voltage
>> +in1_label		"vin"
>> +
>> +in2_crit		Critical maximum output voltage
>> +in2_crit_alarm		Output voltage critical high alarm
>> +in2_input		Measured output voltage
>> +in2_label		"vout"
>> +in2_lcrit		Critical minimum output voltage
>> +in2_lcrit_alarm		Output voltage critical low alarm
>> +
>> +power1_alarm		Input power alarm
>> +power1_input		Measured input power
>> +power1_label		"pin"
>> +
>> +power2_input		Measured output power
>> +power2_label		"pout"
>> +
>> +temp1_crit		Critical high temperature
>> +temp1_crit_alarm	Chip temperature critical high alarm
>> +temp1_input		Measured temperature
>> +temp1_max		Maximum temperature
>> +temp1_max_alarm		Chip temperature high alarm
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>> index bcfdc4ce4c10=2E=2Ee4ca80dd0574 100644
>> --- a/drivers/hwmon/pmbus/Kconfig
>> +++ b/drivers/hwmon/pmbus/Kconfig
>> @@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
>>   	  If you say yes here you get regulator support for Infineon
>>   	  TDA38640 as regulator=2E
>>   +config SENSORS_TDA38740
>> +	tristate "Infineon TDA38725/TDA38740"
>> +	help
>> +	  If you say yes here you get hardware monitoring support for Infineo=
n
>> +	  TDA38725 and TDA38740=2E
>> +
>> +	  This driver can also be built as a module=2E If so, the module will
>> +	  be called tda38740=2E
>> +
>>   config SENSORS_TPS25990
>>   	tristate "TI TPS25990"
>>   	help
>> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
>> index e288fe72a437=2E=2Eeb06d47816fd 100644
>> --- a/drivers/hwmon/pmbus/Makefile
>> +++ b/drivers/hwmon/pmbus/Makefile
>> @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)	+=3D stef48h28=2Eo
>>   obj-$(CONFIG_SENSORS_SQ24860)	+=3D sq24860=2Eo
>>   obj-$(CONFIG_SENSORS_STPDDC60)	+=3D stpddc60=2Eo
>>   obj-$(CONFIG_SENSORS_TDA38640)	+=3D tda38640=2Eo
>> +obj-$(CONFIG_SENSORS_TDA38740)	+=3D tda38740=2Eo
>>   obj-$(CONFIG_SENSORS_TPS25990)	+=3D tps25990=2Eo
>>   obj-$(CONFIG_SENSORS_TPS40422)	+=3D tps40422=2Eo
>>   obj-$(CONFIG_SENSORS_TPS53679)	+=3D tps53679=2Eo
>> diff --git a/drivers/hwmon/pmbus/tda38740=2Ec b/drivers/hwmon/pmbus/tda=
38740=2Ec
>> new file mode 100644
>> index 000000000000=2E=2E067de07ba9fb
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/tda38740=2Ec
>> @@ -0,0 +1,64 @@
>> +// SPDX-License-Identifier: GPL-2=2E0+
>> +/*
>> + * Hardware monitoring driver for Infineon TDA38725/TDA38740
>> + *
>> + * Copyright (c) 2023 9elements GmbH
>> + *
>> + */
>> +
>> +#include <linux/err=2Eh>
>> +#include <linux/i2c=2Eh>
>> +#include <linux/init=2Eh>
>> +#include <linux/kernel=2Eh>
>> +#include <linux/module=2Eh>
>> +#include "pmbus=2Eh"
>> +
>> +static struct pmbus_driver_info tda38740_info =3D {
>> +	=2Epages =3D 1,
>> +	=2Eformat[PSC_VOLTAGE_IN] =3D linear,
>> +	=2Eformat[PSC_VOLTAGE_OUT] =3D linear,
>> +	=2Eformat[PSC_CURRENT_OUT] =3D linear,
>> +	=2Eformat[PSC_CURRENT_IN] =3D linear,
>> +	=2Eformat[PSC_POWER] =3D linear,
>> +	=2Eformat[PSC_TEMPERATURE] =3D linear,
>> +	=2Efunc[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
>> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
>> +	    | PMBUS_HAVE_IIN
>> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>> +	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
>> +};
>> +
>> +static int tda38740_probe(struct i2c_client *client)
>> +{
>> +	return pmbus_do_probe(client, &tda38740_info);
>> +}
>> +
>> +static const struct i2c_device_id tda38740_id[] =3D {
>> +	{ =2Ename =3D "tda38725"},
>> +	{ =2Ename =3D "tda38740"},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tda38740_id);
>> +
>> +static const struct of_device_id tda38740_of_match[] =3D {
>> +	{ =2Ecompatible =3D "infineon,tda38725"},
>> +	{ =2Ecompatible =3D "infineon,tda38740"},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, tda38740_of_match);
>> +
>> +static struct i2c_driver tda38740_driver =3D {
>> +	=2Edriver =3D {
>> +		=2Ename =3D "tda38740",
>> +		=2Eof_match_table =3D tda38740_of_match,
>> +	},
>> +	=2Eprobe =3D tda38740_probe,
>> +	=2Eid_table =3D tda38740_id,
>> +};
>> +
>> +module_i2c_driver(tda38740_driver);
>> +
>> +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("PMBUS");
>>=20
>
