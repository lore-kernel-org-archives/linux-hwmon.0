Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302635;
	b=BmgnflVT1kiqYLCzI+kmhVNfADtdDZXiipQrgB8fyU8BnFOFicHU5b4uwTjZxDyaGxwE
	 ueVlrM6bvNcc2etHJoSzQXx0kAD0vf/CjfRt4rL7g3BJhGK6psjQLG0/NsNS+xrQb8EZq
	 t4wSptquB4KZFXgaW45P7UEQRNhSEgs6rLEQosBTRKkxYZB1Sxm8+U1tOXYatv/Nwv9Ea
	 Qc/9PHAxmXNVtSFoXWbwRBplI+9DayLNn+RZne/wRsNWwhA+W5hNev//bsLVhJAK3QJ3r
	 z8UNR290WLfD4aCEgmoffi7nHMPwqiN1Mkd5cbMamqsLqJqo94P0iVdGz1PjjOQSoBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302635;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rj2xLAy0Juu5CR6/d0l8rOXvtyw7qlMeYYtHO08VahQ=;
	b=aHGdq+2T3ms6buAJ+wAG1O23ZYubyIxoWedIXphbB+9qd3swglY+m4QWBmzYE5w1HJ+G
	 +X/p8cZlhZnbTfNT9Z52TYJYlsglE8Xw9U3IU56cM7PP2vOuVxTUtBXJIqgoZF8DJjRbK
	 QuMfw1Qtit42G8Sc7B/+apIXPYe3i24LFNzOl5cFA7ufMyHE3GmHjzCHlXItVl7dsLgE+
	 YE+9Uxr3Y3KR40pANjlz1dp/jvVexswxbq78m2pZ12DMR0n5/QBzxTZiuN0KgR32p/9MB
	 x1lmpveQQB9U0uhFXvTerKYL9SVdKD0bZn9JV7wAxRNwiJ549ohU49ZrT8dK5ZwXGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3xcuTLP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A37606A336
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 23:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3xcuTLP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6491F000C6;
	Sat, 21 Nov 2026 23:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302635;
	bh=Rj2xLAy0Juu5CR6/d0l8rOXvtyw7qlMeYYtHO08VahQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G3xcuTLPylrFkAyFOmdpO6UwW52HoLsylm2xSv/XWfghhpLi4zAscgXHvSW4nHDY0
	 bOkinPQxLvSqJ66trPQ/uW2x0JA3cZYfB2x1a6Var8TsSe2Xy8bAlbccmv8KzIOdaK
	 5iQyEMgDKKKbrGd9iukgMUZNcQoNy23CUyl+P7RDlfBysOhQNDtKLInB45aJvohWx5
	 2BROaSztX/fLmEMdRohUAimRZ+GHOcbidQRUfMd0cnxfbj4G1keLHo5I3ZxZt3F3ea
	 aHPyMfzeMuEt2DRId7OuPh9LIWXd/5mi16yEIQciutXIiP4kWUI6tUTH5ArXLpKodo
	 zj/AYSSdOz58Q==
Message-ID: <sashiko-outbox-227480@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan
 control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivan Popovych" <ivan@ipvych.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261121230738.4970-1-ivan@ipvych.com>
References: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
 <20261121230738.4970-1-ivan@ipvych.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 23:10:34 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
> running "echo 1 > pwm1_enable" disables automatic fan control and
> "echo 2 > pwm1_enable" enables it back.
>=20
> Both 30a3/31a3 and 34a3/35a3 commands work on this laptop, using
> 30a3/31a3 as these are the commands used by the official Dell
> software.
>=20
> Signed-off-by: Ivan Popovych <ivan@ipvych.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121230738.4970=
-1-ivan@ipvych.com?part=3D1
