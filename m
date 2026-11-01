Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571659;
	b=Ba0VQWi9DlSS9cWOIltYV/O0k0jm+4BGa+oDry9q6f0SEMtxN6E9TVI8Y+a0zdmS56fv
	 8T9qHwdJy4X3czrsXtElZxWqXx6wZxhmBU6wa/P6RpnMrMdu+bhsZGKmDPI8yfBAxiIzI
	 tPw4O1Ax1ng9/xXv9puftKVnXqZtg+mt4T6h8POvol/59VwxkB1mrnuNUasFu0PMB50k9
	 OrxP7b5FPlr1FrI5RYHM+OJ5xlBAJj7G+vQzCehB5Rz+8AWfFKwvZQ4tqmRlhiaGNHrng
	 pyREOYp3H+nkO/jMrKc3zD5MFyzjQObD1+qTQBhm9Rd9TewAwR+EMOj3EXmpWjOer8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571659;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rw4wfCEvz8YGYET97UCun0meUt7LP9yCNcCUmQmo/+w=;
	b=K22tUePFkD6QP12G1yaaTff9XpZU4LCX1DtHGVZfSG7a9J2oZCD12wYVqf0+40uhnthP
	 uFwYvJZQfBV5QeQ/jVvPhR/Uwzxy7LyHMrH1BgtRhHWx4vPk0M/3yiKovZqMRQROQl7Xc
	 14zT4dDOFYbgeXiCnKk3K0tHwwBEl2ZQi6ULJB19D4c3OMq10yzLl+uqpSl+192v8zJ4u
	 xMAyi5gdh5QdrFrfXkYZuGEiYdp+j/GboVcfI1xIQixZIjsCijC1m8csVqupHMs6I0FWX
	 8JnzCDOPfylAwPmjtaMRjdvYGJcpD768Z8KaPghfLcxJ162aUAH42qQ9U0b3C8/0SnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAxtOkog;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B6F606A32D;
	Sun,  1 Nov 2026 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAxtOkog
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B971F000C1;
	Sun,  1 Nov 2026 22:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571659;
	bh=rw4wfCEvz8YGYET97UCun0meUt7LP9yCNcCUmQmo/+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MAxtOkogIckCL3ivZUdId50nS0DVOv7eYx1EJGUkB4UydTJ/Tcq8tpPdJhtOz5eZC
	 Ijw1JGn1orhEcTGQkTNwhk2X5spqppFWpa7L7KyB9VPQwi6Zv+AcQ5Ka2nJMhtmmrW
	 s2GGqLUQ/Z7e7AC5PZNi2gK1fbTYlNPhpHPT1iVJBN6VI2lZDDsPGxEaqlWZFqBhAy
	 /0szm8SFLntTC4as4Sd5POfzrGxwDeOMXhtjmtvGAEVzPHhvwdBpwmN3tPWlV+It4E
	 PfuNKGBDyhi+Ln7G/KgN0FvM5zT0At3CJn9g/P8uFQIREksiJOjjfuU6l3MlYYES8S
	 SsRRnP5KeZfHg==
Message-ID: <sashiko-outbox-192707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] reset: Add BCMBCA block resets through the PMB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-4-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-4-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:20:58 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Support BCM6846 XRDP and PVTMON resets through the Processor Monitor
> Bus (PMB) of the third generation Power Management Controller (PMC3).
>=20
> The sequence is hardware-tested in the XG6846B OpenWrt port.
>=20
> Power-cycle resets for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL were
> considered but left out. These belong in power-domain and platform
> power-management abstractions, which can coordinate affected users.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-xg6846b-bc=
mbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org?part=3D4

