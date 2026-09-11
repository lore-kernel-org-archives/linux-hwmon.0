Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E504534A7
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111824; cv=none; b=bPQptAT8NXRHs1vQC5/5tgEHyxH5rmvNVe1nvvB1VvUZlDjKt/W4zJNqldu8OCKgOGw1w5k29DPEyzlUNEXVhloTfU9DO69ySVVGsUmCSpl418hTTIfiurkFAYD2Xcp4Ypd67EiDhoIKOd7alNpUJKpPsjk9jtfnU1zlqFdc3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111824; c=relaxed/simple;
	bh=n4WhVY1v2/Oxo6gAz7lq8hyJdKaECaeOs1jBC7027RA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cgkqUlWqUzfGVT3xRVc9EOovEY/S5OTC48C5N1WJG9+UzDzBSIVyhyJcv89qxCOVDwqOzRPrC8xBNnNAXAlMz7JxnISXuFTh/K/mHn1kFbOo92+Se1ol945xc+tHM+z1LxAgNm1lW2lDVv+LxuKrQ17QTMRBM5510a6aNBruz2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmA3noDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmA3noDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF991F00898;
	Fri, 11 Sep 2026 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111822;
	bh=8/ZyrsiTRNcVS3WuRMWvOAEmk7Fg+QASpC8FNPw+iVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmA3noDTEwxQXbpbVdYVgsdxQvN1Xt8OrnDivdeC85P3q1IjszWM+o14xFOys9z4c
	 vNxZlQtoDJL25aftX06G9MYjpsHzUm9R5SM5NClfNYKcf0CZCn/3GGzuvYYonWlWJy
	 TONmDdp3rw11sY7/yrEMfXTZ1bdSOH1/hq4Zn6nxPSxFSMagKMaFP0n5v8fHxzlTUj
	 QlMI4JW6zxAB5TXLAqJKfj2NQmUrXkoVQoHJgpEdwcAYuS/TYG1K50P5XGNvN02E0t
	 XIP6KTbMg1fsGQuKXqlUrDN15YnlGBoJN7Gcsu5u2TdnmWXAPBe1MJGgRSpT6XZJwj
	 K77E6lrQHfnIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] hwmon: (pwm-fan) Stop RPM timer before freeing tach
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yibo Tan" <lhfff@tju.edu.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260911071809.130151-1-lhfff@tju.edu.cn>
References: <20260911071809.130151-1-lhfff@tju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:30:22 +0000
Message-Id: <20260911073022.AFF991F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing lock in pwm_fan_cleanup leads to data race and potential m=
emory/HW state corruption during system shutdown.
--

commit 7dfed1a79b0f4d06cbff416478ab737ce3920c29
Author: Yibo Tan <lhfff@tju.edu.cn>

hwmon: (pwm-fan) Stop RPM timer before freeing tach data

This commit fixes a use-after-free bug where driver detach can free timer
backing arrays before the timer is shut down. It does this by splitting the
timer retirement from power cleanup and registering its devres action after
the timer backing data is installed.

> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 3b87f65bae058..c633d7f6464c7 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c

[ ... ]

> @@ -700,6 +710,7 @@ static void pwm_fan_shutdown(struct platform_device *=
pdev)
>  {
>  	struct pwm_fan_ctx *ctx =3D platform_get_drvdata(pdev);
> =20
> +	pwm_fan_timer_cleanup(ctx);
>  	pwm_fan_cleanup(ctx);

[Severity: High]
This is a pre-existing issue, but does this unlocked call to
pwm_fan_cleanup() create a data race with the thermal subsystem?

During system shutdown, pwm_fan_shutdown() invokes pwm_fan_cleanup()
without holding ctx->lock. At the same time, if the kernel's thermal
governor triggers a temperature update, it can follow this path:

pwm_fan_set_cur_state()
  set_pwm()
    __set_pwm()

The thermal path acquires ctx->lock, but because pwm_fan_cleanup() modifies
ctx->enable_mode and ctx->pwm_state locklessly, these operations can race.
Could this result in invalid configurations being passed to the PWM driver
during shutdown, potentially causing a crash or malfunction?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911071809.1301=
51-1-lhfff@tju.edu.cn?part=3D1
