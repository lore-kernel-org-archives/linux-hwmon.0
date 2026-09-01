Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779A442BEAA
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 16:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278973; cv=none; b=kWdeDtryrSp8UL+lDg6+7jBEsWtVH2RDlCI9bPg5Ktu7zHHJYzJuI9U3PzpywdyvDz+Kc2sk1+CboLGraiAEflsVdODpWYHCdhtl7jiOVY0p2lYxUKJ5mS3WnkLv1Ous1TP3BlpIW7MZVDQ5iW90L9rUZlmZlDPGDxKiIY02trU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278973; c=relaxed/simple;
	bh=r902jQg7oFW/zZHEvkgEzVlzeVtNonegr0wywUfQolk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BpbMDXx/qQJUaghQ7pnLRIezjjJ30dxXkIFs748ygQ/2gmnREqfw16vaul8s1je3TPV6fga9g9yLTadb70YClSjtMyeMBibrS9DBkbMZ3VSZQQYFpKUUjpG2IcoaDJWzb1SBdspUNEkH2IDCoYcAIjmrnBWJWiX5qBIde2rsSKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCIesdBt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCIesdBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3811F00A3D;
	Tue,  1 Sep 2026 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788278972;
	bh=+5Kr/fzy2eYv4G8r7kC/YzhE1DqQxKdG0WdYebVj4+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LCIesdBtD8FXs9vvvRSNeSQZdzFYe4RZ6knIJ8BXrBBykCyTFUm+DoLe138BEt3iA
	 MzDTHQMdYi7MAQu1YVObqH6KccrY4RmhGsOiLWTxH096F9VRp2o/+lXtza7J15fH4q
	 q0fkeVlG/1ZunkSBJRlczMF4jKxc4bucopWpyT/gVK81JwiiyRFLyYCKRpD38td0hp
	 YOMEyZAEMExla9c/3tux4L79acgkBBtB4LYr0tTvSoDIrpY6xME9TMDkc8DCbUDndA
	 Gfx9OcHrKrNHpnV+L2vFkz4UwqzYhQRDt07uJWtJqsKiURE+r2c7xtKb7ZeFnJe9Rb
	 HuNy+ewmCCDxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (gpio-fan) return IRQ_HANDLED from the shared
 alarm IRQ handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260901155648.1538876-1-congnt264@gmail.com>
References: <20260901155648.1538876-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 16:09:31 +0000
Message-Id: <20260901160931.DD3811F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The interrupt handler unconditionally returns IRQ_HANDLED while re=
gistered as IRQF_SHARED, neutralizing spurious interrupt detection and risk=
ing a CPU lockup.

Pre-existing issues:
- [High] Missing cancellation of `alarm_work` during driver unbind leads to=
 a Use-After-Free vulnerability.
--

commit 2cca5798d0ba1012484e76e484ce607c8ed4c2f0
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (gpio-fan) return IRQ_HANDLED from the shared alarm IRQ handler

This commit changes the interrupt handler for the GPIO fan alarm to return
IRQ_HANDLED instead of IRQ_NONE to prevent the spurious interrupt detector
from disabling the shared line.

Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org

> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 084828e1e2817..a55a7ea07fc01 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -67,7 +67,7 @@ static irqreturn_t fan_alarm_irq_handler(int irq, void =
*dev_id)
> =20
>  	schedule_work(&fan_data->alarm_work);

[Severity: High]
This is a pre-existing issue, but does this workqueue lack a cancellation
mechanism during driver unbind? The alarm_work is scheduled here and
executed asynchronously in fan_alarm_notify(), but there doesn't appear
to be a registered devm cleanup action to ensure cancel_work_sync() is
called during teardown.

If the device is unbound via sysfs while an alarm condition exists, devres
first frees the IRQ line and then the fan_data structure without waiting
for pending system workqueues. Could this result in a use-after-free
vulnerability when the delayed work executes and dereferences the freed
fan_data memory in fan_alarm_notify()?

> =20
> -	return IRQ_NONE;
> +	return IRQ_HANDLED;

[Severity: High]
Does this code unconditionally claim every interrupt on the shared line?

Since this handler is registered with IRQF_SHARED, always returning
IRQ_HANDLED could mask spurious interrupts from other devices sharing
the line. This prevents the core IRQ subsystem from detecting and
disabling a faulty line, which might lead to an unmitigated interrupt
storm and a CPU lockup.

Should the handler verify if the interrupt was actually generated by the
GPIO fan alarm hardware before returning IRQ_HANDLED?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901155648.1538=
876-1-congnt264@gmail.com?part=3D1
