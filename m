Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55044AB62;
	Thu, 17 Sep 2026 11:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645279; cv=none; b=VwElzkcjHfiMSxcO1GECZATwB0cJue2B+9xUARdoe8sT0x9hg+vwMvENYtbgZJsAGhgj052+3xXzBUbeD7x4smaKXJ5wqr5k8sCs0fH1y3ieQ/7KtT6uBgJ/jwc1ZqhiuLj9Rn1EHZXwcDucTqk/NXdWK7/wqqx/hUsa125kO/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645279; c=relaxed/simple;
	bh=yNgOT/NCm35aZDCZN71bf22t5Nqy2vWSUECZfNQQZm4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OdDp3qNio1fKQb4xnK5nm22i46rtT08xIe9nDq5ybXq/ug8Tw1avzT7ej939rvqF0WUuADZ+0gkB3idU1edIWLqd6BkBjvjMw10qS4oTJvQfnlNXOe0GgUEQkOu12OKB4sZPAq4gloNx2Ef/ZqDaVjDbMlxa87JKNy8OJmmfHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AR3WxnnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AR3WxnnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ADB1F00893;
	Thu, 17 Sep 2026 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789645277;
	bh=K5xW1NM5LMWR99CNbv0SQ6HJpvf05pCRlSuTBKRXwCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AR3WxnnII8F1TNBaO/qOc6EGCrzFCsbaBSS3S9j6SL0h/v6sXeknZjpXB2QWg1JZ4
	 wAmRf81nGfBzI3mLf/4/C4JJoPj3lXRyGgo01nswI/kf4iHqZVA2tnIaheKdy+tSoY
	 Y+fxpHfwyTYVlk1nKwMoaWajKNLwxQETQpADXaJCesvY2fI8wGf3uCXr1VtOX8e4A6
	 nAAODqBo5+64zhaDcIglGx3ygtJ0LEy2bG3unbX2u14MH7qF5mjmNcD1Ei+zJw13Uy
	 ml01zHuhpob2GVEq2j7kmkSanEEKDW+ecnWBTumkiiaDWcEFmPjw7NUKe3tknqFfRb
	 R6max2cvP38Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-add-tda38740-and-tda38725-v5-2-7fc19668ada4@gmail.com>
References: <20260917-add-tda38740-and-tda38725-v5-0-7fc19668ada4@gmail.com>
 <20260917-add-tda38740-and-tda38725-v5-2-7fc19668ada4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:41:16 +0000
Message-Id: <20260917114117.36ADB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] acpi: of_match_ptr() breaks PRP0001 ACPI matching without CONFIG=
_OF
--

commit 7b99b2a1da30b603fdd50ea7b04df230634e2572
Author: Colin Huang <u8813345@gmail.com>

hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725

Add a PMBus driver for Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators.

> diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda3874=
0.c
> new file mode 100644
> index 0000000000000..1b981c7686453
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740.c

[ ... ]

> +static const struct of_device_id __maybe_unused tda38740_of_match[] =3D {
                                     ^^^^^^^^^^^^^^
[Severity: Medium]
Could we drop this annotation? It appears it is only needed because of the
of_match_ptr() usage below.

> +	{ .compatible =3D "infineon,tda38725"},
> +	{ .compatible =3D "infineon,tda38740"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tda38740_of_match);
> +
> +static struct i2c_driver tda38740_driver =3D {
> +	.driver =3D {
> +		.name =3D "tda38740",
> +		.of_match_table =3D of_match_ptr(tda38740_of_match),
                                  ^^^^^^^^^^^^
[Severity: Medium]
Will this break device binding on ACPI-based systems?

When CONFIG_OF is disabled, the of_match_ptr() macro evaluates to NULL. This
strips the of_match_table from the device_driver struct, which prevents the
ACPI subsystem from using the PRP0001 compatible string mechanism to match
and bind the device.

Dropping of_match_ptr() would allow ACPI platforms without OF to still match
using these compatible strings.

> +	},
> +	.probe =3D tda38740_probe,
> +	.id_table =3D tda38740_id,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add-tda387=
40-and-tda38725-v5-0-7fc19668ada4@gmail.com?part=3D2
