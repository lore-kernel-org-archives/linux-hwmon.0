Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9785848AE1E;
	Wed,  3 Jun 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497458; cv=none; b=nqDctFav54jkH8VJ9l9QhT/YFNpN/kEmuh0m5K9Hf2L/Xla6GZWA0moYwUdKel/0u373mLvzTzCaD/JOBxQBjbFKsNy44WKHoKtjc/uamLbVG40w/+EVp6LDSsV/nJSSFnl1ntcAuIkmPtKX0ZrrJOD1VsMlAMDuG7jdYRUz+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497458; c=relaxed/simple;
	bh=NfJbAy4OBwcVFYMOA4sgxeb8rArf6+jwZ/siQJpguXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ryqzYaegkWNkq4k781t2+NtBoFF0aMal4ZLW7YXEvWwVpbF6AB6iwCEJyDNNlv1pjdcfGJ4tOqBhxUJWmqmkU/x5XuchDgC2FM/t+7ndNsZ68yxDUXzZik0i8/CY86WmyzfGOltKc9i5s4qrdGiOtepkCRbjAyGjH0YjioY4AAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKF/wZDX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKF/wZDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA891F0089E;
	Wed,  3 Jun 2026 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497456;
	bh=BCkv78E9W9JqhXuURih8bfzqud6sOSCP/yCrSo3GrRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MKF/wZDX/apSEdEDyfGXWUE09UrNNsu3dSu25Dv0RQIx6Ww6SMiRaQfSmwvV4PWkm
	 GqEz+mP0AXI/6pG4nwBw00PacOcJLYw2VS0yztQ5NPgmyr0Mv4+rVDHOdXDpt6Kydn
	 zIMwvZaFqsgpvlZHNfdAOSMRUc+IjqigQvLxidSEQmez7byREmAVtxZzBQ18kag3vj
	 FBj5t0eZCO9fXzV/RlXXz639siTRmZOoK9BMVZ44RFDHDoYtMnSUYsgTHfsuM2nHcM
	 UZer+Uk5hUwa7U7WBdHXEMlKwZ3/2DZhYqvS9fd+ARzSGT8fdSwHQqAUu3Ndi/5vK/
	 kladeYUr6uZtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] hwmon: (emc1403) Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260603141033.111300-4-clamor95@gmail.com>
References: <20260603141033.111300-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:37:35 +0000
Message-Id: <20260603143735.8DA891F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to probe for `emc1402` and related variants becau=
se its enum value is 0, causing it to be mistaken for missing match data.
--

commit 68609b63ba3fac21c7beeccd770258031aea8a06
Author: Svyatoslav Ryhel <clamor95@gmail.com>

hwmon: (emc1403) Add regulator support

This commit adds support for the VCC power supply regulator to the emc1403
sensor driver. It enables the regulator during device probe to ensure the
sensor starts up and functions correctly.

> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> index ac84200be71aa..dfdd3982efb7f 100644
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
[ ... ]
> @@ -660,6 +661,12 @@ static int emc1403_probe(struct i2c_client *client)
>  {
>  	struct thermal_data *data;
>  	struct device *hwmon_dev;
> +	int ret;
> +
> +	ret =3D devm_regulator_get_enable(&client->dev, "vcc");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable regulator\n");
> =20
>  	data =3D devm_kzalloc(&client->dev, sizeof(struct thermal_data),
>  			    GFP_KERNEL);

[Severity: High]
This is a pre-existing issue, but does this probe function incorrectly fail
for the emc1402 chip variant?

In drivers/hwmon/emc1403.c, the emc1403_chip enum defines emc1402 as the
first element, giving it a value of 0:

enum emc1403_chip { emc1402, emc1403, emc1404, emc1428 };

When emc1403_probe() executes later in this function, i2c_get_match_data()
returns 0 for the emc1402 chip. The subsequent check:

    data->chip =3D (enum emc1403_chip)i2c_get_match_data(client);
    if (!data->chip)
        return dev_err_probe(&client->dev, -ENODEV, "Unknown device!\n");

will evaluate to true since data->chip is 0, causing the probe to abort
with -ENODEV. Will this inadvertently break support for the emc1402 sensor
family?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603141033.1113=
00-1-clamor95@gmail.com?part=3D3
