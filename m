Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239936;
	b=oHMSXVyZJBwYGBz7lFki+cVjjRXLEzWTiE5ZeZH1xxzOLu9+EQR4aHpNHUUX9+bhkceE
	 RvWmt3toskckKmV64XesiuQUt32Xh/UHi5bJhXQfxIvOgYV5zvc/LeHeOQC1Iu1zexLC8
	 mnO4nKiyG9eSCwFYji1eCaFchNMM8vNPYzhK6vMzFk3v2930fwkGefvtbyNcd2Eza5cZK
	 h2h+MfJiwTTT9lMOYyYLlADx6aaobeVQFNlNfOl/M3IoozWej3m7A3+817kz3tq3oBU7a
	 bzuTvDNX9QzCj2gSZKzHc2ATpSYQ4j8li5cXX9B67ypwsr9MT0VpPgl2tnN9VOrenPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239936;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=EHYEZEpEVX6QwEMJWkgUdyB5ikkDEFEGADzKivJPpFw=;
	b=NQHKXVWm9id/6uRY9jaYi64juH3tTG1P2SSV1jNdvmsgv6Vz9vqk5Fy/FvrMzuVnKyQU
	 rGsb8sTcPdq932aZYairoVHH4isuHI9BzNJA+OhsTlyH5Evczh3EEwkiFX7kcJ0nAvhBS
	 mE1THSygINbq/2SShVVccf+fJzGZdNGeFkYt6CoUXzZCHuwvmUNrXBYuC+gBlYMBtXAzE
	 EkJEFLryKZopuA5uFSLwH0WxKICXzY68RbFRptyaEJwdtzvka49urAwKyeMMnepqOpuDy
	 +4HvchOfaQqtwYEQbA73ea7C3VS3GIDsk9hZoS168h+oURKWlCcjA0JLFpUOI5k1G6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=jnpRL9CL;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884BC606EE87
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 15:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884BC606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=jnpRL9CL
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id QQ1bx525QOOJnQRlmx3Kwo; Mon, 09 Nov 2026 15:58:54 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRllxbtkuSeuLQRlmxxR8o; Mon, 09 Nov 2026 15:58:54 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6af1edbe
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=U-dq2D2DsNg0J0l1Y5AA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EHYEZEpEVX6QwEMJWkgUdyB5ikkDEFEGADzKivJPpFw=; b=jnpRL9CLJRLdpsgG0bLejH1Yor
	YAZ+EdRop/kbUzAPz5gPCBhMn+oW/ejfDp8xHV8IhJQpUo0bcQ90V/Ky4f2OyLIV+RAQxI84bgecF
	51n346VdNgApBEiFO4wfIhbvP2ujgpghD+id7hfQSrPRifVeMQUURQ7HP6xPwDM/a9WNlIcQjkqy3
	2TqiDWmRtoL5a3I5CXY+crzbHlx5/6HxNM+xBX8ZF+gPf7LE3C97C4HuF1vHY6xx6PTfVtBn/HBWA
	rBjjCcZT8dhgM/s0pyZ1081dG6GBkX2FgOnuyQk/gaQUKKm7ogvlQ2AqEJDjYdOO/DCgfO9eDIXiF
	a3G2Z+ZA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44016 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRll-00000001WL5-2VOt;
	Mon, 09 Nov 2026 21:28:53 +0530
Date: Mon, 9 Nov 2026 07:58:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Anton Lundin <glance@ac2.se>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 1/3] hwmon: (nct6775) Handle dual use registers
Message-ID: <e3e0e1c2-e505-4abd-a779-cc1576f27fe7@roeck-us.net>
References: <20261109082511.851377-1-glance@ac2.se>
 <20261109082511.851377-2-glance@ac2.se>
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
In-Reply-To: <20261109082511.851377-2-glance@ac2.se>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRll-00000001WL5-2VOt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44016
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 44
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKzcrbw+RujeCV2dCeAcIs28TPb2YNzEXz7NY0QuJNwiG+erfeMzW67us2ESE/0JsJYRN/jEsLYCC6brwD9XKaXpAqcGni9fmmlxqrqJKjdTWfW9tCFD
 c9H/gqqZvRHttUuSjFXKUTCqmbLFWtYjNWVy5yFq7hFtNlRzAvWCXAtgutGnOlV09/3DCSSz8GnrQXZxR07P2a4X6Hkt+dzd+qcAksJptS3orU8Jy5VI9ll1

On Mon, Nov 09, 2026 at 09:25:09AM +0100, Anton Lundin wrote:
> The REG_TARGET register has different meaning, depending on if pwm is in
> thermal_cruise or speed_cruise.
> 
> This means we can't assume it's always word sized, so we need to handle
> it differently depending on which mode we're in.
> 
> The code already does this, but the register was configured as word
> sized for the speed_cruise mode, which would do the wrong thing in
> thermal_cruise mode.
> 
> Signed-off-by: Anton Lundin <glance@ac2.se>

Applied, and added the Fixes: tags as suggested by Sashiko.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6775-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 6e97e4f08b90..3515a962adac 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -1188,15 +1188,13 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
>  	case nct6106:
>  		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
>  		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
> -		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
> -		  reg == 0x111 || reg == 0x121 || reg == 0x131;
> +		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4;
>  	case nct6116:
>  	case nct6126:
>  		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
>  		  reg == 0x26 || reg == 0x28 || reg == 0x59 || reg == 0x5b ||
>  		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 || reg == 0xe6 ||
> -		  reg == 0xe8 || reg == 0x111 || reg == 0x121 || reg == 0x131 ||
> -		  reg == 0x191 || reg == 0x1a1;
> +		  reg == 0xe8;
>  	case nct6775:
>  		return (((reg & 0xff00) == 0x100 ||
>  		    (reg & 0xff00) == 0x200) &&
