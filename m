Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0D71F94F;
	Wed,  3 Jun 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497011; cv=none; b=S8GI7qcZY/8KD7BLIU3U16vdIVqSnA5aYWpMG70IW+CuyGgqQF0Az8WOFsYRDZwMS2xQ6e0POU29JzgNSCD4LD4r0cIll0L4RrNGqDc7eXaQ+Ojzz+rbk2HmS5vtBfZomEoD6kFG5cBx58Hq1Ela6x68YTwq9zwZPrARW+h/EHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497011; c=relaxed/simple;
	bh=T3vdGntB1/PNpzzgtb1lQADtGCBuJ/2bShm0JqyeKfE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pd4EdGMhxGBsK7RPSr0IzU28saPX3rCC1tV/kScz7dtFN1oMBEs4izohPsUA2hWiTTQ668XPCooZOB5Ice6edYIP0B0dI8rGRpkpQ2+nKgQgSyPScVIDrmUw4gHlABw2pqo736QhdNWXKUQdAAC5Wz2wJx1DB90E01HgpL7vxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMEwI0+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMEwI0+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F961F00893;
	Wed,  3 Jun 2026 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497010;
	bh=tHY9g+/SwFn8DA7WSUD1LBTOtNG8zt1pg8dhj+uP4Yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMEwI0+MO1Dolejn+8C+O+DSCiJ4um7YTFhY5gkd3wnMxkFM+QWeikkQy3hlHRLqJ
	 wyw3apYx5axkYgJSo2gczooFmqLZkFwVga66yYpGsFSR5B7bDbdnldVuUKacXfCVS9
	 5fbqOO0wm5vVSVv7xfGMIOWxi6EaayVGm6ASRYwglFl1y5eMUxB64VHlSp46sTm4Rk
	 CZYTBVIAXVYcjjjwgw0Fdxqui+aSBP6jU6fxGmAhzDAfsG5U5LBgV+fxl/oQohd4Rg
	 wGgnLy+LdkCQhMoPFwo6JjvWo0YSHE92c0KhsA/72gZ/8VSsp9vC9ymVsGgFwBWcL8
	 Wn0LLPTLdEoIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] hwmon: (emc1403) Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260603141033.111300-3-clamor95@gmail.com>
References: <20260603141033.111300-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:30:08 +0000
Message-Id: <20260603143009.38F961F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver probe unconditionally fails for `emc1402` devices becau=
se its chip enum value evaluates to 0, which triggers an erroneous error pa=
th.
- [Low] Directly casting `const void *` to `enum emc1403_chip` causes a `-W=
pointer-to-int-cast` compiler warning on 64-bit architectures.
--

commit 8e14b2d237bb423a526fb43282f03dadf7dbb7dc
Author: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>

hwmon: (emc1403) Convert to use OF bindings

This commit adds an OF match compatible table. This allows the driver to be=
=20
used with Device Trees.

> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
[ ... ]
> @@ -659,14 +660,16 @@ static int emc1403_probe(struct i2c_client *client)
[ ... ]
> -	data->chip =3D id->driver_data;
> +	data->chip =3D (enum emc1403_chip)i2c_get_match_data(client);

[Severity: Low]
Does directly casting the pointer returned by i2c_get_match_data() to a=20
32-bit enum cause a pointer-to-int-cast compiler warning on 64-bit=20
architectures? Would it be safer to cast it to an intermediate=20
pointer-sized integer first?

> +	if (!data->chip)

[Severity: High]
Since enum emc1403_chip defines emc1402 as 0, will this check evaluate=20
to true for devices compatible with emc1402? It appears this might cause=20
the probe function to erroneously return -ENODEV and break initialization=20
for chips mapping to emc1402.

> +		return dev_err_probe(&client->dev, -ENODEV, "Unknown device!\n");
> +
>  	data->regmap =3D devm_regmap_init_i2c(client, &emc1403_regmap_config);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603141033.1113=
00-1-clamor95@gmail.com?part=3D2
