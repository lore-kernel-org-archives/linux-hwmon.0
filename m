Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A0289811
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710024; cv=none; b=O4p1qpmwcUlIGEeyLi9QxuVsnpylZn+VPofG9notKSR2aCLOM7MM3YEz1AZFUEf0NiKd8ZsqG52N0Xseg449K4GVB1lURxCpLhOSkUbzEJihE0I/RFYbGI8IgYIz12iME7TYmG6t7xYkSfSCEt0FB/vlVeCbExbh+mffIrpzPSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710024; c=relaxed/simple;
	bh=9rf9TjJ3N6/wxOZHe1pTMfsXcJDkfy2CUsUQed5+CP0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oh/BXLSmg6Oi/jYMNz85f5RpcuvGbhjsPnPrVJDwBrauA57tXcRRD/DHQFhxkfeB1kYou5UFeVk2U5R65LcYjjv8tG6u7EGdVbQcUY+ERovHNPkuOe/1bwPCjjh6JycixCpcop27Syn1vvCGCGpZtbwEa9Gj118VEKuoSt/N/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfUuFSSF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfUuFSSF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47114a40161so19607715e9.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760710021; x=1761314821; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT6/kA1opZCLx91Z67e2PNVsfxox7l1zNGKt5D3VO/U=;
        b=TfUuFSSFw9Y7oOvH5rsbDCnMQhIYOiH2FfzATzXCdYqdd5gsB/6GxOFUlECphVMPjg
         w9qTf5YeW9JSXuJXKSY5upQ1VZxkZsaigfEPRux+YNH14jRZzgbG910DulS1vqlffDAt
         NdLQS2dEcxw6sKJantCgkT+fmDvctdDWZkxD7pqvxgKBEVFeaw81YI8GXDX+8sL6IArA
         usQ3a5LtGfU6coeSjpsytznqnM/SMoEJFYSvpQBRO2TyESbknTrKOkMCFvSs6UAHExk+
         AueZZllvtNpFYkjY7mM3iU7Tc1eQOWtcyybrMVCIhpLscMYZWdrX5YLIqSvLdIaABHhx
         5EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710021; x=1761314821;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MT6/kA1opZCLx91Z67e2PNVsfxox7l1zNGKt5D3VO/U=;
        b=DoIjI9o+SwIaQk56oezywb8tTK86H78M5e90rzGZ66RMlZuL53qv/LClF1zL5S90Kx
         uvQ2Wwd0YfKDsqRYcDoE+RNpV8nFQiaNrO9dfUypvFJ4z7oH1P1Q/rVF9M7mHdMuXgXW
         9VUDJRf4i+Z4jxlQZupamyj9gsQCCTuj1tfICGDarC8f5skjxhVN62AKD7H3sn00MR+l
         JQq7RBe/WkOxDUy5k3k2M9nQVAKzKs3XiQpu/FxlbI1UIRrvs+0bAU/MJRABHAC/PPEF
         RpNfupuyqLlDyEBhEwPYKb1uoKRMc8YNjjbyg4xn/E1O0KkwLfsneNqq0h5p9shfSxFz
         1rNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMQj0CQvb/XY+viFLRViJQsixre3TJZ9kg6sjToXuh7QpwErUztZj7Ff40CZR4AnveaZCMB80PwkxuQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUJflhMNto2MxIcPzGPxq437E3XJIkDEERFVGj9HystkhXAQ2
	GNATHSj85IiNeElTpczIe9EB54Ua++cr/WN+lop2KHNmaYs3jb6SjAkS
X-Gm-Gg: ASbGnctbz9bZW2bPP0hmclbuTh13vasYr++yS4wJnMisTCl3WB/BrLH/ECvgkzzB+Nb
	KCetbc0i/Xm1Dg9w59fZQjY4Kfyfl8Vlo+3wnRmZZ4D0Ipy4L8GrY816n3YJB3xJsdv3oP62eil
	2Z4AYOwbdGQNQRHKR4Hs7uVY52IVSecF7njDFQNDx7PZVACBgjHwjXfJ9TDqi3Mpu+xR+tUd3Ad
	X0dHCuw4W9pxtX603hg9jckqC5VBGhZdSXzTON2iLqIbC6Mt/7ScOg7ma4BLVEbVT8hSkla/VUw
	bivjuS4+DnyU1VD7741RWE2ohf/xjBKXVN924wwcrbv6ck34bd4sYKSGm3FNyzG+YncdLINSVhI
	RZu34bMiKzJVLG1lRuUsbOgA7zYNnHN9LBfzdVZQuhX9tv8rc2NLR2HmRdFfwFSX079tfL2UXFn
	PdlWFA11Z52Lv+sgVtAHpikW6li/DqDA==
X-Google-Smtp-Source: AGHT+IHxImieBLu5OdPyCHX1H0x7uRGt13Ct039AxbmdB0Y6yNswVlYicCVNi1l0iVLLcg4CKY5bOQ==
X-Received: by 2002:a05:6000:2911:b0:426:da92:d390 with SMTP id ffacd0b85a97d-42704d83ce7mr2905564f8f.10.1760710020657;
        Fri, 17 Oct 2025 07:07:00 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426feeb7441sm10354421f8f.43.2025.10.17.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:07:00 -0700 (PDT)
Message-ID: <f6d838f46684e510b96f94d8228e34a47b10c5ac.camel@gmail.com>
Subject: Re: [PATCH 22/29] hwmon: (ltc4282) Rely on subsystem locking
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Hardware Monitoring
	 <linux-hwmon@vger.kernel.org>
Date: Fri, 17 Oct 2025 15:07:33 +0100
In-Reply-To: <20251017130221.1823453-23-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
	 <20251017130221.1823453-23-linux@roeck-us.net>
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

> =C2=A0drivers/hwmon/ltc4282.c | 32 ++++----------------------------
> =C2=A01 file changed, 4 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index 44102879694a..b9cad89f2cd9 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
> @@ -17,7 +17,6 @@
> =C2=A0#include <linux/minmax.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mod_devicetable.h>
> -#include <linux/mutex.h>
> =C2=A0#include <linux/regmap.h>
> =C2=A0#include <linux/property.h>
> =C2=A0#include <linux/string.h>
> @@ -131,8 +130,6 @@ struct ltc4282_cache {
> =C2=A0
> =C2=A0struct ltc4282_state {
> =C2=A0	struct regmap *map;
> -	/* Protect against multiple accesses to the device registers */
> -	struct mutex lock;
> =C2=A0	struct clk_hw clk_hw;
> =C2=A0	/*
> =C2=A0	 * Used to cache values for VDD/VSOURCE depending which will be us=
ed
> @@ -281,14 +278,12 @@ static int __ltc4282_read_alarm(struct ltc4282_stat=
e
> *st, u32 reg, u32 mask,
> =C2=A0static int ltc4282_read_alarm(struct ltc4282_state *st, u32 reg, u3=
2 mask,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long *val)
> =C2=A0{
> -	guard(mutex)(&st->lock);
> =C2=A0	return __ltc4282_read_alarm(st, reg, mask, val);
> =C2=A0}
> =C2=A0
> =C2=A0static int ltc4282_vdd_source_read_in(struct ltc4282_state *st, u32=
 channel,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long *val)
> =C2=A0{
> -	guard(mutex)(&st->lock);
> =C2=A0	if (!st->in0_1_cache[channel].en)
> =C2=A0		return -ENODATA;
> =C2=A0
> @@ -300,7 +295,6 @@ static int ltc4282_vdd_source_read_hist(struct
> ltc4282_state *st, u32 reg,
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	guard(mutex)(&st->lock);
> =C2=A0	if (!st->in0_1_cache[channel].en) {
> =C2=A0		*val =3D *cached;
> =C2=A0		return 0;
> @@ -317,7 +311,6 @@ static int ltc4282_vdd_source_read_hist(struct
> ltc4282_state *st, u32 reg,
> =C2=A0static int ltc4282_vdd_source_read_lim(struct ltc4282_state *st, u3=
2 reg,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 channel, u32 *cached, =
long *val)
> =C2=A0{
> -	guard(mutex)(&st->lock);
> =C2=A0	if (!st->in0_1_cache[channel].en)
> =C2=A0		return ltc4282_read_voltage_byte_cached(st, reg, st->vfs_out,
> =C2=A0							val, cached);
> @@ -328,7 +321,6 @@ static int ltc4282_vdd_source_read_lim(struct
> ltc4282_state *st, u32 reg,
> =C2=A0static int ltc4282_vdd_source_read_alm(struct ltc4282_state *st, u3=
2 mask,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 channel, long *val)
> =C2=A0{
> -	guard(mutex)(&st->lock);
> =C2=A0	if (!st->in0_1_cache[channel].en) {
> =C2=A0		/*
> =C2=A0		 * Do this otherwise alarms can get confused because we clear
> @@ -412,9 +404,7 @@ static int ltc4282_read_in(struct ltc4282_state *st, =
u32
> attr, long *val,
> =C2=A0						=C2=A0=C2=A0 channel,
> =C2=A0						=C2=A0=C2=A0 &st-
> >in0_1_cache[channel].in_min_raw, val);
> =C2=A0	case hwmon_in_enable:
> -		scoped_guard(mutex, &st->lock) {
> -			*val =3D st->in0_1_cache[channel].en;
> -		}
> +		*val =3D st->in0_1_cache[channel].en;
> =C2=A0		return 0;
> =C2=A0	case hwmon_in_fault:
> =C2=A0		/*
> @@ -612,15 +602,11 @@ static int ltc4282_read(struct device *dev, enum
> hwmon_sensor_types type,
> =C2=A0	case hwmon_power:
> =C2=A0		return ltc4282_read_power(st, attr, val);
> =C2=A0	case hwmon_energy:
> -		scoped_guard(mutex, &st->lock) {
> -			*val =3D st->energy_en;
> -		}
> +		*val =3D st->energy_en;
> =C2=A0		return 0;
> =C2=A0	case hwmon_energy64:
> -		scoped_guard(mutex, &st->lock) {
> -			if (st->energy_en)
> -				return ltc4282_read_energy(st, (s64 *)val);
> -		}
> +		if (st->energy_en)
> +			return ltc4282_read_energy(st, (s64 *)val);
> =C2=A0		return -ENODATA;
> =C2=A0	default:
> =C2=A0		return -EOPNOTSUPP;
> @@ -688,7 +674,6 @@ static int __ltc4282_in_write_history(const struct
> ltc4282_state *st, u32 reg,
> =C2=A0static int ltc4282_in_write_history(struct ltc4282_state *st, u32 r=
eg,
> =C2=A0				=C2=A0=C2=A0=C2=A0 long lowest, long highest, u32 fs)
> =C2=A0{
> -	guard(mutex)(&st->lock);
> =C2=A0	return __ltc4282_in_write_history(st, reg, lowest, highest, fs);
> =C2=A0}
> =C2=A0
> @@ -696,8 +681,6 @@ static int ltc4282_power_reset_hist(struct ltc4282_st=
ate
> *st)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	guard(mutex)(&st->lock);
> -
> =C2=A0	ret =3D ltc4282_write_power_word(st, LTC4282_POWER_LOWEST,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st->power_max);
> =C2=A0	if (ret)
> @@ -803,7 +786,6 @@ static int ltc4282_vdd_source_write_lim(struct
> ltc4282_state *st, u32 reg,
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	guard(mutex)(&st->lock);
> =C2=A0	if (st->in0_1_cache[channel].en)
> =C2=A0		ret =3D ltc4282_write_voltage_byte(st, reg, st->vfs_out, val);
> =C2=A0	else
> @@ -821,7 +803,6 @@ static int ltc4282_vdd_source_reset_hist(struct
> ltc4282_state *st, int channel)
> =C2=A0	if (channel =3D=3D LTC4282_CHAN_VDD)
> =C2=A0		lowest =3D st->vdd;
> =C2=A0
> -	guard(mutex)(&st->lock);
> =C2=A0	if (st->in0_1_cache[channel].en) {
> =C2=A0		ret =3D __ltc4282_in_write_history(st, LTC4282_VSOURCE_LOWEST,
> =C2=A0						 lowest, 0, st->vfs_out);
> @@ -861,7 +842,6 @@ static int ltc4282_vdd_source_enable(struct ltc4282_s=
tate
> *st, int channel,
> =C2=A0	int ret, other_chan =3D ~channel & 0x1;
> =C2=A0	u8 __val =3D val;
> =C2=A0
> -	guard(mutex)(&st->lock);
> =C2=A0	if (st->in0_1_cache[channel].en =3D=3D !!val)
> =C2=A0		return 0;
> =C2=A0
> @@ -938,8 +918,6 @@ static int ltc4282_curr_reset_hist(struct ltc4282_sta=
te
> *st)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	guard(mutex)(&st->lock);
> -
> =C2=A0	ret =3D __ltc4282_in_write_history(st, LTC4282_VSENSE_LOWEST,
> =C2=A0					 st->vsense_max, 0, 40 * MILLI);
> =C2=A0	if (ret)
> @@ -974,7 +952,6 @@ static int ltc4282_energy_enable_set(struct ltc4282_s=
tate
> *st, long val)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	guard(mutex)(&st->lock);
> =C2=A0	/* setting the bit halts the meter */
> =C2=A0	ret =3D regmap_update_bits(st->map, LTC4282_ADC_CTRL,
> =C2=A0				 LTC4282_METER_HALT_MASK,
> @@ -1699,7 +1676,6 @@ static int ltc4282_probe(struct i2c_client *i2c)
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	mutex_init(&st->lock);
> =C2=A0	hwmon =3D devm_hwmon_device_register_with_info(dev, "ltc4282", st,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0 &ltc4282_chip_info,
> NULL);
> =C2=A0	if (IS_ERR(hwmon))
