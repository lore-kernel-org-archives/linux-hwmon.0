Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412384;
	b=snq36t2DLiKAbDjXHtaXVFBXAsmpziFQjg6ypCAPgFhe+Hb3pUHItMR/fGyaRlS+xen5
	 i59Wb0sZhTWBa0RjlvrdsZOeZEkQEmczG9lPJrmib9DsxUvf1+JP97VmPWChcrt6K9Gqa
	 F2mOYr+EzEvHRIVFHLOvf0Jzuk4JkVHU2HSvr+Q7pkFKbe0VK6QjSf9x0rRcsAfRQLUy5
	 oVQiQa899zNIrAawCnjQN805TklhTnBF3fzRylv1NQ8z51J7ZLEDQavyf4UEl4687anKI
	 fjp/6W+w3LPiKe7QBtE7xWMolQWf8rz/oYa5OB1vrlsoEjF+JjK9YLYHPoqZhiXT2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412384;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=YnQs/VnO3uDi/CvlZDqm1WcA2dR8BzRrwRasUr5NDt8=;
	b=C0NayLHlNpOC9sAVMh2AAcU31u09dP7/fe30L+Yc6ZX7yPpfTtBbBWtVPaykErrcONlp
	 MJO8VD8f9RZxKgPgRszN0sn0hQPYS4oN2FkzlfbgCdl/f7OnrgdOclRTjmLCy0K7Fl2QU
	 HYEQ5DULJ7N4IJ/e1hB7Jhv+n+U6GxN5gWPajgmQmYD20aiQfhVw/pRlLRWSpzzZA1qvL
	 aj/pI9Tbnq45Ouqcldkq88OyO5EIZ6+PAGBnfi78IP0BD+ZmOpr3VZr1lpo6ufHGHSTID
	 Idiy+oynLKobSvqC0aP09QrKFoMj+j1qrsB+axI/PUObB2jGyqeAVSCa0WwpzXTc6Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZaZTG878;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A2606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 15:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZaZTG878
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id R7vlxht4iJFmFRAdCxTfPE; Wed, 11 Nov 2026 15:53:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RAdBxpRejxmi7RAdBxFq9Z; Wed, 11 Nov 2026 15:53:02 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af48f5e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=8k6WQxmsAAAA:8
 a=_jlGtV7tAAAA:8 a=8xMw9ceNJr6PjkPXCpEA:9 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=YnQs/VnO3uDi/CvlZDqm1WcA2dR8BzRrwRasUr5NDt8=; b=ZaZTG878FbSx
	1YZ5fh/TeVCQEY61fYS/zTHfuPexDTEnidX1xekt9v8Om5vPRQZSzbucQpeJsvPTd//zURytf9UdL
	ewGkPN6w5NJeWqiTWBkq1ptk8bnUF9xT7O52iOZlp+F+j7yzvchy3Oj79KtsBex6IuDuby/bzzJfk
	72QfvLqDLCygiAetUTcuAR6Q+uPd/9LfopSiFXveu1cerJv8F7dSyw6qGE86wQlukAVWfytniRapz
	VVkJB7kWlTbr+esbvhH28/ZHoHz+RPcF1RVH0z4o5xJka+TjDxi8Vydm0L2bxxnhHtLwRA7vd09a5
	ajI8pR8pTfD3Sb7fn4yHqw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48080)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRAdB-00000000nWa-1hCo;
	Wed, 11 Nov 2026 21:23:01 +0530
Message-ID: <a3f77c44-12be-4845-996a-013117f8f33a@roeck-us.net>
Date: Wed, 11 Nov 2026 07:53:00 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] hwmon: nct6683: Add support for NCT6801D
To: Jiqi Li <lijq9@lenovo.com>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com
References: <20261111091338.799889-1-lijq9@lenovo.com>
 <20261111091338.799889-2-lijq9@lenovo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261111091338.799889-2-lijq9@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xRAdB-00000000nWa-1hCo
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:48080
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHAYQBa1+HnAXMQhIHOdzgeY8zfYnalDxn+1UMQHa/EPQo6O1SgdnjekbQdTlxr69Latko6hLKqRFcpGbuEA9PfAbNe4Rf+O7M0gpVp5mKTbJqI1fCnI
 qNv0dO3TFo7Xa3+b952Y1wlbNszXDjp0Zl8hZbDdLUZpnIQrzsk9SNZZQE4mLbvmO4zp0OYXKkz+7zoOdWLE8d4RbuFHONFjnLS6Ks9rYgia5eNBttH4txvA

On 11/11/26 01:13, Jiqi Li wrote:
> Add support for the Nuvoton NCT6801D embedded controller used in the
> Lenovo P3 TWR G2.
> 
> The NCT6801D reports 0x0113 in the Super-I/O ID registers (20h/21h).
> Unlike the existing chips, the device variant is encoded in the lower
> nibble of that ID, which SIO_ID_MASK clears. Compare the full 16-bit
> value so the chip is actually matched.
> 
> While here, also reject a fully unset base address (0xffff). Without
> this the driver would happily register a platform device at 0xfff8
> (0xffff masked by IOREGION_ALIGNMENT) and expose bogus sensor values.
> 
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>
> ---
>   drivers/hwmon/nct6683.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index e1c36c95affb..42ad2c175de3 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   /*
>    * nct6683 - Driver for the hardware monitoring functionality of
> - *	     Nuvoton NCT6683D/NCT6686D/NCT6687D eSIO
> + *	     Nuvoton NCT6683D/NCT6686D/NCT6687D/NCT6801D eSIO
>    *
>    * Copyright (C) 2013  Guenter Roeck <linux@roeck-us.net>
>    *
> @@ -14,6 +14,7 @@
>    * nct6683d     21(1)   16      8       32(1) 0xc730
>    * nct6686d     21(1)   16      8       32(1) 0xd440
>    * nct6687d     21(1)   16      8       32(1) 0xd590
> + * nct6801d     21(1)   16      8       32(1) 0x0113
>    *
>    * Notes:
>    *	(1) Total number of vin and temp inputs is 32.
> @@ -34,7 +35,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   
> -enum kinds { nct6683, nct6686, nct6687 };
> +enum kinds { nct6683, nct6686, nct6687, nct6801 };
>   
>   static bool force;
>   module_param(force, bool, 0);
> @@ -44,12 +45,14 @@ static const char * const nct6683_device_names[] = {
>   	"nct6683",
>   	"nct6686",
>   	"nct6687",
> +	"nct6801",
>   };
>   
>   static const char * const nct6683_chip_names[] = {
>   	"NCT6683D",
>   	"NCT6686D",
>   	"NCT6687D",
> +	"NCT6801D",
>   };
>   
>   #define DRVNAME "nct6683"
> @@ -71,6 +74,7 @@ static const char * const nct6683_chip_names[] = {
>   #define SIO_NCT6683_ID		0xc730
>   #define SIO_NCT6686_ID		0xd440
>   #define SIO_NCT6687_ID		0xd590
> +#define SIO_NCT6801_ID		0x0113
>   #define SIO_ID_MASK		0xFFF0
>   
>   static inline void
> @@ -1394,6 +1398,17 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
>   		sio_data->kind = nct6687;
>   		break;
>   	default:
> +		/*
> +		 * The NCT6801D reports its device variant in the lower
> +		 * nibble of the ID register, which SIO_ID_MASK clears, so
> +		 * it cannot be a labelled case above. Only the switch
> +		 * expression is masked: val still holds the value read
> +		 * from the register.
> +		 */

I disagree. The case statement can check for SIO_NCT6801_ID & SIO_ID_MASK,
or better for something like SIO_NCT68XX_ID which would be 0x0110,
followed by a secondary check for the actual ID.
Also, not having the datasheet, question is if this is really correct
and documented or just an assumption.

> +		if (val == SIO_NCT6801_ID) {
> +			sio_data->kind = nct6801;
> +			break;
> +		}
>   		if (val != 0xffff)
>   			pr_debug("unsupported chip ID: 0x%04x\n", val);
>   		goto fail;
> @@ -1404,7 +1419,7 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
>   	val = (superio_inb(sioaddr, SIO_REG_ADDR) << 8)
>   	    | superio_inb(sioaddr, SIO_REG_ADDR + 1);
>   	addr = val & IOREGION_ALIGNMENT;
> -	if (addr == 0) {
> +	if (addr == 0 || val == 0xffff) {

Unexplained and likely either unrelated or not needed.

Thanks,
Guenter

>   		pr_err("EC base I/O port unconfigured\n");
>   		goto fail;
>   	}

