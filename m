Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AA6419300
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010905; cv=none; b=Hrhk3Oo5s76GNAlKsMEsTkHlq45iDK09aMklZGRUHTbk4ndmeRI21uxQasFbDSBaSvb8ikuHSeGoRQUvwZs/HdoFk/8BkS6zRJ+cA9/TEIFnJdsI9f2ze/lGkKaxW+3KFQdMGRLIjneAy27AV6pJvF0avCaB0zUMaXZPEZmE7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010905; c=relaxed/simple;
	bh=C8Z23G5fMKOxO2zCb/NuJRS28VYirRrmBHN0fhhaHfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPAVA8K4z60A7iHYCILuRxZxNUAR9/vzWneJyRriOqoVR8RfZ/N9BNOUvMEB/s/EjUTzMUzgy1n5OITh2rCh+7i4dkay1IDs8MbQAhtKv4uhp/0jIwjcfu4cmhUDQ+OO7UK81S6J+iFOi4PRVBvCQ7dVCncUes5qiARX6ojNj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+1q2anC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+1q2anC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso39302945ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010904; x=1781615704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEDbW2E0jYhxmhbQRn8cH1fVwccIh6hf9EUZ/KlZ/NE=;
        b=G+1q2anCkxtIlfRoZ13Mr+J6nWfZ55dOIZBEeObvSApqL0Zdqc5dspaCNJcQoeHWLg
         1K1bPl2kRJ/6Fiy8D9Fa2BnkcoXMVao+RL5/b9EHU3hg/HK745UcDk6B/StIziZTkm7O
         ye9NRAyl34ZowYZmwyz2WWTq2HzE6LbCXsV5Ggf6SfkUyaEd3S1NOZGfwkUKfQ9uInju
         VzVP1j4wByJAabZ4NWl3/JHbMSEFyYx/xB2Ht0kKZY6rIQqyr3YJQ1fU3H0DiBkRyrxt
         ME8t8d/jrArCW1dWnDwalMVQS07ug0dBY+bemQlqBJtom65AWRDhNdmkoeUo/BG19llY
         W8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010904; x=1781615704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OEDbW2E0jYhxmhbQRn8cH1fVwccIh6hf9EUZ/KlZ/NE=;
        b=SkjvlqcsygyzjXje+XPeysoFLEhjmaDDWyHT8X/2Vn+gd5cDWIOCvXkWWqWnezwBk4
         AIniwTMcip94zZCgX/Ihl2pxb46Q+BQF+UoiPTTLvhjg7GM/0+Nie2jy1yOY5tO9SbBz
         l/akaN3sLcR353QtQkIYhBW1nCn5o6uUBkaskuSlEL6TFZZHZzam6NIq3hQ8WEAR6R0N
         vNLMS1HjpPTK2nGVlnBA0hySG/O7NcPtJgeE+keGhV+QkXdGYhLS2LdmVaxyZIFiy/Lo
         H8zb5Pam0rfD5pjZass+K2uSmGeyaldH1Wk+tHvoMi3lPuKp7KwcBshxHr+sA35ZI3zL
         XCQw==
X-Forwarded-Encrypted: i=1; AFNElJ98zhkGl3dw7ZxbfikmZMDPHKx0uolcUkF3qzWe+pgznAvGwuESIxqCkWFO+PPr7271yusJWu6OnfyfNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh9UROIbhp6LIl+YEIv8rs/n+jbl/ynsOdntEdcuoOP3ZvpmyH
	4BJYQFdQGG28ETD25fTVmC6CqJ48AlmSQWLyxvWi5TVwnbq49V6OPP3T
X-Gm-Gg: Acq92OH3SYcCzVDwqVB7vgeNYRkJvI6LENVEx6bFsoOuyLhcroJCU0uGcRTDtCpSXxD
	0fM4H1FJDRYrJLRd7sgzfY4bOiVIO9VC2noiipfp6b4PiQ+qKd4Hz0/V8dMx8R8NclTKyTW7Wzd
	ogwt0Ix80A07MZIGjrJEZnl04TnQvBQCbTiqPDL6FPTRUwnhdZUwh/qpi424hyBA7F5wV5HQ9VA
	m4O6mIFXQKHVRsdDWfCkguuULWfRH5Jxl5EvDoafxHTcSpTDVRX8lfbld5TmJaFCk87NKzSWraa
	bgiwB434lPdLj75/llSPOws15RKq6AQM7Gj1ZPmgiadIsFS7NRNr2RViQ1+XBEp2WdYcdXh0QB4
	jEV1GlX7wmYFu8cR5CY8l/5hgkIiAJ3vCNjhl4Zht7rBvYbnNfcn2G+0q+gnwcx6PRVhLXHqn9t
	IC0JAodDH0yiOrjZ/jO1XAY1yhajLH1fWW4tWYd1tZMa09uMhCMfGa3Uuqlg==
X-Received: by 2002:a17:903:27cd:b0:2bf:2243:d4e9 with SMTP id d9443c01a7336-2c1e8233854mr149248775ad.13.1781010904032;
        Tue, 09 Jun 2026 06:15:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm264175375ad.18.2026.06.09.06.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:15:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 06:15:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v5 3/3] hwmon:(pmbus/xdp720) Fix driver issues xdp720/730
Message-ID: <e8dee0c9-7cc6-4687-ac0b-a81ac759ca41@roeck-us.net>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
 <20260609072231.15486-4-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609072231.15486-4-Ashish.Yadav@infineon.com>

On Tue, Jun 09, 2026 at 12:52:31PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Fix driver issues:
> - Adds the missing regulator and property files in include
> - Declares XDP720_DEFAULT_RIMON as unsigned constant
> - Declares struct pmbus_driver_info xdp720_info as constant
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/xdp720.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> index 0f106c13e7ca..b273e53a01f3 100644
> --- a/drivers/hwmon/pmbus/xdp720.c
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -17,13 +17,15 @@
>  #include <linux/of_device.h>
>  #include <linux/bitops.h>
>  #include <linux/math64.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  #include "pmbus.h"
>  
>  /*
>   * The IMON resistor required to generate the system overcurrent protection.
>   * Arbitrary default Rimon value: 2k Ohm
>   */
> -#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> +#define XDP720_DEFAULT_RIMON 2000000000U /* 2k ohm */
>  #define XDP720_TELEMETRY_AVG 0xE9
>  #define XDP720_TELEMETRY_AVG_GIMON BIT(10) /* high/low GIMON select */
>  
> @@ -38,7 +40,7 @@ struct xdp720_data {
>  	struct pmbus_driver_info info;
>  };
>  
> -static struct pmbus_driver_info xdp720_info = {
> +static const struct pmbus_driver_info xdp720_info = {
>  	.pages = 1,
>  	.format[PSC_VOLTAGE_IN] = direct,
>  	.format[PSC_VOLTAGE_OUT] = direct,
