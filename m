Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D442F690B
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710219; cv=none; b=LBl+A0Zt54w6qBCuFt6/TGaNXWlUhCCGIYpyTKeKwxmdhwT1WKu8eetvZFmu6tWbB1DBVjAHerF+JnSgwtnd5nSJnhPuWf2DgAY7q6X9DL56/Fdbr1A0SO6os95e6AFSTb6GEOfx+jjBi/skQSaQOPGBmjr5RTITO+WVThDkCYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710219; c=relaxed/simple;
	bh=HoeoVDSVIWOvC1nl8QlcBkOSIeetdeFlAzb2xVnzbi4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UvhE7mmLMHD7+/CSHY5s/5NR4Cicgh56w/i9mkCRZIXS/CZ39uohfblfrzlVw0XX+gVpvrrvwuv9OcBWemJLM//5oGe3nnMHussvDj1mDI9r00h3O7dqf63DsMXuopT3Kz4YEcT7oQJ8F1gijD9S+JMG12y8MQZeJpsNgeGbzwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR97KhpR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR97KhpR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-471193a9d9eso10615655e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760710215; x=1761315015; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9YwdiYAFmMmwdQyWOz0CzoV/CR10eHW9vBeBwOaANQ=;
        b=cR97KhpRplSNZFpiCzkOWkQP/9wVQieb61yIWOjhtdGvD/XWkrnk9EVy8MnDVk2XWJ
         y0X47Jhy7Rs34vajoAVZDzsTxJFoBOpVaOZcKgHVzEHoUtHYkD2j+1rBy82D2ToUqG/Q
         6aDsPeE79uvv9aJVOGT+s/aOWi5072v/kH2XAP2i+rwfw7EQVM5QG44jUk7vFKdwTJeB
         uzLIwQc6aSRdzWl4uB1UCcYVGEKInv1wPAscn0OOlyTNhYYz+7DWZxPrtHv/DNeLZHTe
         nCplJrwpRyK9oCMZcBJ4dy6fru4LJ1IqZ8qzwQt6KeTTmuOlJaH3nzDTy1fTuS8ojUZx
         Jsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710215; x=1761315015;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9YwdiYAFmMmwdQyWOz0CzoV/CR10eHW9vBeBwOaANQ=;
        b=Ii5YA3NWBTx5+MisyXfORTMYo6uMDGS92X0tfwVk9DYS5obpUiOchXqYIdotyYads6
         PzNxxgP+USJbJPc2WVR7ifHaLqBdimxmCf8gRXR9B1DIKzK1mbbmMlv57rZwv0kD3MGi
         ZZFKlxRCUOHhcM/xsO4+RXzdnfFFUDwhZfHiN4x9H6tJ6CHbR7MfcpmDhu8XiJ8HDf02
         nblJF7nxdWUJ3mWM/I5iEyjwn22g1dtn/EuIh1lM5RpULd1DyCwlZaYbEu34Kh0pv3ZL
         wlw5VFeOR5REJV+m0lJ3JobW8PnY1oNWMfhCTFQKLBEd9b4qsXujtF5DBNMJrpP4Xj8F
         iXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR7R5Ap6n2TPO8C/y5zk2KjLLsU6/+osAdd/uSyPOxWKVSjXpX8y9EGEQJ3dCWfU0+WTr6f5Hr2y6BpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnh1ng0uJs/2nTjm7WjCrZJgDiueIY0sCI0E01mAElepuhvCIK
	4AjZAZ4H93bZkQNbNyIvqwdzc3YhaNmygQHO+LVXJ2ufM39mOHK0Ul6F
X-Gm-Gg: ASbGncsWioOhVLsqSUiU6pyPNagS/x16PfCrtpEhLFVdtwuhivRyXbvW4lifk5lB4GI
	PGhyskbFoZKS8im+McTx/YsZc2K+auj5CKsGYZQ4I8Nd+WV3OyuaO3qCmm0V9c9xsSUyBTwfFs6
	Y+FWc0Pgw/c6v52m8SB69cdFXlfyA37qH65PcQbFRQGQf4Wu5lGCWxkOmiylDyU6zGmMIDH0lYl
	Qf1u2l46KeLDlrGfNSZ5Llhpx5G+6aPjnLn6a/4nXB07apM3fhKwa3Ygk4DH+abzz9SsJYeih9c
	63ZjZL4D7mibDluDeu+8nzAgT8jJLW/WmnPtOixBo18BLVrph1og/TreIuLPQr4OwzA5VbGvLxU
	eQPKHm2ZQk8M9N2/Z5BQVunXV9fGKnKd9IgR5W3pwWcPs2xMJBPwtZgIIZ4t3NltyjRXWLLTvSO
	IXS6svXIAz3JwVE7PVJOHg5QrcYGGxkA==
X-Google-Smtp-Source: AGHT+IH8hrZkQ2RxefG8lIFgDNMzT76y1vNfnWNFIjyJrn9zcpf4G84ZGgk+Vowc2g90eXJ6x6FjKg==
X-Received: by 2002:a05:600d:60a5:b0:46e:1d01:11dd with SMTP id 5b1f17b1804b1-47117872658mr37114375e9.2.1760710214962;
        Fri, 17 Oct 2025 07:10:14 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144d17cdsm81902435e9.18.2025.10.17.07.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:10:14 -0700 (PDT)
Message-ID: <40778ebe88bfcd0f744715fc10232a1b4bc3b78e.camel@gmail.com>
Subject: Re: [PATCH 16/29] hwmon: (adt7411) Rely on subsystem locking
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Hardware Monitoring
	 <linux-hwmon@vger.kernel.org>
Date: Fri, 17 Oct 2025 15:10:47 +0100
In-Reply-To: <20251017130221.1823453-17-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
	 <20251017130221.1823453-17-linux@roeck-us.net>
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

> =C2=A0drivers/hwmon/adt7411.c | 59 +++++++++++---------------------------=
---
> =C2=A01 file changed, 16 insertions(+), 43 deletions(-)
>=20
> diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
> index 08d0effd97f7..b9991a69e6c6 100644
> --- a/drivers/hwmon/adt7411.c
> +++ b/drivers/hwmon/adt7411.c
> @@ -11,7 +11,6 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/err.h>
> -#include <linux/mutex.h>
> =C2=A0#include <linux/jiffies.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/hwmon.h>
> @@ -99,8 +98,6 @@ static const u8 adt7411_in_alarm_bits[] =3D {
> =C2=A0};
> =C2=A0
> =C2=A0struct adt7411_data {
> -	struct mutex device_lock;	/* for "atomic" device accesses */
> -	struct mutex update_lock;
> =C2=A0	unsigned long next_update;
> =C2=A0	long vref_cached;
> =C2=A0	struct i2c_client *client;
> @@ -110,55 +107,41 @@ struct adt7411_data {
> =C2=A0/*
> =C2=A0 * When reading a register containing (up to 4) lsb, all associated
> =C2=A0 * msb-registers get locked by the hardware. After _one_ of those m=
sb is
> read,
> - * _all_ are unlocked. In order to use this locking correctly, reading
> lsb/msb
> - * is protected here with a mutex, too.
> + * _all_ are unlocked.
> =C2=A0 */
> =C2=A0static int adt7411_read_10_bit(struct i2c_client *client, u8 lsb_re=
g,
> -				u8 msb_reg, u8 lsb_shift)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 msb_reg, u8 lsb_shift)
> =C2=A0{
> -	struct adt7411_data *data =3D i2c_get_clientdata(client);
> =C2=A0	int val, tmp;
> =C2=A0
> -	mutex_lock(&data->device_lock);
> -
> =C2=A0	val =3D i2c_smbus_read_byte_data(client, lsb_reg);
> =C2=A0	if (val < 0)
> -		goto exit_unlock;
> +		return val;
> =C2=A0
> =C2=A0	tmp =3D (val >> lsb_shift) & 3;
> =C2=A0	val =3D i2c_smbus_read_byte_data(client, msb_reg);
> +	if (val < 0)
> +		return val;
> =C2=A0
> -	if (val >=3D 0)
> -		val =3D (val << 2) | tmp;
> -
> - exit_unlock:
> -	mutex_unlock(&data->device_lock);
> -
> +	val =3D (val << 2) | tmp;
> =C2=A0	return val;
> =C2=A0}
> =C2=A0
> =C2=A0static int adt7411_modify_bit(struct i2c_client *client, u8 reg, u8=
 bit,
> -				bool flag)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool flag)
> =C2=A0{
> -	struct adt7411_data *data =3D i2c_get_clientdata(client);
> =C2=A0	int ret, val;
> =C2=A0
> -	mutex_lock(&data->device_lock);
> -
> =C2=A0	ret =3D i2c_smbus_read_byte_data(client, reg);
> =C2=A0	if (ret < 0)
> -		goto exit_unlock;
> +		return ret;
> =C2=A0
> =C2=A0	if (flag)
> =C2=A0		val =3D ret | bit;
> =C2=A0	else
> =C2=A0		val =3D ret & ~bit;
> =C2=A0
> -	ret =3D i2c_smbus_write_byte_data(client, reg, val);
> -
> - exit_unlock:
> -	mutex_unlock(&data->device_lock);
> -	return ret;
> +	return i2c_smbus_write_byte_data(client, reg, val);
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t adt7411_show_bit(struct device *dev,
> @@ -186,12 +169,11 @@ static ssize_t adt7411_set_bit(struct device *dev,
> =C2=A0	if (ret || flag > 1)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	hwmon_lock(dev);
> =C2=A0	ret =3D adt7411_modify_bit(client, s_attr2->index, s_attr2->nr, fl=
ag);
> -
> =C2=A0	/* force update */
> -	mutex_lock(&data->update_lock);
> =C2=A0	data->next_update =3D jiffies;
> -	mutex_unlock(&data->update_lock);
> +	hwmon_unlock(dev);
> =C2=A0
> =C2=A0	return ret < 0 ? ret : count;
> =C2=A0}
> @@ -294,10 +276,9 @@ static int adt7411_read_in_chan(struct device *dev, =
u32
> attr, int channel,
> =C2=A0	int reg, lsb_reg, lsb_shift;
> =C2=A0	int nr =3D channel - 1;
> =C2=A0
> -	mutex_lock(&data->update_lock);
> =C2=A0	ret =3D adt7411_update_vref(dev);
> =C2=A0	if (ret < 0)
> -		goto exit_unlock;
> +		return ret;
> =C2=A0
> =C2=A0	switch (attr) {
> =C2=A0	case hwmon_in_input:
> @@ -307,7 +288,7 @@ static int adt7411_read_in_chan(struct device *dev, u=
32
> attr, int channel,
> =C2=A0					=C2=A0 ADT7411_REG_EXT_TEMP_AIN1_MSB + nr,
> =C2=A0					=C2=A0 lsb_shift);
> =C2=A0		if (ret < 0)
> -			goto exit_unlock;
> +			return ret;
> =C2=A0		*val =3D ret * data->vref_cached / 1024;
> =C2=A0		ret =3D 0;
> =C2=A0		break;
> @@ -318,7 +299,7 @@ static int adt7411_read_in_chan(struct device *dev, u=
32
> attr, int channel,
> =C2=A0			: ADT7411_REG_IN_HIGH(channel);
> =C2=A0		ret =3D i2c_smbus_read_byte_data(client, reg);
> =C2=A0		if (ret < 0)
> -			goto exit_unlock;
> +			return ret;
> =C2=A0		*val =3D ret * data->vref_cached / 256;
> =C2=A0		ret =3D 0;
> =C2=A0		break;
> @@ -329,8 +310,6 @@ static int adt7411_read_in_chan(struct device *dev, u=
32
> attr, int channel,
> =C2=A0		ret =3D -EOPNOTSUPP;
> =C2=A0		break;
> =C2=A0	}
> - exit_unlock:
> -	mutex_unlock(&data->update_lock);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> @@ -457,10 +436,9 @@ static int adt7411_write_in_chan(struct device *dev,=
 u32
> attr, int channel,
> =C2=A0	struct i2c_client *client =3D data->client;
> =C2=A0	int ret, reg;
> =C2=A0
> -	mutex_lock(&data->update_lock);
> =C2=A0	ret =3D adt7411_update_vref(dev);
> =C2=A0	if (ret < 0)
> -		goto exit_unlock;
> +		return ret;
> =C2=A0	val =3D clamp_val(val, 0, 255 * data->vref_cached / 256);
> =C2=A0	val =3D DIV_ROUND_CLOSEST(val * 256, data->vref_cached);
> =C2=A0
> @@ -472,13 +450,10 @@ static int adt7411_write_in_chan(struct device *dev=
, u32
> attr, int channel,
> =C2=A0		reg =3D ADT7411_REG_IN_HIGH(channel);
> =C2=A0		break;
> =C2=A0	default:
> -		ret =3D -EOPNOTSUPP;
> -		goto exit_unlock;
> +		return -EOPNOTSUPP;
> =C2=A0	}
> =C2=A0
> =C2=A0	ret =3D i2c_smbus_write_byte_data(client, reg, val);
> - exit_unlock:
> -	mutex_unlock(&data->update_lock);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> @@ -679,8 +654,6 @@ static int adt7411_probe(struct i2c_client *client)
> =C2=A0
> =C2=A0	i2c_set_clientdata(client, data);
> =C2=A0	data->client =3D client;
> -	mutex_init(&data->device_lock);
> -	mutex_init(&data->update_lock);
> =C2=A0
> =C2=A0	ret =3D adt7411_init_device(data);
> =C2=A0	if (ret < 0)
