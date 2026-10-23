Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792730606;
	b=UP5E5g9SPXt5n5ve5mBg4sgm+jCfDSCdZgfCNe9Vmmiua+C8ZeON04Bze7Z4ID5C5CEF
	 3dAC7IkpFxMwrqJjwCx91i3oeAAQYWy5HcR7j8mdS357FFpPR7GvzWFL7qFg2VawgCq9T
	 YUh7b1sX7MqpjgEtNQqdcdycR6/1qBpHgV4I7aX91FqKzhDoo4OSRqwrA2xfUlGwZIwam
	 UUHR3sm76Y76p9B2eu8OBZq9Ee/dv8WxlGk7TaZSFUFXE+geE92B21+bao8qiLa+Aq8q6
	 auEn8U83Ou4sk+KCkAm/0lnp6SXofS6Yg9h1jm6Obv806FyxnGCX/Z5jWVpK5IcEhNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792730606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sqNc/oKKX8cexxAdQmSpvzU0fit/GVwnwfTpo9fj96U=;
	b=5W+NwJMESZ77Nqqjn2/p7DyV08e2WtIgxM1j798t9G6jwUaPX6s8qhIUHQ5n4TZQu68+
	 WTknhWvKuSI1ZtaB45vNpuQEaHArgB0AtOskr5vri4Wzxbl82GmfrbAf+zN8bmpsaXVmr
	 ZDrUMIkssPxDK4MkHai31poOxTbkgO/zufbsnM+Ay4OoJhZLHUELO51yNB99tnV1p5Xr4
	 iggpAlLWNo8Td52jTdxCOl9AXyTVcddU32j4JtKIvL3Dr+1OZBC2rK8OXEq6PrZzM89no
	 hXYxTn0GeJvea3spZ4uCE7dD5CaNdCfbStUW69N1pD+z9IihjcGcTFBDFwDkOJAh4+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNEoFCIp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF12606A319
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 04:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNEoFCIp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF1F1F01825;
	Fri, 23 Oct 2026 04:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792730605;
	bh=sqNc/oKKX8cexxAdQmSpvzU0fit/GVwnwfTpo9fj96U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SNEoFCIp8if1kqFdZ4UwWLxRH/+P42GFGwJ/JT0B7cmVJSeDWBxPhp2ute8UtIRJb
	 EiD+eXVeUQf/aXb88knukW7RBceiNvMDCnB2iBjnXqQh6vIaQzNax9yNQ6IVBQYeNh
	 bZzik+M8gXPwO1E+N8rzbKfUsZmykQQTkMSCXzHb88Vls2XrVkM5KczjFRrjYBGSMp
	 hd9TQaYFPhfkCDLLvoLaxkV/XeWyWFhnAKOc/t3PXO2uaTppmubAHg5SzHbbn2Qqwq
	 CQDukLJabbvVFcqYWb6js3I9XAioOo66U0jHvGJz0kdI5uo8x71YCEU3pQBgE5/o9Q
	 yFUzNZpNmxTqQ==
Message-ID: <sashiko-outbox-182292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5.10, 5.15, 6.1] hwmon: (drivetemp) Fix driver producing
 garbage data when SCSI errors occur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nobuhiro Iwamatsu" <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <1792730299-21490-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
References: <1792730299-21490-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 04:43:25 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Daniil Stas <daniil.stas@posteo.net>
>=20
> commit 82163d63ae7a4c36142cd252388737205bb7e4b9 upstream.
>=20
> scsi_execute_cmd() function can return both negative (linux codes) and
> positive (scsi_cmnd result field) error codes.
>=20
> Currently the driver just passes error codes of scsi_execute_cmd() to
> hwmon core, which is incorrect because hwmon only checks for negative
> error codes. This leads to hwmon reporting uninitialized data to
> userspace in case of SCSI errors (for example if the disk drive was
> disconnected).
>=20
> This patch checks scsi_execute_cmd() output and returns -EIO if it's
> error code is positive.
> [ ... ]
> Cc: linux-hwmon@vger.kernel.org
> Link: https://lore.kernel.org/r/20250105213618.531691-1-daniil.stas@poste=
o.net
> [groeck: Avoid inline variable declaration for portability]
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nobuhiro Iwamatsu (CIP) <nobuhiro.iwamatsu.x90@mail.toshib=
a>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1792730299-21490-1-=
git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba?part=3D1

