Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469403630A0
	for <linux-hwmon@vger.kernel.org>; Sun,  6 Sep 2026 22:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788734583; cv=none; b=J17M7JTGu0tNQdZnDRU81pJLjwityQuKVlc7iTYibZnEIy9eoWOp67xSnMtnSEz7FiSfOdTL0coAszwZPWnlFrLanRWCYxWgzJTEJgWtEHp38trlWhIyLnWB9ggH/bWvem5+kih+m339FKOISA8R3mk/n+uKkWdA2ypI22E8ClA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788734583; c=relaxed/simple;
	bh=OyaQgILTKZHVswix9S8dnA07HRilbrSTX045jeRONgA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tVNHiQL/BE6ga5p3ubY9ubLEDKsnVHjfo5t7KuKasWGsmyCaTgrsLMM+swNu+SKHCMzfOUjS7Kfejnc2J6sbAYuIiJJC7RUE2mBm48cLYtKEneci512ugn2MslUwSRnvPfgvlISD8LjODZzhZH92bPI59iStsYAhKf9iZxsSwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwbWE554; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwbWE554"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46ABE1F00A3A;
	Sun,  6 Sep 2026 22:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788734581;
	bh=qMHFB+cKlmMQ6WktwDGcjQS1+WObqOIEa8xto7b5oDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EwbWE554tE51D+lvhO1Pwi3XL8RvUDOY7/480ggXeztDHytAlFDYazxOFL7E/DtiF
	 lMm4ohbRvoJWXe8j8OLGCXglib7N983NIaHEdkSIDcih+13r3urFM21dql0qwIo/JR
	 FvG7rQ9t/1GoZNlaGeKHwi+JdbS4nVtwdQyPmEQdcXTfcCQ4qj8TX8jkqRQZwXS4vS
	 /qT4Ic89+J+twJf41+LLr/FabOuEJhya855egoNvLB84PnMrnAxOHa5ZNHoCgEtWnB
	 0EEglG2ax6xnUhVAwitPBbyGbPiTGSt18veCugPgLbPQeGa+HY8rNUGjQEKVPJv+SV
	 T2POH4syHyt2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (hih6130) Replace sprintf() with sysfs_emit()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Massinissa Ghoul" <massigh680@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260907-hwmon-hih6130-sysfs-emit-v1-1-a1adb5245d0f@gmail.com>
References: <20260907-hwmon-hih6130-sysfs-emit-v1-1-a1adb5245d0f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 22:43:00 +0000
Message-Id: <20260906224301.46ABE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver performs I2C transfers using a stack-allocated buffer, =
violating the DMA API and potentially causing memory corruption.
--

commit 8d977f465d31017a7624b9759009bb470f1a65cc
Author: Massinissa Ghoul <massigh680@gmail.com>

hwmon: (hih6130) Replace sprintf() with sysfs_emit()

Use sysfs_emit() instead of sprintf() in the sysfs show functions
hih6130_temperature_show() and hih6130_humidity_show() to use the
preferred kernel interface for writing to sysfs buffers.

> diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
> index 7984be1e706d5..6a79aab5d1285 100644
> --- a/drivers/hwmon/hih6130.c
> +++ b/drivers/hwmon/hih6130.c
> @@ -168,7 +168,7 @@ static ssize_t hih6130_temperature_show(struct device=
 *dev,
>  	ret =3D hih6130_update_measurements(dev);
>  	if (ret < 0)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but looking at the call to
hih6130_update_measurements(), is there a DMA-safety issue with how it
performs I2C transfers?

Inside hih6130_update_measurements(), a non-DMA-safe buffer is allocated
on the execution stack:

    unsigned char tmp[4];
    struct i2c_msg msgs[1] =3D {
        {
            .addr =3D client->addr,
            .flags =3D I2C_M_RD,
            .len =3D 4,
            .buf =3D tmp,
        }
    };

This stack buffer is then passed directly into I2C functions that may
initiate a DMA operation:

    ret =3D i2c_master_send(client, tmp, hih6130->write_length);
    ...
    ret =3D i2c_transfer(client->adapter, msgs, 1);

Could this lead to memory corruption or kernel panics if the underlying
I2C controller driver attempts to DMA map this stack memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-hwmon-hih6=
130-sysfs-emit-v1-1-a1adb5245d0f@gmail.com?part=3D1
