Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575328;
	b=vqwicTwSg1humIsATkZyljgXgG72pmamgRvnchl78CfztMVbbGihDY1aCly/t2SN+0US
	 /2chfOYtnw4zntlRWjgcztRxJHddrG46DknijjGy8tgQ6vfc6JlWK4wJxxHxcw2zHS7Qu
	 0XXaGamrqbOZW+L97WwdhftF3Bve+9K5epM9xJM9y1vpnFdgzdgbgZJYzopsBRP3NOlsE
	 e8RkCPTA6k1U4pQZBOC5rlc/+xuuh9jXebNWjZJN8z5ApvsKpRVSXee4d5G3NFvZzLcDG
	 /poSixc+1LZ2yZauZxxr8JdUZZ9xti/n8PhkPjU7VngrVMFLFboqJ+AG1af7TyHN17A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575328;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z49aElEr+a/Ei2W9xYccahZQqIw7fau0FNlMY2LLo7o=;
	b=AIXMx0r0kZuSPl6QgbY1MKaJuxAan6wJbw0IOQ6hJWvt2aNwSZ7vZPT0m7J4nCZZmLdv
	 NQegHO0ZyPgWfC3ZJuDGvvA5BrkF+g7X9UcCQcyaXWxqRlPwWhAB0WT+/lBIfA4WaVQjF
	 PMFo3+Dr/zBJNQ8+NadMQntZ2HoOrw+9QL+bqmFcfx+d3UqvigV+icXdZD8xkuj+i0ylP
	 kOSILgsEmbEF5i0GpZM2iHnXoPsahs/+Yolc4gOw6cn32LRDlII3dASKLC0weQCWfdLqk
	 YoyOX9FscoaeBdyAJmu96Y+WPTpDeySxelOqzyCRxhFdwxf8Xs3LhHEchDkrNWctw7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JpFtNERZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F0606A32D
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JpFtNERZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F741F000C5;
	Fri, 13 Nov 2026 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794575328;
	bh=Z49aElEr+a/Ei2W9xYccahZQqIw7fau0FNlMY2LLo7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JpFtNERZS4p672hiDbZQaC+xVcDJfuTBKw8VVlIfchUtPt3CDB2aORlzVziFyGAiI
	 +b53FF+0LtOplRLAFjxCNdn3G/12nGs4GwpZDEaHWN+IeLMUVAQlwnt6HbKDx7Wb0r
	 lfl40e3MmPB2IttU+ViHm3KLKY26a0vNAb0Odv7bA8yWywMQl9vdX7JDVSRyBAmTqv
	 MpPunww1K9fz7RHBDmvIIoaCYiFd3eLiDC4kj1NDJ3x7mIm/6WDH36k6mnhAK5TNHZ
	 e/Dkhlrdyu7GAWCImN8kGRnOkEVQJqQrCk/WH340P+LFRQ9knXLfRGO4wncApqmcKC
	 NxsDQBCy+eNzg==
Message-ID: <sashiko-outbox-212825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm77) Provide of_match_table to allow module
 auto loading
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukma@nabladev.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261113130133.4094280-1-lukma@nabladev.com>
References: <20261113130133.4094280-1-lukma@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:08:47 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] hwmon: (lm77) Undocumented DT compatible string national,lm77
--

commit 9ee0f69ba3227a960f104981995c86d2458362e9
Author: Lukasz Majewski <lukma@nabladev.com>

hwmon: (lm77) Provide of_match_table to allow module auto loading

This commit adds an OF match table for "national,lm77" to the lm77 I2C
driver to enable automatic module loading on Devicetree systems.

> diff --git a/drivers/hwmon/lm77.c b/drivers/hwmon/lm77.c
> index 51bbc84d74844..e64dabfcda09e 100644
> --- a/drivers/hwmon/lm77.c
> +++ b/drivers/hwmon/lm77.c
> @@ -336,6 +336,12 @@ static int lm77_probe(struct i2c_client *client)
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
> =20
> +static const struct of_device_id lm77_of_match[] =3D {
> +	{ .compatible =3D "national,lm77" },
> +	{ }
> +};

[Severity: Low]
Is "national,lm77" documented in the Devicetree bindings?  It does not
appear in Documentation/devicetree/bindings/ (such as in
Documentation/devicetree/bindings/trivial-devices.yaml alongside other
National Semiconductor I2C sensors), which causes checkpatch.pl to warn
about an undocumented DT compatible string and dtbs_check to fail on
nodes using it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113130133.4094=
280-1-lukma@nabladev.com?part=3D1
