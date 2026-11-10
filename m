Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339800;
	b=EEJ30iSr0UTx9DVyUCMDqKJ964P4BDRtmbXYKNBv4ywzwxgO8SUOQ9xibo+VrQD3ZGSv
	 WxQ8Wy3xRuH7INV46n3NsiGercSNnPAoQHp7B00JgddlHPNSn3KVu+yMOfVEMi+4oagbd
	 q+iiS0KOYnDFq3VKKMA7nJfnLdzQv+i4WWsC/JybB1GoNRZoWIoExlsGnLGLhSUklhOUi
	 k/uuZCeD4mvSJ9VKKGmdzoiDQg7X16OAzU0LCMDLbRAEFM/gkuVKGfbZa6wBAn6/AMYH7
	 /m59kDFZfsGA1xhRtHxfHsnCwFnb6cdpmJf2Ku4Jv5XOk3uxU+dwWziEP1Bw5eqXGww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339800;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=Syq5nNsDqtBxRiwURflCtbJexqVSDOFOFh9sZACLRSQ=;
	b=aCq0rnrUPS9E10uLC1U1h+hHdKjn5Os4Uw3oSbNt5kUSdPCzY+Hmny+R+u0nU++ZSTuo
	 8jRELNsDg1tVv4ywhAVDO0UpHXgIzR4uJFEzXDLqvdiBRamWGLJgpKbuxKbU0gVDLvpwD
	 EkPMeMQB6QefNithgTk19vbcAg+OabHDoyWuRs+v+vA3gs7JumSP3n+ZsYVr6SRb6v4rH
	 VWQPozMbsY2d46x4oRZ/WzWxyo/BAYQTIIQon1iTZ37DLBySxOnQX2IEBHCjZoWjwKp80
	 Y72atZHRL2OmlEgXj4bnAxc/WltMFynGC9KpU2o+uY+0VC6ZGxZqiB4Lwdr6MmfMUqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TIDu++d6;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B828A606A327
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B828A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TIDu++d6
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id QmsbxwWRJVK9UQrkVx8RL3; Tue, 10 Nov 2026 19:43:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QrkTxIipDxmi7QrkTxnAWs; Tue, 10 Nov 2026 19:43:18 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af373d7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8
 a=Pbzasi2esYBJbdekaeMA:9 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Syq5nNsDqtBxRiwURflCtbJexqVSDOFOFh9sZACLRSQ=; b=TIDu++d6Y11F
	yNrByx2EZ6IslHf8/5GqetfVA8RTs9b8ibrVjFwlp6iJy6950+/LB5/ISxVk+HE6XACCopas3ayu6
	dwVaXIB9DPvI+1HiNWaBgWHoewo4B1iT9KofjJQdgBo4KIvJ2u9x4dDoRwVosXbgioDjSmRaF8j9v
	2FZ6C+vxYCdd5Qhlhji/HtdvvfFD2azdS7/R/Oe+mWHbkeXcN9VI8+rMxhZJMRtP0iroyWpcm2cxQ
	tUmt0694a8tDguvF9R2DJ5MLUh170SrNNE8HVyPN0jVRMazqiRtFNKVgtkGnDL6bEP0f084w4nuXk
	VY6/hCnCqiWh2EgDuv+tTQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41260)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQrkT-00000003vp2-1SNf;
	Wed, 11 Nov 2026 01:13:17 +0530
Message-ID: <8b4b2b9a-004f-4afd-8084-0cc744ad3a05@roeck-us.net>
Date: Tue, 10 Nov 2026 11:43:16 -0800
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
Subject: Re: [PATCH 09/10] hwmon: (f75375s) Drop platform data support
To: Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org
Cc: Riku Voipio <riku.voipio@iki.fi>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-10-linux@roeck-us.net>
 <fd6da907-9362-4a6e-adcd-9ef99861231a@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <fd6da907-9362-4a6e-adcd-9ef99861231a@app.fastmail.com>
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
X-Exim-ID: 1xQrkT-00000003vp2-1SNf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:41260
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLvW0rcOb3q6817tiW9VTq5p5mQmrJamJ2g9FEqhgAXlX/ydiupBPgUaokMMzREXklA9ff9fZcOk0Ji4uXhGS095a7I6dEDoQE3DU3hujh3TVReWuBCr
 TaIJCMs9AY+7ZCCdQih4WLcbw/sXCuxBJcs1qsH1d3gfENhePSmUmxvXitKV+iF93W/wxDXA/4HnCUmehqZl7GAhF2dQlO9L2sPYUGvjNwQZdhdKKoabWOwY

On 11/10/26 11:18, Arnd Bergmann wrote:
> On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
>> There are no in-tree users of f75375s_platform_data. Initial PWM mode
>> and enable settings are read from the chip registers during probe, and
>> both pwm and pwm_enable are configurable through standard hwmon sysfs
>> attributes.
>>
>> Drop platform data support from the driver and remove
>> include/linux/f75375s.h.
>>
>> Cc: Riku Voipio <riku.voipio@iki.fi>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Once more, I took a different route here and removed the whole driver.
> Here is my explanation:
> 
>      hwmon: remove unused f75375s
>      
>      This was used on the iop32x platform but has no references
>      left in the kernel and has no devicetree support, so there
>      is no longer a way to use it.
>      
>      Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Note also that f75375_init() runs into a NULL pointer dereference
> when there is no platdata. Your patch fixes this, but I don't
> see how this would help anyone.
> 
Makes sense. FWIW, I am all for removing drivers, and if this one crashed
without platform data I think we have a good argument for removing it.

Thanks,
Guenter

