Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F43E286D4D
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 05:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787377470; cv=none; b=AwQujyaA8Xg1cJejZ3LrAISfYA+VQO0G0g0VFAAFxumx1gSlYbEohllkbqU4n2KM3OK8PM8hHv33BH79dsr3Dv2ta7lRZuRI7pUidLqizPvyW9KgHIrdcMVE09/vKAJALukO2N+Y5pUdlYVZJrYUeyHQ6oiLpwJqQN+lTEvC4L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787377470; c=relaxed/simple;
	bh=5ZcAEaE/zBVUG6WXsYkNFrz5u0QICJhizvAL0EosyeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ekdBk6pn9dIRZ7+cJDtxtLazFNomgquinv7U6/UYjcGVACtN/ZbBw/MUIFSCivNBczDzWHYeYoRd7DX0vTIct/ImWnN5h8JiYXVH+32WL5H4HUeot8jUgr2K70D6WV5q+60r/vVZMM6XzJKlLyFGBALlfPOQJ1gSupfC8AzOBEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpQQkG6e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpQQkG6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55F71F000E9;
	Sat, 22 Aug 2026 05:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787377469;
	bh=K3EK2N7CEApyLKYNye3FoL/8YG+X3zOwO1MezdFev24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RpQQkG6eVU3uxGT3gDhr6kDl1pL82pIoUJtMla7rDS21DmT9dvqRO51ZQE37pn5wc
	 UEl7iuYpM/PRbcC8V3+5biZEyW5+qz9tDkwilw97fgq1GvCdYoNEi8r5bzCfwME3aZ
	 njgvmaaC/Q8Woe8w7mURH77YIO71qc1/5NovFC/5fQevmBqfxiBHmmwR7ItoIJs1B7
	 0xaKDxuOOI9yKAVDYsdoC4Evn5yJ4uJhEVuOstk9Du4Zt8GLOdT/D7zrY82BkmbQEL
	 kaRQ+l1JBpup5tuoKG+HQ+wAzUdbsrvHe8D6A2XfYIZgZJR6uDzCWp3Ez44gz57My7
	 KEU8Afvz47M6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: valid the data size before reading the sensor
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edward Adam Davis" <eadavis@qq.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_8FCF9A8DDF25A10DCC12265DF45DBE995307@qq.com>
References: <6a891232.91706f20.16b6e3.02b0.GAE@google.com>
 <tencent_8FCF9A8DDF25A10DCC12265DF45DBE995307@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 05:44:28 +0000
Message-Id: <20260822054428.D55F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The patch introduces a regression that breaks sensor updates for m=
ultiple legitimate devices by incorrectly validating the status report size=
 against the control report size.

Pre-existing issues:
- [High] The patch fails to prevent out-of-bounds reads for several devices=
 because their `buffer_size` is never initialized, leaving the vulnerabilit=
y completely unfixed.
--

--- Patch [1]: [PATCH] hwmon: valid the data size before reading the sensor=
 data ---
commit 551cce5fc615bfa2ca7512a6e77f7f9ea4f91fc7
Author: Edward Adam Davis <eadavis@qq.com>

hwmon: valid the data size before reading the sensor data

This patch adds a size check in aqc_raw_event() to abort reading if the
sensor data size is smaller than the expected buffer size. This aims to
prevent a KASAN out-of-bounds read when processing maliciously short
user-forged sensor data.

Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D9ee5f5dc18673d6b2f37
Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>

> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomp=
uter_d5next.c
> index 1ca70e7262988..1cc6c220ffe96 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -1334,6 +1334,9 @@ static int aqc_raw_event(struct hid_device *hdev, s=
truct hid_report *report, u8
> =20
>  	priv =3D hid_get_drvdata(hdev);
> =20
> +	if (size < priv->buffer_size)
> +		return 0;
> +

[Severity: High]
Will this check inadvertently drop legitimate hardware sensor updates for
devices like d5next or aquaero?

The incoming asynchronous input status report size is being compared against
priv->buffer_size, which stores the size of the device's control feature
report. For non-legacy devices, priv->buffer_size is initialized during pro=
be
to large values (e.g., 809 bytes for d5next and 2707 bytes for aquaero), wh=
ile
valid status input reports are significantly smaller.

Since the legitimate status report size naturally falls short of the control
report size, won't this cause the driver to silently discard all valid sens=
or
updates for these devices?

[Severity: High]
This is a pre-existing issue, but does this check fail to prevent the
out-of-bounds read for several devices where priv->buffer_size is 0?

The aqc_data struct is allocated with devm_kzalloc(), meaning
priv->buffer_size defaults to 0. While devices like d5next initialize this
field, it is intentionally left unassigned (and thus 0) for devices like
leakshield, highflownext, aquastreamult, and farbwerk:

drivers/hwmon/aquacomputer_d5next.c:aqc_probe() {
    ...
	case USB_PRODUCT_ID_HIGHFLOWNEXT:
		priv->kind =3D highflownext;
		priv->num_fans =3D 0;
		priv->num_temp_sensors =3D HIGHFLOWNEXT_NUM_SENSORS;
    ...
}

When a maliciously small report is received for one of these devices, the
check evaluates to size < 0, which is always false. Doesn't this bypass the
validation entirely, allowing the driver to read from hardcoded offsets well
past the end of the short report?

>  	/* Info provided with every report */
>  	priv->serial_number[0] =3D get_unaligned_be16(data + priv->serial_numbe=
r_start_offset);
>  	priv->serial_number[1] =3D get_unaligned_be16(data + priv->serial_numbe=
r_start_offset +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_8FCF9A8DDF2=
5A10DCC12265DF45DBE995307@qq.com?part=3D1
