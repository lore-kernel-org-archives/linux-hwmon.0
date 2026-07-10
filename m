Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C3E41F7F3
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683306; cv=none; b=spOZnMnHugJBmbT1ARPRVVexkOF2CcF0myHlM7Q2kuYgVODVQJy0haRGUOFgs23Xpgd5v3zCOAe09w64uKJYv9uv0n5Uxfrixl47WbPOOG3YQs2T+VS967lQUnBY46IXMm5vcglg4/DT0C+fcAvtcQnczg2gLSbEUeljilnpBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683306; c=relaxed/simple;
	bh=VUL5zuuUlykHNb6n3Mxny67pW9N9tVzZWAyJU2ZnJLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kP8UWOIdhae3roO82w/GIIS1kmqjDy50byBV7upmgXanUYw/9/+sHV8Rtj8BB2eauMiPT27+cV8u8+l9w0CiPcV+r9MWClTIxpDw75qu0JZ1V4/dzjgXO7BNfYF+y3vTWbfhGomrdUTk2GnpDAOGDwEgmo2oHQ/rHlCDYol1NHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ee5L9CZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ee5L9CZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB501F00A3A;
	Fri, 10 Jul 2026 11:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783683296;
	bh=Sw/ETUmGXENS4YZhfNMd7WZY2UNB9ZOlYxROEwGNjzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ee5L9CZ2sGtxHL3YFS0LLdHtD43qIxcVt93ESjdZ4F+fXwN1wOaC3J3UCIxa+RKV/
	 NF6PHAcyM4w8wRjdHmDzvf0YjFFdw23kb4I3TWbcvbP0sMz6SggtuEwnQjcb7qS9zJ
	 eHsSa0VFT6bKgV+JILgztmZYiHiH2LQct/pchAozYqMdPV9YHn328V6a7XaTJekyW6
	 2BT+IRvQZOD+0i+nQKGek3loSzv8QEpk4kn63youe4aDiWbcTbqds+iJ/ae6IHfRP4
	 hbr5sYgYt/3uQ43bFEi+GJtyTSt/HnhLSm2QSdrVuA/xnXL8SP2O15A6uQWdUG4uxa
	 vgI/d03THpXag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] misc: amd-sbi: Add support for SB-TSI over I3C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-6-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-6-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:34:55 +0000
Message-Id: <20260710113456.5FB501F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Concurrent hwmon sysfs accesses cause data races on the shared I3C=
 DMA buffers (`priv->tx` and `priv->rx`) due to missing locking.
- [Medium] The I3C transmit buffer `tx` in `struct sbtsi_i3c_priv` is not c=
acheline aligned, violating DMA mapping requirements.

Pre-existing issues:
- [High] Temperature register reads are performed non-atomically without a =
device lock, breaking the SB-TSI hardware latching mechanism on concurrent =
accesses.
--

--- Patch [5]: [PATCH v4 5/8] misc: amd-sbi: Add support for SB-TSI over I3=
C ---
commit f466305c592ff454f903d27fc9a9ef283f005d66
Author: Prathima <Prathima.Lk@amd.com>

misc: amd-sbi: Add support for SB-TSI over I3C

This commit extends the AMD SB-TSI driver to support both I2C and I3C bus
interfaces. It selects the appropriate transport based on the probed bus ty=
pe
and registers both drivers using module_i3c_i2c_driver() while maintaining
backward compatibility with existing I2C deployments.

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> index 6ef1831515bbb..1c6f37f26d945 100644
> --- a/drivers/misc/amd-sbi/tsi-core.c
> +++ b/drivers/misc/amd-sbi/tsi-core.c
[ ... ]
> @@ -23,8 +28,56 @@ static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 =
reg, u8 *val, bool is_read
>  	return i2c_smbus_write_byte_data(data->client, reg, *val);
>  }
> =20
> +/* I3C read transfer function */
> +static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
> +{
> +	struct sbtsi_i3c_priv *priv =3D to_sbtsi_i3c_priv(data);
> +	struct i3c_xfer xfers[2] =3D { };
> +	int ret;
> +
> +	priv->tx[0] =3D reg;

[Severity: High]
Does this sequence need synchronization to protect the shared priv->tx and=
=20
priv->rx buffers?

The hwmon subsystem does not serialize reads and writes to sysfs attributes.
Without a lock protecting these buffers during the bus transfer, concurrent
sysfs reads from multiple threads could race, causing threads to overwrite
the transmit payload or read incorrect response values before or after
i3c_device_do_xfers() completes.

> +
> +	/* Write the register address (DMA_TO_DEVICE). */
> +	xfers[0].rnw =3D false;
> +	xfers[0].len =3D 1;
> +	xfers[0].data.out =3D priv->tx;
[ ... ]
> +/* I3C write transfer function */
> +static int sbtsi_i3c_write(struct sbtsi_data *data, u8 reg, u8 val)
> +{
> +	struct sbtsi_i3c_priv *priv =3D to_sbtsi_i3c_priv(data);
> +	struct i3c_xfer xfers =3D {
> +		.rnw =3D false,
> +		.len =3D 2,
> +		.data.out =3D priv->tx,
> +	};
> +
> +	priv->tx[0] =3D reg;
> +	priv->tx[1] =3D val;

[Severity: High]
Similarly, could concurrent sysfs writes overwrite priv->tx here before
the i3c_device_do_xfers() call finishes?

> +
> +	return i3c_device_do_xfers(data->i3cdev, &xfers, 1, I3C_SDR);
> +}
> +
> diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-c=
ore.h
> new file mode 100644
> index 0000000000000..7e8c0e7c3bcfa
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi-core.h
[ ... ]
> +struct sbtsi_i3c_priv {
> +	struct sbtsi_data data;
> +	u8 tx[2];
> +	u8 rx __aligned(ARCH_DMA_MINALIGN);

[Severity: Medium]
Should the tx array also have the __aligned(ARCH_DMA_MINALIGN) attribute?

Without it, tx might share a cacheline with the preceding struct sbtsi_data
fields. When tx is mapped for DMA to device transfers during I3C operations,
this violates the DMA mapping rules preventing cacheline sharing and can
trigger kernel warnings.

> +};

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of a device-le=
vel
lock around temperature register reads break the hardware latching mechanis=
m?

Looking at drivers/hwmon/sbtsi_temp.c in sbtsi_temp_read(), the integer and
decimal registers are read sequentially:

    ret =3D sbtsi_xfer(data, reg1, val1, true);
    if (!ret)
        ret =3D sbtsi_xfer(data, reg2, val2, true);

If multiple threads concurrently access sysfs, these non-atomic transfers
could interleave on the bus. This might cause one thread to receive a
mismatched latched decimal value triggered by another thread's integer read,
resulting in corrupted temperature reports.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D5
