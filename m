Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D533644A2
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777040464; cv=none; b=P+Or/sscPNc4LmNWAQWVezNuFbj72K/tOI5eV8xRti4lkXP7pPEqq8Tpt6R5Hn0YrR0E9fVzqG5mnr+9Fld3kmhVUS6/7aA5/fUtKIp+V05fJFVAN+vH0+1M5OZAaa0OyBFo4ae2DRjIVY8EL6Da7eHYWc/TD14HMY7OsD3Aqs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777040464; c=relaxed/simple;
	bh=rYizP/LCE9tW4K9k+SxzpYjjVsjWeWcv64J1rY0rDZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hmk8KKotPzgSE8yd/Rwh2RCIlm2Nqi5pRrYX7xUwqS/h+IZJhvo6N4HyNGbNCEav3CJbm1TQ2ZDSR8HRAp1WgyKIIA1/ryfAZQ1yOZkIi1OMjaQdX4p6rS9dtf7Spmur9YvpoM0VFuvTtWJL1kVCcQZS5CBflFdusPitoIyWOeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkIduO+d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkIduO+d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D83BC2BCB2;
	Fri, 24 Apr 2026 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777040463;
	bh=rYizP/LCE9tW4K9k+SxzpYjjVsjWeWcv64J1rY0rDZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DkIduO+dTeA2XuYNfRG+zTu17cw+986kvoaMgC/NjwmUZzRO0LynMp05U634QeQ9x
	 2WYmLq9hufAOD89NGAHSdLCy/uN9V/l2Zy2BLRFfEUa2lk5o4LB7sETJkecIyjjLaj
	 a0YumnGqHLBUtb9UKBmTcSixG/vJ5Vk2CEqT7rfMTPX3SckfSAXwZtoK1YBqHPcP5/
	 H5tF0/0/4rKWHzCjiic3WMVhxKgmpTif3wkEPjvsHVHFOZPpPTrwUeOSXL5YGGqqVQ
	 +Bq7uARMzBoZLnoaNhpZH5EYCaHGCGzftTExFtwtoa61xWcW6bG3wQE+BIXgivbwxy
	 vJvLoM3loSNLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) Close HID device on probe errors
Reply-To: sashiko@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260424135107.13720-1-mhun512@gmail.com>
References: <20260424135107.13720-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 14:21:02 +0000
Message-Id: <20260424142103.6D83BC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Missing required locking for debugfs attributes and shared command=
 buffer.
--

commit f516eb8cbe20556b89a6e098a982bbc4318175c6
Author: Myeonghun Pak <mhun512@gmail.com>

hwmon: (corsair-psu) Close HID device on probe errors

This commit modifies the error handling path in corsairpsu_probe() to
properly balance the open count. It adds a new fail_and_close label so
the HID hardware is closed before stopping when initialization or firmware
queries fail.

> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index dddbd2463f8da7..76f3e1da68d09e 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -796,13 +796,13 @@ static int corsairpsu_probe(struct hid_device *hdev=
, const struct hid_device_id
>  	ret =3D corsairpsu_init(priv);

This isn't a bug introduced by this patch, but does the driver lack
required locking for the shared priv->cmd_buffer and priv->wait_completion
when accessed concurrently?

The hwmon guidelines state that drivers must implement locking for attribut=
es
registered outside the core (like debugfs) and should use hwmon_lock() and
hwmon_unlock().

Since corsairpsu_debugfs_init() registers attributes that eventually call
corsairpsu_usb_cmd(), these debugfs reads can execute concurrently with
standard sysfs reads. Inside corsairpsu_usb_cmd(), the driver uses a single
shared buffer:

Thread A:
    memset(priv->cmd_buffer, 0, CMD_BUFFER_SIZE);
    reinit_completion(&priv->wait_completion);
    hid_hw_output_report(...);

Thread B (before Thread A's reply arrives):
    memset(priv->cmd_buffer, 0, CMD_BUFFER_SIZE);
    reinit_completion(&priv->wait_completion);

When the device reply arrives, corsairpsu_raw_event() overwrites
cmd_buffer and calls complete(), which would wake only one waiter.

Can this concurrent access lead to corrupted device communication, missed
wakeups, or returning values for the wrong command?

>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "unable to initialize device (%d)\n", ret);
> -		goto fail_and_stop;
> +		goto fail_and_close;
>  	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260424135107.1372=
0-1-mhun512@gmail.com?part=3D1
