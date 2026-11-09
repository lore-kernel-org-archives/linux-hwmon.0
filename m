Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263980;
	b=2OyLtOY6R5hdX2GJ3ETaKH00d2Y6p2SHnvrJzmJkIeFwcVgV0Lg19bg92B6mTsiFSMgT
	 9o1vd3r1hp6/3GhCcBkZ4VKNRFOmFJ3qP0qoZP+RqTe/p1mFCa6lsmpSVbNCy7QM3+kpr
	 4CBAp8tJFE0vvo5drkjeAWl1FiP8xpzjBwT7YA2p5JUITWi8GwLwH0VzwKlBa4Y3RG89Q
	 /eKq6fdq2+AZZOgKEUadU+9REQOV95QfxCJh8vnviHbYyLay9fPHlYCmkaktEUGX9BaOY
	 wcwtxcjmtrH1sd94LvX+u8HMJeB5DYGt1lNr4mZtRi3ooYWjcLsnorlzxaFuzlnQ/pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263980;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HDpigyZUn4YRacgZmaQ2bBuh0BKpM32XOcVlDRLSmuk=;
	b=l3r0+yBiAFGtwV3p+rYlHeJ/OmoaCk77siqf4pIVgvowRmbGPPAADT5ojaeL9giODhb7
	 rM3R/BJRkhpZZEOc02f+Rpw2TZv3BHjKYoUoZN7KivTyRHjTRIFgOsxOO5fvevpRzwIzs
	 +eYWEgKFLEw/FsdZtiWWbyMSj9ew1uytLhBv5kA0yzm004qbgVZrb1D0ezVdFmQt1blp0
	 svzefTLdpI08VvKxt6OUEodt0iwNgGiPuuVUu2crMLlBkeXyTaEXL1O4WsfQqz7179Bae
	 dTcc0YfaqnqFVBMqcVZRYaZ6h2pelWQ/1G/VHzh4qlOEKQSHZa7bjQYpS/a645ppZnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AR8mPzNp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FD460A3817
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AR8mPzNp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59941F008A7;
	Mon,  9 Nov 2026 22:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263979;
	bh=HDpigyZUn4YRacgZmaQ2bBuh0BKpM32XOcVlDRLSmuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AR8mPzNp5DT8Azkj/TmNcgyCQSHxT8PjE/J6pwdmh6yiNjIksDSJfw6a4L7po3Z7D
	 v5yHwEPS1H7+63PETsvLTSHLMLYcMtn+m0oM32GzHKk+ylrPuoUIU0NaTx2yE/XJZM
	 WzUxOKrfRN8TAW9+6w1VU9+fJO/krhOi0ddQ4TpKajoMbpoZAnVcXZTTK71Gi26LtZ
	 KmTNVzbIDSv0DUZCBpl/Bd3XId6SRxUh2Q+ZWZCDVaf9p9ZVDjdB5afEA7O6mxDAiu
	 LUiZslqorEnygV5YJodTwz49XBMBetmGNi0R8GTcnO1NohU/qzdRDz9m40mjOrxLwI
	 WkcjJU8B6TzmA==
Message-ID: <sashiko-outbox-205758@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (nct6683) Make the fan curves of NCT6687D-R
 writable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109223442.509238-3-tomasz@bojanowski.me>
References: <20261109223442.509238-1-tomasz@bojanowski.me>
 <20261109223442.509238-3-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:39:39 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Allow writing pwmN_auto_point[1-7]_temp and pwmN_auto_point[1-7]_pwm in
> manual and in automatic mode. The points are writable if, when the driver
> is loaded, the temperatures and the duty cycles of the curve do not
> decrease and the temperatures are at most 127 degrees Celsius. The EC
> firmware is not documented and does not take a curve whose duty cycles
> decrease, so only curves like those set by the BIOS are written. The
> limit of 127 degrees Celsius reads the same whether the EC treats the
> temperature registers as signed or unsigned.
>=20
> Temperatures and duty cycles are clamped to those of the adjacent points,
> temperatures also to 0-127 degrees Celsius and duty cycles to 0-255. The
> whole curve is written in one configuration phase and read back, to check
> that the EC uses it as written. If that fails while the EC responds, the
> previous curve is written again.
>=20
> The BIOS may restore its own settings when resuming from suspend, so
> restore the curves written through sysfs on resume, before manual mode.
>=20
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61) with pwm16: writing and
> clamping of curve points, the written curve after suspend to RAM, and
> manual mode after resume.
>=20
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109223442.5092=
38-1-tomasz@bojanowski.me?part=3D2

