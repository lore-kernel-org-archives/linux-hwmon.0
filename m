Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B4382899;
	Sat, 11 Jan 2025 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736610758; cv=none; b=SssYNYVdSi8Ma52f90TWBuxCJdJUBnNhEHVUeko0/cZbOzYXcsn0ecjP0QXl/GeVA3jmYcaMemM2e9uA0hg7r12An1WhqVWIS4+hkUFHBLWHtUuJ3T0Q/LckOdkTdLnfxHqeqSteUalV4YFzGZXoI3dJqb+U3rob4v0YfuTSjXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736610758; c=relaxed/simple;
	bh=qmg0opw5XsODvX+u70D5g1sqZm6tgKKCd7C3Zoek87s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0lGfutN8aa/NB5lKuVlp4b+tI8zcW9fjvASsRFBHlybu+zX+9l8+IesWMe+3D7VDaye8DldjQPR1QIXmItgzmSZCTUcqZvEpskN+l1V2fkzfz0Ap5Y4Of0EcjztDdBA3HVyyGH9o2k4OOi2ql/jyfftvBkKs0L1VFjJ3DpynA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMjHJ/qt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMjHJ/qt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21669fd5c7cso51662665ad.3;
        Sat, 11 Jan 2025 07:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736610755; x=1737215555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoJfdlGOlAHr+H5NA/vW7cVTxQr7rVCeLq6oN2mkwlc=;
        b=XMjHJ/qt+1J6UODTXgjMDph6ll7+s59wTFSM90rSoGupLqdrwb4BOEqIj96QTg3JOp
         Kea9IumOCc4gBIgHeikfAdlgYZ8zBriT988/Pc0HMr/+8fqdHHd3uUCMf4R5ez+1/F50
         FVuziksoyf2HyP51VCg3+sCElQA85d6dLwSFSO8WZlYCRYDkPFppzv0A4vh+drn5nvNK
         FTZI0iXf70duUENTd1txW5OLeFpHDPE+1XspT+Wk0CAWv/ez+OqphRlAuDi7qMBmUVVQ
         SBNosGIs4dJQJDgfaF/q9TmP233qtfDwcjORIGtnlvrYYHD0OUH2Y11ppzQqzP++Gxxj
         4Kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736610755; x=1737215555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoJfdlGOlAHr+H5NA/vW7cVTxQr7rVCeLq6oN2mkwlc=;
        b=roZaXBZ2dwPiuuHgJT52KoTdBRFEyKA6Ilm/HemGT+eJxtZCDRSLeRl2cCbVnEnapu
         PHffZQB1FuxwGETl0fSpebpeKBkPGxh3ur6iLM9vEvUrIj4/2PQSL8tOJt3oRkV8h0M1
         ip3pUcrjXDTngv5fy5Swr3F3pfbwR1G8TTgZdCBaLgXdw9wpmKvtYYSoTYjF3RvPYrjt
         ATY/ZfgBNgEE1BvdL6APQiWkEKL3tXMacXZ3zVKUS+KdNS3wqmsM6w4RiFOJvdjvX/ug
         rqk8IhOosPOdeuIygbPBje0GUAeVq30arMMeRzRUF3YkY+LMHEcN/yA6wa6GVUKDh0wU
         XKWg==
X-Forwarded-Encrypted: i=1; AJvYcCUIs79JamzKadRYyHsBHV2EXToL7nKvGDjkgDT2NE9MpmW1kZl+U0ncuiOelAtg/Mx38nn/QT2kjo+ApQ==@vger.kernel.org, AJvYcCVUSjNZ1EMflFapvl7wbZxAancUAL3F1Za0oxUFFUscfba8Ga0hQbIq6dgs4b00EDPJbGCneDel5HwyM4Hy@vger.kernel.org
X-Gm-Message-State: AOJu0YzKWqT/OUIqLDNaC0q/GS1jZ2frSEq3Loib+cJ4WVRgOepD+P5l
	vBOYknCm4ZIlK2Qr8xDZt+vvmUdQYy4JL0xsth9CR/ddeLk2JA+F
X-Gm-Gg: ASbGncsjt1L3d9FwlixF5EzF0LYaC2HEhd98bwdSwicRwLWZ/lm9J7MshCVgqAVuJL/
	FVaHtcJBAlGD4Y1XzSAoiKQBRHyvzSdXznnFk/QzUD2HoNTTT09bAgYSGjXUj4t5eB3hx+OND5E
	meXMAzPRiDWyX9iOeR1we7BromOEfzYzoWoqaqNCnqkSYYcXLGYBGwynBAzugCOgTqvlIernlVY
	mQBlP86ApfJXQ8VVs4ZmHTxfhXqSshmZKKHIwfhZ6J5JyTaP+hUw7wZgv3/x1CieUuDKw==
X-Google-Smtp-Source: AGHT+IGOysrYTdg1RmL1T+f1Rt3qzH+hhV2d5ecLPOlPKmS77OkqFVsRm67cMKPz8M04UAAYfxgTeg==
X-Received: by 2002:a05:6a21:4a4b:b0:1e0:cbd1:8046 with SMTP id adf61e73a8af0-1e88cd28733mr22686981637.0.1736610755348;
        Sat, 11 Jan 2025 07:52:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a3c259314b1sm3912790a12.9.2025.01.11.07.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 07:52:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 11 Jan 2025 07:52:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Cc: Jean Delvare <jdelvare@suse.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] hwmon: Fix help text for aspeed-g6-pwm-tach
Message-ID: <7642492f-85d2-48d4-b988-d1ce9010c1d1@roeck-us.net>
References: <20250110114737.64035-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110114737.64035-1-joel@jms.id.au>

On Fri, Jan 10, 2025 at 10:17:36PM +1030, Joel Stanley wrote:
> The help text has the wrong module name mentioned, and the capitalisation
> of the title is inconsistent.
> 
> Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied.

Guenter

> ---
> The naming for this driver unusual; other aspeed devices are named for
> the soc name (ast2400, ast2500, etc) that introduced them, not the
> generation.
> 
> Additionally this driver uses the abbreviation "tach", while the other
> uses "tacho".
> 
>  drivers/hwmon/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index dd376602f3f1..9afa70f877cc 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -413,7 +413,7 @@ config SENSORS_ASPEED
>  	  will be called aspeed_pwm_tacho.
>  
>  config SENSORS_ASPEED_G6
> -	tristate "ASPEED g6 PWM and Fan tach driver"
> +	tristate "ASPEED G6 PWM and Fan tach driver"
>  	depends on ARCH_ASPEED || COMPILE_TEST
>  	depends on PWM
>  	help
> @@ -421,7 +421,7 @@ config SENSORS_ASPEED_G6
>  	  controllers.
>  
>  	  This driver can also be built as a module. If so, the module
> -	  will be called aspeed_pwm_tacho.
> +	  will be called aspeed_g6_pwm_tach.
>  
>  config SENSORS_ATXP1
>  	tristate "Attansic ATXP1 VID controller"
