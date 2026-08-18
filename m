Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6313CC7C5
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 18:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787077391; cv=none; b=YcS1KAAvwfWpZAGQnyS71RrBMpZKC/dfjffIlvYFe0SxMWmcjf2JKXFnV6yuKxYY2C8hRr2V8dPVGn6Q3spYgYLGMZUS5U5fA520spgSR1Sq2W9smZzMzoqBDh4rPnzAeiruqop1xPpO97PESZ5Z94F1cJmVSLAiDraDnjY4rTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787077391; c=relaxed/simple;
	bh=W2SuNuQRm25JUDLdkOelPj6ph29jH3Acxv7E+VFBlqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UPvjpaRl4m5NtHUDoGdOxxUeO9gm4aZ1fYYNN2PYmGZr3g73C2iHYYv+yrE3O3tLkUTT1MkAt5XdLMlHoT+5B16+z9awtiTn0uEGbwz9GLYsK1GkStmJ6AciN73hffYZDV2+F9TjoZwfkZ03ckmfbQtOp8nOV2UhufAZa0lC5gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRkqa1wA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRkqa1wA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A621F00A3A;
	Tue, 18 Aug 2026 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787077390;
	bh=KLCVyeduU324AgJ8n25PEO0Jn0c9yxMBtn/5QrQqKYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WRkqa1wAy5HtztKy1yDDwpIyDBsaAZpwGcA6QfNNCd86WjKxcQh0aoxKlG4T6O1Cf
	 WSOkjAva51sRTQsJQyws/JN0MZ7F2+RyCKNWfQ5QRphmMol0hdDXjda6qqHNIHt4WL
	 yE5UFc14lLQq1f8ONPJ9aHTdZAnAbLaNFqQvkDFzjVNGWLLiZxHRmqqh/CeaIbngzu
	 HQ8rDTa2Yl7WwfVdVYELGjc83pSW6xnCQZRp4JZIm0iiyLWhsqk/asJx+OD8ybKtkx
	 DlNuzQ0IBgdAtVA5VOz3jJ5vXcp8U1TZzp9wAAV+7/3f4MlGOgUqQW79SAOjt4ImLj
	 v5gJpnCdIXIiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring
 and fan control
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U2ViYXN0acOhbiBQZXlyb3R0?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260818181345.203295-2-speyrott@gmail.com>
References: <20260818181345.203295-1-speyrott@gmail.com>
 <20260818181345.203295-2-speyrott@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 18:23:09 +0000
Message-Id: <20260818182310.32A621F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `um780xtx_suspend` PM callback propagates errors from `um780xt=
x_cache_state()`, which will abort the entire system suspend if an EC read =
fails or the profile is unknown.
--

--- Patch [1]: [PATCH v2 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring=
 and fan control ---
commit 7277194b4d85f9b2916cb9ff030086a488cff81b
Author: Sebasti=C3=A1n Peyrott <speyrott@gmail.com>

hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

This commit adds a DMI-gated hwmon driver for the embedded controller used =
by
the Minisforum UM780 XTX. It exposes CPU and system fan control temperatures
and tachometers, and allows selecting OEM CPU fan profiles and changing sys=
tem
fan transition temperatures. It also caches and restores settings across
suspend/resume.

> diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisfor=
um-um780xtx.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/minisforum-um780xtx.c

[ ... ]

> +static int um780xtx_suspend(struct device *dev)
> +{
> +	struct um780xtx_data *data =3D dev_get_drvdata(dev);
> +
> +	guard(hwmon_lock)(data->hwmon_dev);
> +	return um780xtx_cache_state(data);

[Severity: High]
Does returning this error abort the entire system suspend?

In um780xtx_suspend(), if communicating with the embedded controller fails
momentarily or returns an unknown profile, um780xtx_cache_state() returns
an error code like -ENODEV or -EIO. Propagating this error to the PM core
causes the system suspend operation to be aborted.

Should this code log a warning and return 0 instead of aborting suspend for
a fan state save failure?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818181345.2032=
95-2-speyrott@gmail.com?part=3D1
