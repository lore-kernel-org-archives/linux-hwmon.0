Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54964908A8;
	Fri, 24 Jul 2026 00:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784851606; cv=none; b=tBtiQrGCkSod6yisj0kpTdAE8HgXd4FQuinS+TFijHzIjxOdAlqKtKH1aiegyvIJI2uVv/oaGdL0eL333kLjSIn1Mknj5GbuQs+zABJwgqaByx1Ca2ew6CjuglQAmNVtxMrxeRRYPug5EiKt1/G2I05qjL/KgBdEh9RjHmYtNiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784851606; c=relaxed/simple;
	bh=rOUhK3ChCDf+fY149y3ewrs46qumDsbp61YOyMF8b78=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mb/2qbf7RL24uJ+ZeYY1C6CbD769TUca8rLsfCLzqvBkUWe/Ab+TAp08uQj/eo3p6xy1uYfohGKEFwegiT9RIKtqYJI4QdHRKf5P2BLmOpna+nKecyot5LTXpj2x9Gije1CUDQcvOai7wxRMOmV29ifm0UKAPdYD2tcAjYSgTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8EBToM+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8EBToM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60C81F000E9;
	Fri, 24 Jul 2026 00:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784851604;
	bh=yUnDHXLMh7aWoxdRgjfwdmFzcHmVB/sDKFwnquCTmj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S8EBToM+K6oZFhVuCv/Xv3a4C7+YGXDIui4F+B9au5ejR0wwpxDEgxGtiIH64C0CJ
	 dC/EeZKxH4CYkKytLTlMvc8ZWbTdglPEikFPwEoqoRhGisQFpDgxR+jV9BIJ10MPxY
	 DXQKilzCvJsG6oL7mZxhY8lWkoAGH2H4I1KMtaImNGjyCCLoPDzon6Yvc4QXxEGOmh
	 bW+P4S/Rcf0wm+FUeFJfi8dhbfRI/Glv5EL8Megy7mPB8uzRSY/R1hoIuhuwa/8BHp
	 V/7dY1QeV+GwFAUuE+qXNHTw1ljvEHT8jH5NABOXkMPNfVAznR9irQFEb/AeYNy3Vh
	 +G7uNQCk2yhNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 00:06:43 +0000
Message-Id: <20260724000643.E60C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Stack variables passed to i2c_transfer() can cause memory corrupti=
on or panics with CONFIG_VMAP_STACK.
--

--- Patch [3]: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver ---
commit 1098fecfca1c29b33a174b200465134bc5be4be8
Author: Vincent Jardin <vjardin@free.fr>

hwmon: pmbus: add MPQ8646 driver

Add a new single-chip driver for the MPS MPQ8646 that is a PMBus device.
The driver adds extended bits decode, alarm acknowledge, gate-close retry,
and an in-driver alarm-poll fallback.

> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
> index 0000000000000..f8dfabef09df3 100644
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mpq8646.c
[ ... ]
> @@ -187,24 +187,24 @@ static inline struct mpq8646_priv *mpq8646_priv_fro=
m_client(struct i2c_client *c
>  static int mpq8646_raw_xfer_rword(struct i2c_client *client, u8 reg)
>  {
>  	u8 cmd =3D reg;
>  	__le16 data =3D 0;
>  	struct i2c_msg msg[] =3D {
>  		{
>  			.addr =3D client->addr,
>  			.flags =3D 0,
>  			.len =3D sizeof(cmd),
>  			.buf =3D &cmd,
>  		},
>  		{
>  			.addr =3D client->addr,
>  			.flags =3D I2C_M_RD,
>  			.len =3D sizeof(data),
>  			.buf =3D (u8 *)&data,
>  		},
>  	};
>  	int rc;
> =20
>  	rc =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));

[Severity: High]
Can this cause memory corruption or a kernel panic?

I2C adapter drivers often use DMA for transfers. When CONFIG_VMAP_STACK is
enabled, the kernel stack is not guaranteed to be physically contiguous.
Passing stack-allocated buffers like cmd and data to DMA-capable APIs
like i2c_transfer() will cause dma_map_single() to map incorrect physical
memory.

Although this is triggered via debugfs, executing it on a DMA-capable I2C b=
us
could reliably crash or corrupt the system. Should these buffers be dynamic=
ally
allocated instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-mpq8646_v0=
-v5-0-5915b5ae9aa2@free.fr?part=3D3
