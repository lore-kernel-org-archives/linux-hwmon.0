Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD75321CC7B
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211702; cv=none; b=dx9qYfEjADirGkqjMPjtsg/Bn7SUpTHUFOsWu8o4Y89WbfqZ/JHDoVRRQIsx1uUhLWk2yKGRHjd5MWIxN4elAYhW8Krdd1EjWxq8RKUW64pZFH95JkFjZogbirSLnUnoENjTlVw/19o9GHhs7kTsX+ONv8imDEkaHGxWC77lMHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211702; c=relaxed/simple;
	bh=XYynoBMqaT1uIjMbgDIg84i1cZ4yYg0+T4izPhaq9rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUmR0tPfy/rK4f1q/NZ3CBT7QVPJRYUzcJh4DWLbjy1oTGjQfCrVTfA1EBNvFbP1Z0EkIYrpeHVHYSMvSe+mLSClSQR/n25fRsDaQ9T8KlFvgR0he2tzohtjeecCqX1AL3PAe/p4sEoJ+STUKIrkpRuDJwnCD6ee1axISRpZSOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqMz1o92; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqMz1o92"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223a7065ff8so34094455ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742211700; x=1742816500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxlEmYXAPVzvaxIzVzV/aas62rv06fFDgvDWGK5sc5E=;
        b=iqMz1o92aeOuEsG0G/ymZaP5RLRGaGEPz1TtnjITNFZCKB8p02hGQE5p8e4w2j5P7F
         WPjR80wJYLtKPqMK1gxPimdmNm5+DpPw/oEzOYS5Y7vsNaTcU+JabpSXds1Kqq4aysbn
         q/R92kDpOKUBF8c6Q3Q+jwnxXZZXZTV2gGw9icAPHkVS1smuSeml/P0B15TXVN0JICcl
         aj5RtyqDayQ/LjM5KE4GYs3mM93tMKubeeV+fDPihlnH8xLBfhYey4A1ZG4hM5n93t2z
         3zB/yxJ1+1jt69PhaZQ5BoguV9LhYRB1Axsni6DkJj0WQlVeU4I+x9jltza4klMDLArp
         lfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211700; x=1742816500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxlEmYXAPVzvaxIzVzV/aas62rv06fFDgvDWGK5sc5E=;
        b=aP6FmEVjq+njTaswSkmK05cZ4ok/nDVb43RUki8WedY/LrOHs3rIZNL0KGlRy1Zshf
         5pDydkFhcmGY1/Sua8Ot55VVYpjmpYB7uBkYVB1FJIrnHthkd50Z6SAFGj5fOtibdmie
         keHgsS+V3wTA+u7zWTKRHOTpDrqAaOsaRMKaZMtIL3hG674CcBi8a14DyyvIiXMLihGn
         3j3k2M2z1s6zPJ8y+UTMt5wxuXQYo33Jy/KNIXWVAI+qHNyWBQUCIPR47CPtmQBF4Cc2
         mVMbqwu/VGM5I9NWrp/6jW8nFegv1tECaqKa3Xbh8uijNFLcaBjHkFWcpFi2Al4FknMX
         JdHQ==
X-Gm-Message-State: AOJu0YyNM2LGC8O7m3YSMXCgRJirql1ypHFqGaO4Bk9TVFjOgsZKItoM
	A1/SNFrey9J9bspeWlurfwXbYjCZY1lUzmLXxCg2h5As0Q/gZeOfA7xZnQ==
X-Gm-Gg: ASbGncszjeK9+7DLVhAKwB6ClrSyjAcQ9FVQ9pf8oM5zryPLuS2rTtp8jaMhp9pqxMf
	c/uAzp2mdYlyArpB32T8NTDlR8f7YNd7Y14Fu5H810syG8zT4PmKraQTUx1SVyiSUpMgcAwcOMv
	AVlXE7NLPUlhyH4zkH2ylMRcbA1+lhM1+ETL0T68hdWXuXto8vwc0tAqGgk/RvEudAdi49LrhEA
	WaihwzQe58LO6Ct3x5HcyRF1MyYy/JcxYyhvP+kColq1uDeO9Bz7rHPzvM2gCu3f96miDDJbe5h
	LUpSrCrlhfXlvJw9cTRPRSbdMxKeL6Ak0k+9VCqvnEoBapWt1ev4eXYOBw==
X-Google-Smtp-Source: AGHT+IFH6azgJt/xuOt+UXmGuboMx3Xyff8pDhE1rUzdH00qyh5N20M8zXLPueSogJ27x2Lje0+oFw==
X-Received: by 2002:a17:90b:3d85:b0:2f9:cf97:56a6 with SMTP id 98e67ed59e1d1-30151c88a66mr17363618a91.14.1742211699913;
        Mon, 17 Mar 2025 04:41:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301539d3f26sm5841134a91.8.2025.03.17.04.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:41:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Mar 2025 04:41:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: correct list and scope of LTC4286 HARDWARE
 MONITOR
Message-ID: <ad1f8871-def1-4a45-9b15-d968fc96e439@roeck-us.net>
References: <20250317091459.41462-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317091459.41462-2-wsa+renesas@sang-engineering.com>

On Mon, Mar 17, 2025 at 10:14:49AM +0100, Wolfram Sang wrote:
> This entry has a wrong list, i2c instead of hwmon. Also, it states to
> maintain Kconfig and Makefile which is not suitable for a single driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Found because I was wondering why each and every pmbus patch was sent to
> the i2c-list... I'd love to have this in 6.14, if possible

Applied.

Thanks,
Guenter

> 
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..68e312bcd006 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13750,12 +13750,10 @@ F:	drivers/hwmon/ltc4282.c
>  
>  LTC4286 HARDWARE MONITOR DRIVER
>  M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> -L:	linux-i2c@vger.kernel.org
> +L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
>  F:	Documentation/hwmon/ltc4286.rst
> -F:	drivers/hwmon/pmbus/Kconfig
> -F:	drivers/hwmon/pmbus/Makefile
>  F:	drivers/hwmon/pmbus/ltc4286.c
>  
>  LTC4306 I2C MULTIPLEXER DRIVER
