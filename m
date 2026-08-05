Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3252F7EFF;
	Wed,  5 Aug 2026 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936808; cv=none; b=c+0inlbYpxVrLb0Hfbn5IY24oKnXZyhgZYPhkkQEKrK+xcdjWZWoLQYIGdJwGO6Qk0BXg7naem+7HgEOaVNo4TjInJ7BbZdTSl2Qgwzv3S3CLsZ8DoPkoodoZl4t+Nox/oABfYq+h6XRGoAgVgkoZeSuYZga/Wpjv2cue1mBTPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936808; c=relaxed/simple;
	bh=69yf0zdAnKK9f7A/vUKaLcKg4TX8m5jHLbiu5Amisdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TaZy8GKmhENMFUA8cL5wmxpaKRS9d8K6AWS70AHoNMDJJUAoa2HcD0J5ltcfbUy8uRMbYgZOs5iIinYrzypxrAd969FtyUIywf7Nzq4YpDkbCgOpXAEc+vLhDm9E61OBjBZhRq/CvWUGTei+didnXoNigUqnbAkufs2mN2lIPtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1AQzhPa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1AQzhPa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABB81F000E9;
	Wed,  5 Aug 2026 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785936807;
	bh=JvOWEEp0Y8F1/GoT9ZmrQPVhEMWGmtbpF1mDPHwa8Ws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1AQzhPaFs4TkZ+MNSP0kSzln0BOWl1+qXNT1DpgK8gpDMo/p5V8XoF2IjIFEzY7x
	 2vE/wGtxFzdMXH/APWkCxCLZm0LEfBQp8tf4siCB1PWCcJL2B7Ag/y+QXtWDoeyIa1
	 BTa2EByqZy6JoC7wT7VGhUF2kh5L1yb9LyBKdhYu28iR5p+Zorlx/+wo0JNh5Xoxel
	 nY83pbllzw4oOiyiP8eMJKs6p3TfAp5KYLVaP8uTs1iiQsKd23MMMDj9LJKm/vDemZ
	 cPt/3gp8oKJxcomjVq4YVx+DzE3nEn3eA2HwGsnjVv61d6YzVK3N0mkyLapXMj7GIv
	 b1E05L+XpnArA==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v6 3/4] hwmon: (adt7470) Expose fan control
 via PWM framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805-adt7470_thermalzone-v6-3-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-3-5605a5f95467@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:33:26 +0000
Message-Id: <20260805133326.CABB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ADT7470 features four PWM outputs designed to control fans.
> Previously, these were only accessible through the legacy hwmon
> sysfs interface.
>=20
> Expose the ADT7470 fan control lines through the generic PWM framework.
> This allows generic PWM consumers described in Device Tree, such as
> "pwm-fan", to use the device through the "#pwm-cells" property.  This is
> particularly necessary for boards where the ADT7470 external temperature
> sensors are not populated and the chip is used strictly as a fan
> controller (e.g., Edgecore ECS-2100-52T switches). In such setups,
> delegating control to the generic PWM subsystem allows the kernel's
> thermal framework to manage the fans based on unrelated temperature
> zones, such as internal SoC sensors.
>=20
> When a PWM consumer applies a new PWM state, the driver automatically
> switches the corresponding PWM channel to manual mode so that the
> requested duty cycle takes effect. The duty cycle specified by the PWM
> framework is internally converted to the 0-255 scale expected by the
> hardware registers.
>=20
> To prevent conflicting access, the hwmon PWM sysfs attributes are hidden
> when the device is registered with PWM framework support (i.e. when
> "#pwm-cells" is present in DT and CONFIG_PWM is reachable).
>=20
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-adt7470_th=
ermalzone-v6-0-5605a5f95467@gmail.com?part=3D3

