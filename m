Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631884;
	b=LU5QdybgsWwkDBFA2DiOSR05IARgN1xmuUrECDhCeqlgiEiNmfgljcWJq996iLP/WLqB
	 aZY1SW3nOIUQwGtn2iWxyv0lJA+v7j5wO164lt1AUsAYfTAKCgs25T+qQWNYOnyCDvaUe
	 fUL+BpI9I5HsMRwVMjuT/q1BOHZo9yJlmKLEwdUXvYWSwBJCSj7Ud9dV5Atf9CHTvxD0f
	 GtyoVw1XGsB/yurY5SN6cAGc/WAT1QDH/pfz3kXeZWbTnd0/ySFvp6uhOL0HIMJ08SztK
	 6hTQ/9y6ey8dEr5bDp6AbhS7RqlMBojla3eFzvLFn2HAQcdy3FKCSmGDzQM8I0sVLOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631884;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=v/EFnPHaPvgzAcdCipbZrXu35F80MQk6sO8AjpoOnik=;
	b=QsE19VU0eN+RtY0F428B/k2R0lMB2AiwfKFtZhDmN1bNXRwTaRMeMl6O/7eS39qXp2Ij
	 V164pBSXtfbh8VlPy9m5Tgi8jE27GY/DWvBlv1owTpUk2S3YPhL+m1XaJCGu7Gw57JMd8
	 Sb9T1g6QXkNwWnYlz5QsC+OIFuLvlGZPPlxcnwYdla+8u7gRsqqLGfHvCLElaV90fRsG5
	 vnK1lYbN9vMGwxKRdiEDRhmV16XOt3N120UNKEVGJm/YITpzMplgKQpo6yy/hLfr9ASPy
	 CAtVCBBxQmyNVs2SafZaVWOEy/uKpeD2CqYlG7ANgyBmifQjAfzLJ7fGD2m/ngr5s5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="cCMN/SxS";
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AD06070CA2
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 15:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75AD06070CA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=cCMN/SxS
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id NrjfxCjRbusRSNtaQxpFtU; Mon, 02 Nov 2026 15:04:38 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NtaPxTR1kkE4RNtaQxxf3w; Mon, 02 Nov 2026 15:04:38 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae8a686
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=4TTe3KnR3ll1BDOd3XsA:9 a=CjuIK1q_8ugA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v/EFnPHaPvgzAcdCipbZrXu35F80MQk6sO8AjpoOnik=; b=cCMN/SxSENgXHDe8PRaAlYC6+t
	0APyhf//lb8VK7INlVcDcbNunKqjoBmZw9POU7N2ZEJOfZzs0n/fL3/2VnyRtyxuXn6ho5r76MULT
	9z/2B4Pl0OzgKIPBzOvVoxntj43237ma5fBsSW0bvJzcSdhSeYqbL+2iIwXO8fbQWXaWj1YquYKWm
	fkG8T7VgyUTa4IIVxgLyOBsCQSMusx+s3tId3FMmESQBA5ltKLENnNnEvcAqrFfOWU3/aYxVrmgwM
	Huv6l9Q8xpFhV3dascxv7cZLKn+eD/T1TqnW4QePVz53gCJVJrJVnWTWB3mFX3cTlNfGSU57RPQAk
	C49z5Jtw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58654 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNtaP-00000003ql9-1v2S;
	Mon, 02 Nov 2026 20:34:37 +0530
Date: Mon, 2 Nov 2026 07:04:36 -0800
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
Message-ID: <8848aee0-9bdd-49c3-8b51-03eeab488bfa@roeck-us.net>
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
X-Exim-ID: 1xNtaP-00000003ql9-1v2S
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58654
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 12
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAUcJ6SLN9DpS9ws4P/OziMhDwcH+uIpaEHeeCdV4QOmAcMZG+fKU7sowzPA/o8mdbPx9aTE/2nUiPcGqqFyyjMjrEkP81kqX6mdxv10JZx83bqj9CXO
 e0kH88BgVZL+5DImeaAyvkEs6P+OOEeG8getMUpUUrON5GDvFpyhp0xHhIV3LvjivMkYLlowyuaB6rsvuRpT14TWLkClQEl6fOOlqfqEpF8AZE96joEE5smb

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

Applied.

Thanks,
Guenter
