Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80195426419
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 23:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786492324; cv=none; b=pjc77Bb1II3yMNkAXeWLz32VFTvxlwGwBRIZZTfVPIo5QIs0zJixLuay0Ko2i/V5jIAz1hitJ976t2vJm6rGEB1tB6fv33L8qAjD6KjXuXeLv6RIP7FSNIu/geTKVXx64aeXxFDHlpapiJF4mjDSAtkMJABhQ8g2KdlvlJgJssI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786492324; c=relaxed/simple;
	bh=JUzNKe/IibhK9kf/cqhMj5OhZlr67+4i2j6tViWimTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=avE3Lv6aWKfZln4t2b7Sin8aK4spZor2WB/IZdmhxZ6Hf2adl7VifkUaZ2YO3YHm5I0b7+pBefFOfUdXMacZSQXlr0/pmUP7r/lXLPEQ/YWVe2lIrTyNjjOqWyRYoKWA2wsL+UE5bjYnxgRqDAbpPwvZE+Tmo3kjbHjOauRl99g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2zxThQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2zxThQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B23A1F000E9;
	Tue, 11 Aug 2026 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492323;
	bh=wPSC9wQWKnMfrJ+J1LhIRUt8k/Y/vl7S2b+mX7Tfv60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2zxThQGiJ0ukB43BqyxMlYWXBxrBwbgSGE3pbP6vJ2JRrHh9UZojuS6plbbOB8A/
	 nHrpgkVDJNSCnCVLVR+XGPfQHbX+qIbwlsP0Gh3SFI1MgpxfOSoVTIGhjC3JLrCE7c
	 UprpeJpHNrx+HAp/aGSq7DWVnl+HRivMnBQHhe8tsfnnlRInqUBz9L0vJHDmBneEbg
	 GevD7iFJ8y4snnalOvu/b55YiBiN2++Hlc0003AW51v4oHkoLWHUHTnGQr0XrG0ZbW
	 3sqQ8Ct157/itSdvseO2pKKDudSwli2wWCOuxH8U7tzKk7osN1i/dkaeEodpmX0394
	 igLnpkz6+GaYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (asus_rog_ryujin) Add ROG Ryujin III
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260811233943.319729-3-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
 <20260811233943.319729-3-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 23:52:02 +0000
Message-Id: <20260811235203.3B23A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing size validation in `rog_ryujin_raw_event` allows out-of-bo=
unds memory reads.
- [High] The `status_report_request_lock` spinlock is ignored in `rog_ryuji=
n_raw_event`, causing data races on completion states.
--

--- Patch [2]: [PATCH v2 2/4] hwmon: (asus_rog_ryujin) Add ROG Ryujin III s=
upport ---
commit b5b4a6af3fd216324c49f933284fb63343c21174
Author: Arie Miller <renari@arimil.com>

hwmon: (asus_rog_ryujin) Add ROG Ryujin III support

This commit adds model data, USB IDs, and report offsets for the ROG Ryujin
III Extreme and EVA Edition variants. It also skips controller commands
and hides unavailable controller channels for these devices.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index b86b87e33615d..5bc60c6036de3 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
[ ... ]
> @@ -34,6 +36,14 @@ static const struct rog_ryujin_device_info rog_ryujin_=
ii_360_info =3D {
>  	.has_controller =3D true,
>  };
> =20
> +static const struct rog_ryujin_device_info rog_ryujin_iii_info =3D {
> +	.temp_offset =3D 5,
> +	.pump_speed_offset =3D 7,
> +	.fan_speed_offset =3D 10,
> +	.duty_channel =3D 1,
> +	.has_controller =3D false,
> +};
> +

[Severity: High]
This is a pre-existing issue, but does rog_ryujin_raw_event() adequately
validate the report size before using these offsets?

If a malicious USB device provides a descriptor with a small max report size
but sends a valid-looking command prefix, the driver will read offsets up to
priv->info->fan_speed_offset without checking if the report size is
sufficient.

Could this cause an out-of-bounds read when accessing the payload fields?

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_raw_event() {
    ...
    priv->temp_input[0] =3D data[priv->info->temp_offset] * 1000 +
                          data[priv->info->temp_offset + 1] * 100;
    priv->speed_input[0] =3D
            get_unaligned_le16(data + priv->info->pump_speed_offset);
    ...
}

[Severity: High]
This is also a pre-existing issue, but is the status_report_request_lock
effective if it is ignored in rog_ryujin_raw_event()?

rog_ryujin_execute_cmd() acquires status_report_request_lock to protect
reinit_completion():

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_execute_cmd() {
    ...
    spin_lock_bh(&priv->status_report_request_lock);
    reinit_completion(status_completion);
    spin_unlock_bh(&priv->status_report_request_lock);
    ...
}

However, rog_ryujin_raw_event() ignores this lock when calling complete_all=
():

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_raw_event() {
    ...
    if (!completion_done(&priv->cooler_status_received))
        complete_all(&priv->cooler_status_received);
    ...
}

Could this lead to data races on the completion states and spurious sysfs
read/write timeouts when a USB raw event arrives concurrently with a
driver sysfs command?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811233943.3197=
29-1-renari@arimil.com?part=3D2
