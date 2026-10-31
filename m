Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465939;
	b=3OP6tuJskjmaLhuVKHwCcAtfU2xUdnAg8zZfRP0GmRSRdwwHEYmGKYKTMXuJFAjaBJpf
	 v1VpZ+FUPNuTa+FWJ5ky5MAfQCBWOfntdTlXWR7ME+vAWuZ4XCkUVZA/M30a5NW/ikeeX
	 Fyh9SETMs4LONirn0IpOcdz+amDCbgaDetf1/x+HSYCpiefT+BB7KJQ+N1aXZFMlZMki0
	 +hRAY4PUP6IypIDV8IYM2FUKTrUHUX/192z3kcbLfaNZSEJs0xqcU+DAPZqmP4rFcu627
	 NktTila61P1HZ2HLk9ko7OxfQAF2EFtXxs9jU7ohf9Y/mcPouDQN35xdPZLoISciVIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465939;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XcPW49+iZ1rXA4SNOkfM+3J0r4fBorZj9fZZrh/ebvU=;
	b=jlqrqLcp+qNTBC3aXHEi4+UBGHcpPyxwuda6UHVSnjV6A9ebWD3wlapGaNjyiNFSIYu/
	 dI23Tq6dSqJPAtYE+o11SqJiNkUHjZFZNdFEBPfcC1+x+M2RArjowW6fxAZwJK8XQ2acS
	 3kXOxWJ7YGA/nb3HyiSS0Hc/8ErWnCNuA8virjF38NSojmWG8FIPgkAajTvCGa1zW4+ba
	 Vw0BG3AWV/XiYM9Z0hP5muf5yZq84cYonBnbmBXRc8AWuEUcOrLCvhb0LCgHfSnts3U2O
	 LcRF+f82ikH6UPDHQKV8dS9k2VcfiOdSQdQRJpovjrOLFYVxir/P1IAuqGDSmBD3f/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0QiVj1g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE94C606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0QiVj1g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9961F000C1;
	Sat, 31 Oct 2026 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793465938;
	bh=XcPW49+iZ1rXA4SNOkfM+3J0r4fBorZj9fZZrh/ebvU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=J0QiVj1gfcsoBSotyPSvR8tUtfRiomNja90SWmn2Ty6b3HuFh9Z/463MpbFkQu4Oo
	 tkqfpOLy6h8E31GNFp2lTE8i86lPZOLpRaIsCBxqXpYxfvdMf2f3YNfb2l74YZzFMw
	 zEIrVhI9iIY/PBID5BbvMyUA7YzGhzZtD1M36IpVdW2baU95X4MlOCN2usN6wvWQHX
	 wEN+F5cjL86+CSjEK/CqAFFftjgdYMbBRy2EH9dYIjo4YBRpavatISLeQBph6s+N+A
	 r9z/r5jcSvSKmG8CYUqhL0TYUe2osiD0uFCmltQdHkA+d6gogsvHUMwvS3TYJ6Zaqs
	 s4trX7c6G657w==
Message-ID: <sashiko-outbox-192052@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (acpi_power_meter) Fix missing locking in
 sysfs show callbacks and resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031165447.1771473-2-linux@roeck-us.net>
References: <20261031165447.1771473-1-linux@roeck-us.net>
 <20261031165447.1771473-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 16:58:57 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> During system resume, acpi_power_meter_resume() calls free_capabilities()
> and read_capabilities() without acquiring resource->lock. Because ACPI
> notifications run on the non-freezable kacpi_notify_wq workqueue, a
> concurrent METER_NOTIFY_CONFIG notification during resume can race with
> acpi_power_meter_resume() and trigger a double-free or use-after-free on
> the model_number, serial_number, and oem_info strings as well as
> concurrently overwrite resource->caps. When CONFIG_SUSPEND_FREEZER is
> disabled, concurrent sysfs readers can also dereference the freed
> capability strings mid-update.
>=20
> In addition, none of the extra sysfs attribute show callbacks acquire
> res->lock:
> - power1_average_min_show() and power1_average_max_show() read the 64-bit
>   res->trip[] entries twice without locking while set_trip() modifies
>   them under res->lock (including temporarily storing a candidate value
> [ ... ]
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: de584afa5e18 ("hwmon driver for ACPI 4.0 power meters")
> Fixes: 16746ce8adfe ("hwmon: (acpi_power_meter) Replace the deprecated hw=
mon_device_register")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031165447.1771=
473-1-linux@roeck-us.net?part=3D1

