Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189819;
	b=B1GGGU8F+GHa6mh3e3cVBxAgQdvK+frdyHDs0SXd1cFWlVC3gsAmV4XAU8980JevW0m+
	 2f8lboEErz3YBUewEgZ0/rSjT3ufw3OFjQFT1a5zvPzGMpctQ5pn4wnRcj9xLx8jtZKUX
	 N7lKaF2mCTNiHLsTyxIISacubfK9vVEh191pTfskrEIXUY3Adm9AmH6uEddh2xKMEzaRI
	 ruXKmHH9c+f4e7UfFyHpZeQsdsUW22xK0J+IkEfQuymf9y8lGXelOOjqFeZ+5USFpFONt
	 eVMEPDoSo5OuCMOa9zUBK8uf5YbXvW77u9cf9uGf5XgsvrLMfMC4e7T4G1f0mQwcngA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189819;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CdWHwYNMtRaxqR4VCusnB1YrE6E9ceOgU4X/dZNWU7o=;
	b=ymKppQn7CX+QK05KSqLLhw3t6UjuHqxfXS54d40WJFPi3hxH5NLU3uj3RvbhyyUsUPf7
	 mGj3PRyika2qRn/27MQCwICAZrMftskHshvwq90TJCvgLFFcee0gvoLeM1GCB4bX3bq0O
	 kf1ZPjc4w1YT9Av2OQarJXurJLoue7XcMiqLLZzgdbDhMAzCDRh17WhRo2cWlbyr0a7tv
	 VGl713ITZyON+rO+t5ijm5Y+doNSXaHH9UXaqMLwZdvP8kdXRvBEqOASkKIJzuc9JQAkW
	 mM0aSZtyxvIY8CG2+yoTDXPeBE2u8Fj4YU8A3t49pHjOH5MAITCPElGeZvIA1a2MTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRkLulWl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A59606A325
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 02:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRkLulWl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971271F008A5;
	Mon,  9 Nov 2026 02:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794189818;
	bh=CdWHwYNMtRaxqR4VCusnB1YrE6E9ceOgU4X/dZNWU7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GRkLulWlu1RtroMyKIJS4GZnYybNGAj1siTv6ogGG8ZbTzy7Zs7Tf5fdDl0DzOmMO
	 gv/aGe/Af3lTYWF0MdPAQS0lclOKJjidECoMix5dyVIBt4XryyXnpuV24POQijGsCz
	 25u2FEQFIiKUS3HlhQkNjQvrgpaj84OD0KxVKvouHY8sTVdAQ4JfD/+Un12Y7ypGLM
	 ddY7c0FS5h71T8BCkakVfjQ1cIgiKG1R3lycD5Gcp6XJPRQAxLlSGNxkI8ehxyBvLG
	 ffWy2AR1918+G936wiXRF8cuiE/hhbsDGZBDGNHbvcNw7rvzEfOe6BmS9xr9GXGiP9
	 vE9bsbl4aheKg==
Message-ID: <sashiko-outbox-204343@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Report the fan curves of MSI boards
 with NCT6687D-R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109015759.24284-1-tomasz@bojanowski.me>
References: <20261109015759.24284-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 02:03:38 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> In automatic mode, the fans of MSI boards with an NCT6687D-R (customer
> ID 0x20d) follow the fan curve configured in the BIOS setup. Report
> these curves with the standard pwmN_auto_point[1-7]_temp,
> pwmN_auto_point[1-7]_pwm and pwmN_auto_channels_temp attributes,
> so that users can see what automatic mode does.
>=20
> The register layout comes from reverse engineering of the vendor's
> Windows software and was confirmed by reading the EC of an MSI MAG
> B850M MORTAR WIFI (MS-7E61, BIOS 1.A68, EC firmware build 03/10/25):
> for all six controlled fans, the curves match the settings in the BIOS
> setup, also after changing them and after a power cycle. Other boards
> with customer ID 0x20d have not been checked.
>=20
> The curve of fan channel n is stored at 0xb00 + 0x18 * n: seven
> temperatures in degrees Celsius, followed by seven outputs of two bytes
> [ ... ]
> out-of-tree module: all attributes show the values read from the EC
> with a separate read-only tool, and pwm4, which does not support fan
> control, gets no fan curve attributes.
>=20
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109015759.2428=
4-1-tomasz@bojanowski.me?part=3D1

