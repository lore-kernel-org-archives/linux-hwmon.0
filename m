Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6C24A33
	for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 00:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785024401; cv=none; b=bxK3KqC4/iigj3WRVzxSCSysdJD3S4AsvFVeU4FA1SAoHLEPp4uzMy1Ar37VelwnPni9kuaKBnHtroO2SiDVRNwt/ZEVxoyFk6Qf+g9ZY18KmmgWLDxHHT61CxPbwPs+O8OlZj+vuaY/WWMBBqusejFnsN64V4fjnxCkhlHRVdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785024401; c=relaxed/simple;
	bh=4uum5U030OVwI4hSbEUirufkKHba7ZlEqbcQ166AaFg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FmO/S2b54sxBsUMepxVzllNn3vYaeMsZQLSvaPnXBAmRE3k1i0lWbG/ZkapiWP/ic81OU2+NoqQzjPdWtnPuIsRu2P6L4TW/uyaugZQNNesOA6hNiMufGZy9HBQIOf0TXHGOyGfj4PHovFiCHf1yFcrZ02awdCnZO0yzVb7gSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPPCjLVy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPPCjLVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB56F1F000E9;
	Sun, 26 Jul 2026 00:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785024400;
	bh=oUOFG7m11wzUff2O5F8grjxicKtfX/c00/McfM7lNJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UPPCjLVy1UnE7IJmgHg5SfqZwbtaIup2hUqB3rS1UnRiDbXm+yARtnkuwOTZ8PCph
	 SFQgv8hJAe192XRBdg8ZXUlZG2MSV0Ego2rDKH66Sp1kISXkkfReZr46Z29ho0bGfR
	 RgzvqZkVFWpDRgfRX3Gzx6pIEyQOZ5mQRvwEkdBHZwspxOW/oW5wrfAuzQ2CTGS+WR
	 xE2VcM9d4wuUpg9g/84yUdI0Jgl4YpdQwrvBYkswVv8RSNx2p0VvxBpjAoJtSMhb1O
	 be5Vllh/+vd6d0yPbN7Rp+vuZ9V/yk3KUNDj4QLm8Dw0rBhzxowwAFBtmLmixq7jSV
	 357NUTggRjz2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm90) Only report alarms if driver is ready
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260725234831.1949014-1-linux@roeck-us.net>
References: <20260725234831.1949014-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 00:06:39 +0000
Message-Id: <20260726000639.EB56F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete Fix / Use-After-Free and NULL Pointer Dereference via a=
lert_work
--

--- Patch [1]: [PATCH] hwmon: (lm90) Only report alarms if driver is ready =
---
commit 79dff8acd6e841981f1482b13b5476e90ffaad24
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (lm90) Only report alarms if driver is ready

This commit fixes a NULL pointer dereference by ensuring report_work is
only scheduled if data->hwmon_dev is set. This prevents a crash when
userspace reads sysfs attributes before driver registration completes.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 4b9c0ccdf2609..b03f75f4ddec2 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1194,7 +1194,7 @@ static int lm90_update_alarms_locked(struct lm90_da=
ta *data, bool force)
>  		check_enable =3D (client->irq || !(data->config_orig & 0x80)) &&
>  			(data->config & 0x80);
> =20
> -		if (force || check_enable)
> +		if (data->hwmon_dev && (force || check_enable))
>  			schedule_work(&data->report_work);
> =20
>  		/*

[Severity: High]
This is a pre-existing issue, but does this fix also need to be applied
to alert_work scheduled further down in this function?

If userspace reads an attribute during the registration window and alarms
are active, it looks like alert_work can still be scheduled while
data->hwmon_dev is NULL:

drivers/hwmon/lm90.c:lm90_update_alarms_locked() {
    ...
		if (check_enable) {
			if (!(data->current_alarms & data->alert_alarms)) {
				...
			} else {
				schedule_delayed_work(&data->alert_work,
					max_t(int, HZ, msecs_to_jiffies(data->update_interval)));
			}
		}
    ...
}

If devm_hwmon_device_register_with_info() subsequently fails in lm90_probe(=
),
devres frees the data structure. Since lm90_stop_work hasn't been registered
yet on this error path, alert_work wouldn't be cancelled.

Could this result in a use-after-free when the delayed timer fires, or a
NULL pointer dereference if the work executes and calls lm90_update_alarms()
before data->hwmon_dev is assigned?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725234831.1949=
014-1-linux@roeck-us.net?part=3D1
