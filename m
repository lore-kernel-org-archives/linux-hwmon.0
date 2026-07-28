Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DD22D662F;
	Tue, 28 Jul 2026 03:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209923; cv=none; b=srxa2qESD+kpZuWwrh85kiTl4JNBJvVp3kZt3BxdQ/acrKhZOkl8073iz7pGMK72OA2eYOOz08bOFK7z0nlFob3pinaQWkURm2gnCaPdD7CGGrM7GBy4dl9tOWKm04ybXr+L/U+g3yC6EMkwSv2jMbSsM+WxTuAedpCAIbmLFDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209923; c=relaxed/simple;
	bh=AgINxfdV+qfw/CBymEKTQ1qWKM7cn5eITigFS9TKFew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UPz+fDIgoAkIkk9rYHw3e6cCcKtzzFsRGc7KuWjvDQpfhicAz1ed4ySdctEbawmuxUKzPQ28pcG6ydrR7q0F965LFv7yrBtTl2jmVd1vterCdLNzfC1EvU8ljlMlz4cH9QAq3mSq8zHsiOIQnI4GvT0QcdfDDBj+pPisVXr9Nfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKruZOq4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKruZOq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BB21F000E9;
	Tue, 28 Jul 2026 03:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785209921;
	bh=XIsFdxYLZk96e16VHkCTnYaLDDD/tqnj/dAIDFrwSys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fKruZOq4r7DYmjO7O25mfO12pOizEznVuJ4JcoPzFM9NHu1USLaZxzvUSYVELcDMq
	 ZpOIsxAbuIOqSTGFkG97p+OhFKeBU7r4Ukp0dMhGvpvIrUw3izKxK0khpexAfIRbiZ
	 sUsZWCkJEk7WHBdvozFFr5GYU+XYzqmUh9ou4Ix5WmISGdFqeDetIm3ZN+MQNCNQLG
	 tvGovfGVNOtYbCIz+dugxANCT/aQQXhb+4JZ+4E231Jl8IAgnqQYyqqNogTsvPrYcm
	 d7jNZwtxHnGSfAi4suda00Kb5fh87vDOesIGMbC4nsMfEsHgIMeaXHAsSYwGCvpGQ/
	 26OY/AWtKaFNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-dev-max20830c-v4-3-cec034298535@analog.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-3-cec034298535@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 03:38:41 +0000
Message-Id: <20260728033841.A9BB21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree fallback compatible `adi,max20830` for `adi,max2=
0840c` is broken in practice because the `max20830` driver explicitly rejec=
ts the MAX20840C hardware ID.
--

--- Patch [3]: [PATCH v4 3/4] dt-bindings: hwmon: (pmbus/max20830): add max=
20830c and max20840c support ---
commit c98fae7fd69f878845956d0f0458ff6045d86d9d
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

dt-bindings: hwmon: (pmbus/max20830): add max20830c and max20840c support

This commit adds compatible strings for MAX20830C and MAX20840C variants,
using the existing adi,max20830 compatible string as a fallback.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> index 01b7275f5b341..cc50a4ee44a27 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> @@ -22,7 +22,13 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: adi,max20830
> +    oneOf:
> +      - const: adi,max20830
> +      - items:
> +          - enum:
> +              - adi,max20830c
> +              - adi,max20840c
> +          - const: adi,max20830

[Severity: Medium]
Does this fallback compatible actually work for the MAX20840C?

Looking at max20830_probe() in drivers/hwmon/pmbus/max20830.c, the driver
strictly compares the hardware ID to MAX20830:

drivers/hwmon/pmbus/max20830.c:max20830_probe() {
	...
	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
		return dev_err_probe(&client->dev, -ENODEV,
				     "Unsupported device: '%s'\n", buf);
	...
}

Will an unmodified driver successfully probe the adi,max20840c device using
this fallback string, or will it fail the hardware ID check and return -ENO=
DEV?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-dev-max208=
30c-v4-0-cec034298535@analog.com?part=3D3
