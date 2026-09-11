Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87594A9D77
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148496; cv=none; b=Xgh35Sufo/I0LFLx7cS7cZQ825jnkYPazRcTiG9HYkGDRiqdVMyPw2pgUDL/Z0Occp1SPLSDL+eqazrATsNazIRSFpKNPZ4cDg6EujFucL8V/VablFhZP4O1VUEnW7Yg/sJqIB4fNmTHEOKsW5HlDCBogXvn0y/VIXIo1kZqFnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148496; c=relaxed/simple;
	bh=xTYsWPBiocfpC+J4m7Vc8uhTYRuQAoYWE+de6wvpGs4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZ9Ydbx8Sn8UaH7qZR7SiyY3Qj0P6ifH09R5+9n4+c1ME/F04oTDYKU34LLXXeHO0Io9rGmLPH0i2OU39mydg3zx+IRrLP5GU0u1mgU6VoIlAaqbYZ7Uw6G8ytkCwY7SjMC01tW/vXiV/aOsJTDcRFH+CdaFmLt39bqr/lgfyMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RntBtb28; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RntBtb28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B901F000FF;
	Fri, 11 Sep 2026 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789148483;
	bh=8b6T0BWXRyoPcbVEcYmlEqDi4qk6nWcCaIKkxNvMzlQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RntBtb28xmX0MWoydlW0RgbPeoU2LZFSzB7JnscA8uNRFLmFiU6z3Uw+A3c72dgMg
	 r+1U1QG0cIyLLijNU8+todLXIOKELv54QHQvbw+IxSKJTL+/CEjYsP8YVCjsTJ1X83
	 SvKJsK3cduToMp0f3xnH75qJW9IJ7Q92M0H38rd4Y0VfplBrGXBlZQpsyKc1kHOroE
	 svKXY6iZCbg8o6XtWcqsgu5qLtAqumglqFEEDl6Z1M+YrJMv8aPWIP41YWoS0+rvTj
	 yvB/myH1OXWT8uyqOfgdqkD4tpPbBC26+g8hHH6HyoNXJpjQPJuyb+mOKlETV/Y0Pf
	 kumfegqbxVh+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID
 lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
 <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 17:41:22 +0000
Message-Id: <20260911174122.D8B901F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Current sensors on the Congatec Board Controller don't use consecutive ID=
s,
> unlike other sensor types (voltage, temperature, fan). The driver assumed
> consecutive IDs and performed a simple lookup, which caused an unknown
> sensor warning. Define current sensor IDs explicitly.
>=20
> Changes the warning on conga-SA7 (type and channel are correct now).
> Before:
>   Board Controller returned an unknown sensor (type=3D2, channel=3D17), i=
gnore it
> After:
>   Board Controller returned an unknown sensor (bc_type=3D1, bc_id=3D11), =
ignore it
>=20
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring dri=
ver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-hwmon=
-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com?part=3D1

