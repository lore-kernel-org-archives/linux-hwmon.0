Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E13C3C16
	for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789885804; cv=none; b=uvglPlA/0jchScvoTzNQTzFftIqGvxNCw/ZcHTdbH2E1Rn/AQmu1217Dtsy5kUi/3y7lcP2vhPU8tviHBjbR0o7XX/tGOb1O6dfzMs5+shqn8ZbZ+dvJuqKgH00doQGUnQrn1leAU1RFHu5a/2lnYvWh8huxSuii4uxVm3TCCpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789885804; c=relaxed/simple;
	bh=iXAylQa3Q4xIjwAw0tNRBeSdT9PS5PhjvZPvxbVnyNc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VvBtynCp0iOkQBbrGT84GyiBBOFkoCRdZWxuKDlN83Li63u65lZJHhApTjXV5prA1VG6R2koepA8tzXrcbaJ33Ik+rppFL+XAjkm7e8T8DC/HOb1zD8BqPwqhKqzR6GEJzCYmBVfR7Zx4RVMMMkp6kGRC07DSXaLozGM7jKlOis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ex6HbP3x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ex6HbP3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC96E1F000FF;
	Sun, 20 Sep 2026 06:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789885803;
	bh=QzMFN7hPZ1IaA3C9IvlFZYZqJlfCKLoY7mrC8BCfHIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ex6HbP3xNCF5UbSrObt2Lk8jGymE4TMcdgmNEkViuO5lvjxnaRyOOyuNDgzvRrSBS
	 9KNt0TQVar0qy1WIMfRv9hL0Icp72kYBY0BeQRPMxs93IrxYioje7Lhy3VJPoF840b
	 XrWw/sNQSLvdHozdiCmBAuTOl9wlRwFjKuyS9yLNzl5X6RXfZfFYfiEsGyHuzDWsla
	 qT+E38y+JBrDiqLPZnaxsJxkkG7O9QrGPCeHDNHUoRDXvbaD/M7HtDr88afFagMF6R
	 Jw2nkKvOrS7w/Ss8wbadPkTjxO1oY1tN9Hx+dnTRFpvbfDa8Z603RIr4bvPo0XxMcD
	 bKtqQp/JhpIJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] hwmon: (spd5118) support write protected devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kean Ren" <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260920062230.2437291-1-rh_king@163.com>
References: <20260920062230.2437291-1-rh_king@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 06:30:02 +0000
Message-Id: <20260920063002.DC96E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some systems do not allow writes to SPD devices. On the i801 SMBus
> controller family this happens when the BIOS sets SPD Write Disable, in
> which case the controller refuses writes to addresses 0x50-0x57; other
> platforms may enforce the same in firmware. There is no way for the driver
> to query this.
>=20
> spd5118 assumes that it can write to the device, which does not hold on
> such systems:
>=20
>   - writes to the hwmon attributes always fail with -ENXIO
>   - the temperature sensor disable in spd5118_suspend() fails silently
>   - spd5118_resume() fails in regcache_sync(), and the system reports
>=20
>   spd5118 0-0050: Failed to write b =3D 0: -6
>   spd5118 0-0050: PM: failed to resume async: error -6
> [ ... ]
> becomes read-only. Document that, and leave the shared regmap
> configuration alone by selecting a separate one without a register
> cache.
>=20
> Signed-off-by: Kean Ren <rh_king@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920062230.2437=
291-2-rh_king@163.com?part=3D1

