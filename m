Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760392F6911
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710084; cv=none; b=lE8BN32qxVaRXJX8Wf231KKnuvtGgzmAHnhZbWg7HG1lcxbmyYx++RnZy4180ddaCzlMuoyhvEhCpxFpveIdd8UrFRYd3dD1gq5FdTlUik3+bJZwB/YbeBri1eiY4ZYOaqgh1ZiQEoHTl0arAN9KvTDopo6EGinKUrlfzbyuFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710084; c=relaxed/simple;
	bh=gM8vTP6Lp8THhxdz7NGaYy+lhh+jf6a+0ehOYhVF7H0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YcfRcX4l+R5bA1urTYdAE7sdJnUZTlHmF0JajH6UXAregw8J82IOnIWisC2Zdv5N8OfxQkMiUs2R5MFvJ5Q/bX15JpARA6FIpPQcmLC9/GLiWQ8gcaO2xCy7w7xuoxv/0mFZncZkHzFRnU8sO+Q0YI+f0mgex5s6Pxe7ZnMCtWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3GusWU2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3GusWU2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so1700733f8f.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760710081; x=1761314881; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEtR1BdJjju/EiMaXlhT75Hgmy4reE+pBfBBJ8bZlTI=;
        b=K3GusWU2DeSAQRKo0Ih3+J3fqdY7F9Gsfe5fZxjsX6Gmkihk6/dKsxmWq9sU1sXhu6
         F3XrBV4BrozTTXKf4VKgmScTFOjmCaOUt1VyYOqqKU0Cac46WoQ5NsB/za6T0GOxFsJd
         JVHgMifjI2jnoD0OC05q4f27uIs/bUGJEFNpfT1x3ISH+ympiyYDRFgnAZEfJkn1FZxB
         g11ZCkKU9lqf+Fuc22uviI4/D0wSEmt6ZHUmIIXJneu5JHY62e32/xZoB2/Nji+y/Y06
         Agw+eui5VvgovWeY0hrvFxYn6q2LlkvSNYiPvPoadgFfD7vYL7qwiK/MzRngAf/a2v8V
         QNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710081; x=1761314881;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eEtR1BdJjju/EiMaXlhT75Hgmy4reE+pBfBBJ8bZlTI=;
        b=R/CR7Q6Coc1Nc1j/Stdtld2nGggzbb7+lMPxI5fm9qIy2mCyV/JaPAe62Z6OpOeQa7
         rhjW83RZuvybR3QTzI+wljH6DAVt2VtYV35BE5Mtwp3yNZhsus63k/kfSRyr7/YgId0x
         vcMuq3xjsOAgtaWdc/MKhXxJBAM3TFDRAO531Qlz+uoh7Bg6NY6+9jBTyEoc0cCi/Esg
         FBNiZB2b5PaITlvzDWyIfG83iKELRLb70EikHUNVSXgYzySwglOXEsrnEpuagIcErKg4
         pim2XyUUQ2zMMh2jUfQvLKVxTsv3ot880rdBC5XIW1k9fIMz7kwP22wsLzLG4LBFa4G2
         eWcg==
X-Forwarded-Encrypted: i=1; AJvYcCWTABbZZJdZRfJ+B5ldgeIm3bjgfFHgvTc2ltka0FprnjC+XDQlcG+AQjJVYFfiHf/juWGiA3fiX6uhwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM7LV8PNm63q+5V+GO7uMHxKTT4bZap79GGCmMnjm5pBwOW1GL
	5anEpJ2RQkRRDcf1LeXfh0n4tE/PYKcp0gtWS/y1nmryvJvdreMauh3o
X-Gm-Gg: ASbGnctwknsJW/v15/ZrduW2RkYE3srLqm2HlSsDg4d/gxBa0QjCDP7D++WVsRIPhoY
	F/qKHlWD6wuoEkO9/vxnADSCbwOreZZt9rimQtmxOto6x0NxYd31Qrb/yJGC1phkya0YAwuqJ+n
	OGQ+qOv18FcNrBwHz3ljM194ObLV8nYGOMO85wDkgw8KMQuZzi+7e0WzN9cvxxOCdtHZyV4RpDK
	S+RFy00zHJXrW6H+jCukpFAQTjnryKhNvll84nWCyCnDHfmCFfbCQ9njbmH0hAPqN3JbFuNVnrB
	aDiWxoMCgrhZT4C+tSch+69ESwtQH9QFPcfTlxWnB7tfS/2P7wF0gIY/H9wbfmVm6OPzCD9wNIb
	hDWYUiaLzXZ3M/dWl6nOmLyN9MzmvR7beGIYZExsqbi2kR/eLsDUL9htIVdHDRuj5dSP5TYW73g
	VsF+xanbKLjUKzCuoQOv4=
X-Google-Smtp-Source: AGHT+IGt938brWwf6lGAMGTGXSH0f28I21gzs7KSt3ImN3j3GFhHi8//xSnem4VxRf3Va/U3NKeT/g==
X-Received: by 2002:a05:6000:2389:b0:427:151:3db6 with SMTP id ffacd0b85a97d-42704d8e226mr2900713f8f.24.1760710080436;
        Fri, 17 Oct 2025 07:08:00 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426e6f03a76sm25294736f8f.36.2025.10.17.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:08:00 -0700 (PDT)
Message-ID: <52cb4c0cb382a3ebf67edb9838c6a82c2b7c0f18.camel@gmail.com>
Subject: Re: [PATCH 19/29] hwmon: (adt7x10) Rely on subsystem locking
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Hardware Monitoring
	 <linux-hwmon@vger.kernel.org>
Date: Fri, 17 Oct 2025 15:08:33 +0100
In-Reply-To: <20251017130221.1823453-20-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
	 <20251017130221.1823453-20-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-17 at 06:02 -0700, Guenter Roeck wrote:
> Attribute access is now serialized in the hardware monitoring core,
> so locking in the driver code is no longer necessary. Drop it.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/adt7x10.c | 27 +++++----------------------
> =C2=A01 file changed, 5 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
> index 2d329391ed3f..d003ee3ebf06 100644
> --- a/drivers/hwmon/adt7x10.c
> +++ b/drivers/hwmon/adt7x10.c
> @@ -15,7 +15,6 @@
> =C2=A0#include <linux/jiffies.h>
> =C2=A0#include <linux/hwmon.h>
> =C2=A0#include <linux/err.h>
> -#include <linux/mutex.h>
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/interrupt.h>
> =C2=A0#include <linux/regmap.h>
> @@ -55,7 +54,6 @@
> =C2=A0/* Each client has this additional data */
> =C2=A0struct adt7x10_data {
> =C2=A0	struct regmap		*regmap;
> -	struct mutex		update_lock;
> =C2=A0	u8			config;
> =C2=A0	u8			oldconfig;
> =C2=A0	bool			valid;		/* true if temperature valid
> */
> @@ -137,17 +135,13 @@ static int adt7x10_temp_read(struct adt7x10_data *d=
ata,
> int index, long *val)
> =C2=A0	unsigned int regval;
> =C2=A0	int ret;
> =C2=A0
> -	mutex_lock(&data->update_lock);
> =C2=A0	if (index =3D=3D adt7x10_temperature && !data->valid) {
> =C2=A0		/* wait for valid temperature */
> =C2=A0		ret =3D adt7x10_temp_ready(data->regmap);
> -		if (ret) {
> -			mutex_unlock(&data->update_lock);
> +		if (ret)
> =C2=A0			return ret;
> -		}
> =C2=A0		data->valid =3D true;
> =C2=A0	}
> -	mutex_unlock(&data->update_lock);
> =C2=A0
> =C2=A0	ret =3D regmap_read(data->regmap, ADT7X10_REG_TEMP[index], &regval=
);
> =C2=A0	if (ret)
> @@ -159,13 +153,8 @@ static int adt7x10_temp_read(struct adt7x10_data *da=
ta,
> int index, long *val)
> =C2=A0
> =C2=A0static int adt7x10_temp_write(struct adt7x10_data *data, int index,=
 long
> temp)
> =C2=A0{
> -	int ret;
> -
> -	mutex_lock(&data->update_lock);
> -	ret =3D regmap_write(data->regmap, ADT7X10_REG_TEMP[index],
> -			=C2=A0=C2=A0 ADT7X10_TEMP_TO_REG(temp));
> -	mutex_unlock(&data->update_lock);
> -	return ret;
> +	return regmap_write(data->regmap, ADT7X10_REG_TEMP[index],
> +			=C2=A0=C2=A0=C2=A0 ADT7X10_TEMP_TO_REG(temp));
> =C2=A0}
> =C2=A0
> =C2=A0static int adt7x10_hyst_read(struct adt7x10_data *data, int index, =
long *val)
> @@ -197,22 +186,17 @@ static int adt7x10_hyst_write(struct adt7x10_data *=
data,
> long hyst)
> =C2=A0	unsigned int regval;
> =C2=A0	int limit, ret;
> =C2=A0
> -	mutex_lock(&data->update_lock);
> -
> =C2=A0	/* convert absolute hysteresis value to a 4 bit delta value */
> =C2=A0	ret =3D regmap_read(data->regmap, ADT7X10_T_ALARM_HIGH, &regval);
> =C2=A0	if (ret < 0)
> -		goto abort;
> +		return ret;
> =C2=A0
> =C2=A0	limit =3D ADT7X10_REG_TO_TEMP(data, regval);
> =C2=A0
> =C2=A0	hyst =3D clamp_val(hyst, ADT7X10_TEMP_MIN, ADT7X10_TEMP_MAX);
> =C2=A0	regval =3D clamp_val(DIV_ROUND_CLOSEST(limit - hyst, 1000), 0,
> =C2=A0			=C2=A0=C2=A0 ADT7X10_T_HYST_MASK);
> -	ret =3D regmap_write(data->regmap, ADT7X10_T_HYST, regval);
> -abort:
> -	mutex_unlock(&data->update_lock);
> -	return ret;
> +	return regmap_write(data->regmap, ADT7X10_T_HYST, regval);
> =C2=A0}
> =C2=A0
> =C2=A0static int adt7x10_alarm_read(struct adt7x10_data *data, int index,=
 long
> *val)
> @@ -344,7 +328,6 @@ int adt7x10_probe(struct device *dev, const char *nam=
e,
> int irq,
> =C2=A0	data->regmap =3D regmap;
> =C2=A0
> =C2=A0	dev_set_drvdata(dev, data);
> -	mutex_init(&data->update_lock);
> =C2=A0
> =C2=A0	/* configure as specified */
> =C2=A0	ret =3D regmap_read(regmap, ADT7X10_CONFIG, &config);
