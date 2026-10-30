Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390174;
	b=vuWmaveP2sdr/3Yo0HIdcBH/7KfCzWqc3yAi5Lv1u6G+/hgT4MLxOk57winDo78Om78i
	 kFQa0Ws8zMamJx6JYJkejSJPnu+vxtSveVYtIhrkdOs9QLZ6FDdmHMe/njw+lfxVB9ARX
	 mf+uMxvGDMbzQQt6BcKSVqPGoXPeDw9LXNGmYEnLXJIS2ax/hLExLy7sPzJtTltQ0qg7N
	 EvwI8dBn/3XfsbKtkccO76duBiuQNlfwBdJaxOwtMCgw8amFfqciAV/+J1xm5WZBR2Ke1
	 vjc0OKvo5THGNpU1SVEj2FkJhQiLFoENfI//AKLvSumMNUrNkeTjgbdAurJP98Cd7oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390174;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=8kVz0XILX5RIwQ6HYtuHl7gWfjeYLa70o0sQEUAqlEc=;
	b=BqhB2SRXsqX3B6gmoxMcK2SlPyitYKz0a47eToI/O6z6M+02HQ3IbJhrq7WHvWp/6CAG
	 C7wrA+aa/Y+4OlruLrLNpNck0N7huPtcj+mZIg+eQ2ZvB5JcOMCjV7wm41ZgOYS7Tu69P
	 yeJ3bGV6Fe/zcJB9QE9iDcAzICnKSmVSf5pw9g9BKeG6KS8K7s39/cKTaXXULfAz5KXGt
	 EuG66L7vKpCbwuCOOxqJhSYHdnCDfaNDtX5g6lvUzXhLAHpoTUR6yTwT8y5JGMWEwVKUd
	 cO5jzNHEMTzDVvwXy/AIPugcy77tl/uYwXO7AT1w/zcEHmNNi8viRp94vfgQ+1gOwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=irb78aLA;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB337606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 19:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB337606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=irb78aLA
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id MfemxB3U3v0ndMshxxrtfI; Fri, 30 Oct 2026 19:56:13 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MshwxcMQWbxHHMshxx2iP5; Fri, 30 Oct 2026 19:56:13 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae4f65d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=_jlGtV7tAAAA:8 a=FQuEuSn5fJWHmgwBhRsA:9 a=CjuIK1q_8ugA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8kVz0XILX5RIwQ6HYtuHl7gWfjeYLa70o0sQEUAqlEc=; b=irb78aLAgTGRW1joDBbOI1pJ4l
	CiMU4xia3rmyGJcuc44medSaPBlvl8MLgbpRpkIc6y5/y+S3hPgTtgsAmZ0yYNTpL9TspgU9F4aIu
	ZHVJvVuhkcaLcfaXwblDAmtGwlI52rLnPK5T/sThWTVvW2p5622vsP52jowuilovBtmwFdf28s0pB
	L/DzIFxK5dKwXgvRUY3Yj5OxFru/Lw4563WYCJlG9ALTvp4SwNhcKcwHOVWhbkip25xmOGDlBIkBB
	iAVISuWrDoc7eXIqQwdE+Xjv2zlOwF/+/Ud3T/lAjynlS8b8ikbiIMYpCgLmQNCGEYiypG91gJDm1
	xBgaS43w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55592 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMshw-00000003xjp-10yC;
	Sat, 31 Oct 2026 01:26:12 +0530
Date: Fri, 30 Oct 2026 12:56:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Message-ID: <34cac8b5-ddb9-4b76-a60a-8f6ffb0fd9ac@roeck-us.net>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-6-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261019114502.55307-6-changhuang.liang@starfivetech.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMshw-00000003xjp-10yC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55592
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 87
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG6kNr+J7ksWu4KF/+x+qS6WCHiyc/bo1J2oRrFwD6vDrOVHtG2PadXjsRQRFI7Fs6IgGaJMXZfe/zN7LtfxODJIvAYeNhFh5rO+sVbPkqnlPle1QVL+
 WV7EbU6PE2mZxBbNncDCmaxHvYkZs3CqKaCLlyMUYnVU5HXxIqn6brbs8aWNonsPJq7FI7evPwaQ7B76UxKA2BL82wGRcI4Isa+WEOJA1rpWsvgp809+fIyq

On Mon, Oct 19, 2026 at 04:45:01AM -0700, Changhuang Liang wrote:
> Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.
> 
> For Granite Rapids, the resolved cores mask must be collected from each
> compute core. This implementation is relatively complex. Since we do not
> use the resolved cores information for these CPUs, we can explicitly
> state in the driver that the core mask is not supported for this model.
> 
> Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/peci/cputemp.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index 457089c561b4..69c4a07b99f7 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -339,6 +339,18 @@ static int init_core_mask(struct peci_cputemp *priv)
>  	u32 data;
>  	int ret;
>  
> +	/*
> +	 * For Granite Rapids, the resolved cores mask is relatively complex to implement.
> +	 * Since we do not use the resolved cores information for this CPU, the driver
> +	 * explicitly does not support the core mask for this model.
> +	 */
> +	if (!reg) {
> +		dev_dbg(priv->dev,
> +			"resolved cores scan is not supported on vendor-family-model 0x%x\n",
> +			peci_dev->info.x86_vfm);
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Get the RESOLVED_CORES register value */
>  	switch (peci_dev->info.x86_vfm) {
>  	case INTEL_ICELAKE_X:
> @@ -543,6 +555,11 @@ static const struct cpu_info cpu_emr = {
>  	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
>  };
>  
> +static const struct cpu_info cpu_gnr = {
> +	.min_peci_revision = 0x42,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
>  static const struct auxiliary_device_id peci_cputemp_ids[] = {
>  	{
>  		.name = "peci_cpu.cputemp.hsx",
> @@ -576,6 +593,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
>  		.name = "peci_cpu.cputemp.emr",
>  		.driver_data = (kernel_ulong_t)&cpu_emr,
>  	},
> +	{
> +		.name = "peci_cpu.cputemp.gnr",
> +		.driver_data = (kernel_ulong_t)&cpu_gnr,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
