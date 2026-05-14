Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F743D7D79
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749646; cv=none; b=VZ/EKYj08I7YKW8i2B1uyjDy5V3soFjfY6flCTIxLl9c8xqskyePwaHKePfzywO4OdZupM7UMtsegETI5/zLOLIgKgjEGThhRE7u0CAqPlIXFvUWevmjV8iLEbauEMkA8nvoG4eSTo9w1YIZHPsfu5ekIHp9QN6Z2H2Php426FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749646; c=relaxed/simple;
	bh=WqQ5PVXhcIKs0E34HaS7f+6OFDFKD0vL5zCYUOLNuY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oAeHMZSKoBkzIh/rS/w7D5TbBgXc5NhMurgHax9iKnsO6GSecEJuywnbK9Ji1SOmb2Nxd/VzrnpIf1OYeBK20MZOMJef15KCrCZurPiMm9a72x3AiOj5DK4dD4IuRQjSJkaBkHN9U7HWs7IKJKTS6HHB8s1rcuufaM54Uhd5wSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWkrHaJ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWkrHaJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63B3C2BCC7;
	Thu, 14 May 2026 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778749645;
	bh=WqQ5PVXhcIKs0E34HaS7f+6OFDFKD0vL5zCYUOLNuY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sWkrHaJ+AV/mPBjH7nSwuI756K5nAh9s1KLs8oWRi15pWrcu3FgRuDWUFmkwQWRDe
	 uRyhB/t7gyUPRuQYVRXIHeNZEt502SwWRqDmtKsZW5So5eXFviXH2pXOtKQvp4P6gw
	 ub3aKR8CuQBPYFcaIfln5Ds9eI9A5Ou+tce40BXTGcguUGtT8sR0ZrILWJ35/t7bR/
	 J6wK09BSoNnnoWOgohJ6u9BjufxD1oWXQ64v0dSQjbH7umvLW7mx4YD6ux4ap+/OwJ
	 ke6yQ8Spxgp2POdL0uBK/6FD7/FPMysgVLFmObcjjofTu4xiYNAJ5mCU+lUzY1iHIQ
	 XQ/uqnISeWM7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups,
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 09:07:25 +0000
Message-Id: <20260514090725.C63B3C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Unhandled error code from pinctrl_scmi_get_groups_count() masks =
firmware failure.
- [Low] Unnecessary persistent state added to struct scmi_pinctrl.
- [Low] Format string type mismatch in dev_info() logging.
--

commit d7d0dd8e474d3b2b3d8c68dd2d8713e62d0299a0
Author: Alex Tran <alex.tran@oss.qualcomm.com>

pinctrl: pinctrl-scmi: Log number of pins, groups, functions

The SCMI pinctrl driver does not currently log the number of pins,
groups, and functions discovered from firmware.

> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scm=
i.c
> index f22be6b7b82a4..abc90a3a7eaf4 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -40,6 +40,7 @@ struct scmi_pinctrl {
>  	struct pinctrl_desc pctl_desc;
>  	struct pinfunction *functions;
>  	unsigned int nr_functions;
> +	unsigned int nr_groups;
>  };

Does nr_groups need to be stored in the scmi_pinctrl struct? It looks like
it is only used once in scmi_pinctrl_probe() for logging, so could it be
declared as a local variable instead?

[ ... ]

> @@ -578,7 +579,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sd=
ev)
>  	if (!pmx->functions)
>  		return -ENOMEM;
> =20
> -	return pinctrl_enable(pmx->pctldev);
> +	pmx->nr_groups =3D pinctrl_scmi_get_groups_count(pmx->pctldev);

Can pinctrl_scmi_get_groups_count() return a negative error code here if the
firmware fails? Since pmx->nr_groups is an unsigned int, would a negative
error code be implicitly cast to a large positive value and mask the failur=
e?

> +
> +	ret =3D pinctrl_enable(pmx->pctldev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "Initialized %d pins, %d groups, %d functions\n",
> +		 pmx->pctl_desc.npins, pmx->nr_groups, pmx->nr_functions);

This isn't a bug, but the variables npins, nr_groups, and nr_functions are
all unsigned integers. Should these format specifiers be %u instead of %d?

> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v1-0-00b47b1be009@oss.qualcomm.com?part=3D5
