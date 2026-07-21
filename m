Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7727C395AE9;
	Tue, 21 Jul 2026 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616197; cv=none; b=Crjmfvf82DBAG8iadMOWhY/p4vZ6y6iecHCgEB1wKJwxPaRa0vf0VD1BHWmzkZOauzTHQD6mysg1UF5UL11gyGV8TQBSOIiez+SNDaMpUs4evq4gfHRgUq1RnWwvDh7wxpughYR/kUzOty4u1VuaIRx/MMuvqsN5dLtZbMd2IV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616197; c=relaxed/simple;
	bh=a4CHPh5liXOZTgtN8cFo3gtJnOMm2Q2Ttbqe8cdiMZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C/+59tb0Uzan16u3KkkG5rCHasbXfaJKmSg0iFtRZp1gEC3ZgVR6yELaXdeIfTg8k+fSy193m3H7O7gLRsvLokca4h+IrIVtH5xgmPL3Gx6z6YQl+sqfNa7GyJMpcxGEuMICj5gicBc2FyFh5ZIUD+4+Yh+UhoR4m91+PsQErnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0BNLGgM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0BNLGgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD4B1F000E9;
	Tue, 21 Jul 2026 06:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616196;
	bh=kVnIpGpmvtjoIQJps5gkSN8L7+gGBTT082HNeVXQLmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V0BNLGgMIrJdVESQXDeOM8oJHspiuSaSVUCvX353qXrflfEyfX3H0/qhQfB0LSpLs
	 OEvtJAzSRCppKsKdGBbBhKEr8Wf9KBSjBi7VqKPLjDbRYaCGagbn9uV5mSfkwy5VWK
	 +oe+5tl+8CR6H1TrbtYoyqbrLzSkh4ngrbs9aYAXO2hBYazyvfgAwpJC8Ll7BCYwPq
	 CGN7pnbf9dAE231xX+S68P0mNYR4ivCJ1J9c+zr7kKF47cmiN2PqSNOtZKQ3kAkv6I
	 T1nMpUYti8VVVASgO91RlrpkgWvm/akcNQfny7fTUr9CHCNkgmrF3QDrB8QvQ7JgyR
	 wUmmPP2WJHRpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-kb9002-upstream-v3-3-70563922be8d@amd.com>
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
 <20260721-kb9002-upstream-v3-3-70563922be8d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:43:15 +0000
Message-Id: <20260721064315.DCD4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Stack-allocated buffers are passed to `i2c_transfer()`, which is u=
nsafe if the underlying I2C adapter driver uses DMA.
--

--- Patch [3]: [PATCH v3 3/4] hwmon: (kb9002) Add driver for Kandou KB9002 =
retimer ---
commit 2acb53c63efe6bebfdbda9c58f2be139429caa78
Author: Andy Chung <Andy.Chung@amd.com>

hwmon: (kb9002) Add driver for Kandou KB9002 retimer

This commit adds a hwmon driver for the Kandou KB9002 8-lane PCIe 5.0
retimer. It exposes the firmware aggregated maximum die temperature as
temp1_input and adds debugfs entries for firmware version and boot status.

> diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
> new file mode 100644
> index 0000000000000..61a6e522e770d
> --- /dev/null
> +++ b/drivers/hwmon/kb9002.c

[ ... ]

> +static int kb9002_i2c_read(struct i2c_client *client, u32 reg, u32 *val)
> +{
> +	u8 addr[4];
> +	u8 rbuf[4];
> +	struct i2c_msg msgs[2] =3D {
> +		{
> +			.addr =3D client->addr,
> +			.flags =3D 0,
> +			.len =3D sizeof(addr),
> +			.buf =3D addr,
> +		},
> +		{
> +			.addr =3D client->addr,
> +			.flags =3D I2C_M_RD,
> +			.len =3D sizeof(rbuf),
> +			.buf =3D rbuf,
> +		},
> +	};
> +	int ret;
> +
> +	put_unaligned_be32(reg, addr);
> +
> +	ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));

[Severity: High]
Does this pass stack-allocated buffers (addr and rbuf) to i2c_transfer()?
Passing stack memory to the I2C API is unsafe if the underlying adapter uses
DMA, which can lead to mapping errors or stack memory corruption. Could the=
se
buffers be allocated dynamically or placed in a device data structure inste=
ad?

> +	if (ret < 0)

[ ... ]

> +static int kb9002_i2c_write(struct i2c_client *client, u32 reg, u32 val)
> +{
> +	u8 buf[8];
> +	struct i2c_msg msg =3D {
> +		.addr =3D client->addr,
> +		.flags =3D 0,
> +		.len =3D sizeof(buf),
> +		.buf =3D buf,
> +	};
> +	int ret;
> +
> +	put_unaligned_be32(reg, &buf[0]);
> +	put_unaligned_be32(val, &buf[4]);
> +
> +	ret =3D i2c_transfer(client->adapter, &msg, 1);

[Severity: High]
Are we also passing the stack-allocated buf to i2c_transfer() here?
Similar to the read path, using stack memory for I2C transfers is unsafe
for adapters that use DMA.

> +	if (ret < 0)

[ ... ]

> +static int kb9002_read_revid(struct i2c_client *client, u32 *revid)
> +{
> +	u8 dummy;
> +	int ret;
> +	int i;
> +
> +	for (i =3D 0; i < KB9002_REVID_READ_RETRIES; i++) {
> +		ret =3D kb9002_i2c_read(client, KB9002_HW_REG_REVID, revid);
> +		if (ret)
> +			return ret;
> +		if ((*revid >> 24) !=3D 0xff)
> +			return 0;
> +		/* Drain one byte from the chip to re-align the I2C FIFO. */
> +		i2c_master_recv(client, &dummy, 1);

[Severity: High]
Does i2c_master_recv() receive the stack-allocated dummy variable?
This function internally calls i2c_transfer(), which again risks DMA
mapping issues with stack memory.

> +	}
> +
> +	return -EIO;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-kb9002-ups=
tream-v3-0-70563922be8d@amd.com?part=3D3
