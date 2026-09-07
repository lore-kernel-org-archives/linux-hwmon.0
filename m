Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE63EDAC9;
	Mon,  7 Sep 2026 03:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752098; cv=none; b=b8aDtgBnwdDFGArt8+oqlgKgzZaCnmTNiBygYkN/InmDZEJO1b+tsv44L8PiBJ/NGiw0HmJHzb68eVRlp2hQ1XwKxeHCJKcb3TF79apAWn1418k2dp2OSCGKRtm2nVEvhi2poo9NhHUc01W//NhzaAQ8eQpjY/BybytVw+Rlun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752098; c=relaxed/simple;
	bh=QFe1Tub4KdfcM+rTehSiWBARSJ1asAuL6cNVC4OLVF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mh7pJNungt1XQzZmiTLWbcYnIeST3pbKmMc/9kn70gZPeY8m/OWjgVwgRMJiiLmMJP+TMOIuEyctH/L+m+EcAiNWRZBHtdmHCEYiellJPtI9o8F1s4al76JEgLmDQY9eJMMnK/5pvjBzJgsgcIwNGtGikwkcSlmQJIVKtrDrCXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d11R6yUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d11R6yUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28DF1F00A3A;
	Mon,  7 Sep 2026 03:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788752096;
	bh=glxT3bIgB219Y3o6cB8V0sllAsGZnqfzivjfJtk8+Ac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d11R6yUA4Y/AGZ7jYTZM2+9joJBByV7cx+NWdpd90FodqnZOEMzmUQz4zxNIQ5TWS
	 VX4Rr2uRqHGbWSfi5sJxhsZXWs87786xDZ6NdWhcCgRFGExvLCuRLJOyF0sN0EY9UN
	 sS8yhQi7UJLcS4/Ez2GeUNRTjeU2Scw91AUBI3A4mb6ULlIx00zu0frtGULY48VAH7
	 ewFBw3stjiUoNFn6zpaG6+03rPMJR43IC0viT9k0uId9jyjgp3IA83xiX13LNMM+26
	 CBaxmuXB62vUUNgXZM+YCcpDXQMyRhpFyqHuCiQ4aLUj/RsLtLGJ+q3/Vq46mMN8v9
	 rOFZphZoYgjRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-add-tda38740-and-tda38725-v1-2-e2db1b2566b1@gmail.com>
References: <20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com>
 <20260907-add-tda38740-and-tda38725-v1-2-e2db1b2566b1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 03:34:55 +0000
Message-Id: <20260907033455.A28DF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The i2c_device_id array uses unnamed (positional) initializers, vio=
lating the I2C subsystem guidelines.
--

commit eb4e8412377fc06c23e75ea2aa72286755317004
Author: Colin Huang <u8813345@gmail.com>

hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725

This commit adds a new PMBus driver for the Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators.

> diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda3874=
0.c
> new file mode 100644
> index 0000000000000..4217a5a9ee661
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740.c

[ ... ]

> +static int tda38740_probe(struct i2c_client *client)
> +{
> +	struct tda38740_data *data;
> +
> +	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
> +
> +	return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct i2c_device_id tda38740_id[] =3D {
> +	{"tda38725"},
> +	{"tda38740"},
> +	{}
> +};

[Severity: Low]
Could we update this i2c_device_id array to use C99 named initializers? The
I2C subsystem guidelines mandate the use of named initializers for initiali=
zed
arrays of type struct i2c_device_id.

> +MODULE_DEVICE_TABLE(i2c, tda38740_id);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-add-tda387=
40-and-tda38725-v1-0-e2db1b2566b1@gmail.com?part=3D2
