Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131327;
	b=4DuBoIRnNrvZ8QEFT9JiKnfRRED+rJ9CQrmol+9LVuPk/rkUkd9RoO8VuKYCXdSWpyfb
	 Qv0tAry1txGtzlSe48mcy+X0Q0QJxZc1QV6cgDXVeZHEiFd5mFmwRqYPuvhPt69vXVHGx
	 Rm4h56/Egnp/cDN6XAApX/xmljY59BBQyomInyyAUSNX3kW8a/kzWBKbotmQLE/3qAK3W
	 CXRSb/KrbBM6xHUEWlKzMIjCLSy3k2lhPZOO2JcmtaZrW84TOByIJVgyeEodfspZJ3zTG
	 jGx+k1ZZSZfVy4h9XuR/9sEYrsL+8qgCuwZGjMglI+X4tUWsfd+bDapvyecunx0nqIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8KfIk9vjo8uXOqgYLh3P2w5Vaps3rjDMe+FupdC0n58=;
	b=G2i5hboNQiFUT2wHkRHVmx36f8APDsy2C0+VCZZu1AROAgOWv9aLkgJaG+Z9YN/7Oeuf
	 guTf3ZqPgQQVBUxbltb+A1VRLs9R45E6xoctr9z5avgDSG5seI2mRt6alf1J8v8nzUlaB
	 4Q8INwRqK3Meg68f+ZpiCFLCRPfMOyVH6MiCfgRvh636yJnwWY2D63exM6+VUDcr4l11x
	 D9iEtN3jCZU68OVr3LZOT/Cla5aFzGfsXMtfdsuHNdKNtyt8CoQNsrstmjA9pi+Pxi6J0
	 0P4m+TWGPsAmiCPZBZrXF6fffpVEriEOSMKnZMZTV7Ogh78nH7PkgvdpgwG4qvdz44A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moFdxge8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86482606A31C
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moFdxge8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0711F0089F;
	Sun,  8 Nov 2026 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794131327;
	bh=8KfIk9vjo8uXOqgYLh3P2w5Vaps3rjDMe+FupdC0n58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=moFdxge88LjH2R/Dmt6Z4r+qjH1ih0HxyGNERehbi6D2on0xWSb1dicPMpgqJxHM1
	 PcE3Ag+SBKBcm2G0xID6qkzBRawzLVTeYJk5t3jVjDvZ5Lnz//OS5NBp5ZqoZVuiOu
	 ZwWWh4RtRXTvrQd9Fybaf2qOOlcIZiDAR6sy0nfd0DIxICP32C4aQzmyhZYRQLk0Vs
	 N7C9CTC2Gk6BFLFdgB5wWa7I3su0mP/p2DJFGkwgQdDHtkAdFgol9H9QTg4IJ7Skw7
	 KGbpflzfI2kWhz13Pf+nneSrwpYL1E50K6YiD2kpuH1LAWZ0p1EPZNZWWCXURyhqYH
	 THoqTzIlCOW2Q==
Message-ID: <sashiko-outbox-203671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] hwmon: sy7636a: read the temperature only while
 the rails are on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261108093602.329554-5-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
 <20261108093602.329554-5-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 09:48:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The driver enables VCOM at probe, which keeps the panel's high voltage
> rails on for good. Read the temperature only while the rails are on, when
> the chip samples it, and return -ENODATA otherwise. Read power good with
> it in one transfer, so the value can not be from before the first sample
> or after the rails went off. Register it under the chip name, as the
> TPS65185 and FP9931 drivers do.
>=20
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108093602.3295=
54-1-pmazzini@gmail.com?part=3D4

