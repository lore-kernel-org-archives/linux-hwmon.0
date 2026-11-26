Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657665;
	b=WPRyjU2AZu7sMBtJvPA5yR5TDRyfr+SCw4bt1hXlCvkp2/OhvOUOKAmpd61MjND7/5F6
	 t5rrO+thU7gM7kTYUkkRf87CiXbrP6VsfQxzZ/tTePPM8uj67VGK1aV0GUyEA3NE+zDEr
	 Bs1au8ktcAmrFVWjNgP+gJbG5vweE7rwsy0+vrjRu+77rJdhGbIiTMObpWxUlxRq9lJFg
	 gaUSP9IE+6nYLl3ZF2qRVF12+dwZF/kjUnF3IDK3llE3tDlZVuA5LcIfdKFSxH9UObDg1
	 nsnh/zsMsh4GWFYUc9GIY4tiHQsUN+Rn8ppB6z0v+4j6USzctUWdNq7OWoAYBn/SwnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657665;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=FMs61J1VzIsH89hHJ/Ixi+nxqnxJ6HYCzSaQ5lTSfMo=;
	b=pvX+dfIqTlVNaElNKllGRNGarrnWXdcjPL4Dcm9lIaSZQ/s6WmgwBzlVM7H5cfCp9PZm
	 uc/rwJMfK9g74SJPsqeG/TpkbFhj6Z/oz4xIUkHHj6jH5c3SbjFNKzod+FET7JIBRJzJE
	 0KTsixEZIvekk5WqwM/57XCjTMLIssCiYPmaF9bvWjMogI/dqYlq/aJP0noqCg6+7Cwon
	 h7oTg8fugkFFHxknBhAUoJ2l45IM664vybPV7qiAoJ/KtZVfk9XqHI2nws6TJi3WpCWxs
	 V9Og7y0e4XNzmEeLAU7zt4Go6DRLTAz98gpeMyPR/oA2XswQJT4ZzgpoYDy8X0xo4mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=UGAgwoHW;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A75606A321
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 01:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A75606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=UGAgwoHW
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id WKVzx6J8BV16IWOaIxEx9t; Thu, 26 Nov 2026 01:47:38 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id WOaHxkbA5b2qJWOaIxw7aH; Thu, 26 Nov 2026 01:47:38 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6b078fba
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=1XWaLZrsAAAA:8
 a=qb-T7JNNOAWFUjPqn7MA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FMs61J1VzIsH89hHJ/Ixi+nxqnxJ6HYCzSaQ5lTSfMo=; b=UGAgwoHWliEYxDH/xSqgfzGik9
	eHRUY2coW1qeu8nRUXcq5dnZspnYxqTFoPSs7THmxA8ATHHTCBD7wT4w0j2Iwc0i/g7WXO2HOB8Yj
	VRltLeVNy12yItVRumLimoUYuJ+VnXN/0TUEq2doAfVXdHe47Z4Jx5khJHJz55u1SPvfY/LPTXuF/
	f+vDAfZPQoj7VPcFAtYO2LsTYAfGGVHAwH9rznAwFmuSbAa3YaaOisQd8qLCyyFKfTOXUE+nk9kTB
	gB3Og4JAboClCj0EVXVHDobdihHjOr0Z5RhDV5jMgQLJ9s6xeG7Ms3c1W0HWAyLpSQ8gC2vSairxU
	H5gYP4PQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44110 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xWOaH-00000003a5m-2HKc;
	Thu, 26 Nov 2026 07:17:37 +0530
Date: Wed, 25 Nov 2026 17:47:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arthur Korn <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus) Fall back to CLEAR_FAULTS when
 STATUS_CML is read-only
Message-ID: <19295c12-1f09-4686-96c9-d1c076e538c7@roeck-us.net>
References: <20261125181336.3298961-1-akorn@google.com>
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
In-Reply-To: <20261125181336.3298961-1-akorn@google.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xWOaH-00000003a5m-2HKc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44110
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBjrKTIeqnIsVv33EC7eVaEFjpIvgubE/+S2mC4UYUx5pZm3d0kbzztIzrDgJLJMZuNYTPa6ajXFyvPZkBE1Re1UVUVQvOZSeRdsvyXk5epsGQ4MCA5+
 g2HL6j6yPX9TBurFVQcogMQCUlgANccY7NftjGKWQF6y6gdK+bIxn/QIS5RPNgA1LirfwRbBqVk1mwS70S/kUfnKXjawaEPaiiT1o3cCw17AA94bhNBft9lz

On Wed, Nov 25, 2026 at 06:13:35PM +0000, Arthur Korn wrote:
> Some PMBus 1.2 devices (such as ADI ADM1273 and ADM1281) report
> PMBUS_REVISION = 0x22 and implement STATUS_CML (0x7e) as read-only:
> they ACK SMBus byte writes to PMBUS_STATUS_CML without clearing latched
> fault bits, and only clear STATUS_CML via CLEAR_FAULTS (0x03).
> 
> During pmbus_init_common(), probing an unsupported register such as
> PMBUS_WRITE_PROTECT (0x10) latches PB_CML_FAULT_INVALID_COMMAND in
> STATUS_CML. When pmbus_clear_cml_fault() writes to PMBUS_STATUS_CML and
> sees ret == 0, PB_CML_FAULT_INVALID_COMMAND remains latched, causing
> subsequent pmbus_check_status_cml() calls during attribute discovery to
> fail with -EIO.
> 
> Verify on non-write-protected devices that PB_CML_FAULT_INVALID_COMMAND
> and PB_CML_FAULT_INVALID_DATA actually cleared when a CML fault is
> expected or cleared unconditionally. If the write succeeds and either
> bit remains set on readback, disable STATUS_CML write-1-to-clear for the
> device and fall back to pmbus_clear_fault_page(). Do not clear
> has_status_cml when _pmbus_write_byte_data() returns an error, so
> per-page write failures (such as -EOPNOTSUPP on read-only virtual pages
> like max16601 page 1) fall back for that page without disabling
> STATUS_CML write-1-to-clear on other pages. Skipping the readback on
> supported register probes (rv >= 0) avoids extra SMBus traffic in the
> common path.
> 
> Tested on BMC hardware across ADI ADM1273-1A (adm1275), Maxim
> MAX16600B.04 (max16601, 3 virtual pages across VCORE, sensor IIN/PIN,
> and VSA), Renesas RAA228234 (isl68137), Infineon XDPE1A2G5B (tda38740),
> ADI ADM1266, and factory write-protected converters.
> 
> Fixes: d9d30e1cb9ca ("hwmon: (pmbus) Clear only CML command and data faults during probe")
> Signed-off-by: Arthur Korn <akorn@google.com>

Applied.

Thanks,
Guenter
