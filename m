Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4481420E70
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683335; cv=none; b=OwYvig9qSn7DQX9gEaNLLUAYtxx6m7Sm7KjX4eJinTwFXDhYgpMBeIMen5J9JYCFNlNWuQ/hxRkbHIdt7YXUG/iW6kpjdjZTp+Vj+LKfKuCBxyYtCBbZF9nHzuf1fqqRIwipcQDHy2e5i4VfNhFMmx/NoI1oqrit+iTmrzxD0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683335; c=relaxed/simple;
	bh=QRHb/TEpHljBROCL9AMGEgu7EYpVI0TPOf8h3cK7IEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T//nlA30Tc9y0Wr86U6mrertMKFRBH2L/gMVRWemaX/aCyaCqC/Ef+LUcinYHCOz/Q9+E+Fw39JhPtdZwbXSBQKm5zCFUx709e1WnESx+Xp2/U4fLY44W2/TFb0Qc/2ojTBEcsoIxHAf6PTg9NQzLqkzv27y2e4TlGSm5q48/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RG0Bz05F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RG0Bz05F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872F91F000E9;
	Fri, 10 Jul 2026 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783683322;
	bh=OwGCIuXyGV1dodN9GxfYRoMrRQpbP0varbBPWp0wPJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RG0Bz05FsW0RtrXnMqOsr5YHo8WwOwN3eozXDgFEdzXLe4qnhrZQEo5QGl2siRX6D
	 PvpVudb7ocU9321PQ4yk+QJTcA/F3k6Iyd7E83JswltsoFnrqiO/Aen532id+7I2Y1
	 Rw8IGoLyZbhmilIVVtQrutHssyeG5jqHRdbeKffX5C+tOiPYRf5RB+19iGPB3YVojL
	 5o8l9lB3G8C6g5CiJ6Yw1nYifGmvRzdtM0Pu0oUYaZ4V9PT2ccVqPqSt1VVdjPc3f4
	 X3shdsR5y4ABLe/GlVq3gW17V30pL9a+w3y7AGM24mV2sO1uOEHyBVauG8aFUj2unT
	 HiSuwjQRMKGHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/8] docs: misc: amd-sbi: Document SBTSI userspace
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-9-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-9-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:35:22 +0000
Message-Id: <20260710113522.872F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The I3C transmit buffer (`tx`) is used for DMA but is not cachelin=
e aligned, leading to DMA false sharing with adjacent fields in `struct sbt=
si_data`.
- [High] A race condition between `misc_open()` and devres driver unbind ca=
uses a use-after-free of `struct sbtsi_data`.
--

--- Patch [8]: [PATCH v4 8/8] docs: misc: amd-sbi: Document SBTSI userspace=
 interface ---
commit 0d1e3dd1fee7d42c8bd4c97352ebe1b9dc763f55
Author: Prathima <Prathima.Lk@amd.com>
Subject: docs: misc: amd-sbi: Document SBTSI userspace interface

This commit documents the SBTSI userspace interface and implements the SB-T=
SI
driver for AMD SoCs. It adds an ioctl interface to perform I2C/I3C register
transfers and creates a miscdevice node for each sensor. It also registers =
an
auxiliary device to bind with the hwmon driver.

Link: https://github.com/amd/esmi_oob_library [1]
Link: https://www.amd.com/en/developer/e-sms.html [2]

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> new file mode 100644
> index 0000000000000..5c178702c67ab
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi-core.c
> @@ -0,0 +1,207 @@

[ ... ]

> +/* I3C read transfer function */
> +static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
> +{
> +	struct sbtsi_i3c_priv *priv =3D to_sbtsi_i3c_priv(data);
> +	struct i3c_xfer xfers[2] =3D { };
> +	int ret;
> +
> +	priv->tx[0] =3D reg;
> +
> +	/* Write the register address (DMA_TO_DEVICE). */
> +	xfers[0].rnw =3D false;
> +	xfers[0].len =3D 1;
> +	xfers[0].data.out =3D priv->tx;
> +
> +	/* Read the data byte into a separate buffer (DMA_FROM_DEVICE). */
> +	xfers[1].rnw =3D true;
> +	xfers[1].len =3D 1;
> +	xfers[1].data.in =3D &priv->rx;
> +
> +	ret =3D i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);

[Severity: High]
Does this code lack cacheline alignment for the tx buffer?

Looking at the structure definition in drivers/misc/amd-sbi/tsi-core.h:

struct sbtsi_i3c_priv {
	struct sbtsi_data data;
	u8 tx[2];
	u8 rx __aligned(ARCH_DMA_MINALIGN);
};

Since tx lacks __aligned(ARCH_DMA_MINALIGN), it shares a cacheline with the
preceding fields in struct sbtsi_data. Because tx is used here as a
DMA_TO_DEVICE buffer, couldn't DMA cache maintenance operations on tx
corrupt adjacent fields like kref or lock on non-cache-coherent
architectures?

> +	if (ret)
> +		return ret;
> +
> +	*val =3D priv->rx;
> +	return ret;
> +}

[ ... ]

> +static int sbtsi_open(struct inode *inode, struct file *fp)
> +{
> +	struct sbtsi_data *data;
> +
> +	data =3D container_of(fp->private_data, struct sbtsi_data, sbtsi_misc_d=
ev);
> +	scoped_guard(sbtsi, data) {

[Severity: High]
Is it possible for a concurrent device unbind to free struct sbtsi_data
before sbtsi_open() acquires the mutex?

If misc_open() sets fp->private_data and drops the core misc_mtx, and then
devres executes sbtsi_driver_unref() (which drops the final reference and
frees data), would sbtsi_open() accessing data->lock result in a
use-after-free?

drivers/misc/amd-sbi/tsi.c:sbtsi_driver_unref() {
	struct sbtsi_data *data =3D arg;

	kref_put(&data->kref, sbtsi_data_release);
}

> +		if (data->detached)
> +			return -ENODEV;
> +	}
> +
> +	kref_get(&data->kref);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D8
