Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16B538E100
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754176; cv=none; b=YxIb6ZseftO//zGr25KGVuYB+H4qZow0RCpAH9LT0aEBHbG1i/p4chHvkVdz/oQn+AfINkZZByUcgyTfc/O8o6pZ1k55okO1E1PS3xgDc7rU8u+GmvWuQm8t/VKHjaYEPiEzlT9aA85Qa5jOLgZCeEpSjjHbh6g41IAQz0cWf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754176; c=relaxed/simple;
	bh=ZKQpxjqTqRs50eLDPP/RTtzt1rN+G2d25wUsw5tADKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tlDxVB/uefWtOX7ne4SRrR58Q/ZUtcVUFEtXNvW6qtRzJtxYNdi6XXOdXfRwEuoF3tWOYK64amJD52R1qSmwgotb+9wIOWmB/MhmUcRu2D16U6Htptj/thMTMyiy8i7WS0fF72lNxROnN42JWOPMW8xjoUUJBHB74fLqWurVpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRzUQQY7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRzUQQY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C36C2BCB3;
	Thu, 14 May 2026 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778754175;
	bh=ZKQpxjqTqRs50eLDPP/RTtzt1rN+G2d25wUsw5tADKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nRzUQQY7TBLAMH6Bmj1o8POiD9qa+DnTVBHGIfliLw7SjJ5U1SDSwnJ3Ek92UdBqC
	 oY0C/Vxt9rnxjYwCuCgeIpxFI8Rs+zVgu+alEHqm/Y0pIWJSGgl4B5yOpl+DF0i8+U
	 w1U4tKb32tMdUny0H4K7idwkW7oEHrK8Yux4l4s6M3iTno2CTgtsMPRbneGVbkvvwl
	 h1+bAntpqXDkdA6VlSrnxvf+/vJ/kGzf4QLRrAed8Gu3U3L80hM+Z9uHeANFvArtc4
	 /cnGIEBOsQFTt5xergCAFkdFDo+dxlKQaKy9OmHuSlJSWoe8bxRoloYJs8M5B/JQYh
	 hISjxm7Zebbog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] pinctrl: pinctrl-scmi: Log number of pins,
 groups, functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:22:55 +0000
Message-Id: <20260514102255.86C36C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Unnecessary structure bloat by adding `nr_groups` to persistent dri=
ver state.
- [Low] Missing error handling for firmware query result before assignment =
to an unsigned integer.
- [Low] Format specifier type mismatch in `dev_dbg`.
--

commit 1afe1feb7c661d03b99df0a5046eac6639ef2fe6
Author: Alex Tran <alex.tran@oss.qualcomm.com>

pinctrl: pinctrl-scmi: Log number of pins, groups, functions

The SCMI pinctrl driver does not currently log the number of pins, groups,
and functions discovered from firmware. This commit adds a debug log statem=
ent
to print these counts after a successful probe.

> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scm=
i.c
> index f22be6b7b82a4..999c2061ddc38 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -40,6 +40,7 @@ struct scmi_pinctrl {
>  	struct pinctrl_desc pctl_desc;
>  	struct pinfunction *functions;
>  	unsigned int nr_functions;
> +	unsigned int nr_groups;

Is it necessary to add nr_groups to struct scmi_pinctrl?

Unlike nr_functions which is used later, nr_groups is only written and read
sequentially within scmi_pinctrl_probe() to populate the dev_dbg message.
Could this simply be a local variable in the probe function to avoid bloati=
ng
the persistent device data structure?

>  };
> =20
>  static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)

[ ... ]

> @@ -578,7 +579,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sd=
ev)
>  	if (!pmx->functions)
>  		return -ENOMEM;
> =20
> -	return pinctrl_enable(pmx->pctldev);
> +	pmx->nr_groups =3D pinctrl_scmi_get_groups_count(pmx->pctldev);

What happens if pinctrl_scmi_get_groups_count() returns a negative error co=
de
due to an SCMI firmware query failure?

Since nr_groups is an unsigned int, assigning a negative error code will
result in a silent integer underflow. While this isn't used for memory
allocation or bounds checking, it will result in incorrect values being
logged.

> +
> +	ret =3D pinctrl_enable(pmx->pctldev);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "Initialized %d pins, %d groups, %d functions\n",
> +		 pmx->pctl_desc.npins, pmx->nr_groups, pmx->nr_functions);

Should we use %u instead of %d for these format specifiers?

pmx->pctl_desc.npins, nr_groups, and nr_functions are all unsigned integers.
Using %d causes any underflowed error codes to print deceptively as negative
numbers in the logs rather than revealing the implicit cast.

> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v2-0-36607e9dd540@oss.qualcomm.com?part=3D5
