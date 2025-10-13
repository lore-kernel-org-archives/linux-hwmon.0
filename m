Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0581547F2
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760355195; cv=none; b=K6xKUfUBsYiEtZhxK9I7gncmZGhhBogFg7vKXYyIpuvb5grDP2ZWVj7HQPqiPN3DJlAykWWLxv/f5NT68snyiG75xyMf+WxN6YR0uBP4JfyboAEfHE2sZdnLUwwTfmF9Q3wZHo1vXkwXjQPPSucYT2pDDIf4ihqmIaZCv7HfDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760355195; c=relaxed/simple;
	bh=OoT646SKc7a+k287nFNXxwcEVz1tRIeE+oM++dyUGR4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YqQjp6bs2aYBdph6drQlALp/NAf79rM+5/l+3ecUpFp6/YBzcHfPt65woJCNis0qcq7ESt4LEORucgcPB8Ltn4ulgJtp9JE+5RvdV398K2+Qc6o2EkMLLNCpmmjK+rwO2jMz955XVijDgO64cHnc9z/tmik0z8dTDWXLZ5uvYx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrZPoEIC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrZPoEIC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so29365155e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760355190; x=1760959990; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8VqxfGuLkOceRkkjn0saCXVTmoiG1YKkoVvmvQbWbM=;
        b=JrZPoEICC7xiZdTxXSMVLVNMHB7FR7198XmQIEOViz8h5lZmuMF9p8bCtyX+WDuBYG
         ngzIlHZRbLM3YPtfHnkwn/zrctAe+2aMuTuwBBtWPeWcbphckN9neqH+j/3m3GeKNVlX
         /L4R6cZmJuLuW3USJvWNlFqiQJejh3or4KfT3gpc5Zu0AemF118xdnKazsHkhOqOX40F
         i/2kDxvHHsWVV7JHhB2skK5zH61PTuR72ha1lkPY27eAclMEjcx9fPeYFxEhQeEGkNDg
         ZyeKv7uGa2PsBJWL8CqbSzun5lvAg8W6gsoSZX8V8DMQLXzWC3zSB2zPDqT3BYnCsQQf
         P5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355190; x=1760959990;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8VqxfGuLkOceRkkjn0saCXVTmoiG1YKkoVvmvQbWbM=;
        b=K2y7CAouseP8kt9AMXxZeK003+b9SBxX8gkkNjElc2+U8MYmi1ZPMlsGTXjfkmwSuX
         rbjCXA8ve3SiZCeNKsdm8sZiCvHWbLGp1eN8PvYUJsROI6IYD7Q7XwDZzzHNAk0pLwt/
         LhAxNTwm5Izo9ZIy854IN+dEHGmShbCHVMbcNGl6UGKIstTgKu3HyJWElcHX0M6rpo1o
         yu8nBsC+6VKevBfh2FCgNUkj1VZsnpIdtnnEDfMqrFX9Y/OvQWQL7MeTHsZmpynlBRNb
         NMR4jwgZ3gZQ2g9LpJqiayHUPg+bZr1VS8kWZI1LgNaSOFQVykwEGKRiL4dscK2Jk8yw
         zbOA==
X-Forwarded-Encrypted: i=1; AJvYcCXiCiIR6iGVgtSI8E8bexmpFpecK53UR4QkBqwag8fhxkhenXD+02e9LFH9+1K5umkAIkz6c0GuBDLSUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk9JaQj0tG0MwN4sNPq2VUPneffHa1F/dRR8Oi+7sRVYJIyYUt
	ADZiyMyTBJjkxg9iW1A6NC7eb75bkvKF8mm8vSe7ejF0bsIU201pOrLl
X-Gm-Gg: ASbGncsdGd7C71oumHjfDWlw1qJBzWtwrDhGV0AOetdIE+O7r1eaWuFsXDoCBR4iMFl
	bOW2XcNjPsyPtjbbbdK+ETW1NAnNAznxNiqKLY9UNTGoM4wMZVpLJoorbpOG2pAB/85pSRFdvWa
	cmHX7SseiAj2a5i6VIFezKr2QLpEZWzrC6fKVsud2KcwfXgSWH2wYuCHOQUncioglZoTnQCRxas
	ysIKy7zFGxXbNtRquBEq9kwz0XGE5pwvobtcyOb6HZLC7It0LMeTa6pOC0FtwYgBbloikrqoqqf
	uq62gSmdV177tvX2BMxADUElTCjsskN6pZEPu614CYmxNEpd8kGHhKjnB/ZtzVUf4OGxvFszFkU
	oHKAlmkAKIH1D2gpgg6A5EeD379+T0Zl0oaRXic6cPizvJ5JLObETwM53UwiK
X-Google-Smtp-Source: AGHT+IElWa7TFjonoS3WJoqQxwqiYRjExC8ZOJuCGeLekwBARIOcBC1wDtLfHmzXki3j5yofpeu86g==
X-Received: by 2002:a05:600c:6287:b0:46f:b42e:e38d with SMTP id 5b1f17b1804b1-46fb42ee464mr83224735e9.40.1760355189314;
        Mon, 13 Oct 2025 04:33:09 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49bdfd0sm182004575e9.10.2025.10.13.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:33:09 -0700 (PDT)
Message-ID: <e22bec7ee71c6fc6c6a4b1c9ac54a0d19cfe2899.camel@gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (ltc2947) Use the energy64 attribute type to
 report the energy
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Hardware Monitoring
	 <linux-hwmon@vger.kernel.org>
Date: Mon, 13 Oct 2025 12:33:40 +0100
In-Reply-To: <20251012211625.533791-1-linux@roeck-us.net>
References: <20251012211625.533791-1-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-10-12 at 14:16 -0700, Guenter Roeck wrote:
> Use the energy64 attribute type instead of a locally defined sysfs
> attribute to report the accumulated energy.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/ltc2947-core.c | 60 ++++++++++++++++-----------------=
---
> =C2=A01 file changed, 26 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
> index 244839167e51..90f70f732b41 100644
> --- a/drivers/hwmon/ltc2947-core.c
> +++ b/drivers/hwmon/ltc2947-core.c
> @@ -9,8 +9,8 @@
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/hwmon.h>
> -#include <linux/hwmon-sysfs.h>
> =C2=A0#include <linux/module.h>
> +#include <linux/math64.h>
> =C2=A0#include <linux/mod_devicetable.h>
> =C2=A0#include <linux/property.h>
> =C2=A0#include <linux/regmap.h>
> @@ -319,24 +319,6 @@ static int ltc2947_alarm_read(struct ltc2947_data *s=
t,
> const u8 reg,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -static ssize_t ltc2947_show_value(struct device *dev,
> -				=C2=A0 struct device_attribute *da, char *buf)
> -{
> -	struct ltc2947_data *st =3D dev_get_drvdata(dev);
> -	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> -	int ret;
> -	s64 val =3D 0;
> -
> -	ret =3D ltc2947_val_read(st, attr->index, LTC2947_PAGE0, 6, &val);
> -	if (ret)
> -		return ret;
> -
> -	/* value in microJoule. st->lsb_energy was multiplied by 10E9 */
> -	val =3D div_s64(val * st->lsb_energy, 1000);
> -
> -	return sprintf(buf, "%lld\n", val);
> -}
> -
> =C2=A0static int ltc2947_read_temp(struct device *dev, const u32 attr, lo=
ng *val,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 const int channel)
> =C2=A0{
> @@ -588,6 +570,23 @@ static int ltc2947_read_in(struct device *dev, const=
 u32
> attr, long *val,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int ltc2947_read_energy(struct device *dev, s64 *val, const int
> channel)
> +{
> +	int reg =3D channel ? LTC2947_REG_ENERGY2 : LTC2947_REG_ENERGY1;
> +	struct ltc2947_data *st =3D dev_get_drvdata(dev);
> +	s64 __val =3D 0;
> +	int ret;
> +
> +	ret =3D ltc2947_val_read(st, reg, LTC2947_PAGE0, 6, &__val);
> +	if (ret)
> +		return ret;
> +
> +	/* value in microJoule. st->lsb_energy was multiplied by 10E9 */
> +	*val =3D DIV_S64_ROUND_CLOSEST(__val * st->lsb_energy, 1000);
> +
> +	return 0;
> +}
> +
> =C2=A0static int ltc2947_read(struct device *dev, enum hwmon_sensor_types=
 type,
> =C2=A0			u32 attr, int channel, long *val)
> =C2=A0{
> @@ -600,6 +599,8 @@ static int ltc2947_read(struct device *dev, enum
> hwmon_sensor_types type,
> =C2=A0		return ltc2947_read_power(dev, attr, val);
> =C2=A0	case hwmon_temp:
> =C2=A0		return ltc2947_read_temp(dev, attr, val, channel);
> +	case hwmon_energy64:
> +		return ltc2947_read_energy(dev, (s64 *)val, channel);
> =C2=A0	default:
> =C2=A0		return -ENOTSUPP;
> =C2=A0	}
> @@ -897,6 +898,8 @@ static umode_t ltc2947_is_visible(const void *data,
> =C2=A0		return ltc2947_power_is_visible(attr);
> =C2=A0	case hwmon_temp:
> =C2=A0		return ltc2947_temp_is_visible(attr);
> +	case hwmon_energy64:
> +		return 0444;
> =C2=A0	default:
> =C2=A0		return 0;
> =C2=A0	}
> @@ -929,6 +932,9 @@ static const struct hwmon_channel_info * const
> ltc2947_info[] =3D {
> =C2=A0			=C2=A0=C2=A0 HWMON_T_LABEL,
> =C2=A0			=C2=A0=C2=A0 HWMON_T_MAX_ALARM | HWMON_T_MIN_ALARM |
> HWMON_T_MAX |
> =C2=A0			=C2=A0=C2=A0 HWMON_T_MIN | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(energy64,
> +			=C2=A0=C2=A0 HWMON_E_INPUT,
> +			=C2=A0=C2=A0 HWMON_E_INPUT),
> =C2=A0	NULL
> =C2=A0};
> =C2=A0
> @@ -944,19 +950,6 @@ static const struct hwmon_chip_info ltc2947_chip_inf=
o =3D {
> =C2=A0	.info =3D ltc2947_info,
> =C2=A0};
> =C2=A0
> -/* energy attributes are 6bytes wide so we need u64 */
> -static SENSOR_DEVICE_ATTR(energy1_input, 0444, ltc2947_show_value, NULL,
> -			=C2=A0 LTC2947_REG_ENERGY1);
> -static SENSOR_DEVICE_ATTR(energy2_input, 0444, ltc2947_show_value, NULL,
> -			=C2=A0 LTC2947_REG_ENERGY2);
> -
> -static struct attribute *ltc2947_attrs[] =3D {
> -	&sensor_dev_attr_energy1_input.dev_attr.attr,
> -	&sensor_dev_attr_energy2_input.dev_attr.attr,
> -	NULL,
> -};
> -ATTRIBUTE_GROUPS(ltc2947);
> -
> =C2=A0static int ltc2947_setup(struct ltc2947_data *st)
> =C2=A0{
> =C2=A0	int ret;
> @@ -1114,8 +1107,7 @@ int ltc2947_core_probe(struct regmap *map, const ch=
ar
> *name)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	hwmon =3D devm_hwmon_device_register_with_info(dev, name, st,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 &ltc2947_chip_info,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 ltc2947_groups);
> +						=C2=A0=C2=A0=C2=A0=C2=A0 &ltc2947_chip_info,
> NULL);
> =C2=A0	return PTR_ERR_OR_ZERO(hwmon);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(ltc2947_core_probe);
