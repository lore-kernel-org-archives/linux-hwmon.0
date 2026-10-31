Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440587;
	b=ImXpoqIwjx41JbZbSrVvyWiyxFT2c/lQ4fBbe6K0UDVwhGttfnjpk8NSFORV17cQ5kyC
	 69xxPewFP/zikd6i8ZQ79atk2JPhBTvm+DmYAkJkGJSNoZzhaRR/F9M4tZk04vN7maabM
	 kLtct3ldAIWsJzBWb9UgGSxVb6MH2H6Xy3n1HadlwbrvawAE5z8cwF7VgrYTBQJQrtZ45
	 FjqXbShqMnIBTGWFznBkcQ/RYJewK1IEFMEEI/rDjwijgjZ2NPutJs79ps/aJqjZvt8EB
	 TWvAPAss/MFo3zurG6VAD9/831zzPpD2M54H8UWdr4BMfeSPFlcwwDDTDNZXlU5Fg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440587;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fF/rQMgZUeXvid9CeTC2EgB8UOb3JC9dI00OGKM6f24=;
	b=RwAburlx1FMh8PhJ+t1UiMUZ7fl7TJLgYfoSyg0Xa9CwS0wpjdi+SYVGtDAcUWmTVucu
	 LI/Xo94ul6n+MsEJ+PRljC6kyLiP4C/dexc3hIfjKPXh1y+D1st9hKEdQ8w0fndj74Upx
	 F86XC09FqKcEJEmruIGh6Rhpy24Q+4/fl97kSKGyX1uP1LTwBdNbNWlRLiije0VKuseom
	 gocAT11bw4iI3HnPS0IqCJOsaRkhhDrGaUBrxfzy3mRmfMOTkAJGscCew7XeYNyUaPktR
	 Bn09oaVTPHBGvrFWr6XBeQqYz5y1iJhcP2kc0pcMsqB7TGQ0PfvnzUS0jUyh40jnimw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fp4SweI2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0D2606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fp4SweI2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6441F000C1;
	Sat, 31 Oct 2026 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793440587;
	bh=fF/rQMgZUeXvid9CeTC2EgB8UOb3JC9dI00OGKM6f24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fp4SweI2pzrRYHS+9C8lxUnAyMK3Nv2exADOLDT+GlDmlQMX8qcXMB3q7EcmbBfmm
	 N3G7VZ2Irc4Cyr8PSdZceq8hB4RaPvG4Fz/qrL1kyzu604UB9udfy/5F0TR/g8IgCQ
	 8exTEo/tIVJlzSL1igCT8sah2xcdkIvOEtPeUeYfMlkf9dGqZs0up7AbrVKjUa6pM9
	 hrP1OAzYwEeuiv+8R4U6Y394reR46EtOjDTI79NXgybX65JZFVI1V5Luc6lA6LO0bd
	 0+6nlPh59FyitgpDp2wLBnLjWtX16bFMUzGaGBF/KI+HtQTBbzXtsH5MgSeU4d90PD
	 +kaA8awmfMDgQ==
Message-ID: <sashiko-outbox-191880@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (gpio-fan) Update the speed cache before
 dropping the PM reference
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFlayBLeXUsIEtpbQ==?= <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261031095039.11683-1-pocj8ur4in@gmail.com>
References: <20261031095039.11683-1-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 09:56:26 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> set_fan_speed() writes the GPIO control value before dropping the runtime
> PM reference when stopping the fan. pm_runtime_put_sync() decrements the
> usage count even when suspending the device fails, but the error return
> currently leaves speed_index at the previous running speed.
>=20
> A request for that same running speed then returns success without
> changing the GPIOs or taking a runtime PM reference. Retrying the stop
> instead drops a reference the driver no longer owns and can trigger a
> runtime PM usage count underflow warning.
>=20
> Update speed_index after writing the GPIOs and before dropping the PM
> reference. The initial same-speed check already excludes a stopped fan,
> so a zero target is sufficient to identify the transition that needs a
> PM put. Preserve the PM error return and the CONFIG_PM=3Dn exception.
>=20
> This keeps the cached control state and PM reference ownership consistent
> without restoring running GPIOs after a possibly partial supply failure.
> It does not clear persistent runtime PM errors or claim that a failing
> regulator has successfully powered off.
>=20
> Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
>=20
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031095039.1168=
3-1-pocj8ur4in@gmail.com?part=3D1

