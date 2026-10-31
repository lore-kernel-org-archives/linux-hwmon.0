Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793486106;
	b=IM5hg5viQ4tSNoaPS4bAYjHpJLru/6a0SzUbLaZ3qRpR3cBJD8jy2wc1j8fGgMcXv78N
	 0q+QO3B8LjVD8iWHnt3rlD05IQWyDR98C8yL7YSK/nL0a8ePrYotwet+Nz+lQgbw5wauE
	 lZDerg5rqs9QOTVrKhzDLwyMFOszr431wzLzf1/XSzkO3to0DhoPF5SQXaKosKqxkd2b1
	 FCE32cPRMNC6Y7tY5cUsoM62vaDweLyTvPVnYHJqO/t6Vs2MoumXfAIKipuU9cehGH3Jq
	 gbS2c2SXV8OQAO0B8qBEdn/0vV9SVPYxuVSIiR32mlEerEbCHigL5D2n4Twmrir49Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793486106;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6fTCjJhzftkUJi9Rj6zpae+QE+SjCave0hb7Pn5kqV0=;
	b=IXMpKkOk+T8wvIjlnGBuafWzgHJ0QQ/R96T776+LnM1EYjVcLGz24ZlcAtxEzLFPIs9t
	 B80iBFYWEqsQqj7bimTzPFoNl8PEfjcWR5/Y1HAjCTaHEU+VM+QHzm31sTe5Qq55Z+QiK
	 GWcxlYUvfbV4hBSpX27OBlgPbkJroe6vTFskiDwizQz0fvac0kALEt3HQuIeeo0CU0zWs
	 oMZ2P3GuSFG9srPbvsiY6+nTgqGcNdApkan96LQPJjWf1/DzkmxZ79bbUQfNVNE8d9nWD
	 z2yuAh+PGMWFP8F4PqAYxIdCl+vKr3myzpPiwaIySKvn4pSyOaRcE70c+8enG7pYxXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Sgar/oe2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34D3606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sgar/oe2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BD81F000C1;
	Sat, 31 Oct 2026 22:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793486105;
	bh=6fTCjJhzftkUJi9Rj6zpae+QE+SjCave0hb7Pn5kqV0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Sgar/oe2E6X20CNnuCdhI1kjSvfEaWd93DLw67LTVxGEow9yy66vcTpr2hBvRlhdm
	 7ZY6bb4licwqQi6CgU3n46NE2Ye1TPtmnuJ43+UOo5j4+/+PD3lCX9Nyuabr0PjNv5
	 s5qxHfvrv/LEDGN7vatX47CaPbsblGyi5Uf0a/xYU366MgrF3ZWT1sg+6QIoVnmwbi
	 OB8YrLxUNuegEV/CmQitjgPXliw7Tj6ASD2gHlRkW4zdv5q8BzEl3NftNYjLuytgOU
	 rYJFdcbdWtAzNvE7vKtVVwOxVn74mVPCYAeI731CLD2c2yVDZSZXpWUNY63vCwXSpP
	 x0EkxvJXcBNZg==
Message-ID: <sashiko-outbox-192207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (gigabyte_waterforce) Protect status report
 data with spinlock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, "Hardware Monitoring" <linux-hwmon@vger.kernel.org>
In-Reply-To: <20261031223131.1855967-2-linux@roeck-us.net>
References: <20261031223131.1855967-1-linux@roeck-us.net>
 <20261031223131.1855967-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 22:35:04 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> waterforce_raw_event() updates temp_input, speed_input, duty_input, and
> the updated timestamp without holding priv->status_report_request_lock
> (and updates priv->updated after complete_all()), while
> waterforce_get_status() and waterforce_read() read those fields without
> synchronization.
>=20
> Because HID_CONNECT_HIDRAW is enabled, or when an interrupted wait leaves
> a requested report in flight, waterforce_raw_event() can execute
> concurrently with sysfs reads. Under the Linux kernel memory model this
> constitutes a data race, lacks memory ordering between priv->updated and
> the cached sensor fields on weakly ordered architectures, and allows a
> reader woken by complete_all() to re-enter waterforce_get_status() before
> priv->updated is refreshed.
>=20
> Extend priv->status_report_request_lock to cover updating the sensor
> values and priv->updated in waterforce_raw_event(), checking priv->updated
> in waterforce_get_status(), and reading the cached sensor values in
> waterforce_read().
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 42ac68e3d4ba ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO=
 coolers")
> Cc: Aleksa Savic <savicaleksa83@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031223131.1855=
967-1-linux@roeck-us.net?part=3D2

