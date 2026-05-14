Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5B3F4115
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746843; cv=none; b=A3l6ZetqIPD2nYwIVJltPRljEFm+JZBwI28mVBUgU4vS6dJYz22DLbThKzAkdIl1OirzF86v4ZZ68L/NIluxTaRRh0xS2u3ERv57HlBQhE9KcobWiCkndCcJBrbEhVWX111eVHIzPF0cUtDZd0Z5tXRGK+PeAxgwJmNkJz6H7K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746843; c=relaxed/simple;
	bh=ZiZlDBbPf93WGgBoMLR4PTsMYtjqzSdyujM9y9bwj70=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZeoTbHNuuGTarYaRSMUtfK91R/Hc9e91sDpyKvph1MKc8/DB3qdQiaX+i7n/5pXQmi6cMmYtO4R7yqEhNDuIqtB6JUmrbR78GIOMK9TKmlR99iKmDCa1HVRHfbU9ZDf8UakJxOiEzu3UAKqqs+YoRm0WPdHAn2oeybxRs1WeHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbNLO6uN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbNLO6uN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9459AC2BCB7;
	Thu, 14 May 2026 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778746842;
	bh=ZiZlDBbPf93WGgBoMLR4PTsMYtjqzSdyujM9y9bwj70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kbNLO6uNmBEadobFU6h0x8uPtgUCXARf0e0wdDwNr4aaxyHXGIlVxX6YUDDTyw8T0
	 1mTh+vmYR2P0d/j+OzIZ09MoGCTBsDz85j1uXLUbjfckKXvzJARXeAXOJE32atD+wf
	 M5IhE/DkqmyPINUjZ/bFGLMFAoIcB97z+VZyshy3OmiHaQFl+vvtdcuU12jaMMKdGB
	 zlt9P2XaaWAfyIG+82lkDozGijEsTeL/rUEZHwD6ZBDJXGnVPpu4J1oZtOz2xZ2xCF
	 xNytjx0DxxTgXpjW2Ua0vJSGmUCj2+ZkpSKTpJ2LuKTpP+Qp/5VDjA9fuip6rM2k2j
	 j7fPZeu1EUqAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] reset: reset-scmi: Log number of reset domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v1-4-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-4-00b47b1be009@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:20:42 +0000
Message-Id: <20260514082042.9459AC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The format specifier `%d` is used to print an `unsigned int` in `de=
v_info()`.
--

commit dfa791ed52b95e32859483ac051e58c6d9c9975b
Author: Alex Tran <alex.tran@oss.qualcomm.com>

reset: reset-scmi: Log number of reset domains

This commit updates the SCMI reset driver to log the number of reset domains
discovered during probe. It saves the return value of the registration func=
tion
to conditionally print the information upon success.

> diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
> index 4335811e0cfaa..f26fad0dc7268 100644
> --- a/drivers/reset/reset-scmi.c
> +++ b/drivers/reset/reset-scmi.c
[ ... ]
> @@ -111,7 +112,12 @@ static int scmi_reset_probe(struct scmi_device *sdev)
>  	data->rcdev.nr_resets =3D reset_ops->num_domains_get(ph);
>  	data->ph =3D ph;
> =20
> -	return devm_reset_controller_register(dev, &data->rcdev);
> +	ret =3D devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "Initialized %d reset domains\n", data->rcdev.nr_resets);

This isn't a bug, but should this format specifier be %u instead of %d?

Looking at struct reset_controller_dev, nr_resets is defined as an unsigned
int.

> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v1-0-00b47b1be009@oss.qualcomm.com?part=3D4
