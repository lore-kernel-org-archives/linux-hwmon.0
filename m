Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980560;
	b=IHL5r2xTbi5D7O3oU90vgUkt84ROYaysBAMk7T6LRXIO0wrABq+v7oXZFuaLv8T7PTn7
	 Yc8YttP0phmKS86J0vQmQ5wF/mf2NakDIcB28khJ25GzHuzL2JxtmRBvKZWHbLo8hmxlk
	 MT9yvaAxgca+gKzt6AanesSm/McZj9KbZaTt87zkwv4w3HWskHr9HMEbGBuXAr3ezH9K+
	 76AYlZyn8cG7HD4uXTIi3bKvVMGZjKmpD32s0g7k27GEg+QXy21HjsgVyY5OaWDVijwUv
	 aevdhGMjMxG9gPrxmlbE/CIiFapnUK9NfcX3lFmJ1NsOPsA661R/aybnd0hy6ojvUyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980560;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=1/ltzpSaW2mwptDqIcYpWL76IXk6qZn6m4iuuayJHtQ=;
	b=YdsO6ZsKkD+4G6mUoUgljFxGtWkx451r5+Wpk2rtCvUNdxXBot1l/S80whbtoe7u77rh
	 087T0AQt+qawlhfsx+ZqyLXLItq4fePONg/VeXPS86vImW04g4v3T0WjqTE/rHCJN9WFo
	 b5HHQqF/o2nU2U3RAA4cnff1ek42VwcCbirf4zGfu216rliLsy7h4nfpTLkWng0SC4hr0
	 o+PuTHdQaJUN16UJ2CC+ZPWWaF6pfd0iXjpDcbROPLrHfhaAKf8X7VY91tGCMlvEjhIhl
	 pP4re0YjFRt0khA2TRqlHK1NRnT3JG5H+F1mR2GjzAMk/nLVzYRi0BjAmx04XZJ8mVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MDilh82r;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10239606A330
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Nov 2026 15:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10239606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MDilh82r
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id P5y8xJNKRJFmFPMIIxlKCs; Fri, 06 Nov 2026 15:55:59 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PMIIxK3XgmASCPMIIxwlAF; Fri, 06 Nov 2026 15:55:58 +0000
X-Authority-Analysis: v=2.4 cv=XJkwSRhE c=1 sm=1 tr=0 ts=6aedf88e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=Yx1vOqRYCXWc8j4kn48A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=1/ltzpSaW2mwptDqIcYpWL76IXk6qZn6m4iuuayJHtQ=; b=MDilh82rsGLG
	tLAUY6y2yCXtyaE4RFIo+Of959sxJVe5D2j3wMDxvk3rbEKj7SEc9VfWKdd9zgLQx3xT4/yg7/Stc
	b8cLKQ9BCSiIeB9ARVqTQFOqKRaIyY/7CYZMRWWn9o1/xrDOwGmFcF1q+z5oRMx1U5oAyQQjnsfYn
	5E57JqHg0/G1EmdeU2SjgOKW4d1IPUrNBSpPYs9XcgwquxTlioGJaLl7qs/oC3P+SyW3utfiHnllo
	5j+nz74zzJr07Kowpo/7oyazaxu32zTCRV88d7ddLUmphVyLHO3vFtIbgJaBSSZ4s9QqCT5kgJD63
	1TVQyKxDWgVNTWEPxGVMOA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48988)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPMIH-00000000HmF-3nOM;
	Fri, 06 Nov 2026 21:25:57 +0530
Message-ID: <0f3669ae-a42a-4021-aa3d-c04f5931f242@roeck-us.net>
Date: Fri, 6 Nov 2026 07:55:56 -0800
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
Subject: Re: [PATCH] hwmon: (nct6775) Add support for NCT5525
To: Anton Lundin <glance@ac2.se>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
References: <20261103132948.144216-1-glance@ac2.se>
 <9e1f1a68-ef65-4e38-9396-48836ff50979@roeck-us.net>
 <au3L9FJUVRDuIsVN@accum.se>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <au3L9FJUVRDuIsVN@accum.se>
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
X-Exim-ID: 1xPMIH-00000000HmF-3nOM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:48988
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLmZtfuufkR0ZDfbxiVnO+UW+v3/6DDBYd3eV6CpCkrXlsPaaRp6CMFSELxz/eY4qLwvGj92fkStpc+Gvo/fcE66PE6T3rONTZkZ8RSi0LajEbtW1e6H
 kphiIoJHep3b5obxHCfQVOow7l9RMYbABOF3khL9bIKZlsP5Y5y4sS62WosviBPwiDO+MSk1C5cflc2E4TqpSYJ5m3W73GV08kDlyGEzqRqOqtu+sRQwmO+t

On 11/6/26 04:45, Anton Lundin wrote:
> On 03 november, 2026 - Guenter Roeck wrote:
> 
>> On 11/3/26 05:29, Anton Lundin wrote:
>>> Extend nct6775 driver to support NCT5525.
>>>
>>> Assisted-by: Copilot:GPT-5.6-Terra
>>> Signed-off-by: Anton Lundin <glance@ac2.se>
>>
>>
>> I don't havea datasheet for this chip, but I do have to say
>> that this seems to be off just form chip numbering perspective.
>>  From the registers it looks like the chip is mostly compatible
>> with the NCT61xx series, but NCT55xx chips are typically scaled-down
>> variants of MCT67xx series chips. I _will_ need to see a datasheet
>> to confirm, or at the very least independent confirmation that the
>> driver is correct.
>>
>> Some more comments inline.
> 
> I've now reviewed all the comments and reworked the code. There are some
> things I'm still thinking about and I kindly ask for some guidance.
>   
>>>    };
>>>    /* Common and NCT6775 specific data */
>>> @@ -840,6 +842,33 @@ static const u16 NCT6106_REG_TEMP_CRIT[32] = {
>>>    static const u16 NCT6106_REG_TSI_TEMP[] = { 0x59, 0x5b, 0x5d, 0x5f, 0x61, 0x63, 0x65, 0x67 };
>>> +/* NCT5525D specific data */
>>> +
>>> +static const u16 NCT5525_REG_IN_MAX[] = {
>>> +	0x92, 0x94, 0x96, 0x9a, 0x9c, 0x9e, 0xa0, 0xa2 };
>>> +static const u16 NCT5525_REG_IN_MIN[] = {
>>> +	0x93, 0x95, 0x97, 0x9b, 0x9d, 0x9f, 0xa1, 0xa3 };
>>> +static const u16 NCT5525_REG_IN[] = {
>>> +	0x01, 0x02, 0x03, 0x05, 0x06, 0x07, 0x08, 0x09 };
>>> +
>>
>> The above are equivalent to the NCT6106 definitions.
>> Please do not duplicate definitions unless necessary.
> 
> I've now remodeled this into:
> 
> +       case nct5525:
> ...
> +               data->REG_VIN = &NCT6106_REG_IN[1];
> +               data->REG_IN_MINMAX[0] = &NCT6106_REG_IN_MIN[1];
> +               data->REG_IN_MINMAX[1] = &NCT6106_REG_IN_MAX[1];
> 
> It's not the prettiest, but it works. Is that acceptable?
> 
No, just keep as is. I missed that the first voltage (register 0x00)
isn't supported on this chip (assuming that is true).

>>> +static const u16 NCT5525_REG_FAN[] = { 0x20, 0x22, 0x28 };
>>> +static const u16 NCT5525_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe8 };
>>> +static const u16 NCT5525_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf5 };
>>> +static const u16 NCT5525_FAN_PULSE_SHIFT[] = { 0, 2, 6 };
>>> +
>>
>> This suggests compatibility with NCT6116, with fans index 2 and 3 not populated.
>> Would it be possible to model it that way ?
> 
> I'll rework it into that. The data sheet even calls it fan5 in one
> place, HM_Rev_Pulse_Fan5_Sel.
> 
> All the registers aligns nicely with this, so I think it's the right
> call.
> 
> The only interesting bit will be that the fan names are now 1 2 and 5.
> 
> In the data sheet they're SYSFAN, CPUFAN and AUXFAN.
> 
>>> @@ -1191,6 +1224,10 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
>>>    		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
>>>    		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
>>>    		  reg == 0x111 || reg == 0x121 || reg == 0x131;
>>> +	case nct5525:
>>> +		return reg == 0x20 || reg == 0x22 || reg == 0x28 ||
>>> +		  reg == 0x59 || reg == 0x5b || reg == 0xe0 || reg == 0xe2 ||
>>> +		  reg == 0xe8 || reg == 0x111 || reg == 0x121;
>>
>> Sashiko has some valid concerns here.
> 
> This is the same as for nct6106, nct6116 and nct6126.
> 
> As far as I see it, we would need to look if we're in speed-cruise mode
> or thermal-cruise mode, and adjust if we read word sized or not.
> 
> Any preference on how that should be done or should I just make
> something up?
> 

Problem is that the second register is shared across tolerance_h and target_speed_h.
I don't know (and have no time to figure out) if the code handles this correctly.

Fix appreciated if needed.

Thanks,
Guenter

