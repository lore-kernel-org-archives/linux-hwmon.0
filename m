Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B62486BBD;
	Thu, 10 Sep 2026 12:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044127; cv=none; b=SQu/yPIHUO3puZiK1M1oCnsySvvU1GZKzT8HqzRWjVA06iyG64tWo5/CcoKwpwUfTjpAnV6RDqQmDrPLCx2H1+U7pBMrG3EPz+MaIpFm69aHlgMOW12e5n05zhu9+b+xL/luwS73W28cOPd5vuulQNnsjqXeRLpO5Rds2jbEqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044127; c=relaxed/simple;
	bh=TG4Gnl1Qtv7eNgGjHPXIME8kZc9aSVBU83Z0jWhZESQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HjNz+r0TaMOiAVJk3UdGPeKjt4x+HHPJmYcxkrqNwspDWydudxldd/GsVjzYK3pSYMzxZivbnO9og+5bkqYtG5m1KDojf+14/n4f5b7URLvrA3UgUrWMzg1Hg2rErG+spCuFhp5jZ0WD6oIHjWB+yqLKkWvA1aTtd/Xru1Sl6bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UK2vN/Qs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UK2vN/Qs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1B51F00893;
	Thu, 10 Sep 2026 12:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789044125;
	bh=lQmBL8I8WhIMpQS5Iw7/Dx1l93unEv8As8CQR+weJQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UK2vN/Qs1fZBD2sacTbbAL8d/KMIuiEW/H/Ex13i1aOHu0s6DFH28yDKrXLs7J+Vr
	 /vmL3jYKsEdI60DiTAGe53mfI755wLLmMO3XpV/oXa+YlksnrhMW9+acBn3mfdysaP
	 b2CJu9sBfMarEQQDbZ6OyEvZbQu3bdIHmyo5jC8vzjlBbp4K16SZ+dtVfQY++HAuvd
	 UgZ64jDtfdVgYC/nMJMsxWty30L4Q52DjEcvmwfemzMGydSOdeSkn2FLsvkh7jepmu
	 Ph2tf8qLn6imWMSSCblszYC2qPfc2taS2yGe3FUMfRihQmDmrMVfkYZOpBNXOxdzo/
	 fy0pPCnhbxiAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260910-add-tda38740-and-tda38725-v4-2-dbae7fabce09@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-2-dbae7fabce09@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 12:42:04 +0000
Message-Id: <20260910124204.ED1B51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `struct tda38740_data` is used and allocated in `tda38740_probe=
()` but is never defined, causing a compilation error.
--

commit 38416ec86775dd4db25c806a9c1584cb372a401b
Author: Colin Huang <u8813345@gmail.com>

hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725

This commit adds a new PMBus driver for Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators. It provides standard PMBus
hardware monitoring telemetry.

> diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda3874=
0.c
> new file mode 100644
> index 0000000000000..6d3e9884f733b
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740.c
[ ... ]
> +static int tda38740_probe(struct i2c_client *client)
> +{
> +	struct tda38740_data *data;
> +
> +	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);

[Severity: Low]
Is struct tda38740_data missing its definition?

It appears this struct is never defined in this file or included headers.
Does this result in a compilation error here, since sizeof() cannot evaluate
an incomplete type?

> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));

[Severity: Low]
Because the type is incomplete, does dereferencing data->info here also
cause a build failure? Would it be better to define the struct locally
with the info member, or directly allocate a struct pmbus_driver_info
instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-add-tda387=
40-and-tda38725-v4-0-dbae7fabce09@gmail.com?part=3D2
