Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672472;
	b=YaqMV/LXd5hXka+BLG3k/9f0pVv+FyPDJUhY2WEqE5s5geT5NqaM/RUqBw9vupxJiO1j
	 XG+ndpmVFKdZSTQp+mEd6XZGYXNJW8sz9DM9hao+RmZiZ5JS/JnrsGTHx3tn5ubco+dYk
	 ShERZoKHylmk8tNf3wltqhwAAjWqyxcncvyXdBLCrRTNQv+J/oexPt10igkQ6wjdRgVUm
	 SRUVsd62El9qW/6qo0rPjgMFJWszo0MdBcI0+YPyt4BWQW/yLTbN7KretF/rc9gLNITDa
	 lPe+wYgrWjj+PKdnTkF/bnJqIsCZakH5kf8k9zwSRTu8uoNhrWq+LpiBeso/m5QMjZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672472;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=zDhHLVzm0ltWkJqSO39EapXAB/Qsjr0CDJVvVZprU7o=;
	b=ky3ocimt481yF3Fo0Q9muWSGjnFSHfRtS9XpyCrxVN9sSJztAoEyLPcv+b8KqF9CTek+
	 6zhYS5rGuz0fe5puCL3Zf3vO17yHNsvMlBBemZdJRQ8DW5n+ILdymP+ELa8fk+AMP18wC
	 T0LO4yEyoFXeGa27SENcfU+zZxOpj7GLIavQK9stDn+ai4ZVu93dcxfXASNofBvAvhc28
	 ZthyN3mPUl4gPOrjG2Hwd5QvE2IToxBZ7yLugGm8BiWeYVuWKeh7c7iVfUpGj0Pf8O/za
	 qqPDWVLVR6GSrGmPiRK375bPjXESIwHDQLcQaeyTGEv3qcHJwt0ny0PYr8rYndlQHuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=xYCsW7z+;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A82606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A82606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=xYCsW7z+
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id SDmzxGeSKRiNxSGIBxC9DE; Sat, 14 Nov 2026 16:07:51 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGIAxr2geb2qJSGIBxmbbf; Sat, 14 Nov 2026 16:07:51 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6af88757
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=6wir25SuAAAA:8 a=WaVpp910takSOVfSHfYA:9 a=CjuIK1q_8ugA:10
 a=oK7VMHOC156yLVqBy6jy:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zDhHLVzm0ltWkJqSO39EapXAB/Qsjr0CDJVvVZprU7o=; b=xYCsW7z+zhJz7EjSuGt6qLm+BE
	2jTwL3TXA9nlJoZh3TJTTmhJicV667d2oEUQf99Tw2FW0yFI6k1n2mQN4G16vI/mmgITiAcp9SZmg
	YCOoBagLpYWKK2zxdBIAyEKSaZfEjVuGvI8LgPN5ZBFu1B8Q4ZQZXER8l62bZ3Ihoiz+/FcomXeHj
	7w0DnoOgWBb4dlDIq/bhUPJg97UJUf+Tup2ffjHJ+WaplNCv0Bh4fnRDt02dnbIDZcH4pgWlvawRT
	LpDAqdiwMk1wuQsOBYLcgaTaqXZY4wYYHzql/WvnkbowORWFYIx4tupHd7uQjL2Wn89GtGcvhDq+A
	uHMp9apg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49340 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGIA-000000004Ey-2qiu;
	Sat, 14 Nov 2026 21:37:50 +0530
Date: Sat, 14 Nov 2026 08:07:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 1/7] hwmon: (nct6683) Add customer ID for ASRock B850
 Steel Legend WiFi
Message-ID: <d998a57b-3d5a-45df-82d3-c01179bd6af7@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-2-jdahlin@gmail.com>
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
In-Reply-To: <20261111082838.1418051-2-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGIA-000000004Ey-2qiu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49340
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 27
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAU/PbKws+Yh12SQRD8us1wT6uqyZrlxUfU0zlmIHfYG5oNiyXsuT0cI9f2PgLLjvUdmwafTkHYDyCv6htnUaKBECclfF60PQz4tRQChMGApS/3HWc+r
 GIilqH4Hn86Z6bBeqDrpRpocNhB7aVxqg+gISs+a6HdaKgiQ8j+IFPYjeYXQEY035NxixBZa7LPnqdJB1FVtv0VOFAY7Mo7AwS2LtrWsFY76e+mFghC4igDr

On Wed, Nov 11, 2026 at 09:28:32AM +0100, Johan Dahlin wrote:
> The ASRock B850 Steel Legend WiFi has an NCT6686D with customer ID
> 0x164a, so the driver only probes on it with the force module parameter.
> 
> Add the customer ID so the driver probes on this board by default.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
> Tested-by: Alwyn Kik <alwyn@kik.pw>
> ---

Applied.

Thanks,
Guenter
