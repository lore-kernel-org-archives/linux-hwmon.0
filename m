Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542009;
	b=qEZ9bW66kZ4rtVERe6zVjm1nqbROLrlZL22SToo10C/admlPPZ/uu3dsbc8u0VSTiKAi
	 W6w+otrzI52YRmsVUn5Q6HhMC3Hq3XRq6jNt7rwtreMfpRz23f/V2mQRZ7QfNZxDPp8j1
	 S03vruEeKmjU5gsbJvImIrPeFz4MH0EPtaw88KvCNUC+AY8luHhBA0BC7KxPmZaMspXty
	 JOmnCDKe37w5jQOs+cVpLCRpjMqfxNVkQg0fwJuGqxkTl+B7SGQ1N1uN9+EqIuTwDoGHO
	 ALC0eo7GJbPXUkh9Nj+9sgHt4v0DFPzDFojOtm91iGwUK6TFRXuS8rdPehdBuCL2Dtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542009;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wS/1eL0R0wZBd+bVvCyEDj/8/99axObHQtBmRQX2sVk=;
	b=pjvtp8VO+uBcQf4HgJRgVSuRhnCanaxHXOXGD4wljcQs0s93w+tUhPy6MNXHT2tKC3F/
	 bgU9OIf1wNPxj9Fgd0ULfaTpIsMK8CgWgMxKPHdd/o7FSh8OLADVZdmn67M0ne0XUFMUC
	 7+BKBX3FRZUL3tng9IkNVqs0ScoCM2RJd/0c4Tf/kB8fmncS/F6fCqGSX/JXuPx4JNiQC
	 sENBJmy06V1HfrSDHf7m2TcuvUdoYsRasWZ4vvkB+uUHiS0RTTW5nKUFiiHeKX+OT15gz
	 bwG/LQWtmz3VFQVEnAGbjIduvWrsfQY/vHKgjF3Veg/ZwHdPRTNAOXXVPMeSe1uePYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIcrSMEJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D0606A31E
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 17:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIcrSMEJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200341F000CF;
	Tue, 24 Nov 2026 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542009;
	bh=wS/1eL0R0wZBd+bVvCyEDj/8/99axObHQtBmRQX2sVk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=EIcrSMEJM5NjGUPcfyqYdW1H2diwe2I30G8+9MPmz2KYTFaxwkI1VD7AnAEJq0Jci
	 0SZJQm5/SMKy3d99TdYzCVLNIA5BZhDTDBaTbaF7Zx6Ede4limyVsc0n9P5tqaFGUs
	 2RKb74eviP8FpcRrOFPw4109/zFL+xFGGi14+64JebvblxPTwo6Wu83zU4QOFhDz4V
	 VeBjc+VxmF+7A6v+b7aAdkEumqrYZ1JopLpfa0oz3sZa1luvhCV4b1Xwq9xI6PlBe6
	 BBaeRd08pyIh5YONAd/GhNq7rs3CcpIloiud1p2/bXhkEYd1U8MJp+TUOErThDpT2A
	 lZo68cb3AZ34Q==
Message-ID: <sashiko-outbox-231727@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261124173900.31266-2-andrea.porta@suse.com>
References: <20261124173900.31266-1-andrea.porta@suse.com>
 <20261124173900.31266-2-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:40:08 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a hardware monitoring driver to support the fan tachometer on the
> Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.
>=20
> The RP1 PWM controller block contains an MMIO register that holds the
> current fan speed in RPM. This register is periodically updated by the
> RP1 internal firmware based on the tachometer pulses.
>=20
> The RP1 PWM driver registers a "fan" auxiliary device for the
> tachometer. This driver binds to it as an auxiliary driver and reads
> the RPM value through rp1_pwm_read_tachometer(), exported by the PWM
> driver in the 'RP1_PWM' symbol namespace. Since the auxiliary device is
> a child of the PWM controller, no Device Tree node is needed and the
> lifetime of this driver is bound to the one of the PWM controller.
>=20
> Provides the standard hwmon sysfs attribute 'fan1_input'.
>=20
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124173900.3126=
6-1-andrea.porta@suse.com?part=3D1
