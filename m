Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901821;
	b=cDceVQIYImW4chG4swnecXG5Y+cAZRjVpeyK8c71fGN9N/+wt7lkgmwR1WIWLcL4+vgK
	 y0Zg1+swQc8rDwwUMD/7jnAtbSor00EyRO6aPNbEcUfLMtyNtPHplEN0OgwDUMNaaQM0X
	 Rdk3LBcveKT8syHYa3Cm8hLEK4tjhgf04xA/nG+8L1+YTH1jdneccKdO8i3od8dCxiET+
	 DsYxg/5B4nVi8yBPJ3OnXFmem85As4GVi4heHgqlxpyvuqkZd4BPTHqd5pqEdSpY6FQ2J
	 wjVVnyZeNKSRePWhUqytzSPkxINeG2DCLGP+0xCQeVnMlkP1AC5qR1Ne6ixlyG2QO/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901821;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/QmknWZa2+u1TrPSRQYNOfVqijDhZE3RqsUA9JNpjkU=;
	b=XPqblTGWb6MvO1oF/07XkwF9NYDbIJgA9N7Ij/CApICT7ovpd6/NsSfpC7biKPLn1y44
	 np1DhB4/u4lUdYVRFhjLuRjJBpu3qeE9834dVpdmOQ/XK/eyhmUk5UmGAvUIorar4ZUlN
	 lVV03LDMgeQccQB4y+LvSXwpq8iEb61iR5lwECskgbuNQyCFBigGaQQ3CvURopZ91dmz6
	 kJeEEv8n2TtP0JUaTVCzkujVlJEmZBTHfMAH6JBu5y3tjh8zv55BtWEQulCiBd4VZwzEG
	 ck0pMt6QYSYRWlZx9wcKOW88VCKr/fGe5S9RquRftSpeKHzqLvbPQB1+kkZij4EIAQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lcfuKBVb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C49606A321
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lcfuKBVb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3A21F01825;
	Sun, 25 Oct 2026 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901820;
	bh=/QmknWZa2+u1TrPSRQYNOfVqijDhZE3RqsUA9JNpjkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lcfuKBVbDj4snzwXOBkijl/7a5ikT8cyMORE5rtn4Y2J3usXZIiHyN07G1kNHJRs5
	 F1QhX/+kJTlp9zuv2AUgO2TRKucHTSF0fZ5yaPoNz565gs3D7LEB5o/852091iJW3W
	 nwuT73qHvbKYIf9a7gC2Ej+l45JkkQiPWJGUlqXEKoZOEkSRdfsjF60AnTr6tgOGtV
	 ka3AdJLYW4QsgpnzUP1X2ENTYzlB+dCukGkckRIoD/GDFusYqorcXZFHLh0QQ3fg+q
	 iZB6qzN3zzTJn7oj747Y5FMc0x94k62MN6yIYFZle+vxvsxtmvAKfNqqg4VE6qtiv1
	 A0Z4j10Mm59eg==
Message-ID: <sashiko-outbox-184038@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/31] hwmon: (pmbus/crps) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-9-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-9-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:16:59 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in crps_probe()
> and shrink the buffer declaration to I2C_SMBUS_BLOCK_MAX + 1 since
> only a single NUL terminator byte is needed.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D9

