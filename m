Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A42F8E8D
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778293577; cv=none; b=NZue7RLfS5bsobuWKUnHKiyqSCuK8+W9yxm+4BzLAg0cFi8Pld6UJR2O7RQf5F62hEvBeSw04Et4WtIC4ifYqNTVConhATsbx2acJyF6DQX84faDSX3wzVq+RMMMjcJ/XddBbvbR0sygX1bnZq+6Cnvj1jO7OV5A+Atnd2mKB5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778293577; c=relaxed/simple;
	bh=MNIWUuHfVPumXcMdA/iZPMhSsrzCMwHjt7W8jFF4jiU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OjqjI88U74Ds+m7BXEicp/o1g+lYWjs9eNkzkPV7xAGyFWrnFH5svVFfiR3WCQEClHB/JjIQcPdlYvpjro0DzlrwVdPJ7LqzAlPk48CDdvzx3+UN6loNebeE/m72IEQE1gf4PU59rtzKJMCGMA8S2UPUCJ/Ol2e8u1J3ZzPhf/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCf7GDOt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCf7GDOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35752C2BCB0;
	Sat,  9 May 2026 02:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778293577;
	bh=MNIWUuHfVPumXcMdA/iZPMhSsrzCMwHjt7W8jFF4jiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HCf7GDOtuyIBnGtdHNTHxh1AbaojY884EKyh32SIuaMwKhONbGW0x2GjLsMcglEFQ
	 kvBlmsgCVpSDNITEH3Ao9biWTdd3ogojMPrvjmNl5mreP55HX0SaxHG6fBGxwFCYVl
	 K4W9XUOS8fF1EuzK6zCYcj/z0tW6gwJqzHnkFRwduNFBwyrrJZByhbzReYxDvtnuLM
	 Bp+jP6sQAUPfZAmGOCTA9f6m846Nkb0GrIr3Wb7lW1ATdXheWyfrebFixyPuaW8L2X
	 e4suKDA6sLf+2bOsEwz98f1b1sF7d0EZ9JcyfGNHpVAmuXyG3qDjudo1q3MSV1nN9h
	 xnPwiMb0GQK2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] hwmon: (pmbus/adm1266) register rtc_class device
 backed by SET_RTC
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260508-adm1266-v1-6-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-6-ec08bf29e0ce@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 02:26:16 +0000
Message-Id: <20260509022617.35752C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] 64-bit division using the `/` operator will cause a build failure =
on 32-bit architectures.
- [High] RTC operations bypass mandatory subsystem locking rules.
- [Medium] Unchecked arithmetic truncation of 64-bit system time during dev=
ice probe.
--

commit 8d9788960851cdc09e1d770587afd7363eaefe26
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) register rtc_class device backed by SET_RTC

This commit registers an rtc_class device backed by the SET_RTC block-R/W
register to allow userspace to frequently synchronize the ADM1266 UNIX
time. It maps the standard /dev/rtcN ->set_time and ->read_time operations
to the 6-byte SET_RTC frame. The probe-time wall-clock seed is also
preserved.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index a058616d42156..07c20746f0831 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -513,28 +514,85 @@ static int adm1266_config_nvmem(struct adm1266_data=
 *data)
>  	return 0;
>  }
> =20
> -static int adm1266_set_rtc(struct adm1266_data *data)
> +/*
> + * SET_RTC frame layout (datasheet Rev. D, Table 84):
> + *   bytes [1:0] =3D fractional seconds, LSB =3D 1/65536 s
> + *   bytes [5:2] =3D seconds since 1970-01-01 UTC
> + */
> +static int adm1266_write_rtc(struct i2c_client *client, const struct tim=
espec64 *ts)
>  {
> -	struct timespec64 ts;
> -	char write_buf[6];
> +	u8 buf[6];
>  	u16 frac;
>  	int i;
> =20
> +	frac =3D (u16)(((u64)ts->tv_nsec << 16) / NSEC_PER_SEC);

Will this 64-bit division cause a link error on 32-bit architectures?

Using the / operator on a 64-bit integer can lead to undefined references to
__udivdi3 on 32-bit builds. Could this use div_u64() instead?

> +	for (i =3D 0; i < 2; i++)
> +		buf[i] =3D (frac >> (i * 8)) & 0xFF;
> +	for (i =3D 0; i < 4; i++)
> +		buf[2 + i] =3D (ts->tv_sec >> (i * 8)) & 0xFF;

Since ts->tv_sec is a 64-bit value, does this loop silently truncate values
exceeding 32 bits when called during probe?

adm1266_probe()
  adm1266_set_rtc()
    adm1266_write_rtc()

The hwmon subsystem guidelines ask to check for overflows in arithmetic
calculations.

> +
> +	return i2c_smbus_write_block_data(client, ADM1266_SET_RTC, sizeof(buf),=
 buf);
> +}

[ ... ]

> +static int adm1266_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	u32 secs;
> +	int ret;
> +	int i;
> +
> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);

The hardware monitoring subsystem guidelines state that drivers must implem=
ent
locking for attributes registered by any other means.

Are these callbacks missing a call to hwmon_lock() (or pmbus_lock())?

If an RTC class device implicitly exposes time attributes to userspace, cou=
ld
these concurrent I2C accesses risk disrupting stateful hardware transaction=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-adm1266-v1=
-0-ec08bf29e0ce@nexthop.ai?part=3D6
