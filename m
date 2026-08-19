Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC464078F2;
	Wed, 19 Aug 2026 19:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166799; cv=none; b=rNvhjURl1W1v0I5aS4LIA+1eR5PkzF5QMNyBU4vah4B+PIHp1YGTokKwXQLAz+OPqw77+sALgNtvBxSsvtaSRLvD4zR88H1aHNFJm1vE+0cJnSj6P+mXYBT/I9X85sJAFeriuQW9UQWbi/nROewxy+Z3yizNnvoc7/IvX0UXx7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166799; c=relaxed/simple;
	bh=MqmqIfzNmkuth/E+kk7+72FX2PfWhxL55bDSfc2zD0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PCVSLG7BNKtuAoBctFHAYmt3pxqND79ydmA2JtTPiHXVFl0wXAifXrrVWlu4dI1LYWmqJ8ij5MIhcvcQlnArGKEY1KuCury9RuJmT5zP5nKaLJC0jCBMrrd9prqqWspkHlZ/kP0PCKZlND5JaP+xZT+92aVWcpkLEdedn7AhfkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avFL27vf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avFL27vf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2F21F000E9;
	Wed, 19 Aug 2026 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166796;
	bh=7QPB8xntRosfEaEsyywjE8Y9e9e7wAx1p25F0kiuc9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=avFL27vf7uiDuhOHLuxB/2oCnPMbgPs124dXFVRT5tHaeRQQCP2+ZifxIXNr163q2
	 0WmOepLH205z65+O10bAs3Vs3o9P+7gMNQJSoER6EPsgVcLrdvg9AhHM25vpQD4TBn
	 D7zzhY7iNTS25TLnTyPGlM0Z4ugnBZLe/UkucPfZmSjQD/DjwXn/VGH6WULFwtEIqd
	 EFe19QZUf3E8F9SDthfUMIVl4MrNFn1LFrQWoxUh1S95SvS5g3u+Zl9n2ksOSMqwqs
	 sL+XArbeCt8QqsqbIfzmhN/qwKpv/2F7M5AtiFK/Vj7pwf0IXIJozlH7biGZyhTfLL
	 pmeSDzXiC4yUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-hwmon@vger.kernel.org
In-Reply-To: <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:13:16 +0000
Message-Id: <20260819191316.8F2F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix for uninitialized stack variables: `struct clk_pare=
nt_data parent_data` remains uninitialized on the stack, leading to a kerne=
l crash during clock registration.
--

--- Patch [4]: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure clk_=
init_data is fully initialized ---
commit 99e024a77f5bce5921d3c6b46054263aa450610d
Author: Geert Uytterhoeven <geert+renesas@glider.be>

iio: frequency: adf4377: Make sure clk_init_data is fully initialized

This commit initializes the clk_init_data structure in
adf4377_clk_register() to zero. This prevents crashes caused by
uninitialized fields like parent_names when CONFIG_INIT_STACK_ALL_PATTERN
or CONFIG_INIT_STACK_NONE is enabled.

> diff --git a/drivers/iio/frequency/adf4377.c b/drivers/iio/frequency/adf4=
377.c
> --- a/drivers/iio/frequency/adf4377.c
> +++ b/drivers/iio/frequency/adf4377.c
> @@ -999,7 +999,7 @@ static int adf4377_clk_register(struct adf4377_state =
*st)
>  {
>  	struct spi_device *spi =3D st->spi;
>  	struct device *dev =3D &spi->dev;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct clk_parent_data parent_data;

[Severity: High]
This is a pre-existing issue, but does this struct clk_parent_data also
need to be zero-initialized?

Only fw_name is explicitly assigned below, leaving name, hw, and index
populated with stack garbage. When adf4377_clk_register() passes this to
the clock framework, clk_core_populate_parent_map() will read
parent_data.name and pass it to clk_cpy_name(), which ultimately calls
strlen() and can cause a page fault during probe.

[ ... ]

>  	parent_data.fw_name =3D "ref_in";
> =20
>  	init.ops =3D &adf4377_clk_ops;
>  	init.parent_data =3D &parent_data;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787165329.gi=
t.geert+renesas@glider.be?part=3D4
