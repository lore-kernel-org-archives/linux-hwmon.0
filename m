Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418688;
	b=nnkK6mGOHc/L6g2YdZ9kKs3H5RSn+i6s+4yS+Vp2wuOuQNQbLKbdkNuwU5VD4ZL/hHjb
	 RXFg8e+8IUXEi80Vip0jrDuiN4F8rp4CSqQVcEp/Gu5lNppqO2DIJgP5mSkv5G8az/cyN
	 9tzSng5KBwwPqzXzi2QbQ90KC16YWWOC/biC7d6JgtEZWaIG4vME3oBArlPvbZykhB51l
	 /8KPztyU3NsZjE0dwI3lv9xiumIWoccHsWEP8TEqHy+b34iC8uGGUlUQAnrZgsAm7KwID
	 yFQV7vzTZpTyPNuYPKKietllfdYxxHcwcjtrHp/Khhpz9QFVdVP8pvKbW1mD+PMp/lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418688;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yLKu1Ru3q7haCRCGXJ4KyliTy0ByvFfbCGhCwxqSPPk=;
	b=zr4fzKSvW/Gp52J2vprGWqOPhwzeSygPQ4xZ6TV44SpstX+MzlP/ENtaF60ovD6lF/UJ
	 sBiEhIqeLQSBzl2SLIeb8Wo6pX8Mzsi5mqZzccHYUeFRZnV5zeB1xlISsvMuPFg0TL3vW
	 zfMk/1VKrONyh/LaWhcTZmofH82n14tYnQENmMyZF9M6yATjhOUwZIOtFRdFTHqd1sfS2
	 rh4ArBQJT9HSlpfVT0o13EVpTkcAZZi92wr5BRvye86UbCaE1ZGkYgXXB945nkGnjTOjK
	 YNi1nkTrhebuVwInTXehYozSHSwVlrAJSJtW4bq0k/bqaUOmEe5JKRkh9iVToD9afWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGhmLXHa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8066606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 03:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGhmLXHa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0D31F00919;
	Sat, 31 Oct 2026 03:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793418687;
	bh=yLKu1Ru3q7haCRCGXJ4KyliTy0ByvFfbCGhCwxqSPPk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=OGhmLXHatsFaT2lDAFz3qoPxIphvxs4yMWhraNAvRUAUXKFAcGW/7RIUCxsGTqQLT
	 24uIQRgYVz/4DHhvMqLSdRKU+iKWAwfGRo0jfsn67LIl+CoNwVyHl9PIDRDggSRNJX
	 iVfr9hiZGGyuVP6UH4rZFpiVHVz5rghu4MeFZ4z834ZXh5p8wJcZZab+JUd4xjkIzg
	 fk1JWp2K/tV0GDA27UMwe/RDSKzjCHBb1ElJ9X5ZLX3ba7oWIuoJ1xebJw+x3N27xU
	 bqhXF8aDFhYT7tHwA3K0yzdzqEYkfakEBnACj6YQSgP51OkBR0+5bTY0T6FkPbY5yQ
	 yP49rJMI4e8gw==
Message-ID: <sashiko-outbox-191737@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (tmp108) Fix initial conversion delay and wait
 until ready
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031034834.1079813-1-linux@roeck-us.net>
References: <20261031034834.1079813-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 03:51:26 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> In tmp108_common_probe(), the driver only adds the 30 ms conversion delay
> (TMP108_CONVERSION_TIME_MS) to ready_time if the sensor was previously in
> TMP108_MODE_SHUTDOWN. However, the TMP108 hardware defaults to continuous
> conversion mode (TMP108_MODE_CONTINUOUS) upon power-on reset, including
> immediately after enabling the vcc supply regulator during probe, while
> the temperature register retains its power-on reset value of 0x0000 (0=C2=
=B0C)
> until the first conversion completes. Because the initial mode is not
> shutdown, the delay is bypassed and early reads via thermal zone
> registration or sysfs before the first conversion finishes return an
> uninitialized 0=C2=B0C reading.
>=20
> In addition, returning -EAGAIN from tmp108_read() while waiting for a
> conversion to complete after probe or resume can trigger an unnecessary
> tight retry loop in callers or fail initial reads.
>=20
> Unconditionally set ready_time to TMP108_CONVERSION_TIME_MS ahead in
> tmp108_common_probe(), track ready_time as ktime_t, and wait for the
> remaining conversion time in tmp108_read() using usleep_range() instead
> of returning -EAGAIN.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 66e1c9171339 ("hwmon: Add Texas Instruments TMP108 temperature sen=
sor driver.")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031034834.1079=
813-1-linux@roeck-us.net?part=3D1

