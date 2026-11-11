Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380422;
	b=o2h+evDYTO4fK7ZF++rNiF++M8+zmRkF6M3OOFPynG059l7bABMx4hTmbzhwiEvUoT+1
	 IVrsj06a5clELjNRlnVpwhArbrIDR5YavI4PhB2xkL0p5UD4wG/1x7dVWpHVwoOh7MP5W
	 WmCTjWR5ejT7cRurLNXgl5Zz+CRR4Opoy9aaJi/qPhGoLhl4mYSB49rHqcJngx/gjAN42
	 0c1IRJCaH0RmhH7ciE8Ln+4CqJ9GJZ8VZalKJkGk0Il45xXGQRPz+ZCufyTUju5w55RXI
	 j+u2fMhegsP/DqHJBEU8wME4fQLEDMsnGHsr37kB85CRYBngJsJ+bTP4DmtvSy3Ubcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380422;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yfolaAytlfaIBqehkRfLmQr3aM4GAylDoiKsUKyAEOM=;
	b=G25XX5RfALwyS+Px7yfCbWqg9SHCn3WdhkOkhqRU6pR5chgt3zPclGmEdvl36D6RETxI
	 rXvl6HlWAzZUuMQjuWQRuPFqN1QPp9z/4CDtqs9d/qmQnguQXOb3lQNN2tfeKC1jCfwAE
	 XFhof3/FSdKzlrqSnu2syjIaPOrxIYMjxcENwXdwDV26LVyv7tpkNx5C69k9Ak+B2hMqj
	 WNbtVri8JYvkoXpQn1o1cvjqiMS5zZtVy6rBduPsaPmKTeugnPwXiP4NEaRyyV3dsWjkt
	 wihvzUx3GoGO2iUG7yak0lHdlPnznMv/36ozPoB5s34EFc5sHvxZF/7vTqguUzD3/mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtsF4EDR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB7606A334
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtsF4EDR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF33E1F00A05;
	Wed, 11 Nov 2026 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380422;
	bh=yfolaAytlfaIBqehkRfLmQr3aM4GAylDoiKsUKyAEOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CtsF4EDRA1G86AJsQw/A3bjx7C/yGmyAXPnh/xWzi8u3h59Q/kr7Cmw4EUd87mfXH
	 wVoI5y/zESqk5QbgIv+bshsqZEsIfw9HUCEqutECyYsDGjCaneS+PNoK0eO9wis/2G
	 fJ1yLQ55Ip/OsB4TlVDOBKhQHkTyMYP2Y94/rs9a9zxaFJwH2lJQhLydszfOy825JB
	 YwQlUCLfG5P0uWIkNQMVwOpR2ZQ72Nense9WZqzobePBKbNFwySejvjmX+myjcw7d5
	 +w+/Hw8bVImOnU49HhFeZDldoSqcbJg0evrq+YDuRn3ZED6IidmnkisPpulT2/axc2
	 h/u9GzaOHKivg==
Message-ID: <sashiko-outbox-208480@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Clamp fan control times before
 rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065238.17669-1-zhujun2@cmss.chinamobile.com>
References: <20261111065238.17669-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:00:21 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The fan time stores pass an unsigned long to step_time_to_reg(), which
> takes unsigned int. Large values can be truncated or overflow when the
> rounding adjustment is added. For example, 4294967295 ms selects
> register 1 instead of 255.
>=20
> Keep the input as unsigned long and bound it to the maximum duration
> before applying the PWM or DC mode conversion.
>=20
> Fixes: 08c79950a047 ("hwmon: Add fan speed control features to w83627ehf")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065238.1766=
9-1-zhujun2@cmss.chinamobile.com?part=3D1

