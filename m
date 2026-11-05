Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851939;
	b=mPuX6/zATYM0huunZW5jcpw783uwevMmunwonzxY9bZ0zqzR0G5jEnT9/1TlSRRm8HNQ
	 SaXPYMAJsguXZlrqsaUcp97WCUy+COcDwV9QjnX25N0rd26vMUnmjz+S6yXxo0IpiBnQW
	 eYO4Oh3hg8m1xfzs3p2XoJDBSn75t6tfefla2EDnIaDDCR3irBK+L7Ihla1cwVaM1ik90
	 v103b44NNzygDhYATCi8mqaLoAZzkMXVEnzhUf3OnFrmMI5iJEhvR87bOSixJR8C7I6uX
	 W6VZ4dd+IetXpV5S3175/bfNZfu9UdOLMq9rjINUuoFjEFQFjNtq5fU01wCEi9po42g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851939;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=c8m5MIJPDMmiDGEpNvB5AEdQQVP/9nxkivagAbmdY3E=;
	b=BihBr3iaOzcLwOcT4fSGmpp5Z45edm/dvWR09s8ycO1+qseSN08yVteDqDn4iPlU7B8k
	 n7GbDxXIphWAJS4RZO4mp8zu52hLN7FrnvsByUCI79sqK/qEFkGU4y1Fm4v8+SldxTQbs
	 YGR6ozeq7jhYPk0rXaPhUDMLvqqZLdxUAXwOCnsvVh+n7rJL/eCkpkI7pw4igmwvbtjkd
	 5zHvM3sK1qmC5sdsMTl1+x8xTeucyR50u/59vozqUfPazNNVSv6pUGDak/5SzYjqmSqsK
	 R2VyRdXpenJE/3/1T5n1Ea/oNBS51OxhkMq6xaBpzjoT+9p1ZeO/0Mgf5/vDJQDpggw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=drn8R2A+;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB7606A326
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 04:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBB7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=drn8R2A+
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id OlojxujJwyb4YOopnxEg1s; Thu, 05 Nov 2026 04:12:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OopmxhiSCVqSeOopmx59i9; Thu, 05 Nov 2026 04:12:18 +0000
X-Authority-Analysis: v=2.4 cv=eLETjGp1 c=1 sm=1 tr=0 ts=6aec0223
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=4dYrO911E-Z2Nd993hQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c8m5MIJPDMmiDGEpNvB5AEdQQVP/9nxkivagAbmdY3E=; b=drn8R2A++CY7/9cj26bKs6QiaD
	J6pcWbAyKj9SHdAz892lRIdOdsexDxV48JWnpvyYaHeM8BXjCiktAO8SFWYJwG3raZXF4dGfc2Fzo
	IB/quCSEYeyr5gOHKFl2NBIk23YSKpL/8ygJWK8ACNBOjXEQQESxhKF6VZHrr9mrMxt3EERFkdrra
	slrNuoGUiAjeR+jmX8a4ebeDeRsBS6TQo5vM7omEKD5BugR2FDOOt/4NC2mQ0YFQxKt3gxehPAOLK
	TcH6cJMz6HHd6fFV+6/885QELU4fSZWlg/j1OTRw62ySBJ22rtqzeV6ANpt806NpsO+kWSvuBh+Ly
	LEY+ncnw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46092 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOopl-00000004BYe-4AfM;
	Thu, 05 Nov 2026 09:42:18 +0530
Date: Wed, 4 Nov 2026 20:12:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Carlos Jones <carlosjr.jones@analog.com>
Cc: alexisczezar.torreno@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/max20830) Add support for MAX20810,
 MAX20815, LTM4739, LTM4740
Message-ID: <777a34ee-aa9c-44ee-ba00-5bda32539324@roeck-us.net>
References: <20261103084331.449-1-carlosjr.jones@analog.com>
 <20261103084331.449-3-carlosjr.jones@analog.com>
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
In-Reply-To: <20261103084331.449-3-carlosjr.jones@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOopl-00000004BYe-4AfM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46092
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 19
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHI2z20mQlxl/e+cX2bFpzCVtmYPxGrUWwl9J/aegIc682ELNJf24Q/siq8vTydG3UOYWGIZVKw34mUpi/b53IF+g8tYq97LyhNEOv4WtGdYBQLkrVHn
 HFNutdUpgZm0rWXxWiHVZ1Zpif634J83mUzK0JF/wtNb7mOztMci01g7/tyccPjvOanOJKxnEUQBXDML3xbvmwjglliVEij9h6tDzfaVnGVcW+R1jNxKslaV

On Tue, Nov 03, 2026 at 04:43:31PM +0800, Carlos Jones wrote:
> From: Carlos Jones Jr <carlosjr.jones@analog.com>
> 
> Add support for additional members of the MAX20830 family:
> - MAX20810: 2.7V-16V input, up to 10A output
> - MAX20815: 2.7V-16V input, up to 15A output
> - LTM4739:  3V-15V input, up to 10A output
> - LTM4740:  3V-15V input, up to 15A output
> 
> The LTM4739 and LTM4740 are the LTM-series equivalents of the MAX20810
> and MAX20815 respectively. All share the MAX20830 PMBus command set and
> telemetry, so no new register handling is required; they are accepted by
> matching their IC_DEVICE_ID.
> 
> The LTM4739 and LTM4740 are uModules built around the MAX20810/MAX20815
> dies and report the die's IC_DEVICE_ID with a "B" suffix ("MAX20810B" /
> "MAX20815B"), not the "LTM4739"/"LTM4740" names printed in their
> datasheets (which are being corrected to match). Only the IDs observed on
> hardware are matched; the plain datasheet IDs ("MAX20810", "MAX20815",
> "LTM4739", "LTM4740") are not matched, as no part reporting them has been
> observed.
> 
> Matching is via the existing adi,max20830 fallback compatible; no new
> of_match entries are needed.
> 
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>

I'll make the change to Kconfig as suggested by Sashiko. No need to resend.
Applied.

Thanks,
Guenter
