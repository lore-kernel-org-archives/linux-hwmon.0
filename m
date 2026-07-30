Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFD8266576;
	Thu, 30 Jul 2026 01:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785374048; cv=none; b=NmRfXax+b6IMbVpbIGIayvINmD0nO6S5vc7kU28lplDdKRzuHypW0SPjINICrgoiLeEn3SmwsnXK4iZPoKX1AKTW8rH5k7m2yAeQ/ApswTqZIVYG8t/cHbpow429jw/9sNlMglxMplBfCjCGrVLm12q/jNqg9uYAxL6Os2EI62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785374048; c=relaxed/simple;
	bh=ZN2iQ69zTg2Omwp+b28sjqEAF7zt9/o21ei2NV8+KN4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8w+jMMHQ61+FtYP+oN3KDBVYJ5/pY4DoO9SpJ8AdzT9oC+GbXIzv0E4exBz1OeivdOqoh9CXoWsOMfJx29xaHssLsg9J20Fq3zJy3jRL/oUamgkxDN3UibHNf2S+0G7NeQWrhWPq371/mZw8QDFd1uY0v8lrO0Oxpski1ZNgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOEr3GAM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOEr3GAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B871F000E9;
	Thu, 30 Jul 2026 01:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785374047;
	bh=1Dd4vBz603VYQr6wd+KQy+PpMObA5u802mrokheimnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XOEr3GAMdhqg6b6ezq3H9beFbmZoEacIrmlDKSQ/xj7mmea5dUa2pe0mePSFccBsH
	 bNqAj4RF+sWtDNuTq8dHVbRwjChLalgW42AvyI4GdOUsIhHPUhcAvKk1BhvlibFwAr
	 vp6xUORJt6Dg2g4XCsILSudHZuZhFgNxlAK7/G5HBnlvJx5f7K2uiYpFtR1XwhxwW+
	 b409492j6+IJljuuYMMWkSdxBwR8fm+NbSvC3KlJCwMW1xbnWV2qSpaTR2DzzH7XMy
	 4eV+zUvEQV1/3GKdmWu+SL3+mAHyBepBvq0AoM26OkD//nJx+8O8DNbh2hIlbfUBEC
	 DZfBo4Avii21w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for
 max20830c and max20840c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 01:14:06 +0000
Message-Id: <20260730011406.A6B871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch adds support for MAX20830C and MAX20840C devices but fai=
ls to add their corresponding compatible strings and I2C IDs to the driver'=
s match tables.
--

--- Patch [4]: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for max2=
0830c and max20840c ---
commit f53870a8f52f5aa8dbc791f9a7e148eeab915f24
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add support for max20830c and max20840c

Add support for MAX20830C and MAX20840 step-down DC-DC switching regulator
with PMBus interface. MAX20830C is a different packaging for MAX20830, and
MAX20840C supports 40A regulation compared to MAX20830 that is only 30A.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index ddead72a8db5d..94433deda0113 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
> @@ -21,6 +21,12 @@ struct max20830_data {
>  	u32 vout_rfb2;
>  };
> =20
> +static const char * const supported_chip_ids[] =3D {
> +	"MAX20830",
> +	"MAX20830C",
> +	"MAX20840C",
> +};

[Severity: High]
While the new chips are added to the internal string matching list here, do=
es
the driver also need to add these to max20830_id and max20830_of_match?

Without the new compatible strings in these tables, won't the devices fail
to bind to the driver when instantiated via Device Tree?

For reference, the existing tables at the bottom of the driver only have
entries for the original chip:

static const struct i2c_device_id max20830_id[] =3D {
	{"max20830"},
	{ }
};

static const struct of_device_id max20830_of_match[] =3D {
	{ .compatible =3D "adi,max20830" },
	{ }
};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dev-max208=
30c-v5-0-a7553f84ee74@analog.com?part=3D4
