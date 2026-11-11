Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415940;
	b=HmWdoOl1JApnbAd37m+53eeWicSgeZP7OUAxAikNCzlAN62dtOvs3ZPbVI40uAZ5p1qt
	 PDSNJZVJS89DFe+jXjKgzIC9EqAtlkNEOEC3eR3yrFHreoumdFLcmAo1rIaseqLy6phuC
	 VwkoJxNWtpKzUNaFpORBpDWrTiEqNFUKV9lWq8qe1gqWrN6E+4JDcRX9Nj1ToYCkiyRRU
	 C+tQfisFk5wNQp6GpIbPLzqI/HpMbaDRFtp1CS7QzNgMRUawLRPcvVKEiXZNmvlpewP3s
	 QQYsj2rb8v2ZUmqG2zT4FPFSLT3QAhnw5XXNeLud2ufKh+7ny0gmDVfyz8keBjsxAmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415940;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=lMj+PC6vZNG06L6ZF2lvr1tCXacfKNDXsoXkCXlojPg=;
	b=ZUmEwkQt3smTKfXOLYP498f1RV5zjN4QJVi3wswtJwqsH1pcrHd4Nk+MhiSiIJDzWzIs
	 n872onz+Lr/5pGE4uPKMBsWS2CONL8iLhvT1GUCAu+ND7p64DWqZUJ1O0u/ewzR31BQwK
	 6JLPY/s7apOvSd5cCjWq8YvjJQ2k3Sv3gNMZ38UzTvVzv7JskKjtSz8lp18oYenweZifc
	 TOKDZwzRHuE0NmMd9Lf84Ie9OCSonXc6eJO1nArpsWr+MqqtbsGYYyImo7qMKWIVtBf35
	 p8XS9i+HV0tzAmizKgyP3VskEcDiR8xFVseWSl+Fvn5LIJZyESOLaSc5fteW4P/ll0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Z3V5NPbY;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C1606A324
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7C1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Z3V5NPbY
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id RApbx3fYGVK9URBYUxHys0; Wed, 11 Nov 2026 16:52:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RBYTxY02fdRrRRBYTxw5Z4; Wed, 11 Nov 2026 16:52:13 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af49d3d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=R5C9hjxsAAAA:8
 a=lr9QKadaxpsK283a4h8A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=lMj+PC6vZNG06L6ZF2lvr1tCXacfKNDXsoXkCXlojPg=; b=Z3V5NPbYpfGE
	nFTa9skQO7BajZCT8vIEQs8GG5ZN5jKkjokO0aMZK9BDX+W5E+SekmetRQYJzFjLEvqke2FRNvOct
	npKjYFsShCm4GclTw79cjTcB4KvZQ1ue54gNCM/MoeYi9xHGd0KUz0js4AzD2IC2kJgMKwfBdzs2A
	+IkxqHJBW+uWO0qcKXiAWot/Y+weg6pGf3EmOre0WOYkVjZvHf25QT8Ssgs/wPLKfdHCZ37Tkd21D
	iXr/TTtoWD9T4yW/T+Ut3744tNJyYBVV+H0qlVNFVsmFYDhsMPDM4k3sbFeseHd4QB8x/lCFK/he1
	ipIm9+zFG88xB8HfcFsjwQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35196)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRBYS-00000001ERI-3aod;
	Wed, 11 Nov 2026 22:22:12 +0530
Message-ID: <d0a3730f-80d7-4870-899f-1d4acc00a773@roeck-us.net>
Date: Wed, 11 Nov 2026 08:52:11 -0800
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
Subject: Re: [PATCH] hwmon: (w83627ehf) Clamp voltage limits before scaling
To: David Laight <david.laight.linux@gmail.com>,
 Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111064831.17299-1-zhujun2@cmss.chinamobile.com>
 <20261111111145.1694eb70@pumpkin>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261111111145.1694eb70@pumpkin>
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
X-Exim-ID: 1xRBYS-00000001ERI-3aod
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:35196
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKdyKDisltubJfjoyJS0i1nttsYHIZU1N3WmFQC1NWWpeJgEGbNpDyMWeJYKsbLwlA5+5GH9WM6okN+25LGgdYniGFejH/jViN5zT7Htjs36NE4SaBNf
 scUjkXGD2t2S7WcGc0r7ViGA92xPEv3jxsOvbgANNfUxvUP+kqj1xN+95EJ/kkKqmYgdflaWSx6IPERJGhrLbyXDqWFUqkXvNRSnl7p90V6XC/r16LT3BtPJ

On 11/11/26 03:11, David Laight wrote:
> On Wed, 11 Nov 2026 14:48:31 +0800
> Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:
> 
>> in_to_reg() narrows the sysfs value to u32 and multiplies it by 100
>> before clamping. A large positive voltage limit can consequently be
>> programmed as zero instead of the maximum; 4294967296 mV reproduces this
>> on a 64-bit system.
>>
>> Preserve the input width and clamp to the representable voltage range
>> before multiplication.
>>
>> Fixes: cf0676fe42c8 ("[PATCH] w83627ehf: Add voltage inputs support")
>> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
>> ---
>>   drivers/hwmon/w83627ehf.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
>> index 9c08ab662dc6..5c04b9c52b76 100644
>> --- a/drivers/hwmon/w83627ehf.c
>> +++ b/drivers/hwmon/w83627ehf.c
>> @@ -293,8 +293,9 @@ static inline long in_from_reg(u8 reg, u8 nr, const u16 *scale_in)
>>   	return DIV_ROUND_CLOSEST(reg * scale_in[nr], 100);
>>   }
>>   
>> -static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scale_in)
>> +static inline u8 in_to_reg(unsigned long val, u8 nr, const u16 *scale_in)
>>   {
>> +	val = min(val, 255UL * scale_in[nr] / 100);
> 
> You need to think about these more.
> Either it really doesn't matter because no one would really try to write
> an over large value unless they are trying to break things - and they can
> just write zero, or you just need to stop the n * 100 + x overflowing.

Writing 0 would be intentional. Writing a large value, however, _can_
be accidental (or just someone trying to find the highest possible value),
so I accept such patches (and sometimes, if I have too much time, hunt
for it as well). My module tests actually depend on it - they on purpose
write a large value to see what happens.

Thanks,
Guenter

> So at least avoid the extra divide by using:
> 	val = min(val, (~0ul - 32768) / 100)
> 
>>   	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scale_in[nr]), 0, 255);
> 
> Another clamp_val() that should never have been added.
> The type checks are there for a reason, not to be killed by casts.
> 
> David
> 
>>   }
>>   
> 

