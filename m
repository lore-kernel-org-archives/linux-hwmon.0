Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D03976A1
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367444; cv=none; b=Y2y7CVn9LvW2+4fo6KL9Qh/QcG+ck7xTpo90TVr80Y98lQHyhn/+qjH55lApqRdip5P8TuSR12KHL/ku1MOWVm1+U0SeHQKJ0gEt43b0itNonT4Ovpxno27zmV3os9JPzdUX6R+41/E5ASlpdo83SZoVmhKIAEaA/z9+pRDorBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367444; c=relaxed/simple;
	bh=pmQe66XmgqHJEHEXq/o6l78xRf4NBIQiT4zEKhB1hzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LrAg2ydIQc2EkqLlpzl9xWxlZUMYQenNGb6aZgm3ae1Zq+fTRXjUmfzfp52ENHMjp4kzDNOWK6oyZXlMv+Ug9JFGZsnWdu+P8imYQvbvEq8mXV2tugzCNPvf2M+M5CK4WngVP6EOyuXu8xc+iOvdXR8wRHHPLuR8qlVOfaz7kgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVW85Hxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVW85Hxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9DFC2BCAF;
	Thu, 16 Apr 2026 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776367442;
	bh=pmQe66XmgqHJEHEXq/o6l78xRf4NBIQiT4zEKhB1hzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QVW85Hxa/m1W1qn+Ges6LDcmqbQGHZopwOezNC/3QFM3OhM1XqzTRCyiXIJUYVElz
	 Jp0lP5poYd/CgJlzPv3de7sU6RoJySc1V6lzz1e8h5oyXgeWHuIBxrauipZ0WH8s2n
	 GD6KzHZMEua/bcJJW5hvGg8kT5oK3Gcxv/fpIBWmDzk7o47ZQhPcDWDxSLD9R88j52
	 v4nu4e5JPTIULHUBENrCE6I7aBVh9FwphL7y3UpoS/GtWoGvVM+CuTquZsL7egYD53
	 VM1Fx2ekPaiCN5GC8Z83faFJtaknlesjoBVOS/3Tizf+vMm6FWr+N3yYCzJ+IK1Mzk
	 feACPyB3bBJMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (lm63) Add locking to avoid TOCTOU
Reply-To: sashiko@lists.linux.dev
To: "Gui-Dong Han" <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260416135703.53262-1-hanguidong02@gmail.com>
References: <20260416135703.53262-1-hanguidong02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2026 19:24:02 +0000
Message-Id: <20260416192402.9B9DFC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] temp2_crit_hyst_store() relies on uninitialized cached data if inv=
oked before lm63_update_device()
--

commit 0ac9742e5a731c1457b701e413708de120dd3347
Author: Gui-Dong Han <hanguidong02@gmail.com>

hwmon: (lm63) Add locking to avoid TOCTOU

This patch adds locking to several show functions to prevent TOCTOU races
when accessing shared cached data, ensuring values remain stable during
calculations.

Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+XYS=
TU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 035176a98ce9c..b8b1de5fa90f1 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c

[ ... ]

> @@ -592,9 +604,14 @@ static ssize_t temp2_crit_hyst_show(struct device *d=
ev,
>  				    struct device_attribute *dummy, char *buf)
>  {
>  	struct lm63_data *data =3D lm63_update_device(dev);
> -	return sprintf(buf, "%d\n", temp8_from_reg(data, 2)
> -		       + data->temp2_offset
> -		       - TEMP8_FROM_REG(data->temp2_crit_hyst));
> +	int temp;
> +
> +	mutex_lock(&data->update_lock);
> +	temp =3D temp8_from_reg(data, 2) + data->temp2_offset
> +	     - TEMP8_FROM_REG(data->temp2_crit_hyst);
> +	mutex_unlock(&data->update_lock);
> +
> +	return sprintf(buf, "%d\n", temp);
>  }

This isn't a bug introduced by this patch, but looking at the corresponding
store function, is there a pre-existing initialization issue?

static ssize_t temp2_crit_hyst_store(...)
{
        struct lm63_data *data =3D dev_get_drvdata(dev);
        ...
        mutex_lock(&data->update_lock);
        hyst =3D temp8_from_reg(data, 2) + data->temp2_offset - val;

Unlike the show functions, temp2_crit_hyst_store() retrieves the context
via dev_get_drvdata(dev) rather than calling lm63_update_device(dev).

If it is invoked before any show function (for example, by an init script
restoring settings on boot), will data->temp8[2] still be 0 due to the
initial devm_kzalloc()?

Could this cause the relative hysteresis to be computed against 0 instead
of the actual hardware default critical temperature, resulting in the
hardware's hysteresis register being misprogrammed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416135703.5326=
2-1-hanguidong02@gmail.com?part=3D1
