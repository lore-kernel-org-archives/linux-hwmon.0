Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673146;
	b=pSC2gQUqcJQQGe0TWovm2LpC+doNp6ktJRuavJN55KxjcOiQozpSQbkxIxq0FROS80yZ
	 a+1n7jAQIyXHHgR3wVKVNPzZeyJOhaEy4NyqysEcz8Btf04HPX4P+d0CrfVS+IJTr3BeO
	 3WaXHefJ1EnsFNAqOJIPTGgYJVV4a5KoXl9sbmwdro43QgSsJFRUqk2bsEexV1PdCaSKB
	 Np8RvoCy1riL0mETNKwLl22IUOuuTFiTCQTxzzLpJbpezdMU0Z1bxE4jxn4hzrY2+Ekyn
	 yUp9taDS9qDkqAcpVhsxsb2NwMzJoVsSbKwuSMa74KRKm1W8t4uVYgvHTfjh7xIqGpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673146;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=JCDCkpZpZx3msxFpU0K7Bh+oLFZlG0e5BdfbB0gsogA=;
	b=SZK0UhUt82kcFY9TgkKwguNA+632KElUiRsTZkBf3JyKSbHxqNHPK/21cQZWt9zhHlTE
	 cyjVckE/zBhllWijBLQ8Uj0JoaCYyn7FbJphiMRTKtmvzLL+B9DcaqgAgofUkCbOTd9yh
	 +iu9BWEU2hdiVk5QaHAK5RM7cIX9gDgP4vKyFlx4IV6KFckgcia4+GKYl6LP6JAC4zEuE
	 rURGw84a0nfpjmdSE/jk1DKorM7UDMA5zWmum8/zV47C1yX6RBPsJwGhNLV4BLgBvCTVZ
	 40C0djD43eihpzfwA812CmKJgckcOD48uIJZAyzyXUq5YXJDMsXa/ze9cpNbx+4JYTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VYCQKKLo;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC96606A32D
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC96606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VYCQKKLo
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id SDX6xGcCgRiNxSGT3xCCH7; Sat, 14 Nov 2026 16:19:05 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGT2xa5f8laNKSGT3xpR5j; Sat, 14 Nov 2026 16:19:05 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af889f9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=mn8VwWfJFaLlvHgQrZwA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JCDCkpZpZx3msxFpU0K7Bh+oLFZlG0e5BdfbB0gsogA=; b=VYCQKKLoer5ezSDEIGlp3u7A8x
	uZ+iLGexfw8yPMd4Jqau/5dc4FCpE6Gkm/7E2ngLDLCgjG6ayuR1bg0xzdrn7FRmmeMSG75JU2YT3
	5wZz6E1m3UPfUSYBxj8XNBPRUeYvfprWvdZlChJngSPMxyc8avaKc5Xfx3QbAQQCPr3exTidfXcKu
	gJ7/0HF/oWlRQ60ttF2Zu9U4EFo8X5DhRlwzB/MuJktN87pR1zuJPl7ioqLkZ+ea6b4hwg0E1zCVL
	c0xIWvF2wgQtK5xTCrnv+X1eY1NgPJCYlTTIP+jMr6p9St1xhOSNOTQRZXFmbjPLnG+qnzQfE/My+
	yBH7uNGw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43562 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGT2-000000008Gd-2VUG;
	Sat, 14 Nov 2026 21:49:04 +0530
Date: Sat, 14 Nov 2026 08:19:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 6/7] hwmon: (nct6683) Name the fan headers of the
 ASRock B850 Steel Legend WiFi
Message-ID: <1155bf6d-9a68-42cd-91d2-d336f345a020@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-7-jdahlin@gmail.com>
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
In-Reply-To: <20261111082838.1418051-7-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGT2-000000008Gd-2VUG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43562
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 57
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC+pSd0Z9Yol/YzYCyKgM3gOFYf8haOcR4Mr4DLBHHcrasLIh7wVFQPmns8sXtl5eO+LYEBMQI0TUsqDOTBNFZHcVWfS/MY7EZx372llBuDAyjc8iRmX
 wW6vwzJmN7EXwdes5B7Qtnn3MxVAGce2J7Nv7vCqGHjGIJ6KheAAVtC2m3nAP29dCxeYZ94FPJGbgsBZp1BbPhOQakBdYwnGxcnkTs1Z2nckuwrzvG49194r

On Wed, Nov 11, 2026 at 09:28:37AM +0100, Johan Dahlin wrote:
> With fan control available, users need to know which pwm channel drives
> which header. The driver has no fan labels.
> 
> Add a fanN_label attribute, visible on boards with a name table, and name
> the channels of the ASRock B850 Steel Legend WiFi after the headers
> printed on the board: CPU_FAN1, CPU_FAN2, AIO_PUMP and CHA_FAN1 to
> CHA_FAN3. The order was inferred from the readings and the BIOS defaults.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Again, please add per-board sensor names to sensors3.conf.

Thanks,
Guenter
