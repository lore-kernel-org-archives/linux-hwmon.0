Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CCC3C4B83;
	Thu,  8 Oct 2026 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460334; cv=none; b=DLFdl4hq8KeSn9ponXvWWJNMnETljzD/Y3uL2+zOE7XD7vx1q3JH6sWvwCspKPztZJ15I9tbHSYeDX6J+4gmfp6QFN0/81Hyp7ZGF0Qn853TAv4KeN+VovlyW7VXokbTu4SxZfBi3cbkwD4KtAUrPCLh6G8Y13WbsP1vzrhiJPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460334; c=relaxed/simple;
	bh=sfnCcQSO9Yom0X8IyLBCTKq1yhy8u/9phetFBT1sK/4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RW0d+jx1XDmpDFNDLW2GksaYhp7GtiTHX12mcz9kz3Pnbh7BXMNyldtywk9dmbWqtI0U6g7M1AOBrQfsdpTV6b2R6L5oltgD6IT2/A+UnuD/zIlPljrAQoTEgYtUt4hYFzanjspo2BgNy14uUxUHQw67H4RuQwTTyW/DYhmDf2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrjzhgCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrjzhgCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C23D1F000FF;
	Thu,  8 Oct 2026 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791460333;
	bh=22NX5RhBxcrLuy7q5X47hl4UqaHBTxw4DUqrHVgrkug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DrjzhgCuMOHhu1Mm7++wtsBWnFVAYh3nEvYxM7Bhqhdq/XnuWAkot9RePBWp1srQ3
	 xdKr3Beko0HAEKLz687t9wci8RG0sW7Sg+rc8BqI6FAzOvjgtqLv2FDOyhKGmcGjIP
	 CmgwM+U9M2BXSd2Cs20C9XAAe5jbfGeA+2FL4rjyt+KkjFpBHM915prymGFx8Oulli
	 5xVdSC5/2FST8soH3iOioEKrnjHdkmw2BxtVm99nY//JdsgrBWdwti79VCl4MDywiQ
	 55Pqh0c9jH5nSdy9PcZ1ZsYUESeXqz1sDbvl6z8PxNho5CFWK5JiLzQPsOeDpfrReL
	 hFah6NoUK0/7A==
Message-ID: <sashiko-outbox-164111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] peci: controller: Add StarFive JHB100 PECI
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008100623.7085-3-changhuang.liang@starfivetech.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
 <20261008100623.7085-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:52:12 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] peci: missing hardware abort/reset on transfer timeout causes spur=
ious completion
--

commit 362c32d18ca6b1082855225b6845fe8810b06db0
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

peci: controller: Add StarFive JHB100 PECI driver

This commit adds the PECI controller driver for the StarFive JHB100 SoC,
providing PECI protocol communication support for CPU thermal management.

> diff --git a/drivers/peci/controller/peci-starfive.c b/drivers/peci/contr=
oller/peci-starfive.c
> new file mode 100644
> index 0000000000000..93aca2413f5ca
> --- /dev/null
> +++ b/drivers/peci/controller/peci-starfive.c

[ ... ]

> +static int starfive_peci_xfer(struct peci_controller *controller,
> +			      u8 addr, struct peci_request *req)
> +{

[ ... ]

> +	priv->status =3D 0;
> +
> +	regmap_write_bits(priv->regmap, STARFIVE_PECI_CTRL,
> +			  STARFIVE_PECI_CTRL_START, STARFIVE_PECI_CTRL_START);
> +
> +	spin_unlock_irq(&priv->lock);

[Severity: High]
Does initiating a new transfer here require clearing the interrupt status
first?

If a previous transaction timed out, the hardware might eventually finish
and set STARFIVE_PECI_STS_XFER_DONE in STARFIVE_PECI_INT_STS, leaving an
interrupt pending. When spin_unlock_irq() executes, the delayed IRQ
handler could fire immediately.

Since the handler reads the stale XFER_DONE bit and calls
complete(&priv->xfer_complete), could this falsely complete the new
transfer prematurely and read in-progress or garbage hardware FIFO data?

> +
> +	ret =3D wait_for_completion_interruptible_timeout(&priv->xfer_complete,
> +							timeout);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret =3D=3D 0) {
> +		dev_dbg(priv->dev, "Timeout waiting for a response\n");
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
Should the hardware be reset or the pending interrupts cleared when this
transfer times out or is interrupted?

When wait_for_completion_interruptible_timeout() returns 0 or a negative
error code, starfive_peci_xfer() bails out early without aborting the
active transaction in the controller.

This leaves the hardware executing and capable of asserting the IRQ line
later, potentially desynchronizing the protocol state for the next transfer.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008100623.7085=
-1-changhuang.liang@starfivetech.com?part=3D2
