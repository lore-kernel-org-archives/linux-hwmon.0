Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530325;
	b=AL1A0bHs29wzA/4N9DLdbCve6BiCDd+st7EcKXZ54a+BrsyoeMu9UqaVeiN9efQRzyhN
	 O7V5ryygkvUmQlBiYM/Punj2x4w+SSqCn4q5+czQH6spTO1GnKXGGgyXiQfjRQp+ZDWmb
	 hT9Zi/lPrH7mKpN9MDcMLpVUl2GN9yBMTsJ0CoLzCvk0oVjGCmDT5zogLPGThqqtvib/Y
	 yb6idZXWmIxbbR2ztEIoz5WCtwAVNJp48ekLdLR7FGuGaKIk047qXPKqoMicujAcOtmlv
	 R5WSusYYb2qbMPKzUchmXT+rhkaxWucsEzQVSChC9QqZmX0QSvao6EiMXDJzL7vCHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/72nCDz6hTuKlyxynZlgtp9OLDpuGk7+tG4o4hpxpUo=;
	b=Hdw7GmcYO5x8010zvOfae/mv0dCC0DxQxfoM4sLxJNkvKZJY/uCB8CzASjCPIYuqFdqm
	 bd+g9hJM4cmWUzH/1c9YFOnP76V/6yyIqgv6wffCenq4BUr3+NKlN1LU0davPXqZCqq01
	 EMSuHLyM2sz3Q3Tf0eTNoCHHHclnlA6M/CSwiFXj6oHQb9BsfTkr7HZ5MdOxu6hU7vLnH
	 TMp4BI5fHfpt+YJjkLqRB2I6SjKFniFPoy0qJyFjoF4Fx2bO9a2qCpGRmtwwxiLa4rdtt
	 E7TKzXyWrmz0CoiOEdy7x+I5UMDsEF2iktj5rIfAPdoXTVe4w0VPsx80zNSgYAclU7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxDA9cFC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07004606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxDA9cFC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731241F00919;
	Sun,  1 Nov 2026 10:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530324;
	bh=/72nCDz6hTuKlyxynZlgtp9OLDpuGk7+tG4o4hpxpUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dxDA9cFCbfXynzTARjzToPJPObI2E1/zOvaVGiHtAkdcoVwCRpqrlj3VFtKoekjsZ
	 e6Y5kJOThmwo/ZEPtlnnSMBZdSjn/k79lmfSwZD8jgZlXeu1hoTuRSa599vu7Uvqel
	 wk3rcl9WbvYaLTwgjNbsUWW0FpRYS0JqJxVaPnsnHJabtcZQQKp2UtK++DnT3o9Kdl
	 L8nap/WY3tJ2ZjGInykJySiUlH251OT7yd6JaC57fl7uHMRq1STyVVT6JLf0w9mPSn
	 x4ADXzT32c+Zgk/5qFMH65gkQ+x//gdiQQH84V/Xkei9sp/c12WJC/7tubaWSp3iFX
	 z2w2hcyaMTi8A==
Message-ID: <sashiko-outbox-192369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] platform/x86: asus-wmi: expose the fan floor tables
 via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartu Alev" <bartualev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101-asus-fan-floors-v4-v1-6-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
 <20261101-asus-fan-floors-v4-v1-6-b8d1c31a99a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 10:52:04 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Firmware enforces minimum duties on fan curves without updating the
> reported curve buffers, leaving userspace unable to determine which
> duty ranges are unreachable.
>=20
> Export read-only pwm[1-3]_auto_point[1-8]_floor_pwm attributes on the
> hwmon device.  Each file returns the minimum duty (0-255 PWM) enforced
> for that curve point.  The attributes are registered for every
> supported fan curve and return -ENODATA when firmware provides no
> floor table.
>=20
> Standard hwmon curve attributes (pwmY_auto_pointZ_pwm) assume
> writable points and cannot represent a separate, hardware enforced
> floor.  Dedicated read-only floor attributes provide these values
> while adhering to the one value per file rule.
>=20
> Document these attributes in
> Documentation/ABI/testing/sysfs-platform-asus-wmi.
>=20
> Signed-off-by: Bartu Alev <bartualev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-asus-fan-f=
loors-v4-v1-0-b8d1c31a99a9@gmail.com?part=3D6

