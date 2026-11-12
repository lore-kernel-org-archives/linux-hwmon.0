Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496721;
	b=WJqYynOT74xVfqXX+BMxvHlnC3ADDjQsl0NXF39Gk8+tpInwDu/MpeLljXcirH0/BpBZ
	 o9O3AaMW/6/Y8NqLkYJDprU8AqFlh1m7YJYaqgf2qHLrCQYD6DUVFetMAc96eEaS44dpY
	 2KQCyEKu3v9AOMRhY8K4UP9lRg7Sp04qktYJMfbKL3NvGcil7rdZ/6RxYgDmiB9yF9mEO
	 R0K0dXfe+KifCW1F9ipxiYE6wNVRXz2QN8n/MLxjLSfAE92hjxERQntCGETqFPtuZ3D52
	 hF1pyt8134X4R7W6PNNb6E8gDm2Tt2UEPqpKoLrGqZ5oocBN812/88BDSLEknEH0bLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496721;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=8Cah2Nuh85bMwNGmNplY7i5n+nc08E8LSVCaDdk5q2k=;
	b=JlU1gIrszl/BMr4hWrr4dynVf3oUs4q5eDH6S0+QnVN+Ml2p10nhESctcHgsQOr87xvA
	 8mQVlzbRddEBwzIN0jpYkmgYXNyfMDEITzL4aSCXlHMvsyCP8d+gVrhZglJJaZKxY+jFO
	 RQPv86nQ8ErDYu4w6xkNFPzAHkAvR4EwFrHfCiRo8i6qoLkT65Fff0xPZgozpkgWSWcNX
	 p5oViQTHWHqVLajJ3imXBJqUaDqX04OIIFDUNoJYtM9dcXyQ+vx+nP6Me0tuuJSPmfsAG
	 2niPnffpPgi32SMguNJwlnkFFu+wxlT2PgURmBLJH/06xE52zpj3raixrMD2R18O1Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=B3KEpRzl;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39BA60A2607
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 15:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39BA60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=B3KEpRzl
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id REUHx1ad3RiNxRWZUxr0pe; Thu, 12 Nov 2026 15:18:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RWZTxiQW9xqjjRWZUxn3uH; Thu, 12 Nov 2026 15:18:40 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6af5d8d0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=YjZJqjhXHxlD0Mfa010A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=8Cah2Nuh85bMwNGmNplY7i5n+nc08E8LSVCaDdk5q2k=; b=B3KEpRzlj0Zx
	bB9m/IVrg3WMAHfMOyn10bm0j15PTvkcIYbSDjmMxSf3X7djdlyloLAe20J0Qaq7ywdCMDhXDorU2
	6/azB3n5dTJd7UQ5CIbuO0kAyjElsjBsC2DV0GI2u0buD5pzqhq1u+F7RjWAlVmlPCI6EaLGr13Hi
	UgtFij5jlwPAXkrHg7/0A/DpBdpEXLsgoFRdC3xbipPNEqN2MICRQ+J16n8h94uzGCssd/ZeTiGad
	95SxRvecLr8z/DBGpGJxpE24jxvTjY7VBynK+WYy8+rTYhj0pY2HqUEW/Orz7zvHZniQfcUpjTrAf
	gxNUwkS52nDU6ZayBLUY4g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57714)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRWZT-00000003LgJ-1hVi;
	Thu, 12 Nov 2026 20:48:39 +0530
Message-ID: <96902e72-6a75-42b4-9d30-ea54e82ee933@roeck-us.net>
Date: Thu, 12 Nov 2026 07:18:38 -0800
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
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260
 to fan control whitelist
To: Shady Abu-Hussein <shady.abh@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111150435.75965-1-shady.abh@gmail.com>
 <20261111172733.84217-1-shady.abh@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261111172733.84217-1-shady.abh@gmail.com>
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
X-Exim-ID: 1xRWZT-00000003LgJ-1hVi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:57714
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJIx93l/ERpLT0QFYu7xklIu0tTLLe4Z1KQD/YwvPunmZNdbCfeOKDfL/zGPiwPcxMg6RzokUNLWo/aqHJaCHjSjcB3NAl/zwfITVZB647knJZ/elZVo
 x10vH1qPlSv1UNeRn9/APeuI1M+rWJUzcqEVL94+d0JoYLeH6ZG8COq5WrbSmknAxYIt9KaTZUhK1EZCXIJ8AZ1hLBrnWkrQ4HnyVLNqfohzqncuGu7/+hMU

On 11/11/26 09:27, Shady Abu-Hussein wrote:
> On the Dell Pro Precision 7 16 PW716260 the firmware fan control
> cannot be overridden using the default SMM method, writes to pwmX
> are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
> policy also requests speeds below the minimum sustainable speed of
> the fans, so one fan repeatedly stops and restarts every few
> seconds at low load.
> 
> Add the machine to the fan control whitelist using the
> I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
> disables automatic fan control, the fans follow the requested
> state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
> pwm1_enable restores automatic fan control.
> 
> Tested on BIOS 1.5.0 with kernel 7.2.15.
> 
> Signed-off-by: Shady Abu-Hussein <shady.abh@gmail.com>

There is no change log. What changed in v2 ? Do you really expect me to
track that down myself ?

Guenter

> ---
>   drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 5ec487843..250d8c1e6 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1687,6 +1687,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>   		},
>   		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
>   	},
> +	{
> +		.ident = "Dell Pro Precision 7 16 PW716260",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 7 16 PW716260"),
> +		},
> +		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
> +	},
>   	{ }
>   };
>   

