Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289599;
	b=rBEAn5nvO7SeB6/bt19slkkAsMDNhcim4fu+dh4+ebzWoBkTkETCW+HjPivExPy+HZ+l
	 p6GSCuabk28L6yE6rIJGkgRaArU20fMHrqNhPBYsNGN7f0eYoaeCPSuL689lnHWL18avs
	 3yRBoUBCy5Pxi3/rjSUL2O7NqOcsynLVyX1y/6xqmF+Z5XXh5RNHNtUead6mTV4DIT4gB
	 nIqAkvJgFkihYoAWv6GvmvdFXRsYA7SQDAVhtsu553qfoA3z9erNo0X0XaZ46J0AgXP3D
	 AzOf05BPoSQvC2sDFWMyL98YQF3aJe++Fn6/aYgRbyZ0a3VoLi1pk8iOPnIV75JbzyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289599;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=3B+QyeakYCTdn90PfE5XnDzYZ1omGiEHTw6D+xzriIU=;
	b=k4IxQAf7KRY4NrwnctKYV44TlAnCkMkoCiPAY6Fjwg0GSfkdxuTBIoM3yZhx/Qb+/5V+
	 K8kwZeiY5tMKSlUDYS7v1z1ovulRnOl69SstuVeS//N4a3pEO/NywzEQbwMKz7u9HN7eR
	 MOYXhSem6ezjv3Xn371XMCdDVvfWafrZ1GgfXjPi3C37hF0uPLXGyBXX7taNH7fOFp42W
	 MOtnNhLz0aCopAboWSVa+9Q/TXyjTteTat1K2e2j7QWcNeYPQtH4mCUtoS2x8AQI6cSlj
	 mi5H1oxc/h+yp2HwfRUw02B6k+r6lh5Z2s/tl94F6wuxP7N7Usb0YDxP95lAvaBn+fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E+9WPu2S;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54164606A321
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 05:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54164606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E+9WPu2S
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id QRmvxs2P0VK9UQegjxxWKW; Tue, 10 Nov 2026 05:46:33 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qegixy3k2SeuLQegjxGxdi; Tue, 10 Nov 2026 05:46:33 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6af2afb9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=7TBn4WtbrrthgNnLwnUA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=3B+QyeakYCTdn90PfE5XnDzYZ1omGiEHTw6D+xzriIU=; b=E+9WPu2SqfIY
	/7f1PYudG01D7SJb0rNaoHZYwWWdOEFa5ehC29DYm7CisOzJmEzA+PEGlYyLGYOqvmpoDtMDljWsx
	1rmOPWY4gxcn8DJ4/k7aBLkWYkI6BG8OYgldm1z5qFmKYeEioGBG/8v6kQZ9LCxKQag0e9p1Sxgm6
	mQlCFKAPDnqy7BKZzFs/EddcYRFXCFglclYT+GNk8fGlOc1XS5xAh2SpZRSNvuZ0idjtihkx41r/U
	WXwrm9gryaVus3hva6jdOzXKa7y8+TU/ACQVXGn0wZ55+oNIW4ISJbnmK1vqTV5t4yUePp74tFy0e
	BxY8hSCUCY07G8Fa5XuYFg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:56848)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQegi-00000004Ojc-2hDU;
	Tue, 10 Nov 2026 11:16:32 +0530
Message-ID: <3c1dc435-3019-4ebd-aa7e-0945b462ea4e@roeck-us.net>
Date: Mon, 9 Nov 2026 21:46:31 -0800
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
Subject: Re: [RFT PATCH 1/3] hwmon: (nct6775) Fix target temp and tolerance
 for NCT6106/6116/6126
To: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <20261110035955.3968731-1-linux@roeck-us.net>
 <20261110035955.3968731-2-linux@roeck-us.net>
 <sashiko-outbox-206182@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-206182@kernel.org>
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
X-Exim-ID: 1xQegi-00000004Ojc-2hDU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:56848
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI0J0lLK6OxmRRAgmNyinwVS2evdIREnPwAQ/DNmhbcdK+SpIoGthoA8bLbmsXIXWQ27zupqsJrwFzFRtPH/rML6upLiibWxrhnQrxPzvO5xAJRYD1fE
 c5ScaLXbujdzLBkRjRs3m909x8c04K1g0PnQ2sJzg79GlZJ9C8olhqzkbUXr8bnpBYx860ORnplGogJhUmMuEEX6i7PkA67yCF/+gSZM7qW8RT1u6mr5t3wb

On 11/9/26 20:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] hwmon: (nct6775) REG_TARGET marked word-sized in
>    nct6775_reg_is_word_sized()

Unless I am  missing something, this should be fixed with
"hwmon: (nct6775) Handle dual use registers".

Guenter

> --
> 
> commit 7460f66a45ab993c8409879e58f676a24f6e5ad1
> Author: Guenter Roeck <linux@roeck-us.net>
> 
> hwmon: (nct6775) Fix target temp and tolerance for NCT6106/6116/6126
> 
> This commit initializes target_temp_mask, tolerance_mask, and
> speed_tolerance_limit for NCT6106, NCT6116, and NCT6126 in nct6775_probe().
> 
> Link: https://sashiko.dev/#/bug/linux-76f191d0-4c79-4982-887e-e5c9a2ed7136
> 
>> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
>> index 6e97e4f08b90b..9340525689cff 100644
>> --- a/drivers/hwmon/nct6775-core.c
>> +++ b/drivers/hwmon/nct6775-core.c
>> @@ -3574,6 +3574,9 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
>>   
>>   		data->fan_from_reg = fan_from_reg13;
>>   		data->fan_from_reg_min = fan_from_reg13;
>> +		data->target_temp_mask = 0xff;
>> +		data->tolerance_mask = 0x07;
>> +		data->speed_tolerance_limit = 63;
> 
> [Severity: High]
> Does setting target_temp_mask to 0xff expose that REG_TARGET (0x111, 0x121,
> 0x131, and 0x191, 0x1a1 on nct6116/nct6126) is marked word-sized in
> nct6775_reg_is_word_sized()?
> 
> drivers/hwmon/nct6775-core.c:nct6775_reg_is_word_sized() {
> 	...
> 	case nct6106:
> 		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
> 		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
> 		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
> 		  reg == 0x111 || reg == 0x121 || reg == 0x131;
> 	case nct6116:
> 	case nct6126:
> 		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
> 		  reg == 0x26 || reg == 0x28 || reg == 0x59 || reg == 0x5b ||
> 		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 || reg == 0xe6 ||
> 		  reg == 0xe8 || reg == 0x111 || reg == 0x121 || reg == 0x131 ||
> 		  reg == 0x191 || reg == 0x1a1;
> 	...
> }
> 
> Because nct6775_reg_is_word_sized() returns true for REG_TARGET, a read via
> nct6775_read_value() performs a 16-bit big-endian read across REG_TARGET
> (placed in bits 15:8) and the adjacent REG_TOLERANCE_H at reg + 1 (placed in
> bits 7:0).  In nct6775_update_pwm_limits(), masking reg_t with
> target_temp_mask (0xff) then discards REG_TARGET and stores REG_TOLERANCE_H
> into data->target_temp[i], while also corrupting data->target_speed[i] in
> speed_cruise mode.
> 
> When writing pwm*_target_temp in thermal_cruise mode, pwm_update_registers()
> passes the 8-bit data->target_temp[nr] to nct6775_write_value(), which writes
> 0x00 (value >> 8) to REG_TARGET and overwrites REG_TOLERANCE_H with
> target_temp[nr].  Should 0x111, 0x121, 0x131, 0x191, and 0x1a1 be removed from
> nct6775_reg_is_word_sized()?
> 

