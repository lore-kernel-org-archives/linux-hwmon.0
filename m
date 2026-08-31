Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5426CE2C
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 01:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141118; cv=none; b=JINLERnWZMgJCw7zmu/q7WzYOvwK0G8PbVhU4Zy+PY4Id/3pXX78bFpsaomRyWeNUe+BE9RGfbWK/bKt5wKILROYITnMY4Ns8p79TXnI5vQSKMVP7+ZhQbtP8gsgTkHHE+TpIxnynQbG9iODJEVATZXnnySGjwCYzmgjEX0MNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141118; c=relaxed/simple;
	bh=ZWSJupnzM1gcZlZgJSCtVk4KTW8Gq1H8XKk47yVkG0g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e/Syl5jEk6Yi3EKX5+elncBeeHNvwqJuYlrdzpPbaDL6tbqof1NJhuXjc7BoBhKuLuD83FNCdCB9apdx47CanFFcHoNELATNCxrnKHrJSadEtE91pYH7m9JHUqjxJMWesEbqveuGMByVbo6vfMhymq2Oji7X1AoDYyKzL79N/wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0aUR0mZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0aUR0mZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D36C1F000E9;
	Mon, 31 Aug 2026 01:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788141117;
	bh=g/xNTvAJKvMde6KX3VJfGruSgZig85fZtqOdqFbJmvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d0aUR0mZUg0MzFGcwHHqMlW0fMxr1t4YJP0pANDlE1Kuh6k5FnOJWn6ORvxTlxpNH
	 FrIimFawPD/vSsYu+xqsXqsNj/R/x3kix0i0+UCu1JHMAdLjFiivA0rAG/HiBfA6dN
	 v3eNfgY2C6U1AOuykbX1jTQDW43T8dtcOd2yj0BtAdrOPa+iqNC9x9NpwZVBoKAuQv
	 QaxSTQsYyZGyDVXuHVBeL0hp1hXRPVy5lBhRYdtOSmn/dqqhnVnGuq5iuFyVRoJPHH
	 vK4czrwNbAWPNUwqC6+LpqZQOLDcFwOIko6mpSp9Q4XF8Cv4FcEBYXbbtk3H20JbEx
	 SHWpciAekj+DQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (corsair-cpro) Create debugfs entries after
 hwmon registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linmao Li" <lilinmao@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831014509.3352442-1-lilinmao@kylinos.cn>
References: <20260831014509.3352442-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 01:51:56 +0000
Message-Id: <20260831015157.1D36C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> ccp_debugfs_init() registers debugfs files whose private data is the devm
> allocated ccp.  It runs before hwmon_device_register_with_info(), so when
> that registration fails, ccp_probe() returns with the files still in
> place.  The HID core then frees ccp, and ccp_remove() is not called for a
> failed probe, so nothing removes them later either.  Reading one of the
> files dereferences the freed pointer.
>=20
> Create the debugfs entries only after the hwmon device has been
> registered, so no failing path can leave them behind.
>=20
> The two version queries stay where they are.  They send USB commands
> without holding ccp->mutex, which is only safe as long as nothing else
> can call send_usb_cmd(); once the hwmon device is registered its
> callbacks can do so concurrently.  Only the debugfs creation moves, and
> it is told which queries succeeded.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@s=
mtp.kernel.org/
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and bootloader i=
nformation")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831014509.3352=
442-1-lilinmao@kylinos.cn?part=3D1

