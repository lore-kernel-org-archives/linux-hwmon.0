Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D63D6CC8
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446525; cv=none; b=euiDu7/HdErVTkmnJ63VqaxVhViLwgmvM9v/XHXu2qVzY7i8EwGCLScMCEqcKYWpvXi19WTPOLz1H1zKroEe2aK19W0FK2pfQ6KGyBrE4rBpSoc/fibeP9cHR7NQeKsLMtixZMTnR41v2KoL6mooe/k26z4dWdLR+xR7M9mrxMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446525; c=relaxed/simple;
	bh=lF0z8ri7UcMqg98TJWNaJmH3xKgmaPnFWaGfCQ010AI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LA7008+eI8PigEVC9+WiEcI1W0Y/oc4eEM78MlObyw4jq/qE/8Xpejy1gMlZhTNYdKmzbdwTQG0Z/YsGdczzP/LX3v/jYwj8POQgG2kHSV3zSklAfzGQIjd3vnq6Iw6tjXW6atV+qcGKT2LJKoGlrnDobQoyboyszjAjAOJ/ftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3039O7X; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3039O7X"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12a695044a4so4545152c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 06:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774446515; x=1775051315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SlY41DQVJlOz8j1Vseluu3wKx7l+aV7XhtjQbxVwE6s=;
        b=G3039O7XuthOu28eexxyWTdFNOWSjXaqI4yW3/X/xjR7bzxEphjSWLieWr6gyVcAoi
         QekWIlsTBe92nbm8IYdUp6UNsZusaG3PoGCNUWfXj311i7Nvczqk9zm47LsCQ+2m4vG+
         TODl6ekQBUxjf71/l8j9w1NPkDiVONxAdcFj7Zdz39Bi1gKg269YkFJeJ64OyA9UONC1
         GU+KUHMNvYMMfhy+SjKDEBnMqzUHPLkRqadD6vrdMZViR0eLeK2WXJ099ebcaDH24R1b
         eHiKkRRSbeyIijewG41l2wjeqjQLgbGne3kO4EFXziUJhHiVCb0AYXUdiHDg/jDm0F54
         kiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774446515; x=1775051315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlY41DQVJlOz8j1Vseluu3wKx7l+aV7XhtjQbxVwE6s=;
        b=ETxBLNe7WdRbueCadjUeuPisUkNEY1CXuWPg5/ZqQdPOqmauKIscSRe0rf/0Q3bAf+
         Qz5zk4EPS9qMJW724VR2HsAC+ztuvxwbG8YokYLnbWtZ6oXpL63wtqncESYEeDOB/HUs
         v9pOoMELkcCGDvdvRtvAjUARFl/u7JzBZlqOJMskinsurMq4NXZ3f4w2VRVGwXC9/1fA
         N/KVVRLiWBn44ox6mUi/ps1yy3eOOxIoTRJTHpBULtUVXI0DK4MZXqC8M1s9Fh2xmX8h
         8+4oLvpjBTt33blTqruL5RSotEFaxl8kOx+rOKNuFUtcA/nF6yFtySW/9ASfeGdBWKi9
         NCMA==
X-Forwarded-Encrypted: i=1; AJvYcCXlMHuJJlGWSJrcp8s+PreW9hkMJsEtt2Y/gYHqM6JeKFvqcgpU/sO1isHTWPazRLZFd5PebfA9BeMdkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPz4K5y1yeI1QpgLJ6VzngGqWCVU9apiEKbAYbqwXycBxUM0md
	Ki10oFx5jyR1uRVS2ID6KwryjB2u5Y0oNua7PWi5vCQHRUA0qs5z1htq
X-Gm-Gg: ATEYQzybFHECBoYLPNErCo/lBx+FGj4nNlxy2WJNUysywO9QX4VA/Pi0i46mo5Opywq
	YQABBWQr0ApkCc7hd29rTCAj5xGg1tVONnch+jnon1NGbcIHGs3Ty4LOW68RNrCaHo7l1VPuKZ2
	mA95gHJMWT/5KWuuiRMqs8HW07TnYMSGM4NCvmlttbDqqaXFGLoKyOMCCuTnmQyIeicRjS3PfYj
	oXGSRkQSCIHdRHiGkK/dKEIF3lMaJ4uP3dTxHPxAaSRPtwtyAdvSJuUDiY53WpJz+17nm6WrVsO
	oFKiF498cpPCXn9yJ1L6Q4JIHsvxcdbSftyxj/WazQDufE9JB1qc0HZYvXhklfAsTLpC7BZSUOP
	5GO8vy4WLPT40kHFdgkwV4dTtwITufLvb9JwvjWpkr5I3mcVxmFubL7IhYG8WnbN2Lh8tuvMKwn
	URNw2euoQApmR8iIi1qwJPHxM+ZFR/CnbY7+sKkcWChOHjwOWkzkkdq9hHWAYBE6p6QQRWCoXW
X-Received: by 2002:a05:7022:fa1:b0:12a:6c84:6054 with SMTP id a92af1059eb24-12a96eef696mr1890400c88.35.1774446514751;
        Wed, 25 Mar 2026 06:48:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b49afsm14199072c88.2.2026.03.25.06.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:48:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <104cde21-a6c8-4b24-96d0-afd9f23817d3@roeck-us.net>
Date: Wed, 25 Mar 2026 06:48:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (adm1177) fix sysfs ABI violation and current
 unit conversion
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260325051246.28262-1-sanman.pradhan@hpe.com>
 <b71a1c83bee9e78abad6806d7bd84b3d7b5bab52.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b71a1c83bee9e78abad6806d7bd84b3d7b5bab52.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/26 06:20, Nuno Sá wrote:
> On Wed, 2026-03-25 at 05:13 +0000, Pradhan, Sanman wrote:
>> From: Sanman Pradhan <psanman@juniper.net>
>>
>> The adm1177 driver exposes the current alert threshold through
>> hwmon_curr_max_alarm. This violates the hwmon sysfs ABI, where
>> *_alarm attributes are read-only status flags and writable thresholds
>> must use currN_max.
>>
>> The driver also stores the threshold internally in microamps, while
>> currN_max is defined in milliamps. Convert the threshold accordingly
>> on both the read and write paths.
>>
>> Widen the cached threshold and related calculations to 64 bits so
>> that small shunt resistor values do not cause truncation or overflow.
>> Also use 64-bit arithmetic for the mA/uA conversions, clamp writes
>> to the range the hardware can represent, and propagate failures from
>> adm1177_write_alert_thr() instead of silently ignoring them.
>>
>> Update the hwmon documentation to reflect the attribute rename and
>> the correct units returned by the driver.
>>
>> Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and Digital Power Monitor
>> driver")
>> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
>> ---
> 
> Arghh, just saw v2 now (and replied to v1). Seems AI still has some feedback [1] (even though
> not strictly related to this patch). For reference, my comments [2]:
> 
> Anyways, as stated in my comment, after addressing the remaining "complain":
> 

I just noticed as well. My response was intended to refer to this version.

> Acked-by: Nuno Sá <nuno.sa@analog.com>

Thanks a lot for checking!

Guenter

> 
> [1]: https://sashiko.dev/#/patchset/20260325051246.28262-1-sanman.pradhan%40hpe.com
> [2]: https://lore.kernel.org/linux-hwmon/f7069532401720fda1ca6e70b72742526fc79dec.camel@gmail.com/T/#t
> 
> - Nuno Sá
> 
>> v2:
>> - Widen alert_threshold_ua to u64 throughout; use div_u64() and
>>    (u64) casts to prevent overflow on read, write, and probe paths.
>> - Update Documentation/hwmon/adm1177.rst for the attribute rename
>>    and correct unit descriptions.
>>
>> v1:
>> - Rename hwmon_curr_max_alarm to hwmon_curr_max; add uA-to-mA and
>>    mA-to-uA conversions with clamp_val on write path.
>> - Propagate adm1177_write_alert_thr() return value on sysfs write;
>>    add linux/math64.h and linux/minmax.h includes.
>> ---
>>   Documentation/hwmon/adm1177.rst |  8 ++---
>>   drivers/hwmon/adm1177.c         | 54 +++++++++++++++++++--------------
>>   2 files changed, 35 insertions(+), 27 deletions(-)
>>
>> diff --git a/Documentation/hwmon/adm1177.rst b/Documentation/hwmon/adm1177.rst
>> index 1c85a2af92bf7..375f6d6e03a7d 100644
>> --- a/Documentation/hwmon/adm1177.rst
>> +++ b/Documentation/hwmon/adm1177.rst
>> @@ -27,10 +27,10 @@ for details.
>>   Sysfs entries
>>   -------------
>>   
>> -The following attributes are supported. Current maxim attribute
>> +The following attributes are supported. Current maximum attribute
>>   is read-write, all other attributes are read-only.
>>   
>> -in0_input		Measured voltage in microvolts.
>> +in0_input		Measured voltage in millivolts.
>>   
>> -curr1_input		Measured current in microamperes.
>> -curr1_max_alarm		Overcurrent alarm in microamperes.
>> +curr1_input		Measured current in milliamperes.
>> +curr1_max		Overcurrent shutdown threshold in milliamperes.
>> diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
>> index 8b2c965480e3f..7888afe8dafd6 100644
>> --- a/drivers/hwmon/adm1177.c
>> +++ b/drivers/hwmon/adm1177.c
>> @@ -10,6 +10,8 @@
>>   #include <linux/hwmon.h>
>>   #include <linux/i2c.h>
>>   #include <linux/init.h>
>> +#include <linux/math64.h>
>> +#include <linux/minmax.h>
>>   #include <linux/module.h>
>>   #include <linux/regulator/consumer.h>
>>   
>> @@ -33,7 +35,7 @@
>>   struct adm1177_state {
>>   	struct i2c_client	*client;
>>   	u32			r_sense_uohm;
>> -	u32			alert_threshold_ua;
>> +	u64			alert_threshold_ua;
>>   	bool			vrange_high;
>>   };
>>   
>> @@ -48,7 +50,7 @@ static int adm1177_write_cmd(struct adm1177_state *st, u8 cmd)
>>   }
>>   
>>   static int adm1177_write_alert_thr(struct adm1177_state *st,
>> -				   u32 alert_threshold_ua)
>> +				   u64 alert_threshold_ua)
>>   {
>>   	u64 val;
>>   	int ret;
>> @@ -91,8 +93,8 @@ static int adm1177_read(struct device *dev, enum hwmon_sensor_types type,
>>   			*val = div_u64((105840000ull * dummy),
>>   				       4096 * st->r_sense_uohm);
>>   			return 0;
>> -		case hwmon_curr_max_alarm:
>> -			*val = st->alert_threshold_ua;
>> +		case hwmon_curr_max:
>> +			*val = div_u64(st->alert_threshold_ua, 1000);
>>   			return 0;
>>   		default:
>>   			return -EOPNOTSUPP;
>> @@ -126,9 +128,10 @@ static int adm1177_write(struct device *dev, enum hwmon_sensor_types type,
>>   	switch (type) {
>>   	case hwmon_curr:
>>   		switch (attr) {
>> -		case hwmon_curr_max_alarm:
>> -			adm1177_write_alert_thr(st, val);
>> -			return 0;
>> +		case hwmon_curr_max:
>> +			val = clamp_val(val, 0,
>> +					div_u64(105840000ULL, st->r_sense_uohm));
>> +			return adm1177_write_alert_thr(st, (u64)val * 1000);
>>   		default:
>>   			return -EOPNOTSUPP;
>>   		}
>> @@ -156,7 +159,7 @@ static umode_t adm1177_is_visible(const void *data,
>>   			if (st->r_sense_uohm)
>>   				return 0444;
>>   			return 0;
>> -		case hwmon_curr_max_alarm:
>> +		case hwmon_curr_max:
>>   			if (st->r_sense_uohm)
>>   				return 0644;
>>   			return 0;
>> @@ -170,7 +173,7 @@ static umode_t adm1177_is_visible(const void *data,
>>   
>>   static const struct hwmon_channel_info * const adm1177_info[] = {
>>   	HWMON_CHANNEL_INFO(curr,
>> -			   HWMON_C_INPUT | HWMON_C_MAX_ALARM),
>> +			   HWMON_C_INPUT | HWMON_C_MAX),
>>   	HWMON_CHANNEL_INFO(in,
>>   			   HWMON_I_INPUT),
>>   	NULL
>> @@ -192,7 +195,8 @@ static int adm1177_probe(struct i2c_client *client)
>>   	struct device *dev = &client->dev;
>>   	struct device *hwmon_dev;
>>   	struct adm1177_state *st;
>> -	u32 alert_threshold_ua;
>> +	u64 alert_threshold_ua;
>> +	u32 prop;
>>   	int ret;
>>   
>>   	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
>> @@ -208,22 +212,26 @@ static int adm1177_probe(struct i2c_client *client)
>>   	if (device_property_read_u32(dev, "shunt-resistor-micro-ohms",
>>   				     &st->r_sense_uohm))
>>   		st->r_sense_uohm = 0;
>> -	if (device_property_read_u32(dev, "adi,shutdown-threshold-microamp",
>> -				     &alert_threshold_ua)) {
>> -		if (st->r_sense_uohm)
>> -			/*
>> -			 * set maximum default value from datasheet based on
>> -			 * shunt-resistor
>> -			 */
>> -			alert_threshold_ua = div_u64(105840000000,
>> -						     st->r_sense_uohm);
>> -		else
>> -			alert_threshold_ua = 0;
>> +	if (!device_property_read_u32(dev, "adi,shutdown-threshold-microamp",
>> +				      &prop)) {
>> +		alert_threshold_ua = prop;
>> +	} else if (st->r_sense_uohm) {
>> +		/*
>> +		 * set maximum default value from datasheet based on
>> +		 * shunt-resistor
>> +		 */
>> +		alert_threshold_ua = div_u64(105840000000ULL,
>> +					     st->r_sense_uohm);
>> +	} else {
>> +		alert_threshold_ua = 0;
>>   	}
>>   	st->vrange_high = device_property_read_bool(dev,
>>   						    "adi,vrange-high-enable");
>> -	if (alert_threshold_ua && st->r_sense_uohm)
>> -		adm1177_write_alert_thr(st, alert_threshold_ua);
>> +	if (alert_threshold_ua && st->r_sense_uohm) {
>> +		ret = adm1177_write_alert_thr(st, alert_threshold_ua);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	ret = adm1177_write_cmd(st, ADM1177_CMD_V_CONT |
>>   				    ADM1177_CMD_I_CONT |

