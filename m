Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386132;
	b=T4rjggGlrMej3LRkg7Sa+R62I70ArshC2LEujt3tUEjOh1lAI63JiNMbvHdNqTcKQQl8
	 7VvASpDMrTrJOu6JMzwEdxawfYkszJ23n1vr46Dnip/zwUAPs9P5sXFxznURiDPc49I7l
	 XM2BD/0kAKiqEK2mazCWzxdeYtfyM4jUksU3y5WOEcANR/E34vbDgSVrBu5H7Ges6r1U3
	 oTJNpsTt59k2dyNE+Y9a377XcRBRxsKR2VLqWOHYJgC/KzllkqV74eGK0vzGaiYI5njoq
	 0qGhBP3Ea8c2x7/UvSUtbuIa76DbgEMMdh/YlmFnvUAZompjlvrCEIyKDZ+25yOXzIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386132;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nuFyfSzeFewb1TsROlMjE3UT1P7N+ccroa5jTgV8Mh0=;
	b=QQ5f5tnGXczlPeRBzZI/2wlI9sdsohcDe0yppA5/SfowJnUxHze7PHp71LZ4FJ93qWUy
	 2ULNDn6vQIhJlM1Zuajq/Ps5VieF9T6Nn3p+Yv0KU40lOAPIJPk7PQEIPV10HDILL4DaF
	 n8E0Nnc8MQo0wh7OJJk8o2esDJDUMB+yB8Ww1AzCPSVg5C4pn1ryQl6BbgVJbklTldtse
	 Bp8zQRbxJTxvF5Ngi9dI8pvxJBry09N2kUgABxKEwZsUmvh4LNNAGYUq6dOQF+DDQgi0E
	 xaZ2bxa0xVi8GmupIIIwMng2J3v3Dv2l3oTNxmj6lKl2rTz4Ovcq6Wu2Hs319IO4o2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKj1Q2mY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBE1606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKj1Q2mY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F02D1F00A05;
	Wed, 11 Nov 2026 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386132;
	bh=nuFyfSzeFewb1TsROlMjE3UT1P7N+ccroa5jTgV8Mh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BKj1Q2mYdK8qkgBmBT80FL2xIySMsfDjUN7B6Z/eC2bUnC8+kVyPofG2K4f1JJCiT
	 hNy1mqVcIHWEk0WWIdc2ON8zBWiyRV24Mo8MexBRl1wwo4XzhLC5Q9Ttq6aEyzQUwW
	 TDeMJmzB6ko18B6xKXsyeYNPYycZBaXqX4e+hrFcbRWx8Tudyv+yMEqrNpja2ZRi0q
	 3W6bJhGx18R8zJi/avidvcCweM5nJMInAnvNmxpfMa6bgr0wVaylYn99o+Nihj4M2E
	 GKzIq/qqwmRX/bkhCKn2XAA96ALTCnEQxTdGCe6WdwW/SXkVYnxcDGjx7alTonQVnM
	 S03lwXe8PtMnw==
Message-ID: <sashiko-outbox-208619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] hwmon: (nct6683) Enable fan control on ASRock
 BC-250
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111082838.1418051-5-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-5-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:35:31 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The ASRock BC-250 (customer ID 0x162b) has an NCT6686D with the same fan
> control registers as the B850 Steel Legend WiFi, and manual fan control
> was reported to work there.
>=20
> Enable fan control for channels 0 to 7 on this board as well.
>=20
> Suggested-by: Fabio Baltieri <fabio.baltieri@gmail.com>
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111082838.1418=
051-1-jdahlin@gmail.com?part=3D4

