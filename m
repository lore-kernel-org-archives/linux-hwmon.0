Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2F73E3C49
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 05:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786081209; cv=none; b=tiuIBYK9ULDPISsGIJIGIeURItDcxt8vdLz8rP1FYaaZIQUvubc7WLaKhKrKr3y4edrZEHz4OR8G1IRJDKOXGSfBvIz92lsMHccyqrGcCCczmTXaBmOgge4P7jGgE78IUrk8ibo6RckSVrmaOt0lTSq7MblQoBx4Fqs6oYjODeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786081209; c=relaxed/simple;
	bh=d2mhu2t1iiN8BgR2yswVf0GniLT20oro3msP/W4O/cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRA/o5dACPwCmbd1XUkolqMZBbXm/UpFQB8SLK1VtilanJjsbOtlb5NVh72KY+Sj72Dp5zpkfu9vmpiPgnI3otD7MeYRsAwNbA1EfiYx4k+P1b+y5L3g3h8LPB+SwenRsHYApG8tW7AHTDLtGWuAjQda5r1cpN5qal79pah24tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfpeAuVx; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfpeAuVx"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso2642052a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 22:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786081208; x=1786686008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/2CFve86d8ETlCPW39gaDcgsPAefy2+7l7EsXU0NfEs=;
        b=VfpeAuVxYHf3tmOdcNwWJIx5qtMIPq9KYuFVzleTO8gYMq10G/eAA7w1IpsKKAih8O
         OL+wax7DGrlGQdQv/Z6Bfu/ihzEYTrQ8GIPdhzhyXu9BwQa5yrLTz0iGZMB7uhV6vpz9
         e8YA0TLYfwrSdZFrbzKtx21dnQDnh/20TDJk6x370E3gCaKjb4rO4EaXlS7o3QzM1ojK
         PLvvbNIxg0AqJZkdVNQ3hTx67AMpNjxa9wAxruOaCvdQ9nZ8Bo1b51cDFG72ibePQ4+C
         d+i37iSC+6NVhbQRAGhvfKeJs8UhyGTXrKJ4EL2L0afguAePObUKvmfGC/0PS0MNhILw
         jAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081208; x=1786686008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2CFve86d8ETlCPW39gaDcgsPAefy2+7l7EsXU0NfEs=;
        b=hYPpH9BJgeDyjSRu+KcB+7eq1JJf4RTpnDDzGMTLBjr7bfY3aMlHZfjqx7si5xL+nJ
         Y6wbX2lXLEnncoF8GOPbdDfbL0hTvfLI5T2oSMGSp3KZ6jxAD4bUz6L+/byC6hVJB5pC
         DZ9GNww4NLi9g88gSaDoJ5f+RNG7EZCto/P1mHf357D9vtkM4ocJArISIg2d189qbTw5
         aKkKUNf6+36Ro4BVzK2X5YUR1Myo/3FBsLePA3mIcyI98D8rhUcR2FfGYs0Oyp+MOk8g
         3ZqOEieUuALC5UAUC945VdqW4YaD7F8+cxzWFsUxwOR2LYG118Xo8ZyyGeIaF6hzucMS
         FPhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0DC8M0InYQLkyPghTGt7H+DvVCou/qXw7NSEthAZTU1MIYXh0rVZWWE8GM+84lScHfWMTonWFNK2DZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTHTyoLvki2DAuYUdOSCcETEQOsiMQcUCnhgkP0lMtULUl9hQ
	x6JLClnlp2wOM65flePeXjeuEVKf6iGyytb7Dshbf0Q+wtpFCntuNazM
X-Gm-Gg: AR+sD11Af7xf20IHz7ZLDS3Ypp1qqviKDVEVk8Q6jek58B2xzJsa1HU5B1AwQIgb9WI
	1FceL4zmbjAN3BZYdg/munsgGjTHkOO6mtN6YI/dsvKiTgzOWvOUI3pTVNNUD5rNAyYFxWz+J/U
	NU7ThUB2cKi1rrQX6VmL8vOTEYyZGhr4SUhVfVVJpX7nNNKvzZNNDWYplvpnY7DOJtpt1kUiJsP
	kA0p8+KXBg/BwI2c6BPict0eTbn8/snI+BzFktmLEpokuSmXvd1Y/Srbg9ZdetgA+oGtOFqqj1D
	X3GpK+ZcDoDrHKT9pCwZce16XtWIj9vis0faAIV7nJ837Eh1SMAYba0iXcHkcpmfbnNy8fKbSGN
	d++eERfCY2r1tAj1I1ybLNnTep9gdL2V/sBQTAcy1B7w9TXwf2RKyz1y7QAAtoZxUmWgZWuvYbv
	vx/0v27xex4HyKnHnLytRs3YgaAaXfIOTDGXpbxI4btkz5kS7ODagRVRumVx+X/4IljaygOq4qu
	oa4WN/MbKDGsQ==
X-Received: by 2002:a05:6a21:4c0c:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cb85dbd1f2mr25329840637.13.1786081207762;
        Thu, 06 Aug 2026 22:40:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm3245738eec.4.2026.08.06.22.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:40:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 22:40:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: update documentation
Message-ID: <02c32669-9942-4aa8-80e4-66d4c8dffb58@roeck-us.net>
References: <anVuBd8Bb7T66OUO@monster.localdomain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anVuBd8Bb7T66OUO@monster.localdomain>

On Fri, Aug 07, 2026 at 05:32:54AM +0000, Wilken Gottwalt wrote:
> Add information about the HX1500i 2025 series and fix the missing
> HX1500i in Kbuild.
> 
> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/corsair-psu.rst | 6 +++---
>  drivers/hwmon/Kconfig               | 4 ++--
>  drivers/hwmon/corsair-psu.c         | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
> index 2e99cfd556a0..8d3636292076 100644
> --- a/Documentation/hwmon/corsair-psu.rst
> +++ b/Documentation/hwmon/corsair-psu.rst
> @@ -19,7 +19,7 @@ Supported devices:
>  
>    Corsair HX1200i (Legacy, Series 2023 and Series 2025)
>  
> -  Corsair HX1500i (Legacy and Series 2023)
> +  Corsair HX1500i (Legacy, Series 2023 and Series 2025)
>  
>    Corsair RM550i
>  
> @@ -93,8 +93,8 @@ Debugfs entries
>  ---------------
>  
>  =======================	========================================================
> -ocpmode                 Single or multi rail mode of the PCIe power connectors
> -product                 Product name of the psu
> +ocpmode			Single or multi rail mode of the PCIe power connectors
> +product			Product name of the psu
>  uptime			Session uptime of the psu
>  uptime_total		Total uptime of the psu
>  vendor			Vendor name of the psu
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d59..3d7cfa429f5d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -506,8 +506,8 @@ config SENSORS_CORSAIR_PSU
>  	  If you say yes here you get support for Corsair PSUs with a HID
>  	  interface.
>  	  Currently this driver supports the (RM/HX)550i, (RM/HX)650i,
> -	  (RM/HX)750i, (RM/HX)850i, (RM/HX)1000i and HX1200i power supplies
> -	  by Corsair.
> +	  (RM/HX)750i, (RM/HX)850i, (RM/HX)1000i, HX1200i and HX1500i power
> +	  supplies by Corsair.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called corsair-psu.
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index ce958cdaef58..3b4cbf696e80 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -875,7 +875,7 @@ static const struct hid_device_id corsairpsu_idtable[] = {
>  	{ HID_USB_DEVICE(0x1b1c, 0x1c0c) }, /* Corsair RM850i */
>  	{ HID_USB_DEVICE(0x1b1c, 0x1c0d) }, /* Corsair RM1000i */
>  	{ HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsair HX1000i Series 2023 */
> -	{ HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy and Series 2023 */
> +	{ HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy, Series 2023 and 2025 */
>  	{ HID_USB_DEVICE(0x1b1c, 0x1c23) }, /* Corsair HX1200i Series 2023 */
>  	{ HID_USB_DEVICE(0x1b1c, 0x1c27) }, /* Corsair HX1200i Series 2025 */
>  	{ },
