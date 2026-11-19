Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047155;
	b=zNyalPK0TfoiqmtigymSbc0PCPWF/X1qEuWykr0P4Djk6imcqK61D2TgKcdZORS1TsNU
	 xPxCv17vz132ZuyoCud/ZQ5P/uVR1dWmGc6KJII2bgZLoRdMOfyne3HiyLPXg+SnGWP5g
	 jIPemmyi7pOVx0iUd6OELCWH1eXARdFheKu0PS62sVA+V51qHUCiEQHgzB7JSfv5TGE61
	 cR8SCVarCV5rpB+/vSohNKF5Q2kBkYBYCcPZ/eNTeb+kIOktVbID5p4hRmY61V3BqbrD7
	 6otso1KGa14tDOdnz5KB3C1S7laO5DykZ6O9sQI4xD9SARi4z8BEVHytAkoG0YEyXtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047155;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W+uN6i5++LMfJ0OjaRiwpgGTbZV+0nijSLmOSoglGYQ=;
	b=AfEUkjkEPl0SovBYGYXZySGKfv5ksbj8B9bVH/uRZyWRZtC20CsSam91iL9TT/XO7y7N
	 Wk2xOEsAcbrQAnoZDD/mfzzxEiAyGL6hhd5oLfT1c+hbQj4OJuHD5lJOWKrBqcI+ZKvVw
	 Iyc/Tx3bqprC+DoYjRuUFm35SCj8GBm3zbcSOTB7QYvEtFAKx6aeVOqu2dYpXQvO5Xr+z
	 e3axDJRLycfZaSqvUFqhTSWdkY3jhdxLvAL46XBgVl3f2wtV9riLSbghlrZOnqkLHBHs6
	 T7rwFBlMeWD0R8FsgKVFCaX9bBOlOoUY/m+Slx5mISsKQOm0oF/zQOB5ZjuzsxZMtLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SHqt3of7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C45606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SHqt3of7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9DF1F000C4;
	Thu, 19 Nov 2026 00:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047154;
	bh=W+uN6i5++LMfJ0OjaRiwpgGTbZV+0nijSLmOSoglGYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SHqt3of7y3viD2KvhOfbAD/6UN2Xq+wVuGLYBNq4QSPk0LP61c5mI6H4Qb3CcfWQt
	 BN2Des8yr7nga1N6nElUu/hDLsGT7RU+RzZvbbG0aKlonUxE4lZj8Rhb7U0xal3RIx
	 pv9J+fjZWDVLzvTAbNsjKpsVFrYbMInPo+ILbAvIznu5wxLH2PNcZ/024fn8rb6Dpd
	 bNRw+Uo2kvTvVQ6d6AUPOh+m2Nh3HPJ9+biPq8Svot1V6folo9Ga6rdsrHLg5UbtQL
	 GjZ6G7Ak4ajkQfjteeFhekS+XmEvSTKYL0MXGMwWR1sEGzwm6W0HqbEOdItZm0U2Vt
	 gddTylzTnIhew==
Message-ID: <sashiko-outbox-222235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] alpha: marvel: report environmental events
 without VERBOSE_MCHECK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118-marvel-env-v4-2-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-2-200317e496c2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:12:34 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The service processors report temperature, fan, voltage and power supply
> alarms as system event (0x680) logout frames. The frame is already
> classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> header line reaches the log, which does not say which sensor or what
> happened. Print the subpackets unconditionally.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-marvel-env=
-v4-0-200317e496c2@gmail.com?part=3D2

