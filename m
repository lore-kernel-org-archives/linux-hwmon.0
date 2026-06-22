Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E194B3B9D83
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137961; cv=none; b=J8ck0QiZSll8CXZuuPt2KXUmEGOFU4XZfJ4+NP7rTESt+kXiHxWj8iAfl+aC1zXshlaIrWyJ46QfCK4EetJna7Yh/hfBBMDm1rXd0PIXcuhcvsfLb5xFUAPz+IyjwNNkLdYfvV66xEyDCx6bTcYijSb0t4igv4hFyG+7wONohg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137961; c=relaxed/simple;
	bh=m2RPaU88H6RTx+ojwM9JUqBsdOfax6z0DkgX4IS4If4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fGcNHWLC+96Wqfg8UFH+xLhnHvT3dlxWyCSj7ZGY0hg7P1IWdrg1dGTjyOpHlWylhVY8wZRPEs5slb/SmCn8iqMkXBaUPQ5nN8WxmzXmqopYBJ34XDZM6rwrqJ2mM4SGkOelklDSQqVSGlSFC6sCoJwk41eKevZa9sT3AOJLDos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVuR+12B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVuR+12B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086C11F000E9;
	Mon, 22 Jun 2026 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137958;
	bh=B8CcvgGJb6yi5Tu2SNC+G2wuxEXXV7cb6lO1TQJ2djw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WVuR+12B7f9vz0aAz7ZhMVeZMU8OV1Q8YA4G/E3XvvcLWUkTFAlm9pBqe0pKZsGtt
	 GZB/A1Ct6lkKKTwmQEChhSyUPfi4D5GCT6BaftnD04yYn3srz1n5/Y5gEvex33akgj
	 gl0MUfzQoPrzyOBUblAEZ9SVBzRif66jd1bQl5YIa4KN2PKtp+0s25s7Ao5FtrXMyu
	 ekTcg7cOCvCCBFbNhX1QhfX/fDuc3JdOCXJGLWx6GT/CRk+Xzl8QgvGB1BFisJvOCz
	 7LKf/7mJnEa5YWWC6TtQ/xuX0J7fcPAWE4+sDxHqHKXNITaTCuWIME462N+49oLUJn
	 UemsLsfwU2zTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] misc: amd-sbi: Add support for SB-TSI over I3C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-6-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-6-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:19:17 +0000
Message-Id: <20260622141918.086C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The I3C transfer buffer shares a CPU cacheline with the device str=
ucture and other DMA mappings, causing unsafe DMA operations and potential =
memory corruption.
- [Low] Unmet Kconfig dependency warning triggered because `SENSORS_SBTSI` =
unconditionally selects `AMD_SBTSI` without inheriting its dependencies.
--

commit 6d735915bcef7f51c2d83398a0f1592836ede997
Author: Prathima <Prathima.Lk@amd.com>

misc: amd-sbi: Add support for SB-TSI over I3C

This patch extends the SB-TSI driver to support both I2C and I3C bus
interfaces. It registers both I2C and I3C drivers using
module_i3c_i2c_driver() and updates the Kconfig dependency from I2C to
I3C_OR_I2C.

> diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
> index 512251690e0e9..1a96b71f85069 100644
> --- a/drivers/misc/amd-sbi/Kconfig
> +++ b/drivers/misc/amd-sbi/Kconfig
> @@ -23,13 +23,13 @@ config AMD_SBRMI_HWMON
> =20
>  config AMD_SBTSI
>  	tristate "AMD side band TSI support"
> -	depends on I2C
> +	depends on I3C_OR_I2C

[Severity: Low]
Could this change cause unmet direct dependencies warnings if another Kconf=
ig
symbol selects AMD_SBTSI without inheriting this new dependency?

For example, if SENSORS_SBTSI selects AMD_SBTSI, it would need to have
compatible dependencies to prevent build failures on unsupported
architectures or when I3C/I2C is disabled.

>  	depends on ARM || ARM64 || COMPILE_TEST
>  	select AUXILIARY_BUS

[ ... ]

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> index 6ef1831515bbb..9278d06d8e5f6 100644
> --- a/drivers/misc/amd-sbi/tsi-core.c
> +++ b/drivers/misc/amd-sbi/tsi-core.c

[ ... ]

> @@ -23,8 +33,54 @@ static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 =
reg, u8 *val, bool is_read
>  	return i2c_smbus_write_byte_data(data->client, reg, *val);
>  }
> =20
> +/* I3C read transfer function */
> +static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
> +{
> +	struct i3c_xfer xfers[2] =3D { };
> +	u8 *buf =3D sbtsi_i3c_buf(data);
> +	int ret;
> +
> +	buf[0] =3D reg;
> +	/* Add Register data to read/write */
> +	xfers[0].rnw =3D false;
> +	xfers[0].len =3D 1;
> +	xfers[0].data.out =3D &buf[0];
> +
> +	xfers[1].rnw =3D true;
> +	xfers[1].len =3D 1;
> +	xfers[1].data.in =3D &buf[1];

[Severity: High]
Does this code risk memory corruption or unsafe DMA operations?

If the underlying I3C host controller processes these transfers using DMA,
mapping &buf[1] as DMA_FROM_DEVICE requires a cache invalidation upon
unmap.

This invalidation could silently destroy concurrent CPU writes to
variables sharing the same cacheline, such as the kref in struct
sbtsi_data.

Additionally, passing adjacent 1-byte buffers for overlapping
DMA_TO_DEVICE and DMA_FROM_DEVICE mappings in a single transaction
violates the Linux DMA API.

> +
> +	ret =3D i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);

[ ... ]

> diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-c=
ore.h
> new file mode 100644
> index 0000000000000..7dde040caf308
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi-core.h
> @@ -0,0 +1,23 @@

[ ... ]

> +struct sbtsi_i3c_priv {
> +	struct sbtsi_data data;
> +	u8 buf[2];

[Severity: High]
Is it safe to define this buffer without explicit cacheline alignment?

Without ____cacheline_aligned, buf shares a CPU cacheline with adjacent
fields in struct sbtsi_data. As this buffer is used in I3C transfers in
sbtsi_i3c_read() and sbtsi_i3c_write(), this could lead to cacheline
sharing issues during DMA.

> +};
> +
> +#endif /* _LINUX_TSI_CORE_H_ */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D5
