Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049795;
	b=az7kONvyRQ43y4YVnLreCA37z6NYnHmyuZM0/nXe1m2sXCk7t0tO7RFLpTTMSZ9xruwE
	 9642TLnhuj3+yo4nwT8PDOMqI3xpfGWWJKRvXH03yXK5hDBY+uMar+Qjc9LMph+RQWk+z
	 tGZvvDMpi53QD/67m43llGr7ooJVINgpwhiaXzznXDVh23kb+4rnZ/wvZ8zBmGjJw98Oq
	 J70y9iiFh9sbX7lt8NznsWD6jsRs1UC8JnMW1ib7fgN84Gc8pzO4HQlhZFh8citYJ8P1J
	 vxMj8P7A+//Ihvvlul1HrSsVGnEZirmp/X2fLN+jBws5uuqq49w+6B6HGnPNzM1mc1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049795;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Al40yz8zX8CT/g6ZiarLm9qznrROayr99YdGIejOzh4=;
	b=s0vLGgkO+j5I87vIyFQTmCG/6QN3Z7CWPzyGS2s8uSMC6jUuoreNdrjxWCSwGm3s2wAW
	 J1slQ6yurI92ZUhZRD9FONOeLVpSuyXGRBjpW4bKfgS6OkeUfb0LrDVcq4JWUSWgKHyKo
	 4cFahABanqoMevYWs1j13/l2I9QbnD4lnupZ6iF6Jvc4ZKKSwH75dSTJXwp+EddWCbSsz
	 /VRF3njhHNdmTvEmoqeg+OqxYp+1fWp/BJ8VUWYIVOLAxJh2hRSxe+JRazAL49oItCR8S
	 6m7skH0m1OJATd6B3MLNZ4dwFN3DmnzRVf8LCvL9e1v7QM1LngPhDo7iuQJ+C15Kmlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nuJTrfl2;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483E606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 21:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3483E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nuJTrfl2
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id LPvQxCYWRc3XsLS9txaQlU; Mon, 26 Oct 2026 21:23:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LS9sx3PLof4wOLS9txdYP6; Mon, 26 Oct 2026 21:23:09 +0000
X-Authority-Analysis: v=2.4 cv=db2A3WXe c=1 sm=1 tr=0 ts=6adfc4bd
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10
 a=rJ5y2_88ZgdFKM9dSD0A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Al40yz8zX8CT/g6ZiarLm9qznrROayr99YdGIejOzh4=; b=nuJTrfl2cv6HWnm3fhxzkWe/wA
	VRs0DQvGsuWH00LII2CP9tHoiCLQbpQ1gAfDgO3FBNi0UjcPIij5TKwMZQ/8O9Bn90eUZFX2PawpY
	o6mQhUQ2oruu/5lqTVgcG6tHLUaqTs98tswJg7VsyFAoxVYLDXCdKavCj1Us32IyROR6qkD7uzH67
	xdd4qsL9/3MoEIE8y8PrEAsWMIuUnacs27mT2FoT5q1gPdp1hnoBdRE8J1e12Udtcb2j2Vu1P15i+
	etQopKwhHD+6GmUDQutNAX+Ig3VRKBWGqxgpzfGHSol4/LsFBViabi1cWM0haUS09OFpvnO47rnoo
	pt8t2C0Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35782 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLS9s-00000003SIU-1SbN;
	Tue, 27 Oct 2026 02:53:08 +0530
Date: Mon, 26 Oct 2026 14:23:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (macsmc) Allow enable writing to fan speeds by
 modifying sysfs
Message-ID: <2cc7dea9-9a0e-4532-8ed6-74664c621fae@roeck-us.net>
References: <20261018113248.12243-1-aditya.garg@linux.dev>
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
In-Reply-To: <20261018113248.12243-1-aditya.garg@linux.dev>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLS9s-00000003SIU-1SbN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:35782
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM1QSCPtPHnQpdD5OJh6csxOAEEDvkmiwLt6nzgoId9AYyIwdbSq2R/DmhaTmn1qzrSWSaf9ZAQ0R0AhduPg0hATkzsIE0LJvOA80YyTx1L2am2WSFW9
 cWIMXmeibakHitMjmZsTZdz7wvE0ct14Aa2srslJ+0Smnblq6KUCwAbhaDsGZTtnKczxOokPMxffJhVA1zbFALoTr82lwYYfQcygyjEN8gVyFSJhYunxeL2E

On Sun, Oct 18, 2026 at 05:02:48PM +0530, Aditya Garg wrote:
> The fan_control module parameter in the driver enables/disables the user's
> ability to manually modify the fan speeds. In case the user attempts to
> change the module parameter via sysfs rather than at the time of modprobe,
> changing fan speeds is still restricted.
> 
> The reason behind this is because during probe the fan_control variable is
> used to restrict the user in the following two ways:
> 
> 1.	if (!fan_control || hwmon->fan.fans[channel].mode.macsmc_key == 0)
> 		return -EOPNOTSUPP;
> 
> Here, if disabled, the OS will return an error and will not allow changing
> the speeds.
> 
> 2.	if (fan->attrs & BIT(attr)) {
> 		if (attr == hwmon_fan_target && fan_control && fan->mode.macsmc_key)
> 			return 0644;
> 
> 		return 0444;
> 	}
> 
> Here, if disabled, the sysfs files are with permissions 0444.
> 
> In case a user changes the module parameter via sysfs, due to the second
> check, the sysfs files remain with permissions 0444, and user isn't able to
> change the speeds.
> 
> Since 2 checks are practically unnecessary, and the second is causing problems
> this patch removes the second check. Now, if the module parameter is changed
> via sysfs, the first check will pass and user will be able to modify the fan
> speeds.
> 
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>

Applied.

Thanks,
Guenter
