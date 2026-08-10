Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B334937FF61
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 05:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786338780; cv=none; b=oFo5LTF2UPZY0F2xPwasdh+PkXcw15CxBd6lJ4T4o69ZaQfg1nmuzyCOViSld+R2Gn6DqcXlQFGNEBv4CqXJ1o3dKFqFj5usjphrFYH7khU2sWQnuwsV5iCtqpVvP2/H2KDBSGV3at5rmRTLkKoZBYR1to5oWuPqn7rg0mXFelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786338780; c=relaxed/simple;
	bh=PQaIEao4jTTaHDGlCS37tKsixnJiFV4t0vC2T6zKBdg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o+Xzxgn3kgmqjADTSLGZxBmxJZXMQ1ZVajNjaaQtpsAURgRmyTorlKq9HBAnXx7zkOsSIrvl2V5Hk+1xj7YASaF8o1F2XqnplI2NXXTsBpc8WznM4hdT43EIN/8T2qgbVy42qToe5iNGUZcIkfzbGSPTSJLGzWFNuxi//YypkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ab+u07vw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ab+u07vw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C53B1F000E9;
	Mon, 10 Aug 2026 05:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786338779;
	bh=i9RdK5TNMfNsgpE6GahseI871DmN2jydqWHDVMvbqMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ab+u07vwWNAhM2tGaGtsTubL8tEJM+qhvPCeZ1xlN9t/3QaMydL8Kz9bWESCGv9g6
	 SAc9ux2muj1m+PDQoYhXPcIiTSjw02yPbDh+IWBmh7oS3Y/ctDqX2/YTtjM6Tr6K1M
	 oHv/2XqK6Lg0P8/JpSyNsdMfnNLAZkzDxTXq96VwV4RHTGbChSpdFi6DO9A47njxSw
	 NbepE3Wac6h1J0GyWmRdixWMEiMNzjtQvMTf/OQtSC6iV7SN5MWg5cOzhZPrpedmuM
	 Qx5ikI1L1Rkr7JX9tKZoeWY0K5BStVLkosmHbhIOkPaWimTgsdXoZgp4DuHGgi6gRa
	 EDdCirHA6WNSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (max6621) fix temperature clamp range
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
References: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 05:12:58 +0000
Message-Id: <20260810051259.3C53B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Reading a channel-specific alarm attribute returns the global aler=
t status and silently clears alerts for all channels.
--

--- Patch [1]: [PATCH v2 1/2] hwmon: (max6621) fix temperature clamp range =
---
commit 6a78b24a06173620d98274b9f9d004f988e65833
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (max6621) fix temperature clamp range

MAX6621_TEMP_INPUT_MIN and MAX6621_TEMP_INPUT_MAX are used to clamp the
writable offset and critical thresholds. They are defined as -127000 and
128000. Correct the limits to -128000 and 127000.

Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 temper=
ature sensor")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>

> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> index e86ec6d237ca6..16a3a61d25326 100644
> --- a/drivers/hwmon/max6621.c
> +++ b/drivers/hwmon/max6621.c
> @@ -17,8 +17,8 @@
> =20
>  #define MAX6621_DRV_NAME		"max6621"
>  #define MAX6621_TEMP_INPUT_REG_NUM	9
> -#define MAX6621_TEMP_INPUT_MIN		-127000
> -#define MAX6621_TEMP_INPUT_MAX		128000
> +#define MAX6621_TEMP_INPUT_MIN		-128000
> +#define MAX6621_TEMP_INPUT_MAX		127000

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in
max6621_read() when handling hwmon_temp_crit_alarm:

drivers/hwmon/max6621.c:max6621_read() {
    ...
		case hwmon_temp_crit_alarm:
			...
			ret =3D regmap_read(data->regmap,
					  MAX6621_TEMP_ALERT_CAUSE_REG,
					  &regval);
			...
			if (regval) {
				ret =3D i2c_smbus_write_byte(data->client,
						MAX6621_CLEAR_ALERT_REG);
				if (ret)
					return ret;
			}

			*val =3D !!regval;
    ...
}

Because MAX6621_TEMP_ALERT_CAUSE_REG is global, does reading a single
channel's alarm attribute incorrectly return the global alert status
regardless of the requested channel?

Furthermore, could the subsequent write to MAX6621_CLEAR_ALERT_REG silently
clear the alert state for all other channels?

Since unprivileged users can typically read these alarm attributes, would
this allow a local user to suppress system-wide thermal alarms by
continuously reading a single channel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/9d3a4f1895a47794bb3=
59a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com?part=3D1
