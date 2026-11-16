Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873491;
	b=kE3J2B9srGDbx5N9dd4QGy5XXhEBYyM7bhgCnAiPwjtO0KAbvZF4Uhyu2C4JPvZhkXUO
	 7HAABZwHYOCoE6fb+gzmN0zU3EWpQTJDfbzM00ulaIN213fPWDwLVDGYsxtxMOKYAOw6o
	 lOj3SDBArYcGS/LM8Wg6jMqbOOva1mLGOVkTPKni+UKoPbDLs325y75ll+UB2XL6XmaRE
	 KFNPnz7Lx/hvBoOKWXXtnZRzAenvDbm+p00+jq6+ii5BEDSuowyRoxUx9bOiiBaByP50z
	 3IIRxa5KxGioAUTClPFS0HXieXfny7YYKWxay+kqpLXInhptOg0pmMbdJechL7rmRNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873491;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zBXqOiT8YaZ3yHU0r5rE68faJDYty4QudSM2bMgOdEY=;
	b=u4+kcO6Zn+6RlDfDHzuyPDZykpSWzAgvn6y6fDZyE2+x6Sr/Yr8GjCSzcF/SCJDDiTav
	 5HSglVG2n5bujfL1077xLifPe6krlitqgMsFDNvJ0xLTDQwtM79qbskcXhcTwwaLKUfm7
	 RpMXTFb7VRsQrGaCBqV+phu1E1ZW0tLlz19cLDu3YGreN/LV+rrZrtwVWo0YMklncgQ4U
	 ycsl0SjzMlEEf1ga6QR9Tz4ZcShlsbLlAdt3hQTXWX4hHB6Creo3CN3YEbZp9Gv8LURvX
	 oIg+9yxv3HPIbCoFclXlTC35IhhC1Ct62Qs0Jt75IxY7IpdXQFMBmA0/Cwz8lRT7YZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxd4Vrp5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C890606A31C;
	Mon, 16 Nov 2026 23:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxd4Vrp5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166F91F000C4;
	Mon, 16 Nov 2026 23:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873491;
	bh=zBXqOiT8YaZ3yHU0r5rE68faJDYty4QudSM2bMgOdEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxd4Vrp5KnanumUMdhbUrQwcvGUyPMJnKS6leYlgtW7xREPvnkz49DM9wQYGYjpJB
	 +6nammoutMIlG2iND6h7va26Y0wpz3e/ZXd4MWKTZGZKfJvdIzZMUbgfFuwvICWuiB
	 8zzG2/01HS7kAIqoTokTUgE43iAxliCPFbPx2X3CjhgJjzKni7gGz1uV3iv42iSpBR
	 mdwmZolzWQsf8EHSiwpVKbcFB7FLev4WTAkLiQw8S6j1lqg9ym6TDEHNnEdslcnr+S
	 ApGLjeOSbQTekJ6rSlNNXlPkxdGcCbHwseJQXshIFOzgYdOO14ITcfkNTuXWk/PWoF
	 /lcy0HWQo9MIw==
Message-ID: <sashiko-outbox-217954@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] mfd: bcmbca-pmb: Add a shared BCMBCA PMC3 PMB
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-xg6846b-bcmbca-xrdp-reset-v5-2-f584e8b8e696@kernel.org>
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-2-f584e8b8e696@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:58:10 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add an MFD driver for shared access to the Power Management Bus (PMB)
> of the third generation Power Management Controller (PMC3), initially
> for BCM6846.
>=20
> Expose an uncached regmap to all children, encoding the bus, device and
> word offset in each register address. Keep keyhole semaphore acquisition
> and transaction recovery inside the MFD driver.
>=20
> A software timeout does not abort a transaction. If the keyhole is still
> busy, retain its hardware lock and reject new callers until delayed work
> observes completion and releases it.
>=20
> The keyhole register layout differs from older Broadcom PMB controllers.
> Match only BCM6846 for now.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-xg6846b-bc=
mbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org?part=3D2

