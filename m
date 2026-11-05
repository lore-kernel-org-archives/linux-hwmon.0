Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854472;
	b=z22AgcdZUHbE+IoZy4rOCZUyFxIo6QtfmCgE9cgghVFXQdA2iqRXuwp66CETCXydzjPT
	 RBEbW+l6mv21eAbS/3A9ADRWT8d4z0f5C9WzVlbWDzxVKmy11xWPV7J2dILGH8mD/knIm
	 BIzAf47Z34P1oFrKeRsBElJp5MoqvyHVPQQuO7FUFpHmcZfV8YufbWsbV3eOdgiRfTKeT
	 dQQM5oX2TpEFUG/8G02Vv4iDupyfTpvndo1bmAMpCtnf5kD3fG5+HPAVhtLtdR2D/Ta3g
	 ZiJyZUk3sv+CZWEMuTaBDZ1MhQKspTsObNQGgt/JgbIj/iJMCi4T3akB+b3rz1cD3wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854472;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n9FVmp2OwENxq/Im5Q2smKglybftNXcEUCs2405f7lI=;
	b=wKxPEk7/rDog46E0Q/wk40hKbQYpxVQJg3SjR8Gl3k8Vllgr3+Mg2vfuwNTTU1Dh7xlE
	 b4uObxUFkOXhJFRpnFzuLOwr/8cKgbYwruZ//VzgofmCZloqEsQXdzHVqYZ/A2Qh5Rhwk
	 zLS7DzaAaCKVrd2/My0e8GacPVPhvZd82bDJgDJLzNKYtIdLgMBEfejOkpizfPS0Kq4s6
	 1KwJzSnB0a8t50mUyFgW8xO0wkslyXw5GMLQi1gBc2+qDdr7yNTY0WBc32/tQBiVWwKpw
	 5nmF4oipJQ/2v/rCZPBQoZ0orC5SImtQ5pSr1RQsuTb9Q74RktDP8xjK1AuP3BztpZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XknhAxte;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73604606A329
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 04:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XknhAxte
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18C41F0093A;
	Thu,  5 Nov 2026 04:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793854472;
	bh=n9FVmp2OwENxq/Im5Q2smKglybftNXcEUCs2405f7lI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XknhAxte9k29CzYewEinCImfqUupH4UgqA5EfwEScdIiswnhWhsbeL07nFcMjA+Sb
	 rcEpXQFFMxGZNC1J2XrERIq+vJjpAGGL0E71yUwJgSuJBY7nGzVoKMgQHFlWzgtTdp
	 6QNsP+iGBGuBQoFbp7o8RF0vGIk20WBZGg2+cEzEo4B9Fjg6oToJGObgPvM1kLGv83
	 lAGDQezk7N61ERA4SjODlOfryuy0UkIx44h3/kEZMJR6m7sfzn1nU9GcFYfwRQ4v3/
	 jh8S3GgElYqHN+lby2SVr/vf+wiO1Z+5xT6mrieaaEzSnSkxYvSr8JVhs/hJBIYK+C
	 UG9UyOq3UnHig==
Message-ID: <sashiko-outbox-198570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus_rog_ryujin) Update cached duty cycle after
 cooler PWM write
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261105044843.3262037-1-linux@roeck-us.net>
References: <20261105044843.3262037-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 04:54:31 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> In rog_ryujin_write_fixed_duty(), writing a PWM duty cycle to channel 0
> (pump) or channel 1 (internal fan) returns directly from
> rog_ryujin_write_cooler_duty(), skipping the priv->duty_input[channel]
> update at the end of the function. Because the function first fetches
> the pre-write cooler duty via get_cooler_duty_cmd and SET confirmation
> reports do not update priv->duty_input, subsequent sysfs reads within
> the STATUS_VALIDITY (1500 ms) cache window return stale duty values (or,
> on Ryujin III when switching pump source at the reported duty, the
> temporary neighbouring duty written by rog_ryujin_select_pump_source()).
>=20
> Furthermore, rog_ryujin_write_fixed_duty() overwrote val in place with
> rog_ryujin_pwm_to_percent(val), so even before the early return was
> introduced, priv->duty_input[channel] stored a 0-100 percentage rather
> than the 0-255 PWM value expected by rog_ryujin_read().
>=20
> Keep the 0-100 percentage in a separate local variable and fall through
> on success so priv->duty_input[channel] caches the written 0-255 PWM
> value until the next status refresh.
>=20
> Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO co=
oler")
> Fixes: b4306c0c8e24 ("hwmon: (asus_rog_ryujin) Rely on subsystem locking")
> Cc: Aleksa Savic <savicaleksa83@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105044843.3262=
037-1-linux@roeck-us.net?part=3D1

