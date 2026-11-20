Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202764;
	b=CXdgS4SN2VtGn8h30+qLD/kyKgwcqJ6BU9H4SJj3n08CKp1I0yEMB9N765Vf9kLtbrqw
	 hNXhP0wLQzNacBIpGKhgAGSRIeyds9Ruefruf9d4TNNjp3dhtdHZNjvxa1PGMqj8GYWPo
	 I4H0Lm9if2F3WPJJEOr9/kVao0DL2z2jFVIah+Cr6NhDZkG2lmii223ngV7/DpOA0Wk+t
	 YpbzGYLZSD1j/FJhEndqQmHo94AZc2x5bslLTv8aKWWtXhb2Pzu9Qb3pqgfdTqkenzXXM
	 5jvTXq2A+C7QuOnWoX++xzYfhueSW14z+zcJ9lAuZVZNEqrMxJqhIJPL197iT6R005w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202764;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:
	 X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=tiJscClyvBCvVMuU6LO39KI1GZ1MeRbP07Q45lvU8jk=;
	b=uH1Ik628RuvGQecr45wj+tFFZyfXo8FbqzljSHn2O7pIpwQxOMYT+OHX665vHprhncwG
	 FdijE5uTQAwEL+p80LVz0rG+z41GMX/NTi1RoYlKijdSGaQbJpw0eJVvD2C/yx1FqfNVb
	 ERJzNxy/HoaH9YZJy6Kw8+nOOSKWJmtTXi+lJrxsKO8xqksJqmjVGJ8lqaqow88lRBuBq
	 6bcUp+v/d1T4V6Y1HtVfGK9PmBWLSvhpgSTRRyGmb92SzRXFf431090LW6Sjvf7bzYp4F
	 Z5SXBqv9sc7s248Vm+CJ1I3AdOxentrhkoiONdW/hnQWFmx+SH9DU1DWVhNGZAQiBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3XOXyy62;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9C1606A6E4
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 19:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF9C1606A6E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=3XOXyy62
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id UFnAxgjLRRiNxUUFGx5JnY; Fri, 20 Nov 2026 19:26:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UUFFxJlm5SeuLUUFFxuwnM; Fri, 20 Nov 2026 19:26:01 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6b009eca
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=U8fI0MGuNzyFiabFk2gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=tiJscClyvBCvVMuU6LO39KI1GZ1MeRbP07Q45lvU8jk=; b=3XOXyy62BO35
	kx5b8aLzzvYFbvuUv4thIZaCMEQGMu47SNNFzrQGREKEF2UiYFa5FKybVflvVEtL0fHKv/xFAC9de
	InuY6q0NYWaWzbK4IxyAdgqL6+XuysZkNvMYq4I4SuAqXQdU9/7PwSr+edcJXUqIFpS+cgSiTja4v
	giu5UBAmxHD/Q6qq0/J5q/QblE3eLIgPCC0/8SFj0MB59JEcxuccKlXuP73Ev/1Vc+WjzT4G9mkJE
	Ebj6MJ/3fokUcg5jtlezUq+PklHIDaNIlCcDe6HxPoiiGDNve8MU9x2hYWkMqd3rVBO9uUxEebrcR
	ZF6FUq1+GCRRsHgYyD9GyQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33204 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUUFF-00000001WZb-0fkj;
	Sat, 21 Nov 2026 00:56:01 +0530
Date: Fri, 20 Nov 2026 11:26:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Asaf Nuri =?utf-8?Q?Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Remove unused for_each_sibling() and
 name_attr
Message-ID: <cbb8f3b5-e2f5-4bc0-97f1-c77f897fb698@roeck-us.net>
References: <20261120165926.579575-1-asafbertizlioglu@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120165926.579575-1-asafbertizlioglu@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUUFF-00000001WZb-0fkj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33204
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGmr/bk+UPwgNdhUkL9K/oA3KS9BbzZidqQDJh9veBps09aDp7BQMB4m7nY/Wh95dqmr1UlrKz5EDmIu8Is0rSzWCfBGE9ATRW/EjjiVGDRGJcwmR6ZB
 ItnIAgXhQ911fTKMYAJwvuVcpVP7d48aQfZwVaUiCg0CU5QLFDYmip2Y/Lio23A3nPUAdQGkW2pOP09oZP2sAqsQKbHTt9gac++4XnVPbuMT2nY0D8b0J/H3

On Fri, Nov 20, 2026 at 07:59:26PM +0300, Asaf Nuri Bertizlioğlu wrote:
> The for_each_sibling() macro lost its only user in commit
> e1b370b64031 ("hwmon: (coretemp) Simplify sibling management").
> 
> The name_attr member of struct platform_data has been unused since
> commit d72d19c26c41 ("hwmon: (coretemp) Convert to use
> devm_hwmon_device_register_with_groups"), which left the "name"
> attribute to the hwmon core.
> 
> Remove both. No functional change.
> 
> Built with CONFIG_SMP=y and CONFIG_SMP=n at W=1 with no new
> warnings. Apart from the struct platform_data allocation size,
> which shrinks from 88 to 56 bytes, the generated code is unchanged.
> 
> The unused definitions were found with an LLM-based coding assistant,
> which also drafted this changelog. Both findings were confirmed with
> gcc -Wunused-macros, git grep and the git history.
> 
> Signed-off-by: Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com>

Applied.

Thanks,
Guenter
