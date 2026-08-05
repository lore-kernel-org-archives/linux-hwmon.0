Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D343CF20C
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 03:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899414; cv=none; b=exbiGOeq+NMffSzP9PkBGXBZsbjrhr6LrxdDlpUywhK8l0zhmir0UNHndFsw6dbFtFDCqEh9WIaWicFikk0Epj7Q03EF9xBnZhfxLP2yGHDe3mZKeiKMT976GPvUyRSqmMLAokaaLRd1OV4NoB/S0pD+cvUmq+l9UUXybbTjXus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899414; c=relaxed/simple;
	bh=Qpr/TxQYH5DNohvgkUtPFZaSBS0tLbmBvSJunegjw+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yg8Wbp1RGwzb0OLln0qUhgUqgQG9ENfHSoPtCxWAB6O+vrWvAbt1x0CaFoP28IWe5W4kPsbNSxB8k1+XAoZv/kVOEt5JK7nX6XWwRR8g6rqj4iSWCHWaSFyU04PKbYQLX3X+kYSU0T80C2138uOcytUS8P5BHMmEN+ZJt4iiXlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cyhn4cmE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cyhn4cmE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F421F000E9;
	Wed,  5 Aug 2026 03:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785899412;
	bh=anLaiHa9zYGRmYMM4rpVBT0Z/euxKkoOfBrjis7O4MI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cyhn4cmEAYoRhs2dmteAbt1NM+uqovwXXYtmj1HpbLLh6yDow9GWZVSkhS1g15uEz
	 x+e1ZEyA4BrtMRMtgGhO61FOeIIJHsWwcHA6ZFVwtn/AmbXvmteX03is0YgbS69VGH
	 7p6Vb/wf6N5UMoILoWv6KwJc1k50FT7IbYTtfJFFqOaT+FU/cClL3rx9s3lKjIQAU6
	 1qg5drrrHPP49Qh7/BOmCJ1ENnqjVuvZDGW4IVELLveoTSk94MFGCR0bQToZX/CLxM
	 XL1HcQyYZ72yMntUQkKufdwlVp6eh1ErvuMTMSA1cxoVdCuezqPWCJQnEWk9tXz721
	 xTf5PrrKWiQOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (ads7828) Don't ignore errors from
 devm_regulator_get_optional()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qingshuang Fu" <fffsqian@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805030056.1082745-1-fffsqian@163.com>
References: <20260805030056.1082745-1-fffsqian@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 03:10:11 +0000
Message-Id: <20260805031012.07F421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver acquires the external 'vref' regulator and reads its vo=
ltage but never enables it.
--

--- Patch [1]: [PATCH v2] hwmon: (ads7828) Don't ignore errors from devm_re=
gulator_get_optional() ---
commit 49f8d154ff184810c29b27c75b5602ac3ecd4f65
Author: Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: hwmon: (ads7828) Don't ignore errors from devm_regulator_get_optio=
nal()

The driver currently ignores all errors from devm_regulator_get_optional()
and falls back to using the internal VREF. This commit changes the driver
to propagate genuine errors other than -ENODEV to the caller instead of
silently ignoring them.

> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
> index 149cfcec78dcc..1c3a8ce8afb5b 100644
> --- a/drivers/hwmon/ads7828.c
> +++ b/drivers/hwmon/ads7828.c
> @@ -133,6 +133,8 @@ static int ads7828_probe(struct i2c_client *client)
>  			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
>  				return -EINVAL;
>  			ext_vref =3D true;
> +		} else if (PTR_ERR(reg) !=3D -ENODEV) {
> +			return PTR_ERR(reg);
>  		}

[Severity: High]
This is a pre-existing issue, but looking at ads7828_probe(), the driver
acquires the external vref regulator and reads its voltage but never actual=
ly
enables it:

	reg =3D devm_regulator_get_optional(dev, "vref");
	if (!IS_ERR(reg)) {
		vref_uv =3D regulator_get_voltage(reg);
		vref_mv =3D DIV_ROUND_CLOSEST(vref_uv, 1000);
		...

If the external vref regulator is not marked as regulator-always-on in the
device tree, won't the regulator subsystem disable it during the late initc=
all
unused-regulator cleanup?

Could this cut the reference voltage to the ADC and cause it to return zero=
ed
or completely incorrect sensor readings?

Should the driver call regulator_enable() or perhaps use
devm_regulator_get_enable_read_voltage() instead?

>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805030056.1082=
745-1-fffsqian@163.com?part=3D1
