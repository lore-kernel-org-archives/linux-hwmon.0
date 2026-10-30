Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390200;
	b=PSc1giqgOeT1/fmour0TIPiuCj65Bei5RsIGiP5Ocd97F1P/38vl0iyrZmjwADN3mVW6
	 j9hB5RVbKN+9gd/PxZaj5/wGCwK/B6cxMG1jAJWqeK9Wy5WfWXlINTflMlC2md6dNGMws
	 M6AqQBKCNgNN6B/zrvUIiHCShxtoHZQNhk9MaguQEuQeTHGaFY8vWgutcZEWcy3c4HK5o
	 nAhX/jQwzBE5jpiO/BJufwZGNlYZxzdrUaXolrjBYd/jyoelyHom89DS0PA6oKJmwO+VL
	 GeUdvBRLhfI9gCnbxsQ8sNX5Q8OhP7VZwqaYqw4jK1IzLxcqNozyt+C34v6cnSSeQIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390200;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=DWzHdFiapqL57vQ9QQf4q1XeBGnNvtXOlbL7A4/rAco=;
	b=L+Jgk+E97sDGzULQnFBL6h+1ei+UsSCcoyegww6jnUX0LSyUtbD5d/a0oI8UQGVN8oyj
	 HDTziVmyYzTiG2aurmCzZBWJZSzCzyOElPFvyF+lhSmbutcApsn8t+OaYvA+fWzsqK+na
	 dI4NX359WYehMAAxyd88NkEQoGA+MaL1wVqY9U8sXXQ5KkkRWTC3YwsE60DPTf8N4OQ/b
	 PjZ0f3bH/DTszgM1jByT2hxYJ7hTNkenI9XBTCKZHbMXV37x4SJBU2j/ArLXSCdUB9tA3
	 FNmcrKeZR1w06gV8gChOnldVc154/8oyE0ds8/KAc+04g4QPfoEr1KVfZ21eTie0Ndw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=doEtbsmg;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6E5606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 19:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6E5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=doEtbsmg
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id Mn9Lx59glaC0UMsiNxDS0h; Fri, 30 Oct 2026 19:56:39 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MsiNxSjJtLr2uMsiNxWfzw; Fri, 30 Oct 2026 19:56:39 +0000
X-Authority-Analysis: v=2.4 cv=UudjN/wB c=1 sm=1 tr=0 ts=6ae4f677
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=_jlGtV7tAAAA:8 a=TmeHqywlB-wf64vNx90A:9 a=CjuIK1q_8ugA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DWzHdFiapqL57vQ9QQf4q1XeBGnNvtXOlbL7A4/rAco=; b=doEtbsmgS12KszkRR7TRgjgMvi
	e4hdP6WzcIw88nPHe3j+q+T2q9jbGdVy49soWf5ZMcQBLYeAT5zxBVYrrkCy4gpiTjddJjznuW+0G
	duvX7QwtYGic1g1Fs4KtKw0NAhOSocKFKuTvXCUCqtcyLi00VHe4vk/IhMJi9TWOuq3HsTgZdGp0M
	VmxYb2gRLA0sq6SXAL58CMmbYYM+90xRnn5gweKBgnMasv4Y/tt6xu+UXpaSCAV5glZQtogaMpV/0
	0M9GGNoufgNpv4k5sS3J1ALa9w06bWHRE2WMiKID5fn3HXhEV/WB7jAGZZ5ZzkssRWQtuylPjv9E8
	LLmTy/lQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38324 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMsiM-00000003xwz-2LGQ;
	Sat, 31 Oct 2026 01:26:38 +0530
Date: Fri, 30 Oct 2026 12:56:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Message-ID: <215a0b5a-9fda-4bce-bff5-b9e4bb5c3928@roeck-us.net>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-7-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261019114502.55307-7-changhuang.liang@starfivetech.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMsiM-00000003xwz-2LGQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38324
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 97
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfENOIX4qV5iSXoczNGJCX6qRuCaJS4LgNSh+oGO+ZalcnYOGkg8zmFvq8RQHnQr4vg7hy0HbHFzdQpOS8CLKjb/3+XKpo6qzbYiaFDI4YDa+/kLBJJYR
 SC1QuOSao3Vq8bGOWErI/ZBwsFN9204Y+4x2mfQNgoj6/MJFPs8qi2Qr/2Up/OwjPMXYUoDHZgYYgBytqhEzxEFWYWqiSZ6K1yAugogbWmM6n4oDpXjsR0bl

On Mon, Oct 19, 2026 at 04:45:02AM -0700, Changhuang Liang wrote:
> Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
> monitoring driver.
> 
> The GNR platform has different DIMM topology from previous generations,
> with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
> channel. Define these new constants and update CHAN_RANK_MAX to use
> the GNR value since it represents the maximum across all supported
> platforms.
> 
> Since the current peci core does not support domains, accessing GNR's
> DIMM_TEMP_MAX and DIMM_TEMP_CRIT via PECI commands will be rejected
> and return completion code 0x90 (invalid request). To handle this, the
> read_thresholds callback is not defined for GNR, and the visibility
> logic is updated to skip exposing the max and crit temperature
> attributes.
> 
> The minimum PECI revision required for GNR is 0x42.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/peci/dimmtemp.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
> index bd3e8715dfec..791a8e866081 100644
> --- a/drivers/hwmon/peci/dimmtemp.c
> +++ b/drivers/hwmon/peci/dimmtemp.c
> @@ -34,8 +34,10 @@
>  #define DIMM_IDX_MAX_ON_SPR	2
>  #define CHAN_RANK_MAX_ON_EMR	8
>  #define DIMM_IDX_MAX_ON_EMR	2
> +#define CHAN_RANK_MAX_ON_GNR	12
> +#define DIMM_IDX_MAX_ON_GNR	2
>  
> -#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
> +#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_GNR
>  #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
>  #define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
>  
> @@ -198,10 +200,18 @@ static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_types typ
>  {
>  	const struct peci_dimmtemp *priv = data;
>  
> -	if (test_bit(channel, priv->dimm_mask))
> -		return 0444;
> +	if (!test_bit(channel, priv->dimm_mask))
> +		return 0;
>  
> -	return 0;
> +	/*
> +	 * Some platforms do not provide the DIMM temperature thresholds over
> +	 * PECI - do not expose the corresponding attributes there.
> +	 */
> +	if ((attr == hwmon_temp_max || attr == hwmon_temp_crit) &&
> +	    !priv->gen_info->read_thresholds)
> +		return 0;
> +
> +	return 0444;
>  }
>  
>  static const struct hwmon_ops peci_dimmtemp_ops = {
> @@ -626,6 +636,17 @@ static const struct dimm_info dimm_emr = {
>  	.read_thresholds = &read_thresholds_emr,
>  };
>  
> +static const struct dimm_info dimm_gnr = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_GNR,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_GNR,
> +	.min_peci_revision = 0x42,
> +	/*
> +	 * Reading DIMM_TEMP_MAX/DIMM_TEMP_CRIT over PECI is answered with
> +	 * completion code 0x90 (invalid request) on Granite Rapids, so the
> +	 * threshold attributes are not exposed on this platform.
> +	 */
> +};
> +
>  static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
>  	{
>  		.name = "peci_cpu.dimmtemp.hsx",
> @@ -659,6 +680,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
>  		.name = "peci_cpu.dimmtemp.emr",
>  		.driver_data = (kernel_ulong_t)&dimm_emr,
>  	},
> +	{
> +		.name = "peci_cpu.dimmtemp.gnr",
> +		.driver_data = (kernel_ulong_t)&dimm_gnr,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
