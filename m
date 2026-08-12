Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B256427F94
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531394; cv=none; b=HioFJ5rwn5rX2+PoEcZcMWkV10MAeEmOuRb0zm1cn2vC8Zd1FV6Sn6PBhGJhCzBpapmlCDtCt9renMYHGhPo/UxhQQvoy7zc81DVe6kjugIzQJeMIMwWSY6MYpoz11ZDEc5sfqCk861UhYoJTr6EmtzWwbObaXpeX8dKAr3KL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531394; c=relaxed/simple;
	bh=4bVcXwR7onvnmwK3mH3dkLorkvIw5DvQvMp2jFsofo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gKvX5NgpX/E2cTovXOg7qipCFCAVmA+bOvpBYg9TsrARG3zqGJf51sUX1CcSgXxSX7f5sLeu2VJJQ+LUySkcNJQVmfHKTIlZUFmOYShgQap/v8ANv0/6FEl4uVCjf3ku0Nfi/VfOMuJEF357xmyF2upbO8bZUp2qSfxo6R02b10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXNh05zr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXNh05zr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA98D1F00A3A;
	Wed, 12 Aug 2026 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786531393;
	bh=xKKVx7nrhftX8WxK5NUUqLPvei5hW9cZBiO3lEjlpls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aXNh05zr6ulDh1T1KXTudodn3C/KyNW/hRUueGySXexTjM4raHz1HKhvIQ4sqnfNZ
	 4mPImnkdTxn3T6NEhWs5ctFyoqw9pRhGCc7biQTZDdq1ZtxWKCV0s7qWc12F8MnJuX
	 ne7bUCQ67tvw8URVBxW9eGz6nrWPTH+61g98u0sJcgOGTp/g5wU+a8QaATypbt+MO9
	 tBsC9KxboEd+rMYinZdUEbBcFwF1M0kYj5lIkUc3N0d1eMEookEMv8djDFfDOfMLzY
	 mjfAIJINufz44YUIr83wHEv536VqsWNI6KX286V3fj/A1tIz0SCPVQhiq4r4ltFM4+
	 f5cYMsXZL27Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III
 White Edition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260812103532.395049-4-renari@arimil.com>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-4-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 10:43:12 +0000
Message-Id: <20260812104312.EA98D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check on incoming HID report data in raw_event call=
back, leading to out-of-bounds read.
--

--- Patch [3]: [PATCH v3 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III W=
hite Edition ---
commit c24d3645c70fad1763a76ddee1293e1040bce990
Author: Will Smith <github@notthatwillsmith.com>
Subject: hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition

This commit adds support for the ROG Ryujin III White Edition cooler by
adding its USB product ID to the asus_rog_ryujin driver. It utilizes the
same report layout as the other Ryujin III variants.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index 79e5b6d6dae0a..702edb8313945 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
[ ... ]
> @@ -590,6 +591,8 @@ static const struct hid_device_id rog_ryujin_table[] =
=3D {
>  	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
>  	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHIT=
E),
> +	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },

[Severity: High]
This is a pre-existing issue, but does adding this new device expose it to =
an
out-of-bounds read in rog_ryujin_raw_event()?

If the new device sends a short report or has a short report descriptor,
rog_ryujin_raw_event() accesses data buffers without checking the size firs=
t:

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_raw_event() {
	struct rog_ryujin_data *priv =3D hid_get_drvdata(hdev);

	if (data[0] !=3D RYUJIN_CMD_PREFIX)
		return 0;
...
}

Would a malicious USB device sending a short report trigger a slab
out-of-bounds read here, or when reading larger offsets like
priv->info->fan_speed_offset? Should there be a size validation check
added to the raw event handler?

>  	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812103532.3950=
49-1-renari@arimil.com?part=3D3
