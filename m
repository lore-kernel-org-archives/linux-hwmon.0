Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33602264D9;
	Wed, 10 Jun 2026 01:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053849; cv=none; b=ccVywCd6SiyUT7t52GKrZTiV0pufaOzGRg9IU8oDYjfjaWnG4hk1dt3HyoGCOpQTCDuGofCylcqX4XRRablS+TkgnqeROEvBdKSK8KApuLjAtetV5A4K+GmWS2Eu6Ve2n6mkLw7jZGVG8AbVPInKn5NWvMS6mug722Q5eUbCGYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053849; c=relaxed/simple;
	bh=oVQZBJcgKKmiJSdMAgWZEIpuHRSN9TmyTjkiyQSIXPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GgfMvUwPqmpVHoN/T+WaLXNhG/Acdzc89fPSHpK3vLQBTNi3DpYeMx6KmqR1KNPhqUm5XrPvpxJDaqmvskN0RlTzxwmqTdV4Mm+exFWK4uf4YTJiQkyERBiDIxcptaOmtVtK58DZQTPRx84mbjA/dQ0kjXA4Vu9UHdfSccJNhL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 32a647ba646911f1aa26b74ffac11d73-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ead17a05-2c68-4da8-a42b-52d166f82f48,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:df4da319c0e1f5e30787a71289f2ac46,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:11|94|82|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 32a647ba646911f1aa26b74ffac11d73-20260610
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2114591673; Wed, 10 Jun 2026 09:10:40 +0800
Message-ID: <e8bb6993-e533-406e-a389-5bf5d670a93e@kylinos.cn>
Date: Wed, 10 Jun 2026 09:10:38 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
To: Cryolitia PukNgae <cryolitia@uniontech.com>, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cbdc1df2ed3443b08cbd1fc2652638deaf798c4b.1780990542.git.xiaopei01@kylinos.cn>
 <305E2395B7027B5B+e851d97c-2af5-4752-8c1c-7f92884fe874@uniontech.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <305E2395B7027B5B+e851d97c-2af5-4752-8c1c-7f92884fe874@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/6/9 23:41, Cryolitia PukNgae 写道:
>
> On 6/9/26 07:41, Pei Xiao wrote:
>> The EC firmware is expected to return values in [1, pwm_max]. A read of 0
>> is illegal and would cause underflow in the conversion formula. Explicitly
>> check for 0 and return -EIO.
>>
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>   drivers/hwmon/gpd-fan.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
>> index d1993cd645cb..decb61936b95 100644
>> --- a/drivers/hwmon/gpd-fan.c
>> +++ b/drivers/hwmon/gpd-fan.c
>> @@ -341,7 +341,11 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>>         gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
>>   -    // Match gpd_generic_write_pwm(u8) below
>> +    /* EC PWM register valid range is 1 ~ pwm_max; 0 is an invalid
>> state */
>> +    if (unlikely(!var))
>> +        return -EIO;
>> +
>> +    /* Match gpd_generic_write_pwm() below */
>>       return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
>>   }
>>   
>
> Have you ever tested the behavior on a real device? When it returns 0,
> what state is the device in? 
>
Hi Cryolitia,

Thanks for your  messages!
Yes, this is not an issue, but this problem was reported during the Sashiko
AI review.
 The maintainer suggested I take a look. After checking, I think it might
be better to add a check: 
if it's 0, just return directly. In case some EC returns 0 someday, causing
an underflow, 
returning an error code would be more intuitive than returning an incorrect
value.

https://sashiko.dev/#/patchset/cover.1780880972.git.xiaopei01@kylinos.cn?part=1

Pei.
>
> thanks,
>
> Cryolitia PukNgae

