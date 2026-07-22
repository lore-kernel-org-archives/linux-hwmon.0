Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD99403AE2
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 22:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784758682; cv=none; b=DyErlpc5tgt8pXE5YiupvIknN083PCn2ptw9R6pBoOu9rK1WSQCRbmwm1u2zM7YAjNT9kFA2qOF8Vn8KVn1cVeDjeqJILqydspsxtVQ0VGo8wCPvjk7ojEK75Li3ljGRkZ6nqWExcHRJOgWBKIvq2F3GSVK0XIBWPrWFg5qKumU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784758682; c=relaxed/simple;
	bh=jMken4843MkyGahFq+DDL3UTq46nsDDnuOC9CrXVWLc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WyY+i1MKo3KRZv+V+yjJOX4Y5qyIwnnFGen58WoHHu9IEK70V2OVHLIOPlwoYXX3Zx4xygTOAGsU1wr4e4NdRx0igyLJfd46M/DNLPjZK5ddsQQ5vJn6A1PYr87NViTQtyRL8Dq/T4tWO0LZ7YyVnEyjnp1G1zhS3XNlgfLottg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxNrWSKq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxNrWSKq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770DE1F00A3D;
	Wed, 22 Jul 2026 22:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784758680;
	bh=wZ2DsqZn1wtURjO5sLNs4nU5pwK5etfJfMZUKTikfFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WxNrWSKq9oSzsMfTz0COu8IgtTRdnnixHSlfawa0nrp+IwfduqqxdgbNIa+z9t/u8
	 lyVInkQ6Dnai/25e3rqOc0ILgx9YedkINzd7jAk0WRlkBwt4GPJGC5UpnQamUYeyKZ
	 UDEnlBuNx4lTTA9EifpZ8+IspKfJiTaMYYAorJn3sry9zOEbb+jLTKA0ZIcr//fG0R
	 k9GgTfLp5WLxu02PFG6pWzFiUIyhr+7kooi7jYUzlZea7Gzxn0aL1CwskalKO3Wr+b
	 GJHnKY1QYD8+TrwG/FicZ8c/EPHDANpsoSzD+WLplRpUsyEzsE8+AU8OW6zXr4F1M2
	 wmylJZTLwETkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 5/6] eth: fbnic: report temperature and voltage
 alarms via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260721221540.648272-6-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
 <20260721221540.648272-6-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 22:17:59 +0000
Message-Id: <20260722221800.770DE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Unpopulated alarm attributes trigger unnecessary firmware reads =
instead of being rejected up front.
- [Medium] Hardware monitoring alarms are improperly computed in software b=
y the driver.
--

--- Patch [5]: [PATCH net-next 5/6] eth: fbnic: report temperature and volt=
age alarms via hwmon ---
commit 6d735c75df1c02d16911aecd205cd4bf98b0bb3b
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: report temperature and voltage alarms via hwmon

Building on the temperature and voltage thresholds stored in
fbnic_fw_cap, expose alarm attributes through the hwmon interface:
temp1_{min,max,crit}_alarm and in0_{min,max}_alarm.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index 4938f7b391402..c5cddd9cef124 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c

[ ... ]

> @@ -87,34 +87,84 @@ static int fbnic_hwmon_read_threshold(long thr, long =
*val)
>  	return 0;
>  }
> =20
> +static int fbnic_hwmon_read_alarm(long a, long b, long *val)
> +{
> +	if (a =3D=3D FBNIC_SENSOR_NO_DATA || b =3D=3D FBNIC_SENSOR_NO_DATA)
> +		return -ENODATA;
> +
> +	*val =3D a >=3D b;

[Severity: Medium]
Is it intentional to compute alarms in software by comparing the live
sensor reading against the threshold here?

According to the hwmon sysfs ABI documentation, drivers should not make
comparisons of readings to thresholds themselves. Alarms are expected to be
hardware-latched indications that can catch transient spikes between polls.

If the hardware does not support latched alarms, should these alarm
attributes be omitted entirely so user-space tools can handle their own
software threshold comparisons?

> +	return 0;
> +}
> +
>  static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *=
val)
>  {
> +	int err;
> +
>  	switch (attr) {
> -	case hwmon_temp_input:
> -		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
>  	case hwmon_temp_min:
>  		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);
>  	case hwmon_temp_max:
>  		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);
>  	case hwmon_temp_crit:
>  		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.crit, val);
> +	case hwmon_temp_input:
> +	case hwmon_temp_min_alarm:
> +	case hwmon_temp_max_alarm:
> +	case hwmon_temp_crit_alarm:
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> +
> +	err =3D fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);

[Severity: Medium]
The commit message notes that unsupported attributes are rejected up front,
but does this code fall through for unpopulated alarm thresholds and trigger
a blocking firmware read before eventually returning -ENODATA?

If fbd->fw_cap.temp.min is FBNIC_SENSOR_NO_DATA, reading
hwmon_temp_min_alarm will hit the break statement above, execute this
sensor read, and then fail later inside fbnic_hwmon_read_alarm().

Could we check the threshold value up front before issuing the mailbox
request?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721221540.6482=
72-1-limzhineng2@gmail.com?part=3D5
