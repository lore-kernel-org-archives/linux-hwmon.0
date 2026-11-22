Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366026;
	b=XU/qXM7f9oRRlPhxBX8UKOxfsvNeQ52Y9DGGJ2k6pJ0Sttr+BuaY0zTe8K3kPJqwKsWD
	 70GmNm9W6fxLsExz0Cd4GYaqU/a9jRynKJdlyv+H3VU1gMQsWBlnFPFGy/IRWG8AWOZg3
	 wRkjG1RV1OMr1NTwsBRp1WqWzWsjLnX64Ygw64JsZyFVXEvlryIBCTowTXzyJ7JXgJJXw
	 kUAEavisOVG9E9Tg0lpLL1ZahCdoaJSzSB7RxWLNEnPXSBvArrSzKGL5qj+toylrEFpfe
	 hhWi1y7pewgRqaUrbad7d6xQMrdoPvDTYyAriuSYXbH2CDiccpyKLCbG52w6qVXf8pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366026;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=CcgUOigE4hpRX+rHA0yhwTQDEsteqQkBf6OiVwFSbwU=;
	b=maOhcrq+dWiiBlKCATvLXhOSOZF3Tt2TEq2xQMOP+0oRaxcuY/SMUKYZEPjLdhWTuBNu
	 AYLCxvF4v7oKx8/hL01SDqw4vK2/9iF5IyATsLnVYCjqHAxhq3pYOPCjJuoU3ylUeWkz8
	 kxMbAnat44apx3/r10Bw609dpfanLNEl5W11xHj8GNVgPWT35Nl0tgCWfH+3Jwo0bh0tr
	 7Ht8yOnS/6rQyOsGyp7P7zzRmexh9YQU1LC6s4uzrseVunhg5FvrrrHz2yc80EcUB9aRR
	 UDoyGuHC1ymrZHBJKY/+SWZMs0S1cqGyMWf0O4R9Z3RcMk7rnzjWeiEEAs0Fk6pAMuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="e1sqG/4L";
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A896D606A32A
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 16:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A896D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=e1sqG/4L
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id UzvfxDanTOOJnVAiWxygUE; Sun, 22 Nov 2026 16:47:04 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VAiWxQGS7b2qJVAiWxpyqN; Sun, 22 Nov 2026 16:47:04 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6b031c88
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=dZ8iJ22SkCJ4RyOMX0oA:9 a=CjuIK1q_8ugA:10 a=Cz_zCYZHDdu2HsMO07vL:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CcgUOigE4hpRX+rHA0yhwTQDEsteqQkBf6OiVwFSbwU=; b=e1sqG/4LlQZn8szLeqSqRIxL5A
	DnqJ+kcIJV4mwG/ILFifJuhNeqRtPKNJ+WbsT9wIp4sOL2L5qp2KwEkbKlr47+pVC6mkmVNygHECO
	WBNKGnRPoMr/JM0TVsJwb/vFhN4n5YgOXun8HvkF8bCU748/u6BqLO45+dWD6P4ladQh4smgz1mKO
	vSY5rLR2tcTlusMAoBywB8U6nCTsRAcwtCxNYD9BwcrsWQivaKkjClASWZaLBtGQ4CQgNtHyGDzgH
	Ec2ShhkskMW3WgoK772vjMy96YpzAj8e6GECBTsIPwrtHVc9E134GCIcB95I4O/7JnzjRa1GAYtXb
	be/eTxyQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55994 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVAiW-00000002mLu-0NUO;
	Sun, 22 Nov 2026 22:17:04 +0530
Date: Sun, 22 Nov 2026 08:47:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Navon John Lukose <navonjohnlukose@gmail.com>
Cc: sergiomelas@gmail.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10
Message-ID: <b672573a-f0ac-4ad8-9be8-6f3a554ddd98@roeck-us.net>
References: <20260913214713.205208-1-navonjohnlukose@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913214713.205208-1-navonjohnlukose@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVAiW-00000002mLu-0NUO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55994
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEkZoRHoKBhHC5KetlScF42UFw6ny1dp9o3uHydyZj1YYXiItoqdLRNrOFBVN6/G1QercT8tWtT88fW+HEQfjFMh3kdC9AdzkMjwtkk0iqChJ9uV2Jd4
 ex4u1E5mt3KzczHZh8QJ5IvK4VjwZMyAJXclPE+nTIl2m0LKWh3aHmegpUAvauHNP4N9S83WlURMBFaS/PxBfNwqi4zVvR4haC6+IpvmaV4npLjG0nXc78N0

On Mon, Sep 14, 2026 at 03:17:13AM +0530, Navon John Lukose wrote:
> The Yoga Pro 7 14IAH10 entry names \_SB.PC00.LPCB.EC0.FANS, which this
> machine's DSDT does not have, so probe matches on DMI, fails to resolve the
> path and returns -ENODEV. The EC exposes its two fan tachometers as FA1S
> and FA2S, and loq_15iax9_8bit_dual_cfg already describes that layout. Point
> the entry at it, and update the reference table row to match.
> 
> Fixes: 9c110a467686 ("hwmon: (yogafan) Add support for new Lenovo models")
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
> ---
> Tested on a Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW. The EC field
> block declares FA1S at offset 0x104 and FA2S at 0x137, both 8 bits, and
> FANS does not appear anywhere in the table.
> 
> Both fans report after the patch, 0 when stopped and 5600 RPM with the fans
> driven to maximum through the vendor WMI method. The multiplier stays at
> 100, and the AML agrees, reading the fields as (FA1S * 0x64) and
> (FA2S * 0x64).
> 
> The table also lists the XiaoXinPro 13ARE as machine type 83KF, which is
> this machine's DMI product name. I left that row alone.

I don't have a means to determine if the old entry was wrong, if there are
different machines with the same DMI entry and different configurations,
or if this patch is wrong. I have not heard back from Sergio. The patch has
been pending for more then two months.

I am going to apply this patch, to be released with my next pull request
and thus with the 7.4 upstream kernel.

If anyone has objections, please speak up now.

Thanks,
Guenter

> 
>  Documentation/hwmon/yogafan.rst | 3 ++-
>  drivers/hwmon/yogafan.c         | 8 +-------
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 22098763a10d9c13
> 
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> index 6395c94..84c5d2a 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -102,7 +102,8 @@ immediately to ensure the user knows the fan has stopped.
>   83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
>   82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
>   83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> - 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
> + 83KF           | Yoga Pro 7 14IAH | 0x104     | \_SB.PC00.LPCB.EC0.FA1S (Fan1) |  8-bit | 100
> + 83KF           | Yoga Pro 7 14IAH | 0x137     | \_SB.PC00.LPCB.EC0.FA2S (Fan2) |  8-bit | 100
>   83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
>   *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
>   ----------------------------------------------------------------------------------------------------
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 278cb08..3fcad00 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -84,12 +84,6 @@ static const struct yogafan_config xiaoxin_8bit_dual_cfg = {
>  	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
>  };
>  
> -static const struct yogafan_config yoga_pro_7_14iah10_cfg = {
> -	.multiplier = 100,
> -	.fan_count = 1,
> -	.paths = { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
> -};
> -
>  static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
>  {
>  	ktime_t now = ktime_get_boottime();
> @@ -227,7 +221,7 @@ static const struct dmi_system_id yogafan_quirks[] = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga Pro 7 14IAH10"),
>  		},
> -		.driver_data = (void *)&yoga_pro_7_14iah10_cfg,
> +		.driver_data = (void *)&loq_15iax9_8bit_dual_cfg,
>  	},
>  	{
>  		.ident = "Lenovo Yoga 7 16ARP8",
