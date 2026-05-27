Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E73E2AC1
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873290; cv=none; b=eY7LQvPypEQeAVxmCTENUBiDE6Edl/IUSdlQxo37b8DejZLer+KfXiVGywt5c5djWP3eCtK+RoQTaXNsI+Tij/utSGOee9SShJ4Z7CmPenlGPK0dmQqzluOinFMsEsVaBRiK+kl8G7acGg/uW0YEXyIS3O5zJzH9M5dT3ihwK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873290; c=relaxed/simple;
	bh=i0x7amVULmFuP9S5FtaWmbjZ0t4kfNs/IdPqOB+yuXw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dsm3t+airUT7nIRtfMRQI++nDPixoPf/ibnU7TJSPDDQ3pjSw47Q48nTeZ5BrT/PsT826Nn/+fKeR49acB8oK8x/XC8NFUJkai/VOx8O28yZF3RnijGGRYUFX+Q9wGMdxqRO33MOcgFBCPR12qI/m9aIHiVPKJlcRSNceAH02P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8s0GLZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8s0GLZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145651F000E9;
	Wed, 27 May 2026 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873285;
	bh=91o1Ydm52wn++N4OlTEE6eJiF84S4+EfAdzUOCld57k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8s0GLZZtVRm24FfM3sR64oT4usGoIi8gfPKKCfAdES8USw0GJ3ltli6klIt+snCw
	 sE+efPo+NVWxRRk01ECFbGweuMSOQ8uA8lpGuBzmvbgdPAUkb2C8gQtqc9vGeEPZyc
	 esR7RC19n0ior5lAfVxUnSn+LdJYeAOniaWrYwvG6RCiq/znSUR5a/qA6EV/nTk1jb
	 p8Ed/K/NrhL6mF6o18DLfVt/ns+v58FTSqHhAgCsTp47YJz1F1jC6KcHAFoOg/cux9
	 cDG1hi0NALWIEOiwsgYaW66IBNbOthW7nHB/KAsEXXRzZ4akBhV/AZX+UUO+K1zA4J
	 IEtmzr39aXmYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (gpd-fan): Initialize EC before
 registering hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_C95D6F2268B839A84420E7BD664E32E61C09@qq.com>
References: <tencent_C95D6F2268B839A84420E7BD664E32E61C09@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 09:14:44 +0000
Message-Id: <20260527091445.145651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware I/O race condition during driver removal due to missing l=
ocking and accessible sysfs nodes.
--

commit 88a13b9945f4d527437047edf383312f4bef1622
Author: Pei Xiao <xiaopei01@kylinos.cn>

hwmon: (gpd-fan): Initialize EC before registering hwmon device

This commit moves the gpd_init_ec() call to before the hwmon device
registration in the probe function. This prevents a window where sysfs
attributes could be exposed to userspace before the EC is properly
initialized, avoiding invalid reads or writes.

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 7284babd4f5c9..745b3fb9e3a49 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c

[ ... ]

> @@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
> =20
>  	dev_set_drvdata(dev, data);
> =20
> +	gpd_init_ec(data);
>  	hwdev =3D devm_hwmon_device_register_with_info(dev,
>  						     DRIVER_NAME,
>  						     data,
> @@ -651,9 +652,6 @@ static int gpd_fan_probe(struct platform_device *pdev)

[Severity: High]
This isn't a bug introduced by this patch, but does the use of devm for hwm=
on
registration create a hardware I/O race condition during driver removal?

Because the device is registered with devm_hwmon_device_register_with_info(=
),
unregistration is deferred until devres cleanup runs after the remove()
function finishes.

During gpd_fan_remove(), the driver attempts to reset the fan to automatic
mode by calling gpd_set_pwm_enable(), which issues multiple non-atomic outb=
()
instructions to the EC's index and data ports.

Since the sysfs attributes remain fully active and unregistered at this poi=
nt,
and gpd_fan_remove() does not employ any locking mechanism to serialize with
sysfs accesses (which are protected only by the hwmon core's lock), can
concurrent sysfs reads or writes trigger gpd_ecram_read() or
gpd_ecram_write() simultaneously?

This could interleave port accesses, potentially corrupting the EC's intern=
al
index state machine and causing unpredictable hardware behavior.

>  	if (IS_ERR(hwdev))
>  		return dev_err_probe(dev, PTR_ERR(hwdev),
>  				     "Failed to register hwmon device\n");
> -
> -	gpd_init_ec(data);
> -
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779868768.gi=
t.xiaopei01@kylinos.cn?part=3D2
