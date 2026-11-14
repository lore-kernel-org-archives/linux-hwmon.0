Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674622;
	b=ANdpxHihmuN7qFoCOQNWWBh5hWto6sqmKBZT0mSDjX17hDOcA/o2CTZVY0cO0mum4Kyd
	 wOAxIaUVCUN6zYpoKOlYnhw4x//yf9ys6QeXdTHQctmylyEOVI8oQZhs3mEQ4HzT87UJ0
	 EeGMkQN/7C52LSzczrs/YxUxP9pQ7Tkm2vw6d0DJy/vJpNtiMP6c338lgxECe7srVM7uL
	 4Vegbcobm2LZgWy1Tr9i37e2wcVOxCuESJIsnHo3m+6B6c2O2F9xWcByDrvXrlzHcNXzu
	 xKzkpuf6KJ1CeT48zNu8szN6Barh6KJD6ktRu7EdAIBhJGM2ZJkl/YYjESJL1oTifvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674622;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=oxoLWz+FF4cPmOqHhBP22dzL/yz794wQWR3uP5yvWcs=;
	b=bpxNnKt32h80YBsCosrduM41oPYVnYfc11Kx14gDt00ciThvENcPj7etefTwm/t9+rGm
	 tzqLJzQo32naGVihd94BibB5s9eiGed4glynU/5vjFNeL4CXbQFd6WzLDatsyWtlFV3P2
	 VgxhgA3fTXxtM8/1WB9c1DBIlkwu4qCqpU516u7mcxA+l7MY6p97jRCM+orvg8A6eIuIE
	 k8EnobDTFCM7JeL7v/lC76wSN6OxcIhQWu0D5YusQYKUONWRQrKqWvq25RuWuxsF1G0bZ
	 jS4WAqq9aKdzKjJEVyOYB2ukON6e2Q6pz9MRtofypKeCbB0gI2El4qqmaeBb4ZAoD5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SVxCG2kr;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EE7606A335
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EE7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SVxCG2kr
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id SDgWxfHTXyb4YSGqsxgIfB; Sat, 14 Nov 2026 16:43:42 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGqrxbN5sdRrRSGqrxlizA; Sat, 14 Nov 2026 16:43:41 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af88fbd
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=epKNRfmuhR7F8Vwm0QkA:9 a=CjuIK1q_8ugA:10 a=mshYcpSARKEtRsk-hzoo:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oxoLWz+FF4cPmOqHhBP22dzL/yz794wQWR3uP5yvWcs=; b=SVxCG2kr7z5DKmWxqdACAVC8tT
	TzjxGc6gS2U69moDMvRhuy6WnbXByk0ENPHIIbUQgYgQ6Er1IqMT9Qaam8hV/MmHhySBk/CLDoiJ6
	r7L+w4voiV/7kzlIKAx0kTxHye5lNYscZ3wL6vug7TA+mtpM8+it9LTXzpfx+lyJgobvyXsswna8Y
	11PTvsi4K8fV+F6d6Ug98pxwPQicoYTxIjI+Tjn1HiKvTR3uMqNWP/AJPl8nRQYO8n8aBRojvQlGy
	eIvYQSdnMPPvXkxPKCQrPjuNXAfZkDk1Kc5ySLpoI8B0zKyVIiQJhZBC04qm8GskMGCdKO2pWaDwf
	fBHA2VQg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34420 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGqq-00000000JsV-3dMt;
	Sat, 14 Nov 2026 22:13:40 +0530
Date: Sat, 14 Nov 2026 08:43:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero
 pulses per revolution
Message-ID: <ce3ad183-3940-40a3-b4bb-c92deb8a7ef8@roeck-us.net>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGqq-00000000JsV-3dMt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34420
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 89
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDGDtwIYd800YxYrwzmJiAQrE0pSYDQMAjAQuOZRfx2mHkrd9g6t1JEnjBBo9zWvchtXzjOEH2OnvEVAzJ38QeIuR60Ty6iWUQ/nbrtVQycb2Bi72Pmp
 n3+Ccc8yKRXpMoVcshwmnC4B+mkhjjklhKnI2q2w2QRBNg6oda2a+L/SzESJt9p2usbOs/5dYZR4ZQb+OdY8qboJXWRrKLCeiuZcA/s1ZRfUAsscUkc96FA4

On Wed, Nov 11, 2026 at 05:12:45PM +0100, Robert Marko wrote:
> A fan sensor cannot produce zero tachometer pulses per revolution.
> Add a minimum of one to the shared fan schema so every user rejects
> this invalid value.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
