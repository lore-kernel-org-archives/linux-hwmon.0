Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF7B3783D5
	for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2026 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616122; cv=none; b=cyLXt4xocR7zfTx2pHTfcINF94uhuvJ/ueEk40gFNxP+e56GOiE6Cv9X54AlVVBX/mFlHAvCNbsoDKSZu8brorGIJP1rEGbutLMrXu/5cs+7xMxJfi480sgPtU/9okkGb/8lJdL7keOC3Crq9CBgHyINuA7K0oRSll+UuUaL68s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616122; c=relaxed/simple;
	bh=6x6HHOX0cLzIlpDyXVZzHBZ/SrHx8SqajrH7Ny//GCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YLCBBgE6ZIFkGCw9RXYmPPvQlziJfE9K+uupjbXuTxWbPJ3cLL2j/hb/IeNx+HCTUNHWiYmRUIehWZYXah8uqiNb6SUQ0/BSzl8pgIjYuX64XphexZg1eLXtw8H/tbxSg9JFgmLTqKn40iSadVppDJBfLKPIFvFxltbVDbR+JbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7XjY/4l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7XjY/4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424E51F00A3D;
	Sat,  5 Sep 2026 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788616120;
	bh=E5x2nuGAP7qhlJDDq1KWyFIoXdgiiOO4woxTa84W6a8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S7XjY/4lzW0tomFR41MqUHJLL9wDsryr93TXHHFNbc7aLORq1w+LIR+lJ37kEJvNr
	 AHsx5pVe32SOyCmfIUHodZmCKelH+iJILiNx6BUD2AzouxT+d6rUPEB/w6UBWz+f8O
	 YOkHhk6m3njTg4LHNCrqFh3r/dOdmFRV2fWvJbRP6rjeKn3H/B+6lfIOqkeIJ808I+
	 Ow5hVS1c8xHuXYlY5GwP5EPCUp5GoDEdQaA9SyvdRvK4BEEHbLJYlquW9rUm0eNGKs
	 Cz4shsN0tMrRyQgoLS63MOM7F5u3s+BB62X0fyzRjQX6/gsqoi5SvKpVJhvQ8aYyii
	 WD+l3hKucuf4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (max6639) Publish the OF module alias
Reply-To: sashiko-reviews@lists.linux.dev
To: hpp.iscas <hppiscas@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260905133643.65365-1-hppiscas@163.com>
References: <20260905133643.65365-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 13:48:39 +0000
Message-Id: <20260905134840.424E51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing i2c_set_clientdata() in probe causes a NULL pointer de=
reference in PM suspend/resume callbacks.
- [High] Unbalanced regulator disable if I2C access fails during suspend.
--

commit e5868671fda98c3e539843bf646808d132b90df7
Author: hpp.iscas <hppiscas@163.com>

hwmon: (max6639) Publish the OF module alias

This patch publishes the max6639_of_match table as the OF device ID
module table. This ensures the correct OF modalias is emitted by the I2C
core for Device Tree clients, complementing the legacy I2C detection.

> diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
> index dd5f4b3b128da..bf9236151be19 100644
> --- a/drivers/hwmon/max6639.c
> +++ b/drivers/hwmon/max6639.c
> @@ -790,6 +790,7 @@ static const struct of_device_id max6639_of_match[] =
=3D {
>  	{ .compatible =3D "maxim,max6639", },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, max6639_of_match);
> =20
>  static struct i2c_driver max6639_driver =3D {
>  	.class =3D I2C_CLASS_HWMON,

[Severity: Critical]
This is a pre-existing issue, but does max6639_probe() forget to set the
driver data for the parent I2C device?

max6639_probe() registers the hwmon device, which binds the driver data to
the new hwmon device:

	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->name,
							 data, &max6639_chip_info,
							 NULL);

However, there is no corresponding call to i2c_set_clientdata() or
dev_set_drvdata() for the parent I2C device.

When the PM core calls max6639_suspend() or max6639_resume(), it passes the
parent I2C device:

static int max6639_suspend(struct device *dev)
{
	struct max6639_data *data =3D dev_get_drvdata(dev);

	if (data->reg)

Won't dev_get_drvdata(dev) return NULL here, causing an immediate NULL
pointer dereference upon system suspend or resume?

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to an
unbalanced regulator disable if the I2C access fails during suspend?

In max6639_suspend():

	if (data->reg)
		regulator_disable(data->reg);

	return regmap_write_bits(data->regmap, MAX6639_REG_GCONFIG,
				 MAX6639_GCONFIG_STANDBY,
				 MAX6639_GCONFIG_STANDBY);

If regmap_write_bits() fails, the error is returned directly but the
regulator remains disabled.

The PM core will abort the suspend transition for this device and it will
conceptually remain active, potentially leading to overheating as the fan
is off. Later, when the driver is unbound, devres will run
max6639_regulator_disable(), which could result in a negative enable count
in the regulator core.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905133643.6536=
5-1-hppiscas@163.com?part=3D1
