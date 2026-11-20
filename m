Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202839;
	b=XI9sNgXytjpNtXabClMENLJSRsYI6Drj9rjDK2GKiff9FTibNZH8VAw6pe4rqdezOP6T
	 VuTD/bro2NusmRRDo8DZ9Gmmd8qjX2HJ47/DnHU0Syo1QLpZ/lUSf4K5f60U/JDnNaJB3
	 f+WZsptkkJCzJr2mrGx2MADyWRaGCZU9WbXfTmQdO7p4Ap/iBXPUpvfxwWhHKmS1gHBk+
	 r811JXfwKMTJbpbcZWjBXDqSgODu9ZSGVij2pS6znRpzAYWzfvIqh2ero8thHICWf+tlz
	 MHUXvuZs/doCCVtcjGH7HZCvMsh6rcmle/JrtPiRBVp5B0LARQiC8zBQwOD6qoMQ8HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202839;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=qZnVbKiwsGTizr9qSy2fPc386Au8rgJJq9gLjt39fx4=;
	b=InMUtIu6uruRhKCNgynIyDCWxaBBW7kXOYnvZU9Bn+6QvKi+k6zUZQRLL03nHwfYJlcY
	 xT/raLx4JLV+PaOFzLLUS1xWtWe3vbiQLIDARBwd028xTPd+xXMLSneGKs+CRDkw0Tfif
	 7BRRZli3e4dtYs4sVYKCUVVgnGpYxvHceMWivuCQ4iZF5XYtksOWYLJjRL+/cd9j4DziF
	 Xx8BAIpnK0UunPLtGXfEGvsnvFKZ6/g7aoaltZTmn4tFitW3vkwngFqyGVdu7TBZ/Lg4h
	 Gg+jf0hMa8AP7BR+VnBpxkhXaqEaCwBoT/pKvPyZOia8sltqEMSbAFjCDxFeAfrfiHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yOAyUgW+;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E9606A6E9
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 19:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0E9606A6E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yOAyUgW+
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id URqnxjNfcRiNxUUGTx5KKo; Fri, 20 Nov 2026 19:27:17 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UUGTxuHYV0288UUGTxSntD; Fri, 20 Nov 2026 19:27:17 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6b009f15
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=a_U1oVfrAAAA:8
 a=KlzepPe7ZaUNfE-c24sA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qZnVbKiwsGTizr9qSy2fPc386Au8rgJJq9gLjt39fx4=; b=yOAyUgW+uLoH4JfD/mSDPJ5KQL
	F8xj+KqNSl8eFGXytMsDH3KjsDCkP7A7FRgrIIWbDT+T9SJLEpWYtO6efso69xny3s56wMViqzbnp
	A7BAUQ9tNHH7HZDWRxX/GIAM9UIAsUv/AXQnIZzYduqK+5R+zqT6wkOO7V0cjiy3tTpzVmUpk6xKt
	xVnn8S8k+Dk75GlnJwB+B6TNTqRr2zTbvwTjLlR1sI8qJKxFMM9gp24u2O4NbDhXDv2S7q3es/yws
	8TDvBtLOcI8k09jSk7OMxleMc7tM2Z1UuBKkgl6UmRNJEWKO65eTSkdIvjoa71r09PFwb5fu/zQ/2
	nQA3E+vg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38032 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUUGS-00000001Wxj-3gaX;
	Sat, 21 Nov 2026 00:57:16 +0530
Date: Fri, 20 Nov 2026 11:27:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 2/2] docs: hwmon: introduce simatic-ipc-ec-sensors
Message-ID: <305517ce-05d5-4216-a89d-ffeefcd00aa7@roeck-us.net>
References: <20261119174548.1324539-1-benedikt.niedermayr@siemens.com>
 <20261119174548.1324539-3-benedikt.niedermayr@siemens.com>
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
In-Reply-To: <20261119174548.1324539-3-benedikt.niedermayr@siemens.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUUGS-00000001Wxj-3gaX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38032
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOeANbum+J2A2k8kNA0abkJCRbXPu1wTaqa3lm6CxBQ3qAYGaA1Zg2NyL3QR4ddFkLg1kixdpPJ/1L3GRIgC+yDdwijMKfuBqs5jxGOCqpx+KDe5iBXb
 IVrpJNZOXThz1A8QdVlloSKnmpAxRGrQqE4XDg4gW0iNLZNuLIEjpEOZySIiUn7TMLGJQDcNq18eTbMHGbv8iwZyJ+c1sGdnmKlg6QzgSk6Ax0mqHfoRp/PU

On Thu, Nov 19, 2026 at 06:45:48PM +0100, Benedikt Niedermayr wrote:
> Add documentation for the Siemens SIMATIC IPC EC sensors driver,
> describing the supported systems and the sysfs attributes it creates.
> Add it to the hwmon documentation index and list it in the MAINTAINERS
> entry of the driver.
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Applied.

Thanks,
Guenter
