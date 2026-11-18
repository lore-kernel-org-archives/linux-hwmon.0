Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974927;
	b=IFbztpJJRI/4Kxk+9AiEysn2nNtGFTI09mUwI7qUt/b2aQCyg88xsEy3cGBhl5BZU4lU
	 TFtXHtRlKQJlf9SCwXGZxFHtplqqvPGGCiRS9SMhT7fduAF9wkB8ZslMHMWv7hD9CC8yD
	 EHhbYexrWo7Mf5mguQ+CvyTiWvho02IN2ZHOiE3kZvz6C9QSFKFlGXNadKxIUw+JzH8Ju
	 lGkcwGg87rym5qxmoJkhrUtWAt/e0Uc1nWhp1t0WE6u3x0C8nkUgnowE6RiKHsho4uxfz
	 Fj8m+PVq7FKh/6W7PC6Mqx+JFF/lzh9YoMJnALFkj96rPTNXqUaZCgBecp4pyJs4TdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974927;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zFKTrFkuftWyJF+RRo/3hKmsEtqv/AIH2A7eQQ36veQ=;
	b=JxWxaNl8HzPRy9Q9OPTUpJfIXZAmvsdPPgrp2JsS/rJkTEAVAi7mRqdYefZvY5DeY8Qm
	 mGQjbsBjo14Xw4oQOsUIYAUyS60fn6P08FiWC2oQMu63dPVezQSzOr/Lm1lJP8hXtd/xk
	 SnwkRK9cPBW29PxkYUUKNtvyP9lUZLsDAD63lWFo+0cUdYY6/SDrlh8RH3QIYYlhfD/G1
	 PJ9fhD4sW36Ay1e6UxTyt3dKT0xuPVxdXWaxTgTDkGZDKe8kwE2R55n12KZV0Lo8k9e5U
	 XfrD6WQzMsiD3JRduGkUnSvSnOZoxcj/Hnrd46ng95skQXn3ImKDJvFE7McpyvRZCgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klqlSfEp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90EC606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 04:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klqlSfEp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CD91F000C6;
	Wed, 18 Nov 2026 04:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794974927;
	bh=zFKTrFkuftWyJF+RRo/3hKmsEtqv/AIH2A7eQQ36veQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=klqlSfEpVm8T+M1u7os4cET1GMtchFNRs37BbGeGg8BOx6cB56rpU2WDUsFbfm6KO
	 f58ozPi/3yQ3FIkvkY5FicWaxW3rD2EgKtvGsmQi//qEGtvYziUo/S5ozxPmS7jaoy
	 LzPePHVpnn99+fku0+2TvvTPF6z+gSBgpOU8YG5kMRFnilTMRky0K8gxtw+KyAmXOf
	 hcmiU2oUD8ldtI6PH7FAjPzE32NKqX8pYwH/UKWcNjHJt4FC40PbaGG29Ae0dNERfg
	 ft5jPJDLukfpAiWYOEJOQ+YXfN/n0/z+W0UwXLZld5XmARMoTGb890DC7exoUy/2J1
	 Ild9aaGHPOLIQ==
Message-ID: <sashiko-outbox-220068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Reject out-of-range pwm values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118040417.19049-1-rosenp@gmail.com>
References: <20261118040417.19049-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 04:08:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> dell_smm_write() scales the value written to pwmN with
>=20
> 	DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult)
>=20
> before clamping the result to the valid fan states. The rounding adds
> i8k_pwm_mult / 2 to val first, which overflows for values near
> LONG_MAX and wraps to a large negative number. That is then clamped to
> 0, so writing a huge value turns the fan off instead of running it at
> the highest speed. With the default fan_max of 2, writing any value
> from LONG_MAX - 63 up to LONG_MAX selects fan state 0.
>=20
> The pwm range is well defined, so return -EINVAL for values outside
> 0 to 255, as is the convention for pwm attributes.
>=20
> Fixes: e7f5f275c62a ("i8k: Implement hwmon based fan speed control")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118040417.1904=
9-1-rosenp@gmail.com?part=3D1

