Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E7A21D3F5
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784530054; cv=none; b=S2oVAjonjpBG76titPUimEJfyYSjbBczw6vWaPac60X500Gy48bZf+mBPtcPbeu2OGRkSPGahkIrpyvD1VmREG5roTabIwSTSl+LNBdH6mvmlBTX/BzdKqD9fPWZQzIdHJPPKJR5AAg5T8OidJWl5h86KwdEqdA9nZtnRsoeiYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784530054; c=relaxed/simple;
	bh=30vPzUUIacmMMXNiTWNlA16ESX3WL/m4WEH9/Uzc9tM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UbK1LbDLq/s73bBYAQbWrnlrf53Zum5ffR9YYK0XVDTbJY9oxcfXGCSXDUgxA0l1mop9tmjq/VB/Y4eU+SrGws11TQwEmcLKFiSbLTpyBTA9Hpen6xwS4EfYWcnFRxUcX8tKFo48zOdvlIU7kM6PkOfqQwWpswjlKJVjXeGBCv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mceZZ+os; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mceZZ+os"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7E81F000E9;
	Mon, 20 Jul 2026 06:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784530052;
	bh=e3qxhXnvqwvKRFbUP8+ewU/+OIhNb4D1+8/4O2uvbxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mceZZ+osoLkGrGiop99kXRf9Fdu4CtuAqrzsUkvBFUO8QdJeXE0UmLHd6bWwe73GA
	 WrtcFs01pOUbsrL5gJirCnXpWN2jNS34K/pGs4BdqHxWIHSKP5y/iam1thyok4X02N
	 1sT+M2x8yjqFzRqtuAwgLwmJatE8s5qdDPKhvExcHZAq2ODnZGJF4aRLYYzH5Fp95O
	 ufO0BAMWtXxck7UXnyuewye4TiduHzx2WB2y5AvoI9mq+QYlD4rrf7fjFBY8JV8Mwv
	 GvMtIqBCvtsVubirJ02a6gwS0vDnAKuDXqiUgkbq8F4fRyfDgg6jiBnhdzYCd/ZkiH
	 0ezwHhgIdBjhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] hwmon: (sht15) Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260720063745.309331-7-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-7-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:47:32 +0000
Message-Id: <20260720064732.7A7E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race window during probe leads to permanently disabled IRQ and bro=
ken device measurements.
- [High] Missing cancellation of pending workqueues on probe failure and de=
vice removal leads to Use-After-Free.
--

--- Patch [6]: [PATCH v2 6/7] hwmon: (sht15) Remove redundant dev_err() ---
commit 47aa96341071db3373308927505b18391833a75b
Author: Pan Chuang <panchuang@vivo.com>

hwmon: (sht15) Remove redundant dev_err()

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs detailed
error messages on failure. Remove the now-redundant driver-specific
dev_err() call.

> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index 101cebbe68e4d..7bb2105d1ae22 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
> @@ -981,10 +981,8 @@ static int sht15_probe(struct platform_device *pdev)
>  			       IRQF_TRIGGER_FALLING,
>  			       "sht15 data",
>  			       data);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to get irq for data line\n");
> +	if (ret)
>  		goto err_release_reg;

[Severity: High]
This is a pre-existing issue, but does the err_release_reg error path fail
to cancel pending workqueues, potentially leading to a use-after-free?

If initialization fails here and the code jumps to err_release_reg:

sht15_probe() {
    ...
err_release_reg:
    if (!IS_ERR(data->reg)) {
        regulator_unregister_notifier(data->reg, &data->nb);
        regulator_disable(data->reg);
    }
    return ret;
}

The update_supply_work workqueue is not cancelled via cancel_work_sync().
Because the data struct is allocated with devm_kzalloc(), devres will free
it immediately when the probe fails. If the regulator notifier scheduled
update_supply_work just before the probe failed, will the pending work
execute and dereference the freed data pointer?

A similar issue appears to exist in sht15_remove(), where both read_work
and update_supply_work are left uncancelled before returning.

> -	}
>  	disable_irq_nosync(gpiod_to_irq(data->data));

[Severity: High]
This isn't a bug introduced by this patch, but is there a race window here
that could leave the IRQ permanently disabled?

Since devm_request_irq() is called without IRQF_NO_AUTOEN, the interrupt is
enabled immediately. If a falling edge occurs on the data line before the
disable_irq_nosync() call, sht15_interrupt_fired() will execute and call
disable_irq_nosync(), setting the IRQ disable depth to 1.

When sht15_probe() resumes, it will call disable_irq_nosync() again,
incrementing the disable depth to 2. Later, when a measurement starts,
enable_irq() only decrements the depth to 1. Could this cause the interrupt
to remain masked in hardware forever, breaking the driver?

>  	ret =3D sht15_connection_reset(data);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720063745.3093=
31-1-panchuang@vivo.com?part=3D6
