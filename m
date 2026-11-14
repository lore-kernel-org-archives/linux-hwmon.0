Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617496;
	b=sJHpjJbfQXZQBqQxdR2VZDraJp5pq/bmKM9s9s/yc6nWdKaH/NJfIXM9WCF8QAnIm7GF
	 hGainjp+SwY6dLGkWzrKP2nntnBTVEW4RGPswCk3U/5inRIQXgTmUtcGJkYxbs0/H23oi
	 Q8T3RlcNnAptTDm3VLLUV34ycvAVd4vdW4k86s6V8XFvKeqwHWt0hbQWKLX+d/6sJStga
	 YVZLPD4uY8on7KQhkYgM9MoSgpjwFWh4PP4RSv0l4BOWj60SV4PzNUZpVPk9q+7lqcvRt
	 c5u9VdOwrmiyBvWySwW5VGarTsfs5xrDP/nvmUze61Sw9AmPP9SCfp5oAn2wLWqpfEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617496;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j72DktMOO2DBFoLK4bDRTTWq1cVQ4dvknVDqpN1MLDg=;
	b=rKnQF8udKuCx2gRj/esTdOfiVIPJIgzPrYQj9SsC6dIV+dhq/lg+2YP18IRjLVPSEJax
	 iBTqZZ/lgDcKmYD6804Y7rHRrOUiub2GDpTvM3684lGIjnGv320SXJuqY1CZDMskP3aOF
	 ZQwFeilRoFhcyWbvaks6uPqL2XfUB6SH1L5PgxgYWN6uSmDnr8SlQ9cIuLMspU3HJ51hU
	 PK30wfbDJmE/dT3gekP3bi7uiagiXGfLItjlsnvGGqn16fPIdTtsReVB0RLhGGn4CHUTF
	 cKOGPuXfbtN+M/bNfsfvjLUNTWPZaJnrAr1HDCfwWwMQDzNelXNEH5JFXN7OnkOJIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDo4lnTs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A65606A32D
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDo4lnTs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7051F000C4;
	Sat, 14 Nov 2026 00:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617496;
	bh=j72DktMOO2DBFoLK4bDRTTWq1cVQ4dvknVDqpN1MLDg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=TDo4lnTsLY5FXm8XNlXB2Msq/g8TEi8XJNw5Oy57rmr+Ym0GxAFBjK54tMKPGy/I3
	 vxqOocKArDJ4wA5z7SgA70evmPUsWy/ukJPDHChHpq5J9c0s5jessk2HZz30VDT/4U
	 FrSFiOtojvrefPuIv9MO4tl4lKoexcKJ2TSL153IqwwPbXvwYAfdrs1cQ/LnZxysMn
	 cQUhTh5L+349+kZzxHPFX9aCg6oSkNfORFEZHndPgbZ6Z32rXePNWBFvWGHiW0P1Od
	 QzWwvMtQNorY7MB9GWBVdRzC1vCtbT/Ogs/U2vq3vkyJ7lPiTfFiHHiHqb4HUThuMt
	 oKJtMyZUP452A==
Message-ID: <sashiko-outbox-213956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] hwmon: (adt7475) Expose fan control via PWM
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2w63DsCBTdGVpbm4gR2VpcnNzb24=?= <david@dsg.is>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261114004110.328050-5-david@dsg.is>
References: <20261114004110.328050-1-david@dsg.is>
 <20261114004110.328050-5-david@dsg.is>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 00:51:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Register the PWM outputs with the PWM framework when the node has
> "#pwm-cells", so that generic consumers such as pwm-fan can drive them,
> for example as thermal cooling devices. This follows the ADT7470
> driver. A failure to register the PWM chip fails the probe. Without
> CONFIG_PWM, no PWM chip is registered. Unlike ADT7470, the driver does
> not warn about "#pwm-cells" without CONFIG_PWM: fan-N children use the
> property too, so its presence does not imply a PWM consumer.
> CONFIG_PWM is bool, so no Kconfig dependency is needed.
>=20
> The binding also documents "#pwm-cells" without a PWM consumer: fan-N
> child nodes reference the chip itself to configure a channel at probe.
> Device trees that do this keep working unchanged. Registering the PWM
> chip does not touch the hardware, and requesting a channel only marks
> it as held. Nothing changes for a channel until a consumer applies a
> waveform to it.
> [ ... ]
>   exist.
>=20
> Document the PWM provider in adt7475.rst.
>=20
> Signed-off-by: Dav=C3=AD=C3=B0 Steinn Geirsson <david@dsg.is>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114004110.3280=
50-1-david@dsg.is?part=3D4

