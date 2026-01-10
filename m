Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54442765E2;
	Sat, 10 Jan 2026 22:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768084046; cv=none; b=i6sm8fqB2Ft5VJJz20q9Kr/iNhkNK8sisGqJNrZsqAlg5CPbYXESUZCH7s/KfwxNsy1XCy5RreGbKCvilrX2oR5o1wvjklu+A4tWYcDNpygORMOoQkon4HyFFfkBrjZmOnCVWe9nYop1vCXL0XeuTJzpobsf1SNV//LVn5q2RW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768084046; c=relaxed/simple;
	bh=skatQEwaTrawTWE/l+J9e9kKWNzbvr7/I6mXdfImKl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=niAMsUYzl6NgORicj7i5qOL5Ru8Y7wzAKthEwQpOzsNewbJh549wOva8PQACax9+EZKuVVJ34oY/gLdynTp778CDYDQ1OoGDmZssmXNF6NE/ZkUhIcExpYo/URnvotYjCJOcmwVe8VJCmwr9SVe2K7kabk39WoZCroqTOe07SUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SatbTOpg; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SatbTOpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768084029; x=1768688829; i=w_armin@gmx.de;
	bh=JyC2kxQ8ynpLerEaU2AHJ5sYgNoeWWJKWYx1k0FHU3s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SatbTOpgTFz6GlikGMB6brkaCVnzg1GlYDy1CHTWacMho0svDo+cT/L0+/yuPRYX
	 KdXcafllKJPvCMNs7/VZlN0n0QlL3cASzrrTnKu3bbZAvYSZdZ/4jckXR3ZkIFJ5I
	 LA9jJt6Q3D8dAiG8nCpJuK2FYlzdB85DEDIemSMTPlJ3OcOdfeXA/KonosXBTyeFB
	 vdH50OHlYZfoxfJgtdlW5hLUV6aaaO7xEnOvBqbQ2knqt+53a5I/PZ+T2UaQhYVh5
	 6rs3HR1FOdEE/C280oN0Ted8hlNwrYW3XzaCBzneAvXpN70GLdKAkw683cotYxlq6
	 b/F5mzH1+6D0xre3LA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1vyIjt0ZTs-00zKjF; Sat, 10
 Jan 2026 23:27:09 +0100
Message-ID: <d08f3edd-f5bd-4e6b-b174-e768d42df281@gmx.de>
Date: Sat, 10 Jan 2026 23:27:07 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Tinsae Tadesse <tinsaetadesse2015@gmail.com>, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BcUPh0WFlb7uz+GgrpYe/iKtJaZ/nvP/e2oSnP7X3xKIIbLjJcp
 ehoryyG2XYPvQlU+O45K9+kf0XelJdCQLpgFlhjIQDfAV8ocDTH/F/4eQrqOcuXxZkgNkJn
 S2JGxj0LrhENXqh6ImNaErbmgLpm6lpl69qeSw5/Y1QOGM1rgauECSBH1HgI3m95kGULHWi
 gKioty0vIfZeyQM0Zhgsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WzUVH9iI4ps=;C/X5jhjGjFXV3v93gBYKt0X+8Jw
 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
 9Js4GYq0=

Am 10.01.26 um 18:19 schrieb Tinsae Tadesse:

> SPD5118 DDR5 temperature sensors may be temporarily unavailable
> during s2idle resume. Ignore temporary -ENXIO and -EIO errors during res=
ume and allow
> register synchronization to be retried later.

Hi,

do you know if the error is caused by the SPD5118 device itself or by the =
underlying
i2c controller? Please also share the output of "acpidump" and the name of=
 the i2c
controller used to communicate with the SPD5118.

> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> ---
>   drivers/hwmon/spd5118.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0..ec9f14f6e0df 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
>   {
>   	struct spd5118_data *data =3D dev_get_drvdata(dev);
>   	struct regmap *regmap =3D data->regmap;
> +	int ret;
>  =20
>   	regcache_cache_only(regmap, false);
> -	return regcache_sync(regmap);
> +	ret =3D regcache_sync(regmap);
> +	if(ret =3D=3D -ENXIO || ret =3D=3D -EIO) {
> +		dev_warn(dev, "SPD hub not responding on resume (%d), deferring init\=
n", ret);
> +		return 0;
> +	}

The specification says that the SPD5118 might take up to 10ms to initializ=
e its i2c interface
after power on. Can you test if simply waiting for 10ms before syncing the=
 regcache solves this
issue?

Thanks,
Armin Wolf

> +	return ret;
>   }
>  =20
>   static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd51=
18_resume);
