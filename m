Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AA543FD3F;
	Mon, 28 Sep 2026 08:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583182; cv=pass; b=lccEVVNRDFhi3SAEQSnO4r0W5ab1dwXV/wIlz/AV02Bk/SuKeZHHXr4s73sZs7pvoKPv99B/D+L1qj/qQ9MiBMgCATjq7PY5UiNCq4QCZkCYJbX9wVapUOadH58NBmh+J1iw2Y6sRdJRe2sGLOP4z9Q2vHN+z9C7T9dqaoCT+7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583182; c=relaxed/simple;
	bh=bOKRBP31qsazQzx5vzWjPlNFB/k297+F6F9MoUx6M0o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G2CHedAUJXfPHpQ3X0d4UzOuHhNYcwGm3fvlHzDU8Z0cBN5NDufiIsGHPY2BxqGglUjpBroQ6/aEPNTFOoHj8zLItKl5KoZTwEG+Bmg2cbR5KX50lY6S9DlKzgjIJtp4l5FT9/ahiFiHtkZpKjczNJhUmpShg01bmGFRoAoqb98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=XviXRgAX; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="XviXRgAX"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E10DD2018B6;
	Mon, 28 Sep 2026 10:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790583176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1EnO2TDwxSS3PzHlA/S4kFWqaJE8d5xyWfASI+Sa6Jk=;
	b=XviXRgAXIpsVWYq1RfR98Nt1lQwEBstF+qB9QRTaGIfRwvzGQm6/4o2fNmeEznNXvLxkJF
	O5fxSSRvRgd2rrpY92ytsVpoqGnyFVlgw6Cut5oUSuaoy2g1YAr1b63Xc3CkSeVnpwecaK
	xLJvVKD5OktWVbnZbQrkzaPFEk2Zv93/QnwuuoMkFeueSLogc2SLyJSfJN72AErkziGLkQ
	70lz/1ozFiryvwICm09+OqHGYeZEkWN1/y/0fScTq+jJjMxp+1RvgaiLu/WyYI1A8+B2DL
	08nAMy/VOo87fVZM5Rel+nJOYJi6Gchg8HIYwuj2cvNjzvwsQY3M9EKmqf2/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790583176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1EnO2TDwxSS3PzHlA/S4kFWqaJE8d5xyWfASI+Sa6Jk=;
	b=J9A6Hbr7cm+ioZH4FrzUyBDckT3JRqmrk4Hzf1qMVnDa2RtRFQDGo7IJoepbONB8DlxxHe
	B3Nla6vtpw12yJTqSyKBJTADz77w4qroYIBWtN9omILxX7k3Ls2HUssaCOghcyNcScd1Ey
	802yKYoBOBuC75qy3kuQLcLLPHcWqkw1fnqCvpsA3JQConE0ymOcyrzLb3i1cUEUNhnu9x
	1d+ZRjFZbBrtqK0HXlZ2BxnLbbbdE/5BOkocT5/JtWptMMmZTwYoJUnl802QZkMJxpomq4
	al+nQa3x5KxIuhaj1WTQZS9jH857uB0SRPs05dC+J7WQ4tqDTVpUmmvhafYhEQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790583176; a=rsa-sha256;
	cv=none;
	b=H1b23b4oiLyJOR6i/1CwxsxzG3SiNhiMt8EoJrIGvnDPDAdSIwUs/JOIkCdPmb/vhfyW+a
	uncsnHI2nE9sqPoHtC2UXOpPDqIubmPs4LEgpUTSe8yvU+8BwRoMQvdHd4RexOp5L8wvHn
	qG84wd+g9yChw42l+Ose/sNvlP7HBwE9QSPpt45pxL2cuQeMEV10EIQ/pIzS36CJKha0at
	w0jglaqttll/MiIInMlyWmqXBIwdITh1Fqdl3E58iiT/nknADrgHcvmXdBdIC4Kg/NPLnK
	2RJn0Y/9maIomrqboYJJANUlw1QDb5MMIV/n4BlnXU1UKCkSh0URlzAHBUHdNQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <838cc8f7099bfc5ee1cac9d3aca7a87aa7dfd17d.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/6] peci: controller: Add StarFive JHB100 PECI driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Iwona Winiarska <iwona.winiarska@intel.com>, Guenter
 Roeck <linux@roeck-us.net>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Date: Mon, 28 Sep 2026 10:12:56 +0200
In-Reply-To: <20260928075956.62298-3-changhuang.liang@starfivetech.com>
References: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
	 <20260928075956.62298-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-09-28 at 00:59 -0700, Changhuang Liang wrote:
> Add PECI controller driver for StarFive JHB100 SoC. The driver supports
> PECI protocol communication for CPU thermal management.
>=20
> For this controller, the special clock and reset operation sequence is:
>   probe: clk_prepare_enable() then reset_control_deassert()
>   remove: clk_disable_unprepare() then reset_control_assert()
>=20
> Co-developed-by: Mason Huo <mason.huo@starfivetech.com>
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                             |   8 +
>  drivers/peci/controller/Kconfig         |  17 ++
>  drivers/peci/controller/Makefile        |   1 +
>  drivers/peci/controller/peci-starfive.c | 376 ++++++++++++++++++++++++
>  4 files changed, 402 insertions(+)
>  create mode 100644 drivers/peci/controller/peci-starfive.c
>=20
[...]
> diff --git a/drivers/peci/controller/peci-starfive.c b/drivers/peci/contr=
oller/peci-starfive.c
> new file mode 100644
> index 000000000000..6004cb27a774
> --- /dev/null
> +++ b/drivers/peci/controller/peci-starfive.c
> @@ -0,0 +1,376 @@
[...]
> +static int starfive_peci_init_clk_rst(struct starfive_peci *priv)
> +{
> +	int ret;
> +
> +	priv->clk =3D devm_clk_get(priv->dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(priv->dev, PTR_ERR(priv->clk),
> +				     "Failed to get peci clock\n");
> +
> +	priv->rst =3D devm_reset_control_get(priv->dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

> +	if (IS_ERR(priv->rst))
> +		return dev_err_probe(priv->dev, PTR_ERR(priv->rst),
> +				     "Failed to get reset control\n");
> +
> +	ret =3D clk_prepare_enable(priv->clk);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to enable peci clock\n");
> +
> +	ret =3D reset_control_deassert(priv->rst);
> +	if (ret) {
> +		clk_disable_unprepare(priv->clk);
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to deassert reset control\n");
> +	}
> +
> +	return devm_add_action_or_reset(priv->dev, starfive_peci_clk_reset_rele=
ase,
> +					priv);

This could be simplified with devm_clk_get_enabled() and
devm_reset_control_get_exclusive_deasserted().

regards
Philipp
