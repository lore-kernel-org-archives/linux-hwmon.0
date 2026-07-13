Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4739185C;
	Mon, 13 Jul 2026 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929315; cv=none; b=rYMXXo6CnggtW0XqP9e08RwKuJKQQCeV7Cc1IqWmc9iQTq/sid4OIC+JqGsD1F78gyHNJWRAiXF8TAmsNOIu1rYhjahAWMrO4hRCf+5RkD5YZ62yv9wo+iHcxwpTSdROvEmvVPCm8nYFTq9XYW+z30NUReUQNwKB0EQqZz9r8rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929315; c=relaxed/simple;
	bh=WNIjz8ouZXK+Ly6vq844QIQ0zWhrvHumanyIbHM90Io=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E4pqKQbv8N/S61Z9GeueupT8yFn0nMCVTkAeb8yjGamO/S9Iq6MT6eBmhKy+TKsm2pVakA7eGjnhPtOCOUB9i+19nhR6UVCMIsbPUUrDYXD1NvDtCiJKetiVlVhRb/LTxItKDpRdFou2NbZDsJXYJYrhCRiolaivMUn3Zqe30Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5xKa1n3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5xKa1n3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BC21F000E9;
	Mon, 13 Jul 2026 07:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783929312;
	bh=iGRLzSuSmVOp/4oqFzAHZjrm8mGpSFp/qcfMCV7QIK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a5xKa1n3q56xr2weDxiqKk5a7Q6z5snboHMuI3tVjAno2S2lQQqfwJcR4NGOavD5s
	 M7JB7e4hCmritg14/mCkhc7/va5S37FtXkmCEpMfbGFfgOfcBk7in3REQkXN8GdcCF
	 epSb5hL6FKRfc29sMlYBNFFx1QM2R6Jivg1MdqIIr0qKgNUWaRIRRymyBbCST5z4EQ
	 JtunfkDV9yJjj6YW61J4pooG+7my/JiMNaRFMinKiYsMLTP0EjabTEBg/e11YLecX6
	 B086OhtARSBbu+S7j7mHtVsEI/g9oi5SFKtA3qWNfjuzlmBieqOTur5xaTadRdfFGu
	 qI9es5dj3hFeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zaixiang Xu" <zaixiang.xu.dev@gmail.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 07:55:12 +0000
Message-Id: <20260713075512.A3BC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Device tree nodes using the newly defined compatible strings wil=
l silently fail to probe because the existing `sht3x` driver lacks a corres=
ponding `of_match_table`.
--

--- Patch [2]: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 serie=
s ---
commit a41d5511b126bf5d822219f86d5fe60736eb2e81
Author: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

dt-bindings: hwmon: Add Sensirion SHT30 series

Add a YAML devicetree binding for the Sensirion SHT3x/STS3x sensor
family and the compatible GXCAS GXHT30, with the ALERT interrupt,
nRESET GPIO and VDD supply as optional properties.

> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml=
 b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> new file mode 100644
> index 0000000000000..dee0252941c29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
[ ... ]
> +maintainers:
> +  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - sensirion,sht30
> +          - sensirion,sts30

[Severity: Medium]
Will devices using these newly defined compatible strings silently fail to =
probe?

Looking at the existing driver in drivers/hwmon/sht3x.c, it lacks an
of_match_table and relies on this legacy ID table:

static const struct i2c_device_id sht3x_ids[] =3D {
        { .name =3D "sht3x", .driver_data =3D sht3x },
        { .name =3D "sts3x", .driver_data =3D sts3x },
        { .name =3D "sht85", .driver_data =3D sht3x },
        { }
};

Because it relies on the I2C core extracting the compatible string to use a=
s the
legacy matching name, it will fail to match against strings like "sht30",
"sts30", or "gxht30" from this new binding.

Does the driver need to be updated with an of_match_table to prevent this
regression?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713074559.1219=
6-1-zaixiang.xu.dev@gmail.com?part=3D2
