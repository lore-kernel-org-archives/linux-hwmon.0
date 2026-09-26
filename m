Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88755472071
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790454156; cv=none; b=RlUqQDLQLHa6ouc5hjvC4Un0s8OiJzJhEIcnnfk+FGpuIyyZlcyGCS/DPDPaYCNKr6CfcnZzES86nQg0r73whn1ER4C/B3R6tOG3hjvR07VLaSc2roet4w3GPHeY3GWN6d7gzEeazSFbBzuAAMxGXYTxKTmfuCdE5Pp4GwAJkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790454156; c=relaxed/simple;
	bh=z9jMUG55HtxWkLl+HhAWppHqiNUvDp2n8qmnfb3C/VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efaeaJPalELqpKRio1b94lorsTNWOCapPkiTop2YFeaIQD617+1qbrWzi66Al0Z905vW3fxViaMahfA7jX5ywlZcILPz5jzkD3wRl+lIJMaTy4ZRFKcX16zHx3r81N6cSFesTqcWg2E1xAh6XzyqFGQsaiujJpENQYuan0nqBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=j8hPZPZB; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="j8hPZPZB"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id C41B9BD8D2
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 23:22:31 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 40EB0BD8CA
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 23:22:31 +0300 (EEST)
Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 9A2271FF304
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 23:22:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790454150;
	bh=7UncYzXhWq4TBr27aqXftzhgIR88dvJWApzZd7nrD5s=;
	h=Received:From:Subject:To;
	b=j8hPZPZBVrz9BIAGXPtG8pAi79qEXO6zQ3Q74Pxd3epR6kj2BlRSfU4TmsxhcO+KM
	 3ivKFupG0bAgt0q1ASBNFJg+AQARw2IUoXql3iD3rAXlopC+RnI8FSj0+uBpBD/0Pg
	 W4rn/gZdiJSQYcGaxCM+RPeSNMBc5f3ZxYk19PoXJNo6oE8yrBevRDvpjvLF/chqm9
	 XaECwMrzNgOJgxgiE0D5N+vRmca2C79OVVtQkwCmvbzb+P/RwoG5rKH5vdHHKuY2y8
	 dsaOcCERsJSVl2j6qMAfrRGDIh3zeG783qZX+/4yUBIIwY1Kpd1hnI6isWll39WPtn
	 5slGrIubR1Ncg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.227.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj2-f41.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj2-f41.google.com with SMTP id
 98e67ed59e1d1-3a0abca97c0so998510a91.1
        for <linux-hwmon@vger.kernel.org>;
 Sat, 26 Sep 2026 13:22:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByggnCLahC8T5F4pJk1U1SbMQELKLF0Pbd9qObSrUHrFtCoCMZmaIlpidiul2sL5ezyRaVNgajZ4Nb2lQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJlkWy2Ei68mf2jEqmaR941hwdMF+xn86ELLYsQ5Ti9tUqU9Gzu
	pgxy2DPiO+fREyyULNK4RhvM4NerqwPoVOEM22ZnGDT2NSEIniPOS4V7VyaikJT3+X7chQLlcwp
	hvAnMi9LfNWODU01yK8ez07/3FqbYkBw=
X-Received: by 2002:a17:90b:5847:b0:3a0:b40d:827 with SMTP id
 98e67ed59e1d1-3a0b40d1ebamr5438590a91.0.1790454148933; Sat, 26 Sep 2026
 13:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 26 Sep 2026 22:22:17 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGiM=OGp9T=4B0VouHYU4ZZVAFTN0u8ThE82xzO-_V1aA@mail.gmail.com>
X-Gm-Features: AclHuK-2w66LiASkiFvCoMQDD08ofVnCMYU_6argHvoEzG0TF-dHbuwt5hJDS2w
Message-ID: 
 <CAGwozwGiM=OGp9T=4B0VouHYU4ZZVAFTN0u8ThE82xzO-_V1aA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon: (gpd-fan) Reset both fans to automatic on
 duo boards
To: alexei.solcanu@pm.me
Cc: Guenter Roeck <linux@roeck-us.net>,
 Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179045415089.517415.8904675070083342750@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 26 Sept 2026 at 22:12, Alexei Solcanu via B4 Relay
<devnull+alexei.solcanu.pm.me@kernel.org> wrote:
>
> From: Alexei Solcanu <alexei.solcanu@pm.me>
>
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
> fan control tool that exits leaves it running at that speed.
>
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
>
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.

We expect the Win Max 3 to release with the same register layout. Can
you verify it has two fans? If yes this is good to go.

I will try to pull this patch for testing. Second one will take a bit
longer because it needs (my) userspace changes.

Thanks,
Antheas

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> ---
>  drivers/hwmon/gpd-fan.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index ed212615b2f..b3b75f99f58 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -444,6 +444,7 @@ static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
>                 break;
>         case AUTOMATIC:
>                 gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
> +               gpd_ecram_write(data->drvdata, data->drvdata->pwm_write + 1, 0);
>                 break;
>         }
>  }
>
> --
> 2.55.0
>
>
>

