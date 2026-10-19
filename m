Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435956;
	b=yiGJr7PFfDECNWCAapIW8tvX707baOiAX4WNHskiDtDGDhiUaLrIcedmWrrly94qTxCG
	 Ut+cIt88FxF42PYwN1wnOy9yFiqch6e7eiwOlINxMmYZdCdhb1yOgsMxLruKQn65OKrTn
	 TVGXWO2d1nHsPHOsHIaDsxcZdZeXU1FeRmuFuqRluUk8SUtRsoONzxYBBOMuGW9pfYXA8
	 RgGQcmEHu+UV7+jIX5b4sXM49IIyxPuVS+TMe5fXUValZQm9TYyJxGex0VLTJDo3EFtat
	 MV84Qc+qTURuIdbIGffr5gffTJH4ms7DwWlGPwpzAt+D/oxFiEzK9m2/6t4Rabo831Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435956;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hw8mNyz0WQQVtaj/CRL34akX6Nc9WuHlIQaHOlLjqNk=;
	b=bMvITF7LlCFYwVwjqz22J1dpvCbV02laeQn9gBMop7kPlo3EyaEMNSJTscLb/SjU0sVe
	 hXt3GRRMIwN+SAXA0vvjMVKGIv73dJr0HKYU55k+JEZw2b6I4OpfVs5uuVYCOdryBGh9P
	 9Bw4IEjZ+Iw1dZAh78x0+SYkYjlBWjrBAt6/7uP65MDPvTPrU8oAChnP9YxXXeaYegj8k
	 IeQeDbhIMVyxpPygMpieYBQvAy8UJJCXb0i5dWdemad76+pSf3KwhGzGbdsyXLy5qpJh0
	 sqjO9KOSUIFpU1Oz/MaltY+DH1oEncb8quuZv1OTvNjqjp9VcyUS4dBH4cLoE/Ehkgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSmRPQpi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D055606A31E;
	Mon, 19 Oct 2026 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSmRPQpi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F491F000C4;
	Mon, 19 Oct 2026 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792435955;
	bh=hw8mNyz0WQQVtaj/CRL34akX6Nc9WuHlIQaHOlLjqNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSmRPQpinqxdqgtMZeZJWARK1vBDh5TelL4sc35nc04xgGMC4T1UwUk9F/608cUvv
	 BlUOAncr+6FJ+exQ8HkqIiuqyZZCbjOlTHdEhJBSg0xppKdr4F6SgEnFSHcLyHAY+e
	 G545t9d6vN/6T85N5v0+cfa8MOQmB4LgcdZ1JRtY4MXrifZ3pcPRYeg2+mxoZ+lM59
	 RwFQgkIoNKVqg/CxtRGTTdDEcS/7OMFud0M+w9BlTzE0nL/QBkLzqJWcbeQJYD1y3W
	 rjzrYJuV7Dqg4Wp4Afw5pcwop8y9Z6cyscyjJhpiHxQk/AtCzAEePliBjEmVCfdoAR
	 sK/HMAJX3jrgg==
Message-ID: <sashiko-outbox-178111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kevin Jia" <kjia@nexthop.ai>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-fs1603-v1-3-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
 <20261019-fs1603-v1-3-8adf972386c1@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 18:52:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] hwmon: (fs1603) positional initializers in struct i2c_device_id fs1=
603_id
--

commit d32400df72d7884af500586426d84640110c0f0e
Author: Kevin Jia <kjia@nexthop.ai>

hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters

This commit adds a read-only hwmon driver for the TDK FS1603, FS1604,
FS1606, and FS1006 uPOL DC-DC converters, reporting input and output
voltages, output current, temperature, and protection thresholds over a
proprietary I2C register map.

> diff --git a/drivers/hwmon/fs1603.c b/drivers/hwmon/fs1603.c
> new file mode 100644
> index 0000000000000..ae22964d22b2c
> --- /dev/null
> +++ b/drivers/hwmon/fs1603.c
> @@ -0,0 +1,480 @@

[ ... ]

> +static const struct i2c_device_id fs1603_id[] =3D {
> +	{ "fs1603", (kernel_ulong_t)&fs1603_models[fs1603] },
> +	{ "fs1604", (kernel_ulong_t)&fs1603_models[fs1604] },
> +	{ "fs1606", (kernel_ulong_t)&fs1603_models[fs1606] },
> +	{ "fs1606_0600", (kernel_ulong_t)&fs1603_models[fs1606_0600] },
> +	{ "fs1606_2500", (kernel_ulong_t)&fs1603_models[fs1606_2500] },
> +	{ "fs1006_5000", (kernel_ulong_t)&fs1603_models[fs1006] },
> +	{ "fs1006_3300", (kernel_ulong_t)&fs1603_models[fs1006] },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, fs1603_id);

[Severity: Low]
This isn't a bug, but should the entries in fs1603_id[] in
drivers/hwmon/fs1603.c use named initializers (.name and .driver_data)
rather than positional initializers, matching the convention for new
struct i2c_device_id tables and the style used in fs1603_of_match[] right
below?

[ ... ]

=E2=94=80=E2=94=80=E2=94=80=E2=94=80
Touestas, feedback, or questions about this review? Email
linux-kernel-bot@google.com.
=E2=94=80=E2=94=80=E2=94=80=E2=94=80

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-fs1603-v1-=
0-8adf972386c1@nexthop.ai?part=3D3
