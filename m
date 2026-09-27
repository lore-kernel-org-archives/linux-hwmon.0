Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDADF253951
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790511415; cv=none; b=ADR4rC9OVJXrUKAAMglaskgiQ8tS7xEHnMzFKX3De4csmnUTnZpxc9Zco0/gOYe5mqnoRuvSksopvz21zXJGb4+JmZnEtl8KBzdwo12wzEUh+S6vIib1Uvnqyhu613kHRsaEKVPpWca5RgAgUx1e/2bgZ3qKX+UCM5sLMwsd1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790511415; c=relaxed/simple;
	bh=j0UDyezGdCo6z1SDNJXUb2nZoLoDgL+Xr9r7K/yxiBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lanLOvAbEO2V/J18EB4JyymbJoBKKa5E1j5cJe2n6znjh8IZv6Zrzb1qUwHjVUKKE8P9/YOg7x9X43GUP9i6r14tS0vxysniwocfic1LMZNVAp1TYhospep9cinvJ2AdH1+eqsVeqe9Q6NxUtTn0zQaZl2UDPwbRWndiDzI5Qr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcGMSCU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcGMSCU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BCB1F000FF;
	Sun, 27 Sep 2026 12:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790511414;
	bh=j0UDyezGdCo6z1SDNJXUb2nZoLoDgL+Xr9r7K/yxiBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GcGMSCU2pqbmeCWcUWvgYeGJ2nJ3M+hIqzLIh8ea6/94wKvff5WyqrCkSFDIpHmxd
	 1VcO7yRXn7KRk9uSwVvqpBat4GRKmYDOdh4WI9IGpmkYZ9q8nKOjqqv0tp9W+724gX
	 +7AmX6lgzJORZGJ4ZMrQRYMuZStYlgUY10Hb6mz3tb2J0sNq2E64mgIP0Cqr5eYHRm
	 lbKMvtXyDuA1iJuRCgyyRgNxxSNcUxPQ6ova9Mnu9Lx39rcOoHmJT0zX1gbC+8oERI
	 eILGsN73+SFM/X6ndAGbpjTKx3Yk26+wBf/x8h2gdqQ2mLlCfyF+T3+Bd24Yyt5/Kb
	 QHwhmHFnNxlFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus_rog_ryujin) Fix pump control source on
 the Ryujin III
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zac Lanzon" <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927120927.72810-2-lanzonza@gmail.com>
References: <20260927120927.72810-1-lanzonza@gmail.com>
 <20260927120927.72810-2-lanzonza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 12:16:53 +0000
Message-Id: <20260927121654.71BCB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The RYUJIN III pump has a 4-pin cable for a motherboard fan header in
> addition to USB. Byte 2 of the set cooler duty command selects the pump
> control source: 0 hands the pump to its internal controller, which
> follows the PWM of the header its 4-pin cable is plugged into, and 1
> makes it follow the pump duty in byte 3. Byte 3 of the cooler duty
> report returns the current source.
>=20
> The driver fills byte 2 with duty_channel, which is 1 for the RYUJIN
> III, and a pwm2 write re-sends the reported pump duty with the new fan
> duty. So writing only the internal fan duty takes the pump away from
> its internal controller.
>=20
> Measured on a RYUJIN III 360 (firmware AURJ2-S750-0108) with the pump
> cable on AIO_PUMP and the header PWM set through nct6775, after loading
> the driver with the pump on its internal controller (pump rpm):
> [ ... ]
> Closes: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/issues/12
> Suggested-by: Edward Blair <edward.blair@gmail.com>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927120927.7281=
0-1-lanzonza@gmail.com?part=3D1

