Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5648642C
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162809; cv=none; b=qpwvZ2gLrJ6ULzPIKX+VHLOzi+TW/3LRF3Xg2A1EAuLwxKABgGh+F3KXJt5E/skpiqBp4j86evYRE0fJyKrFX1+a4p5sZIhpSbZOovQDEmP7QCBggRG8lWMHEk6NNB6fjS1JBkrdLBrRk0a9tTWl/vIZfxtT1oxFFSPH/m/nrgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162809; c=relaxed/simple;
	bh=wUUTuEwrfC89Bk6zRIwGjO7vwt3E9SQDT/CGRnS191s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNhSAw0Adt2utniRIsI9CtFJ5DWWTNkWqx8VK1oacmuuRP03ovSC/JVDhWkAtXG25ZyP3qbQQsSVD9KILfIr230Ci02MUkSoO5+PZ0etcMLnV8HBKhgu+gX22oIE+/YLAfOzlfSXLjfBNLPUlENzGVBOgPoM0Wo1xxUj5qPULj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtQh8mlK; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtQh8mlK"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so31365a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 14:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162806; x=1789767606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CeQ7vx0KvkM9NOKTbl9EpM89WcQPA8FtwRV02R2rPEU=;
        b=OtQh8mlKggldb+caUR8zOiecvOeowoQwazFVClbnwmltHISn64SZyHI9k3iEeKJCQH
         ipbiZqU8MOJdmhpmXeYnGHT1FdG7D+64BblsEu5lSKXonvWJPmROcvYmo5K7ZCPEtF9l
         nUxFDDt2wss+ejXQjwFTd0+T1K0gzXIlYCeoER6rAgHCU9eZztiCfNrSkPrjtdkNkx8k
         c2kfEu9C2j0rGkJrY0aj8DFr7v7SmqB4gSy473ofJh2xYVCADPji9cF8ZV6mGOdEro3g
         MHI8meSNUA4ZcfdG6zivYx0gZcz/PUPqGSqgLd6OqyOAcMoU9vH/oReXI4R96YTWn+ja
         jJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162806; x=1789767606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeQ7vx0KvkM9NOKTbl9EpM89WcQPA8FtwRV02R2rPEU=;
        b=TdxdYhQwpBTHG1xLixyM7T3oJ200/kUC6ZvNJwJtI1VvB7fcO8xD24yEHDerkDQadM
         cEXVx25GxuUBLr5jGPxMqogp7r9N6Z9Ero0btvoCe34gPuEC/bLDF+3zguCk5l3lqYHz
         tGNfuPnl/TBNetuOiE/JCfEfl2lTMGvv0LgivwKtndpszLIsMPYFxUuQQGwlHmxsR/C9
         R5z0outqEUuEx+Qm8J50tFIClVyfH1TbyrUlEp24cwKSXUXfVhmX03AjK+gUkjnIoWOT
         J1ytBSIQVjt4D18x1Xab1Rcdz+9ptfNMx3r/TPa5SkK/RJQUu0fbg2iYxLtpGPoqmMwZ
         lbnA==
X-Forwarded-Encrypted: i=1; AKwUvBz0m+FixodKG9S1BDmlzPqM9sPwZYna/Wyqv5K9eZuspZzMgkCyefdVgUX5jltqlbf18ffvHKhWK7Tr7Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mfe4WYvFL/9551fR5BLSHD8Bju0mZzLoitNg1a2ioS1YojDqcw
	64esObxnlqDRNBAA/tAR22mvG1NKgPSdhtXDJQJrX5NOC8nlP5KqIZHA
X-Gm-Gg: AYBFou2J5NhMUKWgxKbB2ml4dXg0RE7PO0mrhLRPV43EP9pralqa5/K/La02/CTa+a6
	sKA686w2bSiKt5I74d2g5ZMfqnSLaq7k3KP9x/nW+B0gQdCJtDKuTqpK0W5fjxKsOnu63P14qCk
	CQoLG09NP799bevlETw6JXlx7gD+QXS6mc29Ec72bI5V54OFwILP6jOTQba+0/cjgiA9J/MhiQT
	HOo0J/BMuNq5PlhjN8CjKmKbVVmUMy9tpf2bwx4tm8jWCsIBKQb7jh+G346NT4z6EkKggVaeiRs
	WkOr5oBLn4XWMP9VZfbC+pKTU4HRXJQk0A7BfXOxf8kjSqq6CVqajIjJPoQt+F1N/9UIuncg+z9
	FBlDsAN7tAvdw5E6lfPb9An241UFRvJ2aiiASQKi27uxXlwOTLRYos/EoLZA34DYZ2gcr0wlN0A
	3bbDBNSxqgu1hqW5PpjYf/bGvzcM4ERUHgVqethr3u5NPyILXweLMnZiKoLbFeV8whrKaiu+k/U
	LVLW9jmllCY
X-Received: by 2002:a17:90b:280e:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39dbc0c3fa6mr241945a91.10.1789162805971;
        Fri, 11 Sep 2026 14:40:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e5c630sm7301184a91.6.2026.09.11.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:40:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 14:40:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: bhelgaas@google.com, clemens@ladisch.de, linux-hwmon@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (k10temp): Define unshared PCI device IDs
 locally
Message-ID: <8167c38d-5b9e-4889-821d-d05c7461def6@roeck-us.net>
References: <20260911191803.1522358-1-mario.limonciello@amd.com>
 <20260911191803.1522358-3-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911191803.1522358-3-mario.limonciello@amd.com>

On Fri, Sep 11, 2026 at 02:17:14PM -0500, Mario Limonciello wrote:
> Headers (now) only used by k10temp should not be declared in
> global headers.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I'll need an Ack from a PCI maintainer to apply this patch.

Thanks,
Guenter

> ---
> v2:
>  * New patch
> ---
>  drivers/hwmon/k10temp.c | 30 +++++++++++++++++++++---------
>  include/linux/pci_ids.h | 20 --------------------
>  2 files changed, 21 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 5414b7841864b..49a62d7349ca7 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -83,17 +83,29 @@ MODULE_PARM_DESC(force, "force loading on processors with erratum 319");
>   */
>  #define AMD_I3255_STR				"3255"
>  
> -/*
> - * PCI Device IDs for AMD's Family 17h-based SOCs.
> - * Defining locally as IDs are not shared.
> - */
> +/* PCI Device IDs. Defining locally as IDs are not shared. */
> +#define PCI_DEVICE_ID_AMD_11H_NB_MISC		0x1303
> +#define PCI_DEVICE_ID_AMD_CNB17H_F3		0x1703
> +#define PCI_DEVICE_ID_AMD_17H_DF_F3		0x1463
> +#define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3	0x15eb
> +#define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3	0x1493
> +#define PCI_DEVICE_ID_AMD_17H_M40H_DF_F3	0x13f3
> +#define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3	0x144b
> +#define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3	0x1443
>  #define PCI_DEVICE_ID_AMD_17H_M90H_DF_F3	0x1663
> -
> -/*
> - * PCI Device IDs for AMD's Family 1Ah-based SOCs.
> - * Defining locally as IDs are not shared.
> - */
> +#define PCI_DEVICE_ID_AMD_17H_MA0H_DF_F3	0x1727
> +#define PCI_DEVICE_ID_AMD_19H_DF_F3		0x1653
> +#define PCI_DEVICE_ID_AMD_19H_M10H_DF_F3	0x14b0
> +#define PCI_DEVICE_ID_AMD_19H_M40H_DF_F3	0x167c
> +#define PCI_DEVICE_ID_AMD_19H_M50H_DF_F3	0x166d
> +#define PCI_DEVICE_ID_AMD_19H_M60H_DF_F3	0x14e3
> +#define PCI_DEVICE_ID_AMD_19H_M70H_DF_F3	0x14f3
> +#define PCI_DEVICE_ID_AMD_19H_M78H_DF_F3	0x12fb
> +#define PCI_DEVICE_ID_AMD_1AH_M00H_DF_F3	0x12c3
> +#define PCI_DEVICE_ID_AMD_1AH_M20H_DF_F3	0x16fb
>  #define PCI_DEVICE_ID_AMD_1AH_M50H_DF_F3	0x12cb
> +#define PCI_DEVICE_ID_AMD_1AH_M60H_DF_F3	0x124b
> +#define PCI_DEVICE_ID_AMD_1AH_M70H_DF_F3	0x12bb
>  #define PCI_DEVICE_ID_AMD_1AH_M80H_DF_F3	0x1243
>  #define PCI_DEVICE_ID_AMD_1AH_M90H_DF_F3	0x127b
>  
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 63774ae2bf71d..7f2ce86695de4 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -550,7 +550,6 @@
>  #define PCI_DEVICE_ID_AMD_11H_NB_HT	0x1300
>  #define PCI_DEVICE_ID_AMD_11H_NB_MAP	0x1301
>  #define PCI_DEVICE_ID_AMD_11H_NB_DRAM	0x1302
> -#define PCI_DEVICE_ID_AMD_11H_NB_MISC	0x1303
>  #define PCI_DEVICE_ID_AMD_11H_NB_LINK	0x1304
>  #define PCI_DEVICE_ID_AMD_15H_M10H_F3	0x1403
>  #define PCI_DEVICE_ID_AMD_15H_M30H_NB_F3 0x141d
> @@ -567,28 +566,9 @@
>  #define PCI_DEVICE_ID_AMD_16H_NB_F4	0x1534
>  #define PCI_DEVICE_ID_AMD_16H_M30H_NB_F3 0x1583
>  #define PCI_DEVICE_ID_AMD_16H_M30H_NB_F4 0x1584
> -#define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
> -#define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
> -#define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
> -#define PCI_DEVICE_ID_AMD_17H_M40H_DF_F3 0x13f3
> -#define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3 0x144b
> -#define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
> -#define PCI_DEVICE_ID_AMD_17H_MA0H_DF_F3 0x1727
> -#define PCI_DEVICE_ID_AMD_19H_DF_F3	0x1653
> -#define PCI_DEVICE_ID_AMD_19H_M10H_DF_F3 0x14b0
> -#define PCI_DEVICE_ID_AMD_19H_M40H_DF_F3 0x167c
> -#define PCI_DEVICE_ID_AMD_19H_M50H_DF_F3 0x166d
> -#define PCI_DEVICE_ID_AMD_19H_M60H_DF_F3 0x14e3
> -#define PCI_DEVICE_ID_AMD_19H_M70H_DF_F3 0x14f3
> -#define PCI_DEVICE_ID_AMD_19H_M78H_DF_F3 0x12fb
> -#define PCI_DEVICE_ID_AMD_1AH_M00H_DF_F3 0x12c3
> -#define PCI_DEVICE_ID_AMD_1AH_M20H_DF_F3 0x16fb
> -#define PCI_DEVICE_ID_AMD_1AH_M60H_DF_F3 0x124b
> -#define PCI_DEVICE_ID_AMD_1AH_M70H_DF_F3 0x12bb
>  #define PCI_DEVICE_ID_AMD_MI200_DF_F3	0x14d3
>  #define PCI_DEVICE_ID_AMD_MI300_DF_F3	0x152b
>  #define PCI_DEVICE_ID_AMD_VANGOGH_USB	0x163a
> -#define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
>  #define PCI_DEVICE_ID_AMD_LANCE		0x2000
>  #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
>  #define PCI_DEVICE_ID_AMD_SCSI		0x2020
