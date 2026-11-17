Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939429;
	b=TA052qFLPMH0DVGLxD032im0ifdwQfm80KLsRQlPJVEbHDnq+k88d54JcWMjrTmLhhge
	 QberdJ8A/ujrihMj1JgdAtLCKJU+NvihCK5+d9FUzUhsLa+VJxHpc50PKcLFMDt0eQcul
	 gZ5aRpcC2fsU6+6Jt5+gKWy45ih8bngOsqey4fEOXEDnplIhIZ3lwUHjs4cVup13qs+KP
	 QsUY74lNk2VXgz06la+A1rhLM+CGt2M8pHrWpPN++rqp2ThNGpA53+elLeaMl0QN+NmNw
	 BYl4dR/r4j2PWtrZgw2GRhA+rIFAgSe0HAt2iCG2w8uf+0nBsROvkydA9SkemthCKDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939429;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7j/OSinZOASBPcLYIBrVmxMnJl0K4ERRMwW+QzbwMSU=;
	b=CkWT0B0R8uJlGPqEqqb3r43PCtUGyicJwYxzGvOtlUzJgT98EF17tV8BdxpkQhHZQ9xQ
	 WK2FUXzFxon06P2ggGjlayPJutE0U2Cy4UYTfkdU9AklWav9zeEYbmSEvYusSi85EiVdh
	 FFf98/gG1j+9BQtMEBsEHiZYXlpYR5eO6MXCsstnkwJi2BshakgPm8dQVVsPrW53vlEuj
	 qKrN1/UfOqlnWd94iWHP1WloIKKvmfqozRNo4o8PhgoGimPLKyu+dCUFNYa8jkJAuX0kh
	 4clzgYjNs5oPj+/D4JW/HtCVF/vQelRwsK9iiqWKdVAN4Lx05kLa3lf7fENWmBQMaBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTifZ0BT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1ED606A32A
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTifZ0BT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16081F000C5;
	Tue, 17 Nov 2026 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939428;
	bh=7j/OSinZOASBPcLYIBrVmxMnJl0K4ERRMwW+QzbwMSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LTifZ0BTWGHP2gfnDJHfT0z1yG81eQuY2+e5L7o4OpzWGaHqdvUDQyGqmrKkkbxDo
	 dg69Yi5zLX4tu8hBJxXFCirfqbQpjljE8CO+IoNvkr2PuqofwBFS7i+K1iEqlnL9iI
	 jayzZoqQ0knDbb0GW6fQ9wSskhFLMvuC7oMHa/xhIhfBib7K3Sgbkdy+ZvG6/n5MVB
	 Cfax/bDRTgVjSDUkNXlCT9OxxrxbSRBDH2/XWd12R8BODbGO3Sj5xbFnUs7vI9F0B1
	 z6XDWKNACVQSA6Gks+mhTeqxa40GIkNkFLXdtgxdncllVw7MphnV32jbLcSSIoDjEz
	 +aVMYPoJaaxMw==
Message-ID: <sashiko-outbox-219324@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] alpha: marvel: fix the environmental subpacket
 layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
 <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:17:08 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>=20
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>=20
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-marvel-env=
-v3-0-0edc370fdca9@gmail.com?part=3D1

