Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AB41B35C
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682900; cv=none; b=IlVIv/89rFBZdrWz1Y0l2klx800xA1Mqo79MEX9mwMgNfPL7QgsOnhoSr6ly3dl5L/SxpH2n89dZKfEBM0qvzmZ/R9rLFy4W/evfZ3efwJTlZsp/M3Fjz27mKaYrkaTgPdLvAsquUUyj5byrCARE6EnpxLL0rVnRuGM6v2SIbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682900; c=relaxed/simple;
	bh=SmYWqxviij9HFGWDIDtYQvDEHoUV8sC1BARFiZ+psJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rfNTtV5JwZudPRc4xAHufVgI8xNgwoy+MfMasPMsPi4K24Kx7BEIe1zP42cMDqYtxmsJd123i97clBxFtrsxGozOSuhEa1V+UcdXOEPvM2cGtpiIQ7AnBavM44T1Yh09hmlJ9DANZemzikqNr/NPDuqq9EjUbdN3sErzjqlCSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4UwEuV9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4UwEuV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5AF1F00A3A;
	Fri, 10 Jul 2026 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783682890;
	bh=ydg2VWoD+LNR21+MCLpbeg3+/ofEcseGj9syUsB0RKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4UwEuV97C78yDuTSsavXLFn0P3raK2gIk34/EmlsHXtDKtFChmeKs/EbK2aEZwS9
	 hDjM425UUAhwHgKfjmFAONWcql0V9li/nunDdXcoHe1NFfYIY8l/vdmzij27rLSzvj
	 bQ61aOfoJg8om55kFhlihfI+Z07JlsGaKoP0U0XE19ukoa8Xs5wt9qBiE24p+Bg47t
	 fA94h6OtV61515MJ13kW+RwqPmmNqkQqllSS6GDBMk72kN3OSbaTWubiKEtUh9RwpJ
	 y39LOfIbvvMC1Hz1eWVxVrSXevFuCbhHSj/Zu+41GEQmvqztT4pB2Gya2LkZ1cCKKN
	 elRWYpU5MRsdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] misc: amd-sbi: Add SBTSI ioctl register transfer
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-7-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-7-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:28:09 +0000
Message-Id: <20260710112809.DE5AF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Data race, DMA buffer corruption, and TOCTOU vulnerability due to =
concurrent hwmon and ioctl access to shared I3C buffers.
--

--- Patch [6]: [PATCH v4 6/8] misc: amd-sbi: Add SBTSI ioctl register trans=
fer interface ---
commit 01a49ea8ef63627c7743953c52073396818f7f3a
Author: Prathima <Prathima.Lk@amd.com>

misc: amd-sbi: Add SBTSI ioctl register transfer interface

Implement IOCTL interface for SB-TSI driver to enable userspace access
to TSI register read/write operations through the AMD Advanced Platform
Management Link (APML) protocol.

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> index 1c6f37f26d945..5c178702c67ab 100644
> --- a/drivers/misc/amd-sbi/tsi-core.c
> +++ b/drivers/misc/amd-sbi/tsi-core.c
[ ... ]
> @@ -77,7 +92,116 @@ int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *v=
al, bool is_read)
>  	if (data->is_i3c)
>  		return is_read ? sbtsi_i3c_read(data, reg, val)
>  			       : sbtsi_i3c_write(data, reg, *val);
> -
>  	return sbtsi_i2c_xfer(data, reg, val, is_read);
>  }
>  EXPORT_SYMBOL_GPL(sbtsi_xfer);
> +
> +/*
> + * The mutex protects against concurrent register transfers to the device
> + * over the shared bus.
> + */
> +static int sbtsi_xfer_ioctl(struct sbtsi_data *data, u8 reg, u8 *val, bo=
ol is_read)
> +{
> +	guard(sbtsi)(data);
> +
> +	if (data->detached)
> +		return -ENODEV;
> +
> +	return sbtsi_xfer(data, reg, val, is_read);
> +}

[Severity: High]
The commit message mentions that the hwmon path is placed under the same
lock in the next patch, completing the serialization.

Since this patch introduces the ioctl path before the hwmon path is locked,
can an unprivileged user reading the hwmon sysfs attribute (temp1_input)
concurrently with the new SBTSI_IOCTL_REG_XFER_CMD ioctl cause data
corruption?

For I3C devices, sbtsi_xfer() calls sbtsi_i3c_read() and sbtsi_i3c_write(),
which use the shared priv->tx and priv->rx arrays for DMA transfers:

drivers/misc/amd-sbi/tsi-core.c:sbtsi_i3c_read() {
	...
	priv->tx[0] =3D reg;

	/* Write the register address (DMA_TO_DEVICE). */
	xfers[0].rnw =3D false;
	xfers[0].len =3D 1;
	xfers[0].data.out =3D priv->tx;
	...
}

Will this allow concurrent access to overwrite priv->tx while a privileged
ioctl is preparing or executing a DMA transfer, leading to buffer
corruption during git bisect?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D6
