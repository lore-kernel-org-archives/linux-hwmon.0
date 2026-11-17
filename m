Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931646;
	b=W9w9YkffVBd5GbpBXj3cUxZqdMSs0HWfdt3IB+SK43D0Zh+81dEUgyXutBgbEiyBV5mF
	 epfFd6kxOfJUdVQ0zza30gKhwHCvHPRdaiG9B97MRy/cYfWrMArWYRK8t6xDHCjjw8zAi
	 I4wBkRCViLVmXIHeYDnx4gvbdzW3/3ieZMWOeE1egbLQIXkdppPfcwZ0yclbUr3VEpnkU
	 zIU11z2CECnLrra/2NSYljeKQUi8xb0xIlRJ9lhxgQ41lRSmCfOVl15uo0umup0RMb9+l
	 ccM7RSmzJZzSuEWYPFeWjt2ZPy8zdyH5jvYRhWpPw8A8dc7/tn1QpEgvTduX/GKQEpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931646;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=B8rKq+lrMO2vs+TwCEpv+G1FuUz9J/1UMscRqzU7y2k=;
	b=qeV/TEaCDGbwuLb3d56tuW38W10TnSyhq4+oZs0bF7JZ6mx+4onD4ymWKlthUP7AEuxh
	 LanLgewEoQW3vfwWsaqNtnU1+DKWaTkf9jhsdy8iwjml9jsDNxfuRZIGGAloiYegBU1jM
	 bk6gy69IVD1NgTY4MiemWBo8MxWZ6K9X6IZzrBR1pNo/mE3cDAHyI+y0CS7GbFypiWzP0
	 RD1gajIp8Cd33ptY44iapb9QR0U8z3jEzixYMEgb8k9603d7LU3BsboCgpd4d5sJAEzYs
	 zZwKRHrYQBfq/ptNGbqH4xYjDmEDKzq5T7+kGJNcpyGvAUEE3ovF2PuXECIsuBPY9HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FWeA1A4v;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A99606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 16:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FWeA1A4v
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id TDAjxmn9lOOJnTLiNxHltd; Tue, 17 Nov 2026 16:07:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TLiLxW9XaFhzrTLiLx94HA; Tue, 17 Nov 2026 16:07:21 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6afc7bbb
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=iHwBjlyiAAAA:8 a=n7ZOxHGsqZCoBoouLwQA:9 a=QEXdDO2ut3YA:10
 a=uNSKXYNwxGiU6LD0JREI:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=B8rKq+lrMO2vs+TwCEpv+G1FuUz9J/1UMscRqzU7y2k=; b=FWeA1A4vfBgI
	nhgLKxloJNOtVfZC680Egqmw3iDaKxTt/XkO1i57ZPMifQV/b77i/KryZrlhQf+YlWTcnnHdTzSFp
	PHj0+0Lue8NmWVi1Eb7WY20b4wp9ZI07oMoAb6N/Iwqf9/G0ikNCXl3Jn94+4u6PUMMXgNrUFNIoi
	oekDSKCK/dqw6W9ISag61aLlF1oFGZbwyCB5AiuCX/tSZ89q206urqM0BjzW9Ptm5W235ciSCn8KE
	kuPO54eZgRC0zFNpyu0PfhhZuFiFbqFUm7vMTJD6OKNkZydcBKdyTEIN4sSP+/ZpCV9UH3gL7iZIF
	fWXyEyC6K61cnBeFv8eerw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45048)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTLiL-00000003JjC-10Fi;
	Tue, 17 Nov 2026 21:37:21 +0530
Message-ID: <aff0cb59-fc73-4081-bed1-12de5d068404@roeck-us.net>
Date: Tue, 17 Nov 2026 08:07:20 -0800
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
Subject: Re: [PATCH] hwmon: (pcf8591) Propagate channel access errors
To: Siqi Chen <chensiqi@uniontech.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261117113819.3336050-1-chensiqi@uniontech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261117113819.3336050-1-chensiqi@uniontech.com>
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
X-Exim-ID: 1xTLiL-00000003JjC-10Fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:45048
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKwcNlmnlsZvTxerXj+OTbPA8opnzjHk24USQDK6EisriVFQxfa1lotGQ3RflxjyBagXeP7mRLkWUxGihBEnMxXhSx7oRzx1m6Ju3whoOmD93xw3tT8i
 zlNqDfIYFRYSBCMWDR3KoST1iq/BCtVoyr6Sx1lLo+3FGzcrAmpmZ1fTiinMLn/RZAbXzD+QvRxYJ+5I0AOns//Sih2zOMP50SdfKelUFm7YwSulbEor9+PS

On 11/17/26 03:38, Siqi Chen wrote:
> The SMBus channel operations return negative error codes on failure.
> The final read result is stored in a u8, causing an error to be
> truncated and exposed through sysfs as a valid ADC value. Errors from
> the channel selection and dummy read are also ignored.
> 
> Check all three operations and propagate their errors through sysfs.
> Keep the cached channel invalid until both channel selection and the
> dummy read succeed so that a later read retries synchronization after
> a failure.
> 
> An AI coding assistant was used to identify the issue and help develop
> the fix.
> 
> The change was compile-tested with W=1. No hardware testing was
> performed.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siqi Chen <chensiqi@uniontech.com>

This is an old driver, using a long since deprecated hwmon API which
generates a warning message during boot. Such drivers will need to
be converted to a supported API, and the result will need to be tested
at the very least on simulated hardware, before accepting any other
changes.

Thanks,
Guenter

