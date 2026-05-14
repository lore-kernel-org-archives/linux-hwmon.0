Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E876A3A8739
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759873; cv=none; b=m3bS+cPY+dUWBFNOQ0lKrUmWOgYctKi92HJuc7NaRYMnoCTcLf/aih31G5PAFXoOfXrXJkUYGNTu2whyKdtjMo9ScgTVlnD6AmkOxOJ+0kU6LFeotQQQjW1UAZW7G86qgiGNfWdg1Hnoci1ZRcoVaocJURANHgqH4XuX6kHmebM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759873; c=relaxed/simple;
	bh=P6YUF0aIhwdKYY80t6lmmIZfCgGxOomMgDT59Ogv8/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dwy8jAYb4zFvwJTtg4UEERcUXIdSFMvsyDcThXvLPPj/oo5EdyNRxqJ1gEmBsToGhvDB/VT5JtVuGZrbktT+SOhibxg044aGnQKAVg1bjWG8WOuUd8ibgAfublbHx3RxsZFAD5xKbTSi11zanc1WWZAYS/poGpD5tpIXyxHTbqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8L3OgYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8L3OgYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F41BC2BCB3;
	Thu, 14 May 2026 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759872;
	bh=P6YUF0aIhwdKYY80t6lmmIZfCgGxOomMgDT59Ogv8/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=b8L3OgYdcs4SWDGorAjSjzAm0QxlwBGJa/D8sYpzR7ZdAA6b1MXx6SkIoBs3EPJWw
	 gh9bbvXKaqOG0DwDmnQtpjgudqB8TDoUP8aI9ChDE+xMXLd/tK37TfgHFztcItE7Nl
	 UKrqLNXVMvSSP3Yok/BMqMPRjNs7zY+KANtP3MmCjmDxh2QBryCtxIYz2fuEMoVI3h
	 WHOKsmzSkPZW3CzFxkvE8Kn1szd3fcUJ9WEVaAHQvU5cvFY2svABJeP0DHAQemQUMT
	 fDialsoXG8szD9zvlWCQKOc1+osYgF6Pnyd6NkFXDqt47ggDELVXICr+3FmZ3Y9Pdz
	 UjgSnRRcm7Krg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer
 dereference when DMI match fails
Reply-To: sashiko-reviews@lists.linux.dev
To: Kean <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260514011411.4167069-3-rh_king@163.com>
References: <20260514011411.4167069-3-rh_king@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:57:52 +0000
Message-Id: <20260514115752.6F41BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added error path for DMI match failure introduces an I=
/O resource leak.
--

commit 6d1770785fa851d42148760f539b79225f6680d7
Author: Kean <rh_king@163.com>

hwmon: lenovo-ec-sensors: Fix NULL pointer dereference when DMI match fails

This commit adds a check to ensure dmi_first_match() does not return NULL
before accessing its driver_data. If no match is found, the probe function
now gracefully returns -ENODEV to prevent a kernel oops.

> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-=
sensors.c
> index 6cd83c378f091..10fc0376cb7f7 100644
> --- a/drivers/hwmon/lenovo-ec-sensors.c
> +++ b/drivers/hwmon/lenovo-ec-sensors.c

[ ... ]

> @@ -546,6 +546,8 @@ static int lenovo_ec_probe(struct platform_device *pd=
ev)
>  	}
> =20
>  	dmi_id =3D dmi_first_match(thinkstation_dmi_table);
> +	if (!dmi_id)
> +		return -ENODEV;

Does this new error path leak the I/O region requested earlier in the probe
function?

Looking earlier in lenovo_ec_probe(), request_region() is called to reserve
the I/O ports:

drivers/hwmon/lenovo-ec-sensors.c:lenovo_ec_probe() {
        ...
        if (!request_region(IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
                pr_err(":request fail\n");
                return -EIO;
        }
        ...
}

Other error paths in the function explicitly call release_region() before
returning, but this newly added return does not.

I note that this issue is resolved later in the series by the commit
"hwmon: lenovo-ec-sensors: Use devm_request_region for automatic cleanup".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514011411.4167=
069-1-rh_king@163.com?part=3D2
