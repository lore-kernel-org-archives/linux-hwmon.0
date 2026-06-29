Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24DD35DA40
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 23:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782775172; cv=none; b=Na6Z4duOIdPh2TaTEKRHI9ru4AbFH3gg1yWN1jns2hDbNS1CJsjfSOpjjqgYDy0vIQuHUCu2KA/hvuHEeGyuKWd5+TmLhVXVPp2mDAldF0cUPdeT6ydyYk3Xl+LK+oymsnjCaE0+nkYZB5aNt4mpdWjbdIhhCl/eju4n7BHogGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782775172; c=relaxed/simple;
	bh=/LaboKW/6/mWkd1GFF3wi+qAwbUGRARw7UnWmJjLhkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MyLc7W8T7mB8rP+ZmB5HkphciGGO44xAcQAckYYlPtGBRHsImRzC7j17SBGUfg+t4HuDS1gWh3zc85vFAs/iHQeun5tA+7KAH7M5xr+hqj26dprfsrmQy4QeC/6W3ChrOlBQg2msxEg67Vs1h1DaIwfiUlZUUHR9iFkeSxL9Xks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iF2VZat8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iF2VZat8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F1C1F000E9;
	Mon, 29 Jun 2026 23:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782775171;
	bh=/LaboKW/6/mWkd1GFF3wi+qAwbUGRARw7UnWmJjLhkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iF2VZat8CFcM35SBnbPsSHBNWSPUbfsCsFgfHWUFEt9kWzIjfDDGeqUxL9BOKC5Yn
	 tBWd5zZrq6JLyEoiLuDETM+b7MueMvnN0rvw9PqTPP7QLXcCdHE6oXEywXY71sxM6Q
	 M8e8hCxKz5Ks7E5jQeBKRxZBFDW+nKOfj3ENYDX2CyoWBFn6ylelBS7FmEznETXUah
	 h+4vVETeobd+d5T8eN4QgfELOTP5XXvbYR8epPonEEEMH3dwckj2KbQNcmp3ni+aUC
	 sLk9M33AHz14jn2/25+XgO/TY1JYgH0eileJmRJQ4xm8ll4BqUlzMYQWl2WUQCLXvo
	 XkXw2aT8GenYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Fix passing events to regulator core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629231434.2011247-1-linux@roeck-us.net>
References: <20260629231434.2011247-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 23:19:31 +0000
Message-Id: <20260629231931.61F1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Sashiko reports:
>=20
> Commit 754bd2b4a084 ("hwmon: (pmbus/core) Protect regulator operations wi=
th
> mutex") introduced a worker to batch regulator events over time using
> atomic_or(). The delayed worker then passes the combined bitmask unmodifi=
ed
> to regulator_notifier_call_chain().
>=20
> The core regulator subsystem's regulator_handle_critical() function
> evaluates the event parameter using a strict switch statement. If
> multiple distinct faults occur before the worker runs (e.g.,
> REGULATOR_EVENT_UNDER_VOLTAGE | REGULATOR_EVENT_OVER_CURRENT), the combin=
ed
> bitmask fails to match any case. This leaves the reason as NULL and
> completely bypasses the critical hw_protection_trigger().
>=20
> Fix the problem by passing events bit by bit to the regulator event
> handler.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 754bd2b4a084 ("hwmon: (pmbus/core) Protect regulator operations wi=
th mutex")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629231434.2011=
247-1-linux@roeck-us.net?part=3D1

