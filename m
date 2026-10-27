Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118067;
	b=En9zpkG4nZQOIqxPN4QmjkJwag+Tyj6x07R0UY6a3+WW8nPbzKzmiDiR1ync4/jIhVAa
	 qorzLkCrCQwbUgw9OWATHjc242sKuUq2vcw8Gh0hakhFyV8+fTMS4pGx4RwoJCJ9bwitU
	 Ty5xSBqiJpxvL5Q4vAL7mFdbspXwAXrr65pj4fM59GX8Cwv9lGYzPLyCRpLbaDh9lxwVF
	 Z9RdJuoKlwyoF/1Lhyk18KU+/zzluDI/N+I5Q9xHlldPKu2tKI/2cL9SuxjuM7hCurdox
	 hzSv6ldI0JyKcGKKyZHCGTgDNqRPoTjt9f3mq7jAIIKWd+lLSqJJHlSkTmJO/vMr1bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118067;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=/EJgt032IdKFtV9uvcwyjszAG6BEFtwyoI2Bq1VEXIs=;
	b=YQWR7h8t3QkZi1kLpTiskjuDH5TqP6+0G+x10lCzCRBS7Zw8ee1Z8u0GruQoTXIxrFJ8
	 kABZFn0ZXyy4IJMY9NGxO7w8uQhOe4gKcbIReviBQExVE9ypOCy2UhYKNniKws/6oBOKA
	 bYByRcJ0mo9RBB1pCtNaNifRdlFzLXQc9wsdmGc9vGspei1lLS0IBzrtf9ZyTIAfkn79v
	 wnWkkaPTIK9Yc1hZZ9j2LhDc0vwh8PsVBuAbLOlyhzILnaEmiBznELhmCT8f2DPxNVSjO
	 gZc1L9ZY0xXX9mwgKdjFDzJ88c3u3Ntc0e8P1NsTqia5LkAJqKYoob7Bc53NZnzm+ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="Q+/9W7sV";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3198606A31F
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 16:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3198606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Q+/9W7sV
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id LhouxxmPqv0ndLjv8xLfGF; Tue, 27 Oct 2026 16:21:06 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Ljv7xT3uVH2S8Ljv7xIlLV; Tue, 27 Oct 2026 16:21:06 +0000
X-Authority-Analysis: v=2.4 cv=Mfxsu4/f c=1 sm=1 tr=0 ts=6ae0cf72
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=QDHc5EiPAAAA:8 a=cFugUJLFjlu1G8EhGgcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=59RwALqDKVzMjVMkmKwL:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/EJgt032IdKFtV9uvcwyjszAG6BEFtwyoI2Bq1VEXIs=; b=Q+/9W7sVWOL7f94vaxUWWWnKuw
	/eS72wD3OA7M7OAmX+n98fIkwLOQ+u3kytxX9w2qqJWmJ2jBX4ZX3mncaSCNcMtdga1RjjBeR9C3r
	3h3R+f7HVI/nIgVrGTcTs2nV/tLtsj3iYFaYBAXOxw4M4X34EvQOzBfIEnKuirwapyb0ZxaErHDIN
	XAe0Iw/6AJSrQv3DI12/LAOQPuzNnYSobXDtOsx+b4/BV7jJTNXX49DDgAvOVCRrmSOpCtC7aClo8
	7Rmvdqp8DENvcoqHQs34Z69zJi9HiMFeRVNHFY1WTuy+/urM6kxp7AXmSxVRdyWpzFGFXiHd+t2WF
	pjghLRrA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38130 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLjv7-00000000nU6-1WJd;
	Tue, 27 Oct 2026 21:51:05 +0530
Date: Tue, 27 Oct 2026 09:21:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: remy@demangeot.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
Message-ID: <1fcc110e-7269-44de-a415-1848922f75f6@roeck-us.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
 <CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com>
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
In-Reply-To: <CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLjv7-00000000nU6-1WJd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38130
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 51
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGA/v6cbhKhbJ5HpvYGu5LaXtGX6faoM87LuZqX78pP3l6cbQsMR9hKEj2hffz7WHJsAvb17PcUtgU2bcbzDsp7lylov0I+BEeksVfwisNtir9x7/7Pp
 +Ve9/pUFRRnRxvBzmEjp0w+kbD4AGbXWziUPaFPyy7x9mHNPiGZqtRb25fznqbb5i0yr9QhklkcAaqnAJV5DhGQ8+a0qAAuqKTeHMxMd+LR2sq2a+bYh3tFC

On Tue, Oct 27, 2026 at 10:23:33AM +0100, Eugene Shalygin wrote:
> Hi,
> 
> On Mon, 26 Oct 2026 at 09:57, Remy Demangeot via B4 Relay
> <devnull+remy.demangeot.net@kernel.org> wrote:
> >
> > From: Remy Demangeot <remy@demangeot.net>
> >
> > The MAXIMUS IX EXTREME has a second EC (firmware ID "RGE2-Z270-0109"),
> > not handled by the ACPI EC driver, at I/O ports 0x68 (data) and 0x6c
> > (command/status). It uses the standard EC protocol (0x80 read, 0x81
> > write) and the same bank register (0xff).
> 
> I'm not fond of re-implementing EC access logic in this driver. I
> believe the ec.c driver needs to be changed to allow us to simply
> create another acpi_ec structure to operate the second EC.
> 
Me not either, but that would (should ?) be a separate effort and might
take a substantial amount of time to get accepted upstream.

Guenter
