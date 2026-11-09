Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231827;
	b=YJpkZ3TdgZswmHcNVhPPWCmU0uO3H5iGT8Mg1DSYjn6DCFIXMlP1JpRUd3VZ+oaB5/5L
	 Zxll9Lwc2kLIHgFWcQH4nprUWyT2FJTB/HkIweNWq+snrdi1ciLvCT7rxpPK9Bku6b31R
	 8yjh8/iGB5sd4xy1E3b2cRsg3evLyh/1TCJ6Obk3W/ptuVJjhZZI8iv8tcmWjrAtsixGF
	 VoH1zHbv5JXzp6vBMEloIj28RpA2N34dhHGtCND7oEIQp4RilV1VjB86vpRSV2GsfaYJ4
	 jOsBuT9MhYkHErc0u9IHGrRvao3AYIajh2FRzqTtH3ePG6Jw07EpunOYLYsjGPjV5aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231827;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2+QQWnTbc10Knd3FnLJZL+dDPMuDRSXiQi262F0L/KI=;
	b=HzYjgnCi1Zjiojq+8WXKcdatzGqPEM4sfSrgYuuVU+PqPd5qak/hqJVuMSxBUrfhwEvl
	 loREnDrQAYfjXBf5ZcRFAvTJToNcywgeBmzbvtgzY+VR5xj6//P2UZUnimKzmSvfJXMzh
	 0K84K1h1oI87vqDDglDsW8ts1PQ4lL0OuyQ97kNUBJ8Rq7nCGw7Q1Yb84BJA0JR0pGWJB
	 2bJGYcAg5uWq+74f2ZbvCZbMiGk4mK9rOdFjxKpyjfRlKUM/m53x1nhxYF3Ge+UAkUYpj
	 1TVP9+yJM8RXNyS9X02LmN2joUed2rtNrCwDmgbgk0J4oORSkMHUy94npZlsXZFvRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nugK04xh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C102606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nugK04xh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8501F008A2;
	Mon,  9 Nov 2026 13:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794231827;
	bh=2+QQWnTbc10Knd3FnLJZL+dDPMuDRSXiQi262F0L/KI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=nugK04xhRTEdoQ+K9xzCGZ1e0vfxgx/gWlpZaxoFmH2WZpJUgaabL9BbhsOMdURk5
	 4Zk2DXScAqRFy6bS6QFxQSYzDDs2oZCQIlYVWpPYdWJZtSeZImEH5wD8/Fq5AP4tOx
	 redkd/6aBj0QvSkgoythiezGgNFMWpHjSTiwlW5jdzKXwc6nvOXOMhdXMD8US6izU2
	 FlaZGWN3PWvic6/48/I63K7rQ67o57HBUU2cyN0YLxeJ8UoYKsIWEMZlrdBOIXHpIe
	 43yXChRUqZEjqx/44Ph6dlZ4Dvil/GcoKQ3eP52gYVeE58eSsh90c8qMitHR0wBW1m
	 C/cm1XlMIMUFw==
Message-ID: <sashiko-outbox-205022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: microchip: lan969x: add fan
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109133609.810876-6-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261109133609.810876-6-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:43:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> LAN969x provides a PWM fan output and tachometer input in a register
> block separate from the temperature sensor. Describe it as its own
> fan-controller node and keep the temperature sensor compatible.
>=20
> Connect the EV23X71A fan to the controller and route its pins. Use a
> 25 kHz normal-polarity PWM for the board low-side FET. Set cooling
> levels so the fan starts at full speed.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109133609.8108=
76-1-robert.marko@sartura.hr?part=3D6

