Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904579;
	b=uA29HcOYaiYF1tlPzrUgnp9ko1S7Fdw/hh7DLZPKVKY/hCm6pNiN6YzlgzUoOy2PcZbc
	 IoeZYxLp6VAy7Nu2uqygF60Sv8hX7bp1uirmuzoZjrEx27LESCY38pwfZd0vF45lyrytg
	 NTMmRNQWqr8DN1ftbLqFAtSzU37huA0uF5qA3dgz/isiLZ//9gTa0zJS1z9gPKERmU7qa
	 bSpdzE5WVjSOScAmVTlTTsymdmySuIjACd2elHc1VSyFe0OB2FWRWAY94YDnZD18F9jE+
	 +iGt9uj7wPiGLO5SWvftX9eZT21MDVzub5ahjXMmSoS7Wmnq4/Qw2W06tFgBuDn+tNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904579;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+ZWKiJY4Q4caNY2SFpzO2za8W/EfkoacuC+Dlm37As8=;
	b=31+XKfhbANAG5M9Ec8V7sszhwRP8vJYOVIAB+N59lubAdSxPVcb1CsMM3XPs7Rvr4OZe
	 MTisC5wKj1YYykVh+odY+/2pMaE7Gndq2ZrR8f3MPqfOi3ItgDe+M34XaxYWv839qos0i
	 kGTL5Iv8DGHGLMGhVpN6c34uXlOI/GXEsO+F/MPQTYS8n7cJvwwVz+CgkVh7vTMUyETwA
	 RjuXRSflro4qIdeJgT4rhiLl3ZnnpwssM/WHxJKT2DCBHJmxzji8LRM/YpkJYzyhs6shY
	 1Tttv/HZgjEW2i9nh1Hno/B1bLXaHXFcIma4RKh2/5lqDlou4o4pdLm7gt5OtHxcp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/y/jNBs";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C12606A887
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/y/jNBs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0291F000C4;
	Tue, 17 Nov 2026 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904579;
	bh=+ZWKiJY4Q4caNY2SFpzO2za8W/EfkoacuC+Dlm37As8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/y/jNBsykhu44JZMJj5L0GVVQLvCA646UJcOEHNkLMM+41mLNb5tsTna9Eal9uHp
	 1u6hYfobUK6SL0OJKUGEI8lEljSz2oz2l7HhiFIgO8h/NTw4ChAh6OnCfr8035FKZ4
	 2kyd4Ht2TSW5rL6SOL4hJQRoZv9tBecnR+hnka29qTaewKFDmv+mGyfnFG69jVJ260
	 2e9/gCwf83GNjTEgSAqR7uKVC1EGS67+LhbbMvZS1TclJVjQHFikzYRRWpsF9lhXbS
	 6k+p7roA/6c8MbgM+AtXFh0g969qbX3cymxgQW8nHgUrX1JCsv9h+uxVZhPq3P7Vzg
	 cyitFyiDsss6w==
Message-ID: <sashiko-outbox-218422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: ltc4283: Add support for the LTC4284 swap
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-staging-ltc4284-v3-2-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
 <20261117-staging-ltc4284-v3-2-326bb844e08c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 08:36:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The LTC4284 is similar to the LTC4283 but adds dual current sense
> channels (SENSE1 and SENSE2) with independent sense resistors (rsense
> and rsense2). It also introduces a dedicated ADC sense resistor (radc)
> connected to the ADC+/ADC- pins, which is used for power and energy
> calculations instead of the primary sense resistor.
>=20
> The driver supports both chips through a shared channel table, hiding
> the second current channel for LTC4283 via the is_visible() callback.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-staging-lt=
c4284-v3-0-326bb844e08c@analog.com?part=3D2

