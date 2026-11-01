Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546993;
	b=NneURx68EbH/zXrVhwiz/T+JJ3cc9H/E5GUDoIonSAzVCbNcLIPSTlCrZbqLkj+Il9Ge
	 rarGBrF2llPq2Fpc9P9Cdpu/A7pnDV1QJcKBf2Qk0SLEzgNZaejENcBesXHi3vRnYAIOO
	 VXZGwSgbTQJUk3ij5gL/Q95ixRo/ssFw6PU35SMSRWvHjvOwN67Y8uq6U5qOTl2hpcDl0
	 4OJqJ+xTia3tFanO2KAA4wMCM4PEmKgSp4LqkisFpHLUmkycVw8cA8ovPXu7zIM1UcTyF
	 4tqVb6r8Vi+zKrdBqIlMaRyBtjjzzdjGgTO7SgwxbF/FJOC0pB2nNkEN9iTYcFunm9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546993;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=M8amNBZbX3mgm8Ye/pmIdEFQUf9GQhaQZQ60dCUWzws=;
	b=anHGA7JNeN+R+7udP8w4WgfQSVE3oISEv1gBpJWPMpCQyrvexlZhBJsPowp3zFVHmdgS
	 bT6YZItNZAI91FEp8sWmQb/d5COoBPIN7vxUhoXP6R3cEeHpLrobaUDOitp3OVZUlK2tH
	 XRcpdC1EWwRw2sO57dxiUdmy4WcLdz/fDK18gRLxvf2UxTN8p+0Aljh5fp2mMPc958cHs
	 28ALLFnRcKhbRlC4VWnVlbaBJKRNFK0xoCHNM5bv9E9Z5vi4hB2MeRP9iENL4Nbi94doH
	 +WkJrYO79m7WOKNPn1qEHIKBKFuy96jc/auwClaxgnOA41If5DwJSCk+dsOr1D8nveg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=byywlFEc;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41742606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 15:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41742606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=byywlFEc
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id NIzSxHmoAv0ndNXVIx1J1Z; Sun, 01 Nov 2026 15:29:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NXVHxvKxrvtkxNXVIxa93r; Sun, 01 Nov 2026 15:29:52 +0000
X-Authority-Analysis: v=2.4 cv=BbzY0qt2 c=1 sm=1 tr=0 ts=6ae75af0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=-cCQWeGbsj5rnnQNRpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=M8amNBZbX3mgm8Ye/pmIdEFQUf9GQhaQZQ60dCUWzws=; b=byywlFEcvA41
	Q7oojlgKNcRTx42gfFky7bFf+twJYbKih3NAjjCDl/iBMVYi7R9B+Vek0aWKP1TZOEZacekQcCrEj
	CeWIt/f7gTVI6Z2WmqLW5NTFei5w6B20FWVc8pDiDjkK4escWb0ldvDpUk6hdGVAE9hz6myXdLDyj
	WSzVH6By8FlJ5lxjws9LDpzUJuOTcbwzw7CrsVX+hxJ2Wrjyb/zPg5LjwHF6HsDVWl+1CWMND33To
	xibqpO7RxxOl7yXvgrSNlfczSEKiEla3SWHx0nRwRplNlOiFHpyJ12Gckqf9xpF4Ys/tjbIPIVct1
	0t8kCklydU7czOrzwCGcQw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58488)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNXVH-000000035GU-2MUd;
	Sun, 01 Nov 2026 20:59:51 +0530
Message-ID: <d3a44b63-ec0d-42e9-bd0f-20ea388c6c14@roeck-us.net>
Date: Sun, 1 Nov 2026 07:29:50 -0800
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
Subject: Re: [PATCH] hwmon: add read-only MECHREVO GM6PX0X sensor driver
To: Armin Wolf <W_Armin@gmx.de>, LIght JUNction <lightjunction.me@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
 <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de>
 <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
 <CAOD9jONGkoub7CPdBqmNGhSWvy8p5S=bJCY-43NxjkQPEqQzyw@mail.gmail.com>
 <dae6828e-2da3-441f-bc5e-a273819f7499@gmx.de>
 <CAOD9jOMcc78EK_HhkTMVGTihhVOLU1O=i0jh_R-C4SH=Gv8GzA@mail.gmail.com>
 <88d6dda7-49d1-4b58-a166-98e6e0c60d03@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <88d6dda7-49d1-4b58-a166-98e6e0c60d03@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNXVH-000000035GU-2MUd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:58488
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNi8otuiXvnZoowLVzDCud1cpemzBM4304ShNzcGQeX1+R8KUaSpv5j8VIQ0eCwmm9q29qAIDx2UVQ4oJgcz4vsA/kXbISucP6SGquzRr1zTQi5T+xEd
 Mn1Udra9m4CSSBo9BMM+Qa9fMyvCkW5hpx1Va0LOea6F5caqqOo5aUZiM1uur/BHw91luIjW/Uzoh5isDj8jvkmBs3nwnxm1ypwD3GXOpKfCWENx0jP2zV14

On 11/1/26 06:47, Armin Wolf wrote:
> Am 30.10.26 um 21:44 schrieb LIght JUNction:
> 
>> Hi Armin,
>>
>> I added 0x046D to the read-only ECRR probe and sampled it 10 times on the GM6PX0X. With 0x046C as the high byte, 0x046D produced 4934–4979 RPM; the verified 0x046B path produced 4994 RPM in the same samples. So 0x046D also gives plausible fan-speed readings, but the values differ. This does not establish which offset is correct; I can only confirm that 0x046B matches the existing sensor readings on this machine.
>>
> Interesting, on my machine register 0x046B always returns 0x0F, so it seems that only some models
> report values values inside this new register. Because of this i suggest that we use register 0x046D
> for now.
> 
>> I still won't load uniwill_laptop with force=1 on this running system. The probe writes several EC settings, including CTGP, lightbar and keyboard-backlight state, and I have no complete way to snapshot and restore them. I have not tested whether a cold boot reinitializes all of those settings, so I can't rely on that as a recovery method.
>>
> Can you share the output of acpidump and dmidecode? I can then provide you with a patch that only enables
> a subset of known safe features on your device. Because i am very against having a second driver using
> the exact same hardware interface as the uniwill-laptop driver, so this patch will not fly with me.
> 

I agree. There should not be two drivers accessing the same EC firmware,
and the register value similarity can not be coincidence. Disable everything
but hardware monitoring for this system if needed, but please do not
introduce multiple drivers for the same underlying hardware / EC firmware
and use the existing drivers.

Armin, thanks a lot for catching this.

Guenter

