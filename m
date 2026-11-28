Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795862104;
	b=FfiZxM53v4Sfcq8bFMsWAtZ5y1uM9GEHEoECbpzNAuvTYBpUgYvYn321wYjdf8ks00To
	 eH7V5EJx0ztwmRd00Hv5dKIspyTbzSNe8Vd3p3mITOwuEtFGg5ued4wjnxLUEGK9iFQiz
	 XUrPAsSPteGoM+CjelDSo2t0xA+hbBCCVNil8vBdFZFZZmeidTDJoC50HJt5LHbbIlVMj
	 g6McT8A2M+xkqdbCUl9trZYJJf8UC6IPBN0q2KBx72sCLaS6ssvYAcudQgyME96Y4bvv2
	 q9v8SpTJBwX2sPEQXUQQiVVYwmUeG1LyVxX5lh45oqfnji5GMKZOWaK3lR3wvj4mOkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862104;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=3DWTBN3W2OOglTxceZ61QD61ptx6VVBNKwoPW3PhGys=;
	b=cxQvZUyxZfwUaPn3FU9w5I+v6IERgOdFTLteTUM8/mWMyA7v7tZyWl6ciwaOGuC2LyMd
	 dtR/ikwbsgQxPqCbs7fvm/BUMCJllvS5/z30NNHRC5v4yoZ/y5yi4RmwQhUHG8dN+xX8G
	 DIaYWr5r7/NKL4DANMC5yJIW2C2vKSyFwU5bZSYK4zFFbP6+/gtIJpWWFYn7FVZz8jbPf
	 Wbi83DIoWAQkRvlnRleYXD/PnA39RpUJkLLwKml4eOUVz1FQ9N92FmEn1RHCCOR5XBMCf
	 uMmF1lus9bIfpYGAWNQs6bQjPKymQZ6Bsy82zu+1N+adYrF+QocGbI+ChTMKq4DL10w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Q+yyJrba;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD9A606A31C
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2026 10:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD9A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Q+yyJrba
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id XCPixqgYeAR1iXFloxGyLy; Sat, 28 Nov 2026 10:35:04 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id XFlnx4WDeGh2BXFlnxGvef; Sat, 28 Nov 2026 10:35:03 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6b0aae57
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=L-xz6NSyAAAA:8
 a=zLGufa3UZyHqUvnfKmIA:9 a=CjuIK1q_8ugA:10 a=R1xhReGu_IPUwS1Fismc:22
 a=H7nlQ9NbTXmbZqfEVjPa:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3DWTBN3W2OOglTxceZ61QD61ptx6VVBNKwoPW3PhGys=; b=Q+yyJrbaLXS2BIBJpS7jVpIqkh
	+0pV9ky1aJMwbr4psKrw8oJnxhoRCelHiUPVplFIdERg702WMm1bF77seUsjZNlCroQRXzAUoOYJF
	lDizP+ym78+XcFyd4RjQO1RoZHyGGpLimpfxpGeSyiQY5eEJN0I5eZWq1dLKytI0ps+L0rjAoSun9
	RWQXSs3YLuDDCDoK2pZySczHd1xDYQDTF0MWqi1/5gW6m2jrJdb4dMgA7RZMYeyEAepcuh5qU8Y6y
	xX56yyeXjrMAo1XDMr12alET85mwhMR4O6tCaUOzx1Nnfdkwkm6VzL25iU1txBzrRfd6XTzAeemRy
	wHeoj+yw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:59246 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xXFln-00000001Luf-0DCC;
	Sat, 28 Nov 2026 16:05:03 +0530
Date: Sat, 28 Nov 2026 02:35:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Andrew Davis <afd@ti.com>,
	Carlos Jones Jr <carlosjr.jones@analog.com>,
	Kees Cook <kees+treewide@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): Do not treat ASCII MFR_REVISION
 as MAX34451ETNA6+
Message-ID: <a6e77eb9-610a-4fde-a5ca-c95769ae67cc@roeck-us.net>
References: <20261128025223.2680033-1-william@wkennington.com>
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
In-Reply-To: <20261128025223.2680033-1-william@wkennington.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xXFln-00000001Luf-0DCC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:59246
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIt7pWZyfLXqQGXJ6T5ROnZ8d4c0Um29fmPUwaNZcdmB2QUq9o1vxWIxnoN8b9R20CJ+bGGdjwQvlJ6hlXHYTt2gi4PEupVp8L6pHACBWjQkisbzVNrV
 bEg10DpJ67DiAc2kv1XIK1Wken9zD2UCo7q9z7Er6adhdufptu5NLleWXDP9e2o7Sttv927c4f+64+/adyRzWBX009UdXGf2dA08Uvpuo9uf/QxrhvKT6Rfv

On Sat, Nov 28, 2026 at 02:52:23AM +0000, William A. Kennington III wrote:
> Per the MAX34451 datasheet, legacy MAX34451 parts return two ISO/IEC
> 8859-1 characters in MFR_REVISION (0x9b). On an NPCM730 BMC, both
> MAX34451 devices (MFR_ID 0x4d, MFR_MODEL 0x59) return 0x3236.
> 
> Comparing rv >= MAX34451ETNA6_MFR_REV (0x0012) and rv >=
> MAX34451ETNA8_MFR_REV (0x0014) without checking the upper byte
> misidentifies these legacy chips as MAX34451ETNA8+. That switches
> PSC_VOLTAGE_OUT from 1 mV/LSB to 8 mV/LSB, reporting every voltage
> rail 8x too high, and exposes unsupported VIN channels reading -8 mV.
> 
> Require rv < 0x0100 before applying the ETNA6+/ETNA8+ quirks. Tested
> on that hardware: the voltage rails read 1x again and the bogus VIN
> channels disappear.
> 
> Fixes: 19932f844f3f ("hwmon: (pmbus/max34440) Fix support for max34451")
> Fixes: 596f410c05b1 ("hwmon: (pmbus/max34440): add support for newer version of max34451")
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/max34440.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
> index b59e9fd42401..390dc32f6f41 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c
> @@ -352,7 +352,14 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>  	if (rv < 0)
>  		return rv;
>  
> -	if (data->id == max34451 && rv >= MAX34451ETNA6_MFR_REV) {
> +	/*
> +	 * Legacy MAX34451 parts report MFR_REVISION (0x9b) as two ISO/IEC
> +	 * 8859-1 characters (e.g. 0x3236), whereas MAX34451ETNA6+ / ETNA8+
> +	 * use single-byte binary revisions 0x0012 / 0x0014. Require a zero
> +	 * upper byte so legacy parts keep 1 mV/LSB scaling and do not
> +	 * expose unsupported VIN/IIN channels.
> +	 */
> +	if (data->id == max34451 && rv >= MAX34451ETNA6_MFR_REV && rv < 0x0100) {
>  		max34451_na6 = true;
>  		data->info.format[PSC_VOLTAGE_IN] = direct;
>  		data->info.format[PSC_CURRENT_IN] = direct;
