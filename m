Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464525;
	b=mg3ai1OYZIZUI871obVDw9L3FAXpX65rtF59XKHcccyekWeZEKoVesknyg3vEVV7vSlt
	 q2x8H9Fu++sM9H3BcbcC+Mvlskav6X7z5yxhsFeRpasxW2vX42pw7BblDU1FGLOWK7EEk
	 NvOWoxYV2UddzqTUs4xo4cwBceV5KqbUywG8UbmaVBeNxHQvacCXV1j9uxHgpdg5OAmLs
	 EIvPAXS1rvwrwlAiKXTmo2Wa6IK9VOMo3dTgIXPYmIr23tOE69hJHv9Rwmw3TDMVhnPmu
	 2ditSj0l2e4Hh+JLh54Adl10GkTZUnbPlZ6BQ7C1RE0uBVnKiK2LqEQhbQrU2LFAbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464525;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=gNGrlpJ5GBGLYgkbdRirPnoTxZGSI1GUcCCkis3/WLY=;
	b=cN2qN6N6sUAes3cycn1uQ5VhHNlxsiZFcXQDF3a8+7gsi3gXxVYaSlCMVE+plEF4aNjJ
	 hH72GNzDY1VLv2W+CTsCktYItNMBiaQlXBnOruDzgjA3U6dPk5shDkVJ7GRMiJ/WsCFDZ
	 DWgC7CXiMosfAyt5Csw+30UNyoyUd7xelutxK9pM8M4gWY7virytrdoJN6hT7wy+oZr1E
	 VDaZdaNKdf74ZfaGfglJyosnTTkHG/BwHh7R9GeGpM3BvBhtm7Ymz+fMdiAecRUw29m1y
	 fafLn22B5nvslfvZBrZ+ubaYQIfnqDwSjTu7Yc4ItO9JIucYX4ESfjGuhZCUBc9Etjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4EenYoqU;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3716A606A31F
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3716A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4EenYoqU
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id VYI0xwXSy4vCDVaL8xDuGs; Mon, 23 Nov 2026 20:08:38 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VaL7xjINClaNKVaL7xQXKG; Mon, 23 Nov 2026 20:08:37 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6b049d46
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=S-ZHDvpaSbKS-1XEJIsA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gNGrlpJ5GBGLYgkbdRirPnoTxZGSI1GUcCCkis3/WLY=; b=4EenYoqUwKLVxFO6ApN1BAtn1h
	9g9dniMYtL8cDLa5uCobumqajKPCJIJoW/lBuSWPWDYiy+XCmlX6XJv9YeZS4Fr1Ng4+s4MrsNYd/
	7qkK1f20niFm3try8mq4GfQt+LVIU3bz61JMbygk+E0r1NuhTlGSeLl2I2lrGUkW6rjEyftbGBU9Z
	goKiId2MfM2etgos7XZSfwrw05LMeMpbCfDGq/I5MI8NHDEtFJqgwRE18BG8uSmHVMlM3syiC6a1x
	3EcHJ329+YBuXhVro7TCMFn6KK3SnNNG2PDPhH78mcRHMNRjjxEWMLwl+V8GmlZZU8WcpUFkCB1fa
	jqxbWKYg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60550 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVaL7-00000001cZJ-0V6J;
	Tue, 24 Nov 2026 01:38:37 +0530
Date: Mon, 23 Nov 2026 12:08:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH] hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754
 chips
Message-ID: <88719c0a-24dd-4714-8729-bf7deee35dd1@roeck-us.net>
References: <20261123-ltc2978-ieee754-peak-fix-v1-1-96cbe686ab67@analog.com>
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
In-Reply-To: <20261123-ltc2978-ieee754-peak-fix-v1-1-96cbe686ab67@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVaL7-00000001cZJ-0V6J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60550
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNDb2xtbjxXOCV1GGHu7P12NV0t5hIMsbaq/PiIjKbz4mF1n5/suh0G2aJp459t7U1aTmnPRJJP/LOylM2a24GSFByIy/DDf/OFRBADzTwIMWSxdvx+r
 ad2wgUy8Y2D6T+gj6nsO5L/CmYvNdh6tBgeReZZ0oGWO/Oue6x6Q74ax9PZfdfSYcRFQgSHfEgMvydVDXl+FlfKb3bnmZzSzm2keJa+rfy+/zyWVtn0gEnjr

On Mon, Nov 23, 2026 at 02:52:02PM +0800, Christopher de Guzman wrote:
> The LT7170, LT7171, LT7175 and LT7176P report their sensor values in
> IEEE-754 half-precision format, but ltc_get_max() and ltc_get_min()
> compare peak values with lin11_to_val(), which decodes LINEAR11. Bit 10
> is the lowest exponent bit in binary16, while LINEAR11 treats it as the
> mantissa sign bit. Positive values with an odd biased exponent, such as
> temperatures from 16 to 31 C or input voltages from 4 to 8 V, are
> therefore decoded as negative, and the reported peak stops following
> the real one.
> 
> The peak start values have the same problem: 0x7c00 is the lowest
> LINEAR11 value, but it is +infinity in binary16.
> 
> Add a FEAT_IEEE754 flag for these chips. Compare binary16 values as
> sign-magnitude integers, and start peak maximums at -infinity (0xfc00)
> and peak minimums at +infinity (0x7c00). The min attributes are not
> exposed for these chips, but the min path is fixed as well for
> consistency.
> 
> Tested on an LT7171-1: after stepping VIN from 3.3 V to 5 V and back,
> in1_highest now reports 4992 mV instead of staying at 3294 mV.
> 
> Fixes: c1d6afdbb8ed ("hwmon: (pmbus/ltc2978) add support for lt717x")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206843@kernel.org/
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Applied.

Thanks,
Guenter
