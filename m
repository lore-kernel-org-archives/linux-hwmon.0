Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AA6253F07
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768670182; cv=none; b=CPT2StU2zAAtT0voUplaWXhR006iV3PGDLgAVteXD0wfOOapLe9+U//s6c+UNX/B7a0bqyZYu9Xhjs2EUd02H46AFxHwfI9/UOuNPJc2QM/BFskEitenp0Bn+kqal+UPdCRv/ypm5VUvzL5IXUHHJY34cGpy+eFuRaRSU589+uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768670182; c=relaxed/simple;
	bh=XZ8qQTmJgsDlKe661P5iXEFq6xa7mHeyyguZErPXtT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjE48RWmBgArDymmP6x1Xnp+5hXDx97sgLgIZqop/BkV0SHaqX30b6bDll0uelw5zXTheIkOcjTw9CJPvABghHD6RGTbr8GETxM+JUxEUPe7zP3FlrHV18xVOmKDCVKAJlz4e97Ta7loYwJVP8DQqAkIinZnU5Yi4iDt0VPoH/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3UJ8IAX; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3UJ8IAX"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ad70765db9so2634415eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 09:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768670180; x=1769274980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4PPU26eDiciS4G6Di0XcBtKVmNWO7Np0WKIsYVDncg=;
        b=M3UJ8IAXh1Y3W5lzUL88BE/vZwsKSkdmmI4YH0qfl3CTBakE6tW6YUIjUFrzUSityK
         Q2nCvpmGdpctUH81sKWdxz1vHAwpIcPGLgPclAAg5LlfrvkTEQuxpR41D5tbXgHIyP17
         RrUVTOm3ckIuwTetaFU7+HRAgWp7FBO87gOQVs2NuzfC5HL2WSfV1CsRb74PVSVJKJMR
         +zk8N8udyfXuySZxnxvrrEsJ3/+R+fuVqZl/tO0ZMep2QaSluPnLy/Z3g4nV3EoDmdLN
         fwZ3iAZKBQew4UDTkqn0OCb/VKIBCYMOlp1jJqweqgay6OmKIVpItihFIc8BZTpjF17w
         fsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768670180; x=1769274980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4PPU26eDiciS4G6Di0XcBtKVmNWO7Np0WKIsYVDncg=;
        b=YPrc5djjmuvncPWV/g2iCAW0SOc9s1GsZsPMT5sfPNnDPwBSN3E/P1Pz/lbbX5wjta
         M3R4afcWkKciS9HppaHmpIIeW0LxhrmFqYlUUEnDxrS1ZEALrziO7fw3aLco/4Sgu//o
         LX8icyDX8t2QIwxVhvPqi1HLZ+yRr7UZDhnhO5q77659s/uNZtkYS8uKE5A8WIajqRLU
         VNTAzie12iL+PWNejCX+tDQnYTebsa2hd5uSlnBe04RceMUmp8RmynYNrxAwXaJlpPH5
         UR13E5cy2KmZxkLy1fw1GZuC8daEmF/OH4ONUOzj7va2LR16LDSEDY7DYHaMfUuTw2jE
         Mfgw==
X-Gm-Message-State: AOJu0YzxoMHH/MUYX9NJBGo+X84giPW1nob0C8fltStqJe7xbzgHM+vf
	CD1BIZf3Loj9O/qHqc7NrMoZ58m0oSEUvGW9kAYdj2/292kqDXY4CCTyl220iw==
X-Gm-Gg: AY/fxX7MLwc4jfO29PGw7h2OQ4sr7eAfhGCSwHCFZQV2GAfc1CEPeQOsk1epQEyrC8Y
	Cl4shIIlslpDYr84AQqsA/lEJPswNO8TrD+VWCEvY0LZwWvDsfe8WmgJTNPsr24m9gVo8QCBSWB
	FsL6757ktU3siyfldyLBnVlRVR8IJMmkGRStiFAfVf6NYKY3+2LmVWo4Uk7kbHoWnP/EuIcxIk2
	wmjhZk4CHBGY8R66neS1MKn5TMMnPgR93dG4XWqbtpxttDGmmNen0EOUHJH4KSsF1vbjijevmAD
	n7OvRnIfChDczzat3Cp2zvjgJSX7AlmgLRTxVYV0l9I6kcYcsqYl+Rp2yPUg4Wteqbdr+QkJDih
	B/HRekYnh5dsZ7Da6umXIB+zNrpvvDeeBAP85Efjbdhejai542KPRZF02TmqTrsafITb+8ACMus
	rtPb7NByb4H/tTbQ5lTeP3e/hh
X-Received: by 2002:a05:7300:cc14:b0:2b0:5696:26c0 with SMTP id 5a478bee46e88-2b6b4e28165mr6679776eec.2.1768670179873;
        Sat, 17 Jan 2026 09:16:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c0eefsm6524051eec.4.2026.01.17.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 09:16:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 17 Jan 2026 09:16:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: leobannocloutier@gmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	pali@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (dell-smm) Add Dell G15 5510 to fan
 control whitelist
Message-ID: <61499322-48a7-4a63-900d-b7a997d2d1e1@roeck-us.net>
References: <ef59dcf1-5a53-426b-8c17-00ddc8fe5d11@roeck-us.net>
 <20260117015315.214569-1-leobannocloutier@gmail.com>
 <20260117015315.214569-2-leobannocloutier@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117015315.214569-2-leobannocloutier@gmail.com>

On Fri, Jan 16, 2026 at 08:53:15PM -0500, leobannocloutier@gmail.com wrote:
> After running a system upgrade on a Dell G15 5510 (kernel upgraded from
> 6.17.8 to 6.18.4), the fans would spin at maximum speed whenever the AC
> power cable was plugged. I copied and adopted the fan control whitelist
> entry for the Dell G15 5511 to enable manual fan control.
> 
> Signed-off-by: Leo Banno-Cloutier <leobannocloutier@gmail.com>

Applied, after updating the patch description.

Guenter

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 6040a8940..93143cfc1 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1639,6 +1639,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>  	},
> +	{
> +		.ident = "Dell G15 5510",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>  	{
>  		.ident = "Dell G15 5511",
>  		.matches = {
