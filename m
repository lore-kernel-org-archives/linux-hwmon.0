Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B1565112
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002996; cv=none; b=A22QvFEZ51dMn3k/shY0qgcGJ79NPb1O12irJtIXZN9PvStkfHpNhxySmKNTyzpSRQdGkiVcQXigXMHWrBdfief8+eawiYyy2I/KRCa12Adw1e6XmZ2puuDyPzjUcs0g+tiXcskEfbDSlYaWhtTKxcEUwWN+ZsTZbc+ZvrSPlT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002996; c=relaxed/simple;
	bh=rPrMs/xtayN8pR/OPVZxMDGhVSy3LYGZO7enpUI+N+Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JHQ8DI5nCDPS1lWHkj0UaHYYy8Ubyz8aB/fG7qee7EhzDQCj+npdiM3ZDY3+uSi/d7yZGvOngmizwCvjcKK01USh/wLRd+fe4zTmuJjCsSA24Eo7NE8otWZkqEj30Ap9Q4UHRm6nb2meobOwY16Tn/YOXCrkDJ+SbnxKO1GWTng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbZBHtU5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbZBHtU5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C13A1F000C4;
	Wed, 14 Oct 2026 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002992;
	bh=1xxw0MHtVjaawXCol0M5bJFgmHB9O6z65L6PO0wfC64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GbZBHtU5OnkAsNmoaqy814LUv4tEb1wc4e+E5gUiKCQ3FLBYVzMSMXf9dnidaX2o2
	 xpJR83d/JXYARFds7PSEOEcXJ9EP+ecP/2BpBYLZxrc6TpAB0S57dLWTaYZJmT2/iu
	 EQG6YZnutC/ttAy/HMKWaijSK3SNMFB2D0fCq8Z0cFLwi5rodDdrcltXSamVhy6+Ju
	 7SE9w26f8ueY0/y3SPWm5swQTpcxdyX2pvxjyaDRPTLlkKHW6HhLcG7u6f5UNBbTkY
	 xz/8KAMHq7Elwpg5iG/JhkjO/Dp681tfxZ2nvB0u2xkQkWbqhSEdmePU8YoMm+6hDK
	 fI4q3YqDHG3lw==
Message-ID: <sashiko-outbox-171713@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/11] hwmon: chipcap2: enable IRQ processing when
 regulator is already enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-7-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-7-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:36:32 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: chipcap2: edge-triggered alarms lost for always-on devices
--

commit d3d969f96bc4b1b75c3078d08aa3eae3d286d7f8
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

hwmon: chipcap2: enable IRQ processing when regulator is already enabled

This commit sets process_irqs to true before returning from cc2_enable()
when the regulator is already enabled. This prevents operations from timing
out by ensuring the ready interrupt is not ignored.

> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> index 654f6420da7ab..837b1830f2e4e 100644
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
> @@ -120,8 +120,10 @@ static int cc2_enable(struct cc2_data *data)
>  	int ret;
> =20
>  	/* exclusive regulator, check in case a disable failed */
> -	if (regulator_is_enabled(data->regulator))
> +	if (regulator_is_enabled(data->regulator)) {
> +		data->process_irqs =3D true;
>  		return 0;
> +	}

[Severity: Medium]
While this ensures process_irqs is set to true during cc2_enable() for
always-on regulators, does this fully resolve the missed interrupts?

Looking at cc2_disable() in drivers/hwmon/chipcap2.c, process_irqs is
cleared when the driver becomes idle:

drivers/hwmon/chipcap2.c:cc2_disable() {
    ...
	/* ignore alarms triggered by voltage toggling when powering up */
	data->process_irqs =3D false;
    ...
}

For always-on regulators, the device remains powered and actively
measuring even when the driver is idle. If an alarm threshold is crossed
during this time, the device will assert the edge-triggered alarm pin
(IRQF_TRIGGER_RISING) high, triggering the interrupt.

Since process_irqs is false, the interrupt handler ignores the edge, and
the pin remains high. Subsequent sysfs reads will call cc2_enable() and
set process_irqs to true, but because the pin is already high, no new
edge is generated.

Patch 9 in this series adds synchronize_irq() to wait for running
handlers, but does this handle new edge interrupts arriving after
process_irqs is set to false?

Are edge-triggered alarms permanently lost for always-on devices because
process_irqs was cleared in cc2_disable()?

> =20
>  	/* clear any pending completion */
>  	try_wait_for_completion(&data->complete);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D7
