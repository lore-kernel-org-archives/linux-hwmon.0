Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D40378803;
	Fri, 17 Jul 2026 21:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322592; cv=none; b=dz2EUga4eozsQH+2j+6ZVH1/si/HPC7yBy0lGoSzg//Zfp6VVGBPRP1ABCGG18FRjKXjr43aq1l/MPnh8Qjcf3Jgt4er/ZExq+vygdohChr1+pv0ZVRTmNql+3twPhk+W4C9krEdicqbkjXhoRKI/REoZeMDqWrG4W1clQoVmPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322592; c=relaxed/simple;
	bh=Q84eFp442145JNL7+aMSolfkrBDwAEyWsephECcUxQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OBTAYZlCHj5Cib2zpW/vVmAJUvK7+yTJ18xkT6njKFUV414VzEFpEqhVsGtRJl8ve3FPeM7R18uMI5jtJBtJJlkbmgVmoSzLfSmJa5RZ8IKnvCYI55jbmgrXWp5KZRHPbNdAXxhINAqx62eht04SIoaNO+ZXldQX8ntf2fNa6rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nu7C7WJy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nu7C7WJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C6F1F000E9;
	Fri, 17 Jul 2026 21:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784322591;
	bh=QVhCGj1S6dtYQ8k6bHIwuykkzxG6vqyIakUwCwPq3yI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nu7C7WJy5Uok9p1PNWfq6cwW3FAMscHK/xnnzpYT0rOvEluVdAqEsCptXhxFiduGJ
	 9Yjib/SyWTv1Vy3kGNj9BG2AnRkoStv8WJZo+S6yWflyQ38VJGEHEglmfrqS4boAlG
	 DcvvABoYHKFiB+W/BfPJmkx8K5GZP/leoWycO5he2OLDTELEz5GbEhZHHOZNVRX74p
	 j7KwfqRHHpssnisNFF5IIUmoNi/0a/ikhq+t7/kiTbTkmI1+3DC9GbSaLDhYNGQYSP
	 Jat/4TOtJ2yA7lQYIL9YUCPXDBYNtCvWlMlDSl7OANllOweaj49PC7+ePRm7TP44iu
	 MX+yDAcyzCRSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] hwmon: (adt7470) Add thermal zone sensor support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-adt7470_thermalzone-v2-6-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-6-a55147958fad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 21:09:50 +0000
Message-Id: <20260717210951.34C6F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The background update thread holds a private mutex during a multi-=
second sleep, which will severely stall the thermal subsystem polling.
--

--- Patch [6]: [PATCH v2 6/6] hwmon: (adt7470) Add thermal zone sensor supp=
ort ---
commit c1655de2721e60975758432b0053b21f699a5803
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Add thermal zone sensor support

This commit exposes the ADT7470 external temperature sensors to the thermal
framework using the HWMON_C_REGISTER_TZ flag.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index aaae14a421cd8..595a8f934d60a 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -1251,6 +1251,8 @@ static const struct hwmon_ops adt7470_hwmon_ops =3D=
 {
>  };
> =20
>  static const struct hwmon_channel_info * const adt7470_info[] =3D {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),

[Severity: High]
Could exposing this sensor to the thermal framework cause a regression by
stalling the thermal workqueue?

The thermal subsystem will automatically poll this sensor via adt7470_read(=
),
which acquires data->lock.

Concurrently, the driver's background kthread adt7470_update_thread() holds
this exact lock while executing msleep_interruptible() for up to 2 seconds
in adt7470_read_temperatures():

drivers/hwmon/adt7470.c:adt7470_update_thread() {
    ...
    mutex_lock(&data->lock);
    adt7470_read_temperatures(data);
    mutex_unlock(&data->lock);
    ...
}

drivers/hwmon/adt7470.c:adt7470_read_temperatures() {
    ...
    res =3D msleep_interruptible((data->num_temp_sensors >=3D 0 ?
                                data->num_temp_sensors * 200 :
                                TEMP_COLLECTION_TIME));
    ...
}

Will the thermal workqueue block for up to 2 seconds when trying to read the
temperature, risking a stall in thermal management for other zones sharing
the same workqueue?

>  	HWMON_CHANNEL_INFO(temp,
>  			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_th=
ermalzone-v2-0-a55147958fad@gmail.com?part=3D6
