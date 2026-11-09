Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237181;
	b=LtSg9lt/h/7s7+JJDlNlE1AcjNlsqKhoEwolZvndRjQkjs2tfxdW6kear7gruB6aXhq+
	 FqC9AzjvlHGOddUMjAepcpeQDhdtHT9gdDNuJfo/m4YObLattEPB6WRsbgIGOfOu5Tidu
	 yGs/c9ykwn0Rj5613LYCpn39xT1xovxloO8x+z+tqkkhaIs7JpMpnSG7R+detDbvYQr+m
	 nArb/n/Ar0BOvtnw2ceJcuGj37gjl0f7VTfiDn5z3r34ZbL/EE3oefG+B4V3uGA84hLVc
	 Gd4gdbDy9ji983KAHYnS4qLuXATD3ctl3fGnzIt+Aaq/4lYRCSyg7ni2QEpr5t6+e9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237181;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=oLClHZAiMj98sMJiVJxYuzmbPG0nMxiCEYPgb4jBb6U=;
	b=amAsQ52MSBYqaarNZVPMgDre4N7l9qKJuyMUyVz9WPyXrXI3cvaM3rxPh0hWZwagakaf
	 Lflsc1eOUMaerdIbKOCxRqqziJLsrizRkIjYiVyVIHL8CMtYFqQVbl0ewTR0Tw29mkTGg
	 O8rVBsisVrXkrROGZCNWUqipc1/jUh7yqHIlZdAeWaQwx/UBNyu3SVK14NDQgbD79F3+5
	 VycKm4gjovipdy4oNbk0fDEbCbbcQhD/9S6I5+BWqu0Vlp+qADpJZIT0HnijN3G8CvSQb
	 I3FkU7grJAm2tcTZRvSI85cvCClLYxcY9/EXoEQifYxDHaGxgYhe4pivOuTOvjt9bQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=jB1Cuzvl;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FBA606A325
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 15:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FBA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=jB1Cuzvl
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id QPThxBH3fyb4YQR3MxlLrz; Mon, 09 Nov 2026 15:13:00 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QR3Lx3TJVdRrRQR3LxnAlf; Mon, 09 Nov 2026 15:13:00 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af1e2fc
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=YqshgQQMxR2ATWee5y0A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=oLClHZAiMj98sMJiVJxYuzmbPG0nMxiCEYPgb4jBb6U=; b=jB1CuzvlPv/j
	zqSNv+mCojetzrBOdwUJpH6Vm6VnfWgCupLDnsUCNGS9e6TMx0TXHvjFVFO7lAsbfYSrIirHcC3kV
	3EENkh2BBIqK6fgRO2j2jxHqx3MCDe4ONoqRzja6/2DgWj49BDbunc56fdNIE5yuG57+yOd8WpvmJ
	5uDzvSjjzA1zWpCVzAwTaxio8s1WTxgsd0T8QV1xdYXZHlg0xPS240cuUQ59Z1RvYIGt/IWaRbVU4
	ibhRtarxYjcLHqOG6hezV7iqziQA3/8/9mcmpes+wnF4bxmHQ/edyt6Rkpgxiez3ltY0m2rWcUPhh
	DxwbCz2HvvhwLjndLYLKjw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33582)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQR3L-000000015qL-26FE;
	Mon, 09 Nov 2026 20:42:59 +0530
Message-ID: <bbeb7fc2-f9da-48cc-a383-f7234540cc49@roeck-us.net>
Date: Mon, 9 Nov 2026 07:12:58 -0800
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
Subject: Re: [PATCH] hwmon: (lm85) Bound fan stop temperatures before
 subtraction
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109101936.17430-1-zhujun2@cmss.chinamobile.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261109101936.17430-1-zhujun2@cmss.chinamobile.com>
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
X-Exim-ID: 1xQR3L-000000015qL-26FE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:33582
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 12
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC0w0/7RXeedHCg1WIe24XUXyFpRtXClV8o0buAK2sGULMPpylst/BWggk2e9KeoVFNaBMkSMsMOzYhhNh8az+sdKQRjHONUnGNjwWIcA9p8uDVSwJr9
 l3nQAAp6TsJ8Y99DvSwLdhANuE4c0LmQwyvwZk+eM/B5fPDLSwc3Pk2eVZyBBPPVsrRzxlefvrom2ey3DKx11WhAPOe355i5dDmNVxxsoy7dQYtIijR5oUVa

On 11/9/26 02:19, Zhu Jun wrote:
> temp_auto_temp_off_store() subtracts an unrestricted long from the zone
> limit before clamping the resulting hysteresis. Extreme inputs can
> overflow this subtraction and select the wrong end of the hysteresis
> range.
> 
> Bound the requested stop temperature before calculating the difference.
> A signed 8-bit zone limit and a maximum hysteresis of 15 degrees require
> only the -143..127 degree range.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> ---
> Validation: x86-64 and i386 driver objects built with W=1.
> Source-extracted boundary tests passed on both word sizes;
> the corresponding test fails on the base revision. I/O is mocked.
> No physical sensor or booted-kernel testing was available.
> OpenAI Codex assisted analysis, code, tests and changelog drafting.
> Please review and add your own Signed-off-by before submitting.

You did not even read that, did you ? I can not apply any of your patches
due to the missing signature.

Guenter

> 
>   drivers/hwmon/lm85.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
> index 80bd1f47114d..e776ec4ae40f 100644
> --- a/drivers/hwmon/lm85.c
> +++ b/drivers/hwmon/lm85.c
> @@ -1153,6 +1153,7 @@ static ssize_t temp_auto_temp_off_store(struct device *dev,
>   
>   	mutex_lock(&data->update_lock);
>   	min = TEMP_FROM_REG(data->zone[nr].limit);
> +	val = clamp_val(val, -128000 - 15000, 127000);
>   	data->zone[nr].hyst = HYST_TO_REG(min - val);
>   	if (nr == 0 || nr == 1) {
>   		lm85_write_value(client, LM85_REG_AFAN_HYST1,
> 
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

