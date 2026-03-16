Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2533A453F
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676067; cv=none; b=kExZujcyplTGR4Pe7xht2i7wSTHh81wgFigpi4LizZHNXthuVisEm7ZJOlP13E/GyFvcNkfJtGCneUrurBlJZVfrh5lKPPgY6Tevm0vLPW5vG4WlKXhIakS/+59nBmxHxCJaTY6GbomAiwo/ceVY8x9/S7Fh0IbvL28yJq4VIVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676067; c=relaxed/simple;
	bh=mt7njM8AMm3366rY9bZXkt/iQj9L9Y+U9ts2fzBUnT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+zAv87hcUN44qFd5uQ3RL0UMwo0XAIPKhOsvcqlYGLFOHG6bkfSR43Tja/RMBYCzf2g4ZSKR9R1pwvm5ZZ1wrtSyrZU7ShOu2J0fJcWf1QiwlnSgSiM9mMlgme80q1brnbrc73rsPp6mTZf8Vq0089iFx/G61AILg8zmHyDqWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIp015W9; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIp015W9"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2beab594d8eso6934327eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773676064; x=1774280864; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIbl9qFxJrmkiuonu3RjguYUay2gXS+vKFLd6XX8oOc=;
        b=LIp015W9YoJTicgjk8ovsupZRgmsJQjS/JWd+D3F2zRM8dRflWQ9O8pcbzHALWr6ay
         9cQF+ZcnVTSrsFqHkIIHNFqWfZaEq+1lgy4XIbG6ieETcUgYajTiN4QvZh2gaT3qucd1
         Zg4H3IUGbStHSpwJPOJLvOHPdeSScVPe6T+wSdv4BbLUcLgpGd9yzKuMFr7BhgbrKOSQ
         NH/CGbu2DnWSeBqhTQnok+jjBh6NuXn7lnBMsNk5bp+JwKbGPddB69ZM5hIGyYZyF3fM
         5nwh/APwOD+TjBxorMJ++ysRR9ltIxDKNlrjea7DuZtZcquUMscD4y+bJg7qqjc2QWxu
         h0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676064; x=1774280864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIbl9qFxJrmkiuonu3RjguYUay2gXS+vKFLd6XX8oOc=;
        b=aFJOTD9BnoWM2rXVMKSC993xemOIabVv377EEUD3W8GdkGDPqfgw8sADpAXyrucXyo
         dR9XSBrzda0hW2XRgCCo2K3c5nOQBy51abXeylEtRpijOBL0YB0bGUSUr+9vmhD426EP
         Swxrg51SydyxVjryhKUChp5nzpv8tgZpPxg6guvGSb7tqFULbO7VBo1Clfz0l/8QEAVe
         mEwYNJHvk9to8SfXTlEeXfCo7bvOD54AiYe4lusTtcOtyyTAGHnE99PpJ8+3YOzMjf5I
         wQWsGCwWz9uZSERrW5K9xFiTanp+STcmpDrFhljYoEbhvvEQwtUgT2hwsdRDhaSdbgzX
         M5oA==
X-Gm-Message-State: AOJu0YwdpTEhOxb5eSnr+QRECxS9Bf5DlE5kQVcz4vdO9c7LDM9SCA9A
	t+XmUckeOjmA6qjoAyY0S7vLS16MUR3Xzzx5srXRvmoZe3oWQcIWDAvA
X-Gm-Gg: ATEYQzwRbUliWA4RDLHlixBuwl7OewShqMqqj5Rx1aaIYrnc7Tg1aN1UCaWf6u6xiKx
	HQ7kdu54H0D5RSaCg/xyOLKQ295e60bsn8aj1XFsXBeI6aVAgJQ01pkYNWpmyqr4Ed6wiWY0hJn
	2n6eyqmg+z6GmDAizj9wHNZB6dMHYygscVYMtNyDkE1U/mZG5uEalwqEI07eTqR5uhDt6p+peSE
	FePshvs0JsUf2L9mpFIrJSmwgv5bKuzxacHA2fauuboW0dIeEuqtG5xCfvxQx3z+mwfYpeLynF/
	kJLBHFjoelNmKyeoKKkPUWyKy/KGQ+BuDt9G8U4mzcMcTuHoIR6w1mBjhIt7nLYlpFmIoURzHEh
	we3nf0g2WsO50pgQhEqvFbRjTm9my49fcNkdvFXijt0JObAL+dcOtL39UKwf7rRptkzYl24Ciuv
	xaqGf2E6LQF8G69h6D+RRf8xETul599o6hG7LN
X-Received: by 2002:a05:7300:c9e:b0:2ba:6b03:909b with SMTP id 5a478bee46e88-2bea558f037mr6495235eec.19.1773676064417;
        Mon, 16 Mar 2026 08:47:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0b1fc876csm9911380eec.29.2026.03.16.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:47:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Mar 2026 08:47:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com
Subject: Re: [PATCH 1/2] hwmon/pmbus: (isl68137) Add support for Renesas
 RAA228942 and RAA228943
Message-ID: <35c39de7-773a-4f94-b495-97eb25555a71@roeck-us.net>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316053541.3903-1-dawei.liu.jy@renesas.com>

On Mon, Mar 16, 2026 at 01:35:40PM +0800, Dawei Liu wrote:
> Both RAA228942 and RAA228943 are digital dual-output
> 16-Phase(X+Y ≤ 16) PWM controllers
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
> ---
>  Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
>  drivers/hwmon/pmbus/isl68137.c   |  6 ++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
> index e77f582c2..0ce20d091 100644
> --- a/Documentation/hwmon/isl68137.rst
> +++ b/Documentation/hwmon/isl68137.rst
> @@ -394,6 +394,26 @@ Supported chips:
>  
>        Provided by Renesas upon request and NDA
>  
> +  * Renesas RAA228942
> +
> +    Prefix: 'raa228942'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
> +  * Renesas RAA228943
> +
> +    Prefix: 'raa228943'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
>    * Renesas RAA229001
>  
>      Prefix: 'raa229001'
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 78cff9712..da2484d42 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -63,6 +63,8 @@ enum chips {
>  	raa228228,
>  	raa228244,
>  	raa228246,
> +	raa228942,
> +	raa228943,

AI:

  Is it necessary to add these entries to enum chips?
  Looking at the rest of the driver, this enum does not appear to be used
  anywhere. The device data mapping seems to rely on the variants enum
  (e.g., raa_dmpvr2_2rail_nontc) instead.

It has a point. 

Guenter

>  	raa229001,
>  	raa229004,
>  	raa229141,
> @@ -478,6 +480,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>  	{"raa228228", raa_dmpvr2_2rail_nontc},
>  	{"raa228244", raa_dmpvr2_2rail_nontc},
>  	{"raa228246", raa_dmpvr2_2rail_nontc},
> +	{"raa228942", raa_dmpvr2_2rail_nontc},
> +	{"raa228943", raa_dmpvr2_2rail_nontc},
>  	{"raa229001", raa_dmpvr2_2rail},
>  	{"raa229004", raa_dmpvr2_2rail},
>  	{"raa229141", raa_dmpvr2_2rail_pmbus},
> @@ -529,6 +533,8 @@ static const struct of_device_id isl68137_of_match[] = {
>  	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa228244", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa228246", .data = (void *)raa_dmpvr2_2rail_nontc },
> +	{ .compatible = "renesas,raa228942", .data = (void *)raa_dmpvr2_2rail_nontc },
> +	{ .compatible = "renesas,raa228943", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
>  	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
>  	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
