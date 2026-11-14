Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674663;
	b=haB6TpBX5AAeGFcPMDsVPO2sR8dvNww5YOWVRiEP+otQPhkiTOwCkev8H4bXuP2J/EcU
	 Zl+qxiqpFjByWR2cGDlpE+Ti1XqD3Ph6aH8ellPC2IfmEeNrrZ5JNSrGkyfudJAjJO1ul
	 zlrhlMWxoMCPhILtzEKbjAdlzfEPOh1DF4oByBAepx03eH5PSruz4SRSMNthRVd3iRIGb
	 mMNwsdrfMlGFhMKSjoM416F/ABKpZFUP6O+MEPqxPreQJhd85LqV5AkEHJM81VG1GWlha
	 4MLdOIrUDc5yaNnepaQ+NhQxLYDOeTUcdJlIb7JxtFnYf9mCzROcDxEXw0Cq7BwZIWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674663;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=B0OC0ZuonTQMXGfSxyDCyL/1ZM45W9+oO4OKZDmsoH0=;
	b=SMPDDiCMk7X8XtN91w01TFrgtXUsatL6y/y+apJJMJ8GNjx+HDNsDY667FfcG9VAw7VJ
	 LO0ksX32qqyaq4w2/Q2hdiXOMOiTLQZ+UmYQH+TAkLjwraQrkaBqy/qVAWwtY0QB/QD6p
	 EUubOT/SbUo7/Wb+xNqqOmUpCzObrXlKLLtpklHt3ljqb0+bS7UJP/K8Oy+fPGnkc5tMt
	 7cGZOQh2jRSduV+HVg7UYRYOSnn3Xjc/9gDdGDuWoQPaSbda4+OiTXU2NlKaI48XhcwgL
	 j43VdNVI5G4eTVDb0SVIuwxQNO7LvUzuJ5BtpzxbEPU1Db+HxYMlqNGM57aag/ITyxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gj8hRzTn;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6EB606A330
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6EB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gj8hRzTn
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id SEIVxzQhxJFmFSGrWxyg67; Sat, 14 Nov 2026 16:44:22 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGrVxbOCDdRrRSGrWxljz8; Sat, 14 Nov 2026 16:44:22 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af88fe6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=XYAwZIGsAAAA:8
 a=VwQbUJbxAAAA:8 a=kXeqfPWSxjI9BzV32rYA:9 a=CjuIK1q_8ugA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B0OC0ZuonTQMXGfSxyDCyL/1ZM45W9+oO4OKZDmsoH0=; b=Gj8hRzTn1Qv0Tn1Cegteb7ykRg
	3Hr2Vfh7fpwxl20G5C4GVXr8t+0XKtiV7ZqbCd2yHexKZzfWUZYM3R5hHl5XrOW5G9oak497GShdn
	BBYXj/2UERRK5fN4T8CaUVeZ4++MBC+gttXXZyDqHbjQ7WEQqFhpz7d8NCI1VaYO843flyVufD+xS
	4HjIoqy84YJX7r4sxJb2ShtqSgnPYLOpZiyaxjnJBuv5T/9/FWDxM46FWzVN0bxaiLjFPBIYPmfj+
	gVh4BAT53kfZnql1hENZ3zYXsA5OHF/dcat9cJEeMKmLay68bzxmJfUAq9ThWq38wkXQ9e0VJxN3P
	6ZTS4Rcg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48162 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGrV-00000000Kmi-1jrj;
	Sat, 14 Nov 2026 22:14:21 +0530
Date: Sat, 14 Nov 2026 08:44:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <db9e90e3-9d06-4b23-b373-9a78e2598ea5@roeck-us.net>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-2-robert.marko@sartura.hr>
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
In-Reply-To: <20261111161619.232141-2-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGrV-00000000Kmi-1jrj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48162
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 105
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNqD6DHVHwTDxnpKXgGVHJyf3t1wUhG2r1Rbna0cIxeHMixEMQjI/DIPLSSRnpa4UY0PXCU4LNqEqG/6fNzI5ga1Wzv2040zkU3MG2ioBp6WkbqG7ok4
 daoLrBeoymrNMiQGBfiCceHig1cH4JE1Prm07HGec78JXseX0XHfauKWdhv8SGoNYATSyAd2dOOHHVfPYG+HFdOf2h8OsF8lxZvGN0GV1cz6ZBszk8Mb04MS

On Wed, Nov 11, 2026 at 05:12:46PM +0100, Robert Marko wrote:
> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
> 
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
