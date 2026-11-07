Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085619;
	b=zEJtRlcs6gXoSEwyAXz+/ioEcb8xpZQmOVcsX7n22TGoaH9OYrb0WQPWVU+L8ERa8Xt6
	 Rnlx/L2CVwJ/ixhJW6WMNv95nFd+cLHbd+AShJABWNY4AHUA8XjsKMEcYbCmooXK1X9z5
	 2rWMzEZLAGJgCNvrI+qlv5yiW0/LLSmGJiDWwIYXyZ8qVK0r693XlenDEUVSyP7ShYkpQ
	 pnro7sq+f2enPwuRt7GLROlvNatFYMiRx4MDGiNOQ0G2LPvA9aTiip2kP7QabvryDeJei
	 6TbgHymZR7zxyeXgQHouhamJhmXullIqUaj9pNdldIHtW2OmByQ+J99h540KN/nNMqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085619;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=8KSc09ODib0Z5Yx1q1G86S1Aevjg7RWxPeQP7OwRbqU=;
	b=nHHpFe+bQFVsdn8KP+1IyqkhR6pzlBXHdW7OoJ4dlxHtYRdYbzrySxAboXhXQz4Uoi19
	 QhirFMLrpk+nRXZmGPvHAhV/dEyThN2pKteAdVhwOJ7M8Vzan8gjdI8df+xgb5yn9H9SA
	 Z18Cqlxa1rE9c3fZLh+WCqdEa2UB0XfPJ1dR8GSGYepWQApHdXd2S/rXGDzhwBTqCmuUE
	 DTsfVX6npgSBqk70pm2qPFIfN2SejCKj+esuF++MklN/ZWgpp8pSHstH/Gz83VMKXxb1Z
	 YF7OSG3WuENF68vjUjbh12fD8UvqZlswNzokKFwDG7Wu78gq1xhBwm6I1rldK7vEdnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=V7wzKorN;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB53606A32C
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 21:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB53606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=V7wzKorN
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id PNpxxfxVW4vCDPncoxy1Kc; Sat, 07 Nov 2026 21:06:58 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PncnxtHz3laNKPncnxzkw7; Sat, 07 Nov 2026 21:06:57 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6aef92f1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=Vqn8mfWAHm7spiFAKEwA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=8KSc09ODib0Z5Yx1q1G86S1Aevjg7RWxPeQP7OwRbqU=; b=V7wzKorNxc6D
	/TZI41vPEAUa/mBIseR7+uma6jImlp1Jd09gHI35eubPCUHH/dIijAdADUMVE6Kq6E1scL5g/n8VN
	y9cQO+WxcfwSgADorqh2cDJ/G0NjpTMGcyys1uS/QBcEuJie77mOBmZFrzYrXiHESz5P4bdJGsOL2
	ZchJFNVuj4BUrjzRFeGw0FXJM9vSrHTpgPFZBUjEZs6pkskdfmT/MJci4t9WQT4PiGo4zZ2qTzP9e
	P5AyCzvvZBVjG8jsVG485Ac4bKmBFMsJcrCj/dp4+m+Qs1H8nzwwGDtFKhjjwbyoTEgoco3ZjbI7Q
	8TIacU5vr8LkohrTHlvmpg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:51494)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPncm-00000002fjo-3k56;
	Sun, 08 Nov 2026 02:36:56 +0530
Message-ID: <81c1e042-b06c-4a13-9251-a967532e21cd@roeck-us.net>
Date: Sat, 7 Nov 2026 13:06:55 -0800
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
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller
 voltage sensors
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261107082821.8257-1-tomasz@bojanowski.me>
 <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net>
 <20261107161249.336512-1-tomasz@bojanowski.me>
 <5e99fd86-d934-49c1-a867-02cc61ab1ecf@roeck-us.net>
 <20261107181518.385136-1-tomasz@bojanowski.me>
 <e79d3e26-4ca5-4ca4-9159-427a5a6f1129@roeck-us.net>
 <20261107203300.427273-1-tomasz@bojanowski.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261107203300.427273-1-tomasz@bojanowski.me>
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
X-Exim-ID: 1xPncm-00000002fjo-3k56
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:51494
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHIJnOgOcchLoSwzDD11gB9nO/cnz0OKX9ti9T4F+bROlA7H90VluJwCa/IyCbZdmh08U6rMgSkNcQWsaBQp8a58QC5z+mdli1Gf95Jo81mWB3KWrfPB
 LScQr3iHfVzvXWBhU8UYQ2U7pkVtyNm6aX5DfiwCOMvl3X0+xDoJKQlSsmoE4gpYuGT82LYwZy2IkByerbh1s6ZB7h7DVMJiVm4lod0t61Ka2dvF1R7O2fUL

On 11/7/26 12:33, Tomasz Bojanowski wrote:
> Hi Guenter,
> 
> On 11/7/26 11:40, Guenter Roeck wrote:
>> Please let me know if the code still works for you.
> 
> It does. With commit 64e4888, the MS-7E61 reads the same as with v2
> (CPU 1P8 1.79 V, CHIP Core 1.04 V, VDD MISC 1.10 V).
> 
>> Offset 11 does not seem to show a valid voltage. On the other side,
>> offset 15 would reflect a value that at least makes sense.
> 
> The vendor software reads CPU VDDP from offset 11 on the MS-7C94 and
> does not use offset 15. It would show the same 0.002 V, so I cannot
> tell what offset 15 is.
> 

That makes me wonder if the vendor software is buggy. I have
two of those boards, and they both show similar values. If we can't
figure that out, I am inclined to drop support for that board:
It is not worth the trouble with people complaining that it does
not work.

> One small thing: if the read fails, msi_ml_read_report() returns
> without hid_hw_power(..., PM_HINT_NORMAL).
> 

Good point. I wonder what the best way to handle this might be:
Push it back into the device specific read function, or always
call it from the common read function. Or maybe only keep it for
the 7e61 board and assume that it isn't needed for the older boards
since they are expected to send raw events. Any thoughts ?

Either case, do you have evidence that this is even needed in the
first place ? The call is rarely used elsewhere in the kernel,
and none of the other HID hwmon drivers uses it.

Thanks,
Guenter

