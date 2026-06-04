Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF53F7A8B
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jun 2026 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564359; cv=none; b=TQtzkwWh6KPPUH00R9YWP2nl7zt/15T1Q0QLAitND4dyHpYllqVSQAYYGCIvHvKlt8Wxn4fDO3rHlQ6rJlPNWuX9UK06tnCnBCyrI2fHfbOrOrV/ZKHoLXZQMFq8OTAGyVIkEf9GUHotCwLJVhcOrBZHUc0H2XLFsOllHNCYzGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564359; c=relaxed/simple;
	bh=hBi4w4J5cSDPvWKthcdaYZoF8WVOaCNp9Vr9DAsf5u0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K7hNwkxiIq/8kzlCKNZ3sY0uis4Zf2U14NfSeOJVaAodycTyztPTmfiLrP3gIDgpgf/cXLXISSmpkbW1kWGxSTKsXflrSF1iEW3wNKyU5oMBfbH+ONpJ1zIrxfcAAX1xbwvAtJHuwoilJU2B0YEWDhpGpOeubDGfV/7bDAaWXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV47i-0003qU-4b; Thu, 04 Jun 2026 11:12:22 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV47g-0013L4-2k;
	Thu, 04 Jun 2026 11:12:20 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV47g-000000003X3-3Emk;
	Thu, 04 Jun 2026 11:12:20 +0200
Message-ID: <85e630579d97172e9bc64bce082b2d7b763a1263.camel@pengutronix.de>
Subject: Re: [PATCH v6 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: hehuan1@eswincomputing.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Date: Thu, 04 Jun 2026 11:12:20 +0200
In-Reply-To: <20260604080552.169-1-hehuan1@eswincomputing.com>
References: <20260604080430.126-1-hehuan1@eswincomputing.com>
	 <20260604080552.169-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

On Do, 2026-06-04 at 16:05 +0800, hehuan1@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
>=20
> Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
> supports temperature and voltage monitoring with polynomial conversion,
> and provides sysfs interface for sensor data access.
>=20
> The PVT IP contains one temperature sensor and one voltage sensor.
>=20
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> ---
>  drivers/hwmon/Kconfig       |  12 +
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/eic7700-pvt.c | 495 ++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/eic7700-pvt.h |  99 ++++++++
>  4 files changed, 607 insertions(+)
>  create mode 100644 drivers/hwmon/eic7700-pvt.c
>  create mode 100644 drivers/hwmon/eic7700-pvt.h
>=20
[...]
> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
> new file mode 100644
> index 000000000000..ea0f1299cd29
> --- /dev/null
> +++ b/drivers/hwmon/eic7700-pvt.c
> @@ -0,0 +1,495 @@
[...]
> +static int eic7700_pvt_probe(struct platform_device *pdev)
> +{
> +	struct pvt_hwmon *pvt;
> +	int ret;
> +
> +	pvt =3D eic7700_pvt_create_data(pdev);
> +	if (IS_ERR(pvt))
> +		return PTR_ERR(pvt);
> +
> +	platform_set_drvdata(pdev, pvt);
> +
> +	pvt->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pvt->regs))
> +		return PTR_ERR(pvt->regs);
> +
> +	pvt->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(pvt->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(pvt->clk),
> +				     "Couldn't get clock\n");
> +
> +	pvt->rst =3D devm_reset_control_get_exclusive_deasserted(&pdev->dev,
> +							       NULL);

Why store this in struct pvt_hwmon? It's not used anywhere else.

regards
Philipp
