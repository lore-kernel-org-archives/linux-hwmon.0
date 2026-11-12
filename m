Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513114;
	b=4q2Wky8Vl8tyyJXpAiHwPV2mg/42sBpZJW4dtyKRNctef7pSfulb3Pfn1PiA/Nqam8JB
	 fW+Zm4e8CmaDlfqpmftSpJmS9TzLVKzEFFM1Vaw+NDUvPktZU9L6kw/wU5/NGzllb0R2D
	 3pB2wKFLaORcBXLOUb5CjdnSST1xVs2ylmcbho7Oi1sRnjWxK9uBAxHQtN82A8PU1jXDE
	 DhAOxZ2g0kw99N5Jvi3Hhf4zCdmpxZFa+e8smwcKoh16PYaBfA5ySsW33j70S+NnMc/mV
	 5T2kQn+9CLwTTx/QV4wOEaNRXfNYJBfyqP7ECPhxmnyDgHeqUNnR4Dgdbp+DToPy04A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513114;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=3MfZj507MMC+kYJd+NbJOCDQqm4lY2g+JzGBMiwexkc=;
	b=c1nh+FfhLjPy0XQrxwX/UXZgctd5ZmlW8dHuSy5owa/qXozAEr/tiNeoSlL7FbTZTkXb
	 VoNbjMFVh/Vgci5QY78jhx48/NobdKTx1I31hy2f9K1xGCIkJAv+GCQbY9pvZxMgLJYy0
	 kKRSwHjC2+ywxXDCfG74AsdR1G8yKpZWpnGZhP777GrX/F8Ov40qw/8i+pTtg1Yek/uHf
	 DMPZDruJDVuhzxNA3LpW7aAvJGMR6nw6nnSLxYTyfdeBFSxtRO2hUvKkI+sl4NVhywHDD
	 IcMludq6PwVyPpRNAKj21QikldahT/9laAXXpXuTugtkplWeoazSLJiVkDNa7Wr/wKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=s5MNDvrn;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE2606A327
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 19:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BEE2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=s5MNDvrn
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id RYn5xUKAJyb4YRaptxNog3; Thu, 12 Nov 2026 19:51:53 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RapsxKkStlaNKRaptxhHwO; Thu, 12 Nov 2026 19:51:53 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af618d9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=sozttTNsAAAA:8
 a=3OfnbWqpRXkE7MXKp-4A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3MfZj507MMC+kYJd+NbJOCDQqm4lY2g+JzGBMiwexkc=; b=s5MNDvrnZfVFU0eoxUz96jY+9a
	+sDLh5t+2OLuO1qHSYRp2Jh4PNJKff6xWIZhhNjeusu0CRlYpEA9ufKafpUVV+QPe6l2RsTgKIRDa
	yg6RkQhTjGZ6bMjviG5PgyrhE06NsJ0ke4vcmVuwokGV+1eOMO2hVm65uRUmwSWF60aIWoe0i0xg8
	CxKjsz7L/16Rv4YHNSTiR0KHmLrPvpMtviVVscfNIQWTPCaOeZ7d4a21o+WrAcgSv2x1VtPS5UVh3
	PunOrtLlhd5peVwknvVP5gkx/IDZd+/otI8wEaR7aWbFlAJNnyU6uWrsDqnqL+eQbjZSaxgvBoX0W
	zKJ2Q+iw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48542 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRaps-000000016KU-2p9m;
	Fri, 13 Nov 2026 01:21:52 +0530
Date: Thu, 12 Nov 2026 11:51:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Davis <afd@ti.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (emc1403) Fix table name to match driver
Message-ID: <d93134c3-2635-4ee3-a13b-34b005dfc2e2@roeck-us.net>
References: <20261111181154.445315-1-afd@ti.com>
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
In-Reply-To: <20261111181154.445315-1-afd@ti.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xRaps-000000016KU-2p9m
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48542
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 33
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ/glbB2FJO7DT93a0pnTyQYaFrn1U+5I9G5oyAdt4/ifu3kManh6ace9dizP3de4EGJvtmqh0v3gMCG3R+yPj/yh+6t74ILEHJqj+5wS6HQMJQsQjSS
 UrkrTXmmfMulTjBE7qTLbDJVEPBN3oHhQJfvS6smGLO0HIMtMw3dXbq+OvPopzmgRRAJ1spoiCd7Av76b97hGB9eHImQVUgTP6sAWRN1wnL+/nRz2NMdf/9h

On Wed, Nov 11, 2026 at 12:11:54PM -0600, Andrew Davis wrote:
> The temperature conversion time table is called "ina3221" but this
> driver is "emc1403", this looks to be a copy/paste error. Rename
> the table to match the driver.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Applied.

Thanks,
Guenter
