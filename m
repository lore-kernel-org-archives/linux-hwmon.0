Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380411;
	b=IBb4UTuVhWSW4fuVCZIESmi953n/YEwQ/5pECSN28bVGBbPO4rFsHz/bOaiT/lbh0UNv
	 jOF5Jv4AFu9E+qR5EZ8VdCplKpZxHLhbOOEy/HOHNQMg2Q5FiCcZYIz8+jR9cmOFEzHId
	 gf3w9A/HNts+w6jDw9yrWzG5CFPMVzK/LGcCZSPCXG4uKLLiYSLj8TVU6T861JzaBqLth
	 tSiA0JMoaqlbs0L/VUSLzEWRtYta+t2rD0EP5Sct7bhNZjkaRGY0XUgbVGkb3WaMLHeHt
	 1BAQHi7uKeehO6gaKhpgp6sKtASsd+0gij4ARwT707/M4LIrIPQocWqKIPVAX2DKm2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380411;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:
	 X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=LSD5gbGGgGHR9hhcem3MZ2q3tssD5SSjeWRvzutmFFI=;
	b=WhIVpAl4wI73hAIak1gbj2iyeSt4LOxrhpleJml0ZBnP6UiA07pIhOF9WWpVsJDE15vy
	 ycFCsRauFADRUx9E+K4HHvqdxrIJ2Vs7BexXEgquAeprVUqlfRgCZLCgTqMGmsXOzGRyN
	 il2GydGkL7vjwvBZBr3C6xeRRrC4RKEsPjxbzSoswlq472Edocur5SONzdUk9DshCHl6m
	 hofzZt2pYIP4ofbI2mbAMIY+OJqM14i/OPzGmgSMt/2xcqrZZ5gsFnd7McLZXmKVvfZ1L
	 /a88lTLJNNFlsgmiGe2bq9xWeNG7Yaj3VmLjXm7i1t2BwjON+irXHCaJ2ri475uGqtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mGUh6841;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D84606A31E
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 20:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mGUh6841
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id UykGxpGvNRiNxVESSxGgaD; Sun, 22 Nov 2026 20:46:45 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VESRxbKJzYskhVESSxhZAo; Sun, 22 Nov 2026 20:46:44 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6b0354b4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=JtdX1pvmAAAA:8
 a=VwQbUJbxAAAA:8 a=tI0p-kfHP82b7JzrScQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=c0toiO28_D8leWPcdVQN:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=LSD5gbGGgGHR9hhcem3MZ2q3tssD5SSjeWRvzutmFFI=; b=mGUh6841l/Rq
	mHCjTP9lDhFZH1axHpr7h98VsAtQjmITqrd/kobcmpT1D7hYvxI189C9naTJKLgC3cwvR0rF2PYlH
	WJXO4VHZz+OWvaEOMuT348mYxyuTgmaQydYYrdkD+bcZNezwqNbbS2I9i+zb57bwIDWR3atjMN9aU
	eB7j7+sNTku11ljRiPSSyeuoqmN1jr1eGuPf4kvw23L07iw6pNwvFHk+GOSQymaARQv0gUrqP6gfv
	NZs+rCMRr+abC9/jgucOUBSM6fiRylJgdfDobym1/Sd/ODNh2pKm96EPLsHCQSjHtkWYUUovdccfs
	DsmBxMYQGIgIC6P2dong/w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33312 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVESR-0000000007M-0aq4;
	Mon, 23 Nov 2026 02:16:43 +0530
Date: Sun, 22 Nov 2026 12:46:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Popovych <ivan@ipvych.com>
Cc: linux-kernel@vger.kernel.org, pali@kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control
 whitelist
Message-ID: <27ffe277-f1d1-4e85-8bd4-bea8f2962f05@roeck-us.net>
References: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
 <20261121230738.4970-1-ivan@ipvych.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261121230738.4970-1-ivan@ipvych.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVESR-0000000007M-0aq4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33312
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAG9poKzcpCqja2eBBBVMZmrpIvlWK2AXF7dof/TzJXaduKQ+1OSOD7yDBsYnabh51tpm/zggIcsDEXvMd23UTMYcOhUN95lNd5OuWbdgMjRx0HgKvz0
 sFUTol3T/YNbf5EsSFqvP4na7/vLRNtKl3T6ClXC4J6ZCL+ItdvNyxyZep/jSl7xCPSDj8R8jTCCkszdjii+9ixAA0QArUb7w5Lxqi84WENYA0fu73TrpxDb

On Sun, Nov 22, 2026 at 01:07:38AM +0200, Ivan Popovych wrote:
> Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
> running "echo 1 > pwm1_enable" disables automatic fan control and
> "echo 2 > pwm1_enable" enables it back.
> 
> Both 30a3/31a3 and 34a3/35a3 commands work on this laptop, using
> 30a3/31a3 as these are the commands used by the official Dell
> software.
> 
> Signed-off-by: Ivan Popovych <ivan@ipvych.com>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter
