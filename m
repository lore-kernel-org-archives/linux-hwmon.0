Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339331F985
	for <linux-hwmon@vger.kernel.org>; Sun,  6 Sep 2026 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712531; cv=none; b=t2Immw+e+zZh+AUMn1BTlmiJ5x5l9vQEgwjBgembftDjPDW78H3ARWiqaUadMgo5GNL5NDSJtVZ4A9+68qg+pbBpIoaJ3t8mmPEWrVZpOwa7znArm+KKd7U1SXaN1ptAdfnwVf3jUpAxC++Nx2h/1iJPoixZSw0OeXUgTbwD1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712531; c=relaxed/simple;
	bh=h7/V0at/+NnzSzY6aIr+rxyoxqYmvVBXwXOt5aIeDb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPHpRtLd7derqXY6arau4CwJIcs5vfVNVSKlzI9KHk8JhnAr98ITqdSUyhfiZF1I4R8mw1OpU+L9NhuziCJ6lh/EyC/gd5Rw5txiMCdrqykCw6oDmvZbHRCy6M2SnD+xVnq1DQFSLsMjC7mlancAN7JaPzRihvXvoAkTh9rKTAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsVHdJ+A; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsVHdJ+A"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b3d66515so2639594a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 06 Sep 2026 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712529; x=1789317329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nudUPWM2QAIfEFELmaEz+5a6jh0fU341vXApFqIJxX0=;
        b=fsVHdJ+Alol5RfVCLNFmDxQvYGfnQKuPwKGALOmrliN+dSNCPXWYX1Ycz/XKI8uvRG
         LgdKgPWyFgE8kKV/CX1KufshBCkrF1tlI8CtLCrzzLxBd6lBTiHjJuiLYolHs/2+qeW6
         BaKvQOH1WxtNC/6DvbWFFxIRy5r+qm39zE1V4bDHaiqR2KomGcnu5rvmVmJaTx02mEQa
         DEv0svWg7gDHhgETNFuYF9go6sK2TcN6n1djVqsaXanJd0ZormxJfBi6VzVnS7ymEyMm
         KCm3JilJQzyy6pCsxbfO+JsZZIY1nXFB81rh+Vu9TGirFbRGqm/Kzj35bbR6jKKwcKTe
         dGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712529; x=1789317329;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nudUPWM2QAIfEFELmaEz+5a6jh0fU341vXApFqIJxX0=;
        b=Nba9DK7x8agIm+o5PI+49w/eSDp7dqkDN1tbdxq6rCQst2X9TrW+6v0ToElIa2x2vW
         T6tlceJ1zYqSPmgMRBcT52PXOAXXFTdU94i5IeNr/1iti94HNaUVO1lDGKMHlmehIFFd
         hzrOuZLnCeLhUfwXVQhyRIqLyPiEnsAP3CEz+XDrhBDU/rRjOpJxBlqetsLkggmyuT8A
         mn5+VOiPzCGkJnlZV7n9hv/YzHFKYTosKDj4jZATD2OAuev5iwh52KOeZ0Yi6g8K58rF
         esj2tVpPHuuzrV72gTlfW29LVPNuWjAmYucuyLPxzeD6/lUhrRAxk98GjU4Sal/afKjO
         Z9oQ==
X-Gm-Message-State: AFuF++mDILbmY2Sl/LsI4Mr3QlMUq9NrNKTvd3q/GWzWtXmh+7SHAEP/
	Yc8hO7A8Nx0lE5XjBAtxsCT50NcQegmEwFoRS9b8gtz0fuLF5E8nFjRl
X-Gm-Gg: AYBFou27QTX4f55qtZFZzJM6ex8BRzPaDNwkA/NmgVinlM5TV8++HLE/0azJoHGjK0O
	9HnevCFjWVVu3HxorDNO5dRxUoMdOv+BS4MgfJxjuFIW+kv5LmfErxF050bQ9C3IVnzvR98B+4e
	KcwJc/N8NWN4VF3srZ/R3Mf5nPBgRGi7ThJp06+MtxORO1B2G8wcDnzDKJfQhyd0XmfTURaKdar
	MbKmw7kqeiWgpfCm0tTXMTsf4qIdoNAp6X6wmRHYhF/OBjTuYTvyN50YCf8B/Pw6ldJo0yQHdVO
	QmLcPFTwcJ7+x5iWUKE+YK8AMbTWwk9szEJmjq+vYTDCXbz4KkJPiotNTutVzpmz2KofkIBh5dL
	mIsObumGl9IW5gVrICz+vZIdUTbBpyGk1OgR8V2da+CBDA9wboXpMfLXJPhXxrTlFrhi+M+ACey
	WH2QpCqpXNQ5wIqLun4j5CS7q+e9TzvcSTZ4/37jE8ezWBKEFrDcuf8K48Y0sbxY1W7i+ykjQQe
	xGTCLnb6RtD4uZlkOgesJ+PlhHLFKlOspPefA==
X-Received: by 2002:a17:90a:d44b:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-39b26203f11mr29397287a91.16.1788712529186;
        Sun, 06 Sep 2026 09:35:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm23627154c88.15.2026.09.06.09.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 09:35:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f83af616-c221-4276-a44f-31f5a0072f2b@roeck-us.net>
Date: Sun, 6 Sep 2026 09:35:27 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260906021023.766992-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260906021023.766992-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/26 19:10, Sergio Melas wrote:
> Add DMI quirk entries and map correct ACPI paths and configurations for
> additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
> and Yoga 740-15IML.
> 
> DMI product family matching is finally preferred over product name to
> reliably distinguish identical model numbers with different internal
> fan layouts:
> MODEL (DMI PN) | FAMILY / SERIES    | FULL ACPI OBJECT PATH
> 82KU           | IdeaPad 3 15ALC6   | \_SB.PCI0.LPC0.EC0.FAN0
> 82KU           | IdeaPad 3 15ALC6 ub| \_SB.PCI0.LPC0.EC0.FANS/FA2S
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> ---
>   Documentation/hwmon/yogafan.rst | 40 +++++++++++------------
>   drivers/hwmon/yogafan.c         | 58 +++++++++++++++++++++------------
>   2 files changed, 57 insertions(+), 41 deletions(-)
> 
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> index 9ff5db5dc..a7e628bc3 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -85,27 +85,26 @@ immediately to ensure the user knows the fan has stopped.
>   
>   ::
>   
> - MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
> + MODEL (DMI PN) | FAMILY / SERIES    | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
>    ----------------------------------------------------------------------------------------------------
> - 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> - 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> - 83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> - 83DN           | Yoga Pro 9 16IMH9 | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S  |  8-bit | 100
> - 82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> - 81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> - 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
> - 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
> - 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
> - 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
> - 82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
> - 83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> - 81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> - 83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> - 82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> - 83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> - 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
> - 83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> - *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
> + 82N7           | Yoga 14cACN        | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> + 80V2 / 81C3    | Yoga 710/720       | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> + 83E2 / 83DN    | Yoga Pro 7/9       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100

This is now combined, taking away the entry for Yoga Pro 9 16IMH9 and with it
0x06 and FA2S. Yet, it is not explained in the commit description.

This is just an example for unexplained changes.

> + 82A2 / 82A3    | Yoga Slim 7        | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> + 81YM / 82FG    | IdeaPad 5          | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> + 82JW / 82JU    | Legion 5 (AMD)     | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS/FA2S   | 16-bit | 1
> + 82WQ           | Legion 7i (Int)    | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS/FA2S   | 16-bit | 1
> + 82XV / 83DV    | LOQ 15/16          | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS/FA2S   | 16-bit | 1
> + 83AK           | ThinkBook G6       | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> + 81TD           | Yoga 740-15IML     | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
> + 81X1           | Flex 5             | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> + 83KF           | XiaoXinPro 13ARE   | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> + 82KU           | IdeaPad 3 15ALC6   | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> + 82KU           | IdeaPad 3 15ALC6 ub| 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> + 83RU           | Legion Pro 7 16    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> + 83KF           | Yoga Pro 7 14IAH   | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
> + 83BS           | Yoga 7 16ARP8      | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> + *Legacy*       | Pre-2020 Models    | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
>    ----------------------------------------------------------------------------------------------------
>   

This is doing way more than adding support for new devices. The entire array is
not only reformatted but reorganized, and the contents have changed. This makes it
all but impossible to determine what has actually changed and why those changes
were made.

I don't mind cleanups, but please do it with separate patches to distinguish it
from functional changes. One logical change per patch, please.

Also please address the concerns raised by Sashiko.

Thanks,
Guenter



>   METHODOLOGY & IDENTIFICATION:
> @@ -159,6 +158,7 @@ Contributors & DSDT Providers:
>   - **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
>   - **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
>   - **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
> +- **wizard-28** (IdeaPad 3 15ALC6 Ub - 82KU)
>   - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
>   - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
>   - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 413ddc721..2ce358c74 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
> +/**
> + * yogafan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
>    *
>    * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
>    * laptops by interfacing with the Embedded Controller (EC) via ACPI.
> @@ -53,6 +53,17 @@ struct yoga_fan_data {
>   };
>   
>   /* Specific configurations mapped via DMI */
> +static const struct yogafan_config yoga_740_15iml_cfg = {
> +	.multiplier = 100,
> +	.fan_count = 1,
> +	.paths = { "\\_SB.PCI0.LPCB.EC0.FANS", NULL }
> +};
> +
> +static const struct yogafan_config ideapad_3_15alc6_82ku_cfg = {
> +	.multiplier = 100,
> +	.fan_count = 2,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" },
> +};
>   
>   static const struct yogafan_config yoga_8bit_fans_cfg = {
>   	.multiplier = 100,
> @@ -90,17 +101,6 @@ static const struct yogafan_config yoga_pro_7_14iah10_cfg = {
>   	.paths = { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
>   };
>   
> -/*
> - * Lenovo Yoga Pro 9 16IMH9 (83DN) uses the PC00 namespace and has two
> - * 8-bit fan tachometer fields.
> - */
> -static const struct yogafan_config yoga_pro_83dn_cfg = {
> -	.multiplier = 100,
> -	.fan_count = 2,
> -	.paths = { "\\_SB.PC00.LPCB.EC0.FANS",
> -		   "\\_SB.PC00.LPCB.EC0.FA2S" }
> -};
> -
>   static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
>   {
>   	ktime_t now = ktime_get_boottime();
> @@ -200,6 +200,30 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
>   };
>   
>   static const struct dmi_system_id yogafan_quirks[] = {
> +	{
> +		.ident = "Lenovo Yoga 740-15IML",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 740-15IML"),
> +		},
> +		.driver_data = (void *)&yoga_740_15iml_cfg,
> +	},
> +	{
> +		.ident = "Lenovo IdeaPad 3 15ALC6 Ub",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6 Ub"),
> +		},
> +		.driver_data = (void *)&ideapad_3_15alc6_82ku_cfg,
> +	},
> +	{
> +		.ident = "Yoga 14cACN 2021",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
> +		},
> +		.driver_data = (void *)&yoga_8bit_fans_cfg,
> +	},
>   	{
>   		.ident = "Lenovo LOQ 15IAX9",
>   		.matches = {
> @@ -248,14 +272,6 @@ static const struct dmi_system_id yogafan_quirks[] = {
>   		},
>   		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
>   	},
> -	{
> -		.ident = "Lenovo Yoga Pro 9 16IMH9 (83DN)",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "83DN"),
> -		},
> -		.driver_data = (void *)&yoga_pro_83dn_cfg,
> -	},
>   	{
>   		.ident = "Lenovo Yoga",
>   		.matches = {

