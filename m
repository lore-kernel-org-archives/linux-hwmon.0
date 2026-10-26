Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042133;
	b=PZ7+B4CHbysEnZqLGVANIsv5CD6Owa58X4148jHohSvFynzx9jf7lqEG/mp6upk+W5QX
	 SsHTWB4gZaUY1WRbOQgY0UEqYZMJW/mpXjwAuS0YuWDGiZ8jJd+xv5ihL/3GZx0HkC5S5
	 75SW7G5/QE6CCZfH+fD9pDEYg7x9MTkUxHFvWq9Jfcqk3EDpI0KrGQ6rZsMTwrCcMPfMJ
	 +rMwrNpmzkcGqkQfJCjRTuvBj3va0Ane588yhIwQqRT7bMmJetTHhd50XAu1/syP68K8E
	 CDImO8fxnH2fFE7r5/CPYcsdcSjTqbf+BMMdudIDv8o81hG7T37u24gUafu6uOQsjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042133;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=dthud7n8CfSjqHS7DsUzsSN6317CU/LaPA6uNk4Ml7Y=;
	b=sW/lXSbmQKqRaJX3zWY+ngiz+WA190rZtPuwSvqUKQG1wvh3YVGzJxhzsLvOhxSRiIbq
	 85YmdenByZXiczBk00uuQAhhHMJ9/eLksY/gW7ll3i0vYna2JaKE4H3vZ78hCCHofTKdF
	 3jVnpzQuoOBRSNqBlHTeMjrQgNQ68MdTLNNvFBjnnFuLGeRjLRSmsqceOvx2rurDhv0dG
	 xOc13Pxsw2HQYkq7THpSDmuN2P3dwRKLx4h0OKuE4sNc1KUvKQnYjDHGaOng0Zs7597wN
	 v2HiFVtR5OuuzhCvS/H6ZQtLrOCBiRIVKRucQZAy2KtVGvVFw0MpamKTzr/VTT62rLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fU5dWQ1y;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D65E606A31F
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 19:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D65E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fU5dWQ1y
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id LPvQxu8MFv0ndLQAOxD1EN; Mon, 26 Oct 2026 19:15:32 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LQAMxzP7Ef4wOLQANxZx6u; Mon, 26 Oct 2026 19:15:31 +0000
X-Authority-Analysis: v=2.4 cv=db2A3WXe c=1 sm=1 tr=0 ts=6adfa6d4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=NEAV23lmAAAA:8
 a=uk_-rdj3JvsFQWsf6W8A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=dthud7n8CfSjqHS7DsUzsSN6317CU/LaPA6uNk4Ml7Y=; b=fU5dWQ1yEtI5
	iCBbb4lZG6wtacNr7PcieCJbBxCnaB2p4eUXqUysKHRxReUDdWkEzHUlhc0gK7hgnfFp8LoxgSY5p
	7IGN8uHmARgK8Ro8QysvvmbO9hxfo4Ujp86DlkOzSf+Wc0hSQWtHv+THLNaJHxwMn03V0M2A73YtP
	E7JqlSwnTjRWR7+bS/8Ii0380ONMJ3Y7lyBmvtOZnZ6ZLgz0Ju8FgHfDD+pTz1alDTAdSz72nbtzK
	TbsjdYLgLExHi6RR1qt6I1UmrzIRoN/1aD8ccJXOYCMzH/r67b/FWpE80g3RZZI+X0lkjukyYJ/VO
	xhKfnFyFXK2sQhxB7z2dKg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54252)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLQAM-00000002EWK-23LA;
	Tue, 27 Oct 2026 00:45:30 +0530
Message-ID: <af46087b-06d1-44b4-a2a6-f737d5ca247c@roeck-us.net>
Date: Mon, 26 Oct 2026 12:15:29 -0700
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
Subject: Re: [PATCH 0/2] hwmon: (nct6683) Add fan control support for MSI
 boards with NCT6687D-R
To: Hamza Mahfooz <someguy@effective-light.com>, linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004153250.516730-1-someguy@effective-light.com>
 <at-dYL4g1w_qBxe6@hal-station.localdomain>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <at-dYL4g1w_qBxe6@hal-station.localdomain>
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
X-Exim-ID: 1xLQAM-00000002EWK-23LA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54252
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBPZdNmcfBqlMeYhvKmbis3kZMR9m+KMn+XM43cpAqmJrehxofQ5giI7lH9hjc3D79JePBGd6B4vJpY0Cbq2ACTnWOPiC4WcP6PCB7z0stETzxTrB+7Q
 OWo2g/FtayKFToN5TKjqkfQYOL86f0BXAZvzGL6EoMpX/h3aYgLR+DH2NlO/xpfW2Kt58q9oupNJWB3X/P+w9qy+/WFsbJHzcXm3G/5mJGdwS1oxbLEPKq+2

On 10/26/26 11:35, Hamza Mahfooz wrote:
> On Sun, Oct 04, 2026 at 11:32:48AM -0400, Hamza Mahfooz wrote:
>> Recent MSI boards (customer ID 0x20d) use an NCT6687D-R, whose fan
>> control registers differ from the ones used on Mitac boards, the only
>> boards for which the driver supports fan control so far. In addition,
>> the system fans of these boards are connected to channels 10-15, whose
>> duty cycle the driver does not report.
>>
>> This series adds fan control support for these boards, based on the
>> register map reverse engineered by the LibreHardwareMonitor project [1],
>> which uses it on MSI 800-series boards.
>>
>> Patch 1 reports the duty cycle of the system fans, and patch 2 adds fan
>> control support for the CPU, pump and system fan headers.
>>
>> Tested on an MSI PRO B850-P WIFI (MS-7E56, BIOS 2.A93, NCT6687D EC
>> firmware version 0.0 build 04/18/25), on top of kernel v7.3-rc5. Fan
>> control is available on pwm1, pwm2 and pwm13 to pwm16 on this board.
>>
>> [1] https://github.com/LibreHardwareMonitor/LibreHardwareMonitor/pull/2294
>>
>> Hamza Mahfooz (2):
>>    hwmon: (nct6683) Report the duty cycle of NCT6687D-R system fans
>>    hwmon: (nct6683) Add fan control support for MSI boards with
>>      NCT6687D-R
>>
>>   Documentation/hwmon/nct6683.rst |  17 +++
>>   drivers/hwmon/nct6683.c         | 233 +++++++++++++++++++++++++++++++-
>>   2 files changed, 244 insertions(+), 6 deletions(-)
>>
>> -- 
>> 2.56.0
>>
> 
> Ping?


Sorry, I was out of commission for a while, and I am still digging
through patches. Now applied.

Guenter


