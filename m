Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFBA39022A
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 06:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529962; cv=none; b=Pc38aWb/pESQEeY53QAS1c5A3koBpw+eTMnukhLq2GPdipqyywD4toleScZBTFoxOM3NHYUYtAsvJBlMUetcreazbpNPB+6ug5k/ZjWTy8IN79NiuRcwhMUB1hoTje4XdSSTEGRbtJKtu0gCv+IiNsinYyJf9TZuSwplY1kgv/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529962; c=relaxed/simple;
	bh=ITrxoZpkcX9TuO8eobZY5DOydT7rlOva9iR5OXMipM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zz+gzHtENSC7kGxBPb0KEoWhHE6XADzd+m6BVabRlpiP07yXTOQJctE4HzyzbyVa9Gvr3ZlzBOqMHUeCN6vCFfBw3k1Vwz+Ayeo6TzTfqfdhPRVKHxdMA3gvEfu5OOFNliIWomJDjxHHQr0cBigNsx6yIh3PrvWbSnK4/mAP+wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhqE+ezR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhqE+ezR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88ACD1F000E9;
	Mon, 20 Jul 2026 06:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784529959;
	bh=TE/aADV73m3Hou9DXUWRESgRfAkKDs2DmJT/1ShLBCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HhqE+ezRtfqIOupba+tYynfmNxruyvUQnPewIiuQEVYBRToLOJnN33R1IbvWOpfDl
	 Xf3UDyLrZxOCdr4IgkfUvszREPwXOvdkGkL5mvMyb1De5prAmPqSWRdFlB4FrNxtNu
	 /QhqMNAoh9eRHYOOUXTKe3jW5d5sNM5NUznOP2isRDivECAYEKNQRJ90umvKO5In+1
	 V9Ig4jhz2z79NV+RQUwFJGPRouj+ynnsC7IMtHGqK3+XfY9FU6H68nD9Yl0yU5JXJW
	 wDLkPpJY/Ed+SMQRoMOLjyKZHYxr5LBrX0YGscoDD0NW9it6FcMyVAC8pRQmN4ix9Q
	 3sYbU0JFOYrqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] hwmon: (pwm-fan) Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260720063745.309331-6-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-6-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:45:59 +0000
Message-Id: <20260720064559.88ACD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced regulator enable count during devres cleanup if fan-shu=
tdown-percent is set.
--

--- Patch [5]: [PATCH v2 5/7] hwmon: (pwm-fan) Remove redundant dev_err() -=
--
commit 1f579d7c79ca89d1d4a39ad9aa36221339e0a01b
Author: Pan Chuang <panchuang@vivo.com>

hwmon: (pwm-fan) Remove redundant dev_err()

Since devm_request_irq() automatically logs error messages on failure,
this commit removes the redundant driver-specific dev_err() call in the
probe function.

> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 37f37813ea511..3b87f65bae058 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -628,12 +628,8 @@ static int pwm_fan_probe(struct platform_device *pde=
v)
>  		if (tach->irq > 0) {
>  			ret =3D devm_request_irq(dev, tach->irq, pulse_handler,
>  					       IRQF_NO_THREAD, pdev->name, tach);
> -			if (ret) {
> -				dev_err(dev,
> -					"Failed to request interrupt: %d\n",
> -					ret);
> +			if (ret)
>  				return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does this error path trigger
an unbalanced regulator enable count if fan-shutdown-percent is set?

If devm_request_irq() fails here, devres teardown executes in reverse order.
First, pwm_fan_cleanup() runs and explicitly enables the regulator to shut
down the fan:

drivers/hwmon/pwm-fan.c:pwm_fan_cleanup() {
    ...
    if (ctx->pwm_shutdown) {
        ctx->enable_mode =3D pwm_enable_reg_enable;
        __set_pwm(ctx, ctx->pwm_shutdown);
    } else {
    ...
}

Later in the devres unwind, devm_regulator_release() calls regulator_put().
Because pwm_fan_cleanup() left the regulator enabled, does regulator_put()
detect a non-zero enable count and trigger a kernel warning stack trace whi=
le
leaking the reference?

>  		}
> =20
>  		if (!ctx->pulses_per_revolution[i]) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720063745.3093=
31-1-panchuang@vivo.com?part=3D5
