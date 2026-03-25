Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10883CC9FE
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446374; cv=none; b=TnONgY640WHZhLWEcCAfMHUMhLHniLdF5XZqec27IPRzKIatZYFrUEnIh8k3BeDwA76HUgvrjOVAiH1rt/lIAnogpR5V5u67enOGk6liGXmnERE0gjZbunoMrhFusk2rxJQd+Fr2qFh04rtpCt3KPBWpcRNJmqImhtM3Y2CA3po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446374; c=relaxed/simple;
	bh=Vwgw69NADjMkwnE16XQ7k1ncxY3uIYaWHTkg0O7ORK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPamW23gWCZKrwgLvv0yW1zqx4ghzPBYEHJ9NWgaNxKm09ioLsFRIv+6j2TB8f8btBTEjJwCBfBE4LyrSAhLVCrAY0g+8CqJf4kk06ffykSByS0URP+55XmP7uwzCICN8JaXcEDJwp2WJGI1oLrMIGB375UWHcV4wtdmnfGBM/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivmNOxjY; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivmNOxjY"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1565787eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774446372; x=1775051172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1drf0ieTyW1w2qGw1O/xWLKJ52n0DUl9jE2Vx3cwxHg=;
        b=ivmNOxjYCKn4jg2m5qPaN+Snf+HTOghdVChGVHsugZE7iCcl4Ks0fS/DJkXKgHNReC
         nbFk3hUNSWx95qoQuYpbYNLC0YCU25+xejo5BXbse6ZBmmK+TCEftf4IvQa0lq8FTr5W
         MomyuA3d/AAJbfLnoP8pv8BGIskNONtsOVlx7HFe3L5yO+iH6NYtI2hV8tZCZFjhGNKL
         LSR1fFzyOFBjG0Xtmu7gkYwIEqlNhRhKMqu+SZxPeybNAoU1sD0nOgbm43sMTbfYCp2r
         64MvdPkOhnXyiD/dEjrJrXgjezp2O09nadpysX0fb0H3EQwYnjD7xnvzm/F6DVGhPqlj
         KJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774446372; x=1775051172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1drf0ieTyW1w2qGw1O/xWLKJ52n0DUl9jE2Vx3cwxHg=;
        b=Nfr2dqiAY+udqHDb6wPJsIN+v3gsONq2EGPhIVxXXBzPKplwvKZe6rPschL/gGxHoL
         /QS4lPIOI3UDnvCCtlhsnGZV65+FiYAKX3X5DEtfjwMlK9/oURca0lhZ87oB10asTAG4
         eouh//4c26Pi9JLkWspTp7ebSwWS0f1Hb2bYBkhOBJtQGL5aSnDHStiveH/DM+LS4t8P
         NY1PXb1CMH+zm49wSMdthsyBkWLE+723nZOwthab8Uf6AZnQDLJxISOuyE7/Fc56LK4N
         f83UCbMvRD78JBH71Rck+Vy4qp5x1XLHTnFwVNendcRWq6eQszeuSZpOP8/Jc8vHeFxC
         PUDw==
X-Forwarded-Encrypted: i=1; AJvYcCWpxjpEBf0JdOghq7tW/MiRiZCFrCfqb83j+NhfF+A5SVuWqVcOB3sDwASr3xiJu6uY5Idlzp1AqKxnkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLoZUWLO7YJCVO2x7Te8VwXkXtDY2ltXGKM/pEqGx6PBQmgSUc
	iKRtbZIwap4eKNDkFIMVBm/VkDEN2oA+tZZvX95/nQzSzBbIBGK5IeORwXCoEg==
X-Gm-Gg: ATEYQzxVC3TmTAgtiyZwfeTx4PN3vPiaCuid5oQS2EksMfgHM9OK9wRaOBovvwgPlJ0
	tM8Y7qymerR2I6Uu1/C+t7pPfeYyxHHXec7ZwPrhjscXAHwG7l40KWKRroS8N5S/blbo5fwj8m4
	uTY1x4Y1z4ceoK01SVC+PQs2XtujopwZuFgjZHOld6HLLf8scVG+w+Q3V9om/ypOAIXSJ2TxWuJ
	Yo1xHdMJS3MGnmQ/CwZT/EmGbCQQoGdOzPTj2S2RIIbraiLcWba/ho+2R4VBxoDMrZB3Q2OXZeG
	F70se4Ik1f63d7ksxnQ7r+YVf+qjeaDM0jIIooq8F4wiYsUok6zZ6PiDNj/d1o6jDT7kb1Ccw6D
	nqzyAHX53zGjlcq+rwYEYyAAXzSEFU6NjzM+IFRas0ihV4lGHjREWtTEkS6//wioSbdSaUNOCHv
	xyvXh26oPzmcwbchTnrh469k8wM+kN6IFLapfUywVtaf0xF9NxrYAeSXuw7uKc5No2fPskwjx6w
	JPYaAxfjgQ=
X-Received: by 2002:a05:7301:4e07:b0:2c1:6ee:a171 with SMTP id 5a478bee46e88-2c15d3dab47mr1964401eec.18.1774446371842;
        Wed, 25 Mar 2026 06:46:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1313bf5fdsm9713382eec.14.2026.03.25.06.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:46:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f460f5cb-ff67-4644-9bb1-db772ff60b70@roeck-us.net>
Date: Wed, 25 Mar 2026 06:46:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: adm1177: fix sysfs ABI violation and current unit
 conversion
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "beniamin.bia@analog.com" <beniamin.bia@analog.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260324182231.228195-1-sanman.pradhan@hpe.com>
 <f7069532401720fda1ca6e70b72742526fc79dec.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f7069532401720fda1ca6e70b72742526fc79dec.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/26 03:37, Nuno Sá wrote:
> On Tue, 2026-03-24 at 18:22 +0000, Pradhan, Sanman wrote:
>> From: Sanman Pradhan <psanman@juniper.net>
>>
>> The adm1177 driver exposes the current alert threshold using
>> hwmon_curr_max_alarm. Per the hwmon sysfs ABI, *_alarm attributes
>> are read-only status flags; the writable threshold should use
>> hwmon_curr_max instead.
>>
>> Additionally, the threshold is stored internally in microamps
>> (alert_threshold_ua) but the ABI requires milliamps for currN_max.
>> Convert appropriately on both the read and write paths, and
>> propagate the return value of adm1177_write_alert_thr() which was
>> previously discarded.
>>
>> Clamp write values to the range the hardware can represent rather
>> than rejecting out-of-range input, and use DIV_ROUND_CLOSEST on the
>> read path to minimise rounding error during the uA-to-mA conversion.
>>
>> Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and Digital Power Monitor
>> driver")
>> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
>> ---
> 
> For the AI comment, typically these applications don't go to ohms for rsense so, in practice, it

Limiting rsense to a reasonable value (1 Ohm might do)might just be good enough.
That is really unrelated to this change, so it should be a separate patch.

> might be that we never get he overflow. But I would still play safe given it's so trivial. I also
> see you only replace hwmon_curr_max_alarm with hwmon_curr_max. It would be nicer to first fix ABI
> and then support hwmon_curr_max_alarm (properly). Though might be a big ask if you don't have HW to
> test it. Anyways, after AI feedback addressed:

Ah yes, good point. The chip _does_ support actual alerts, so that would be desirable.
However, that should also be a separate patch and, yes, it would be better to have an
actual chip at hand to make sure that it works as intended.

I'll apply this patch as-is.

Thanks,
Guenter

> 
> Acked-by: Nuno Sá <nuno.sa@analog.com>
> 
>>   drivers/hwmon/adm1177.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
>> index 8b2c965480e3f..8742b8b5314b6 100644
>> --- a/drivers/hwmon/adm1177.c
>> +++ b/drivers/hwmon/adm1177.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/hwmon.h>
>>   #include <linux/i2c.h>
>>   #include <linux/init.h>
>> +#include <linux/minmax.h>
>>   #include <linux/module.h>
>>   #include <linux/regulator/consumer.h>
>>   
>> @@ -91,8 +92,8 @@ static int adm1177_read(struct device *dev, enum hwmon_sensor_types type,
>>   			*val = div_u64((105840000ull * dummy),
>>   				       4096 * st->r_sense_uohm);
>>   			return 0;
>> -		case hwmon_curr_max_alarm:
>> -			*val = st->alert_threshold_ua;
>> +		case hwmon_curr_max:
>> +			*val = DIV_ROUND_CLOSEST(st->alert_threshold_ua, 1000);
>>   			return 0;
>>   		default:
>>   			return -EOPNOTSUPP;
>> @@ -126,9 +127,10 @@ static int adm1177_write(struct device *dev, enum hwmon_sensor_types type,
>>   	switch (type) {
>>   	case hwmon_curr:
>>   		switch (attr) {
>> -		case hwmon_curr_max_alarm:
>> -			adm1177_write_alert_thr(st, val);
>> -			return 0;
>> +		case hwmon_curr_max:
>> +			val = clamp_val(val, 0,
>> +					div_u64(105840000ULL, st->r_sense_uohm));
>> +			return adm1177_write_alert_thr(st, val * 1000);
>>   		default:
>>   			return -EOPNOTSUPP;
>>   		}
>> @@ -156,7 +158,7 @@ static umode_t adm1177_is_visible(const void *data,
>>   			if (st->r_sense_uohm)
>>   				return 0444;
>>   			return 0;
>> -		case hwmon_curr_max_alarm:
>> +		case hwmon_curr_max:
>>   			if (st->r_sense_uohm)
>>   				return 0644;
>>   			return 0;
>> @@ -170,7 +172,7 @@ static umode_t adm1177_is_visible(const void *data,
>>   
>>   static const struct hwmon_channel_info * const adm1177_info[] = {
>>   	HWMON_CHANNEL_INFO(curr,
>> -			   HWMON_C_INPUT | HWMON_C_MAX_ALARM),
>> +			   HWMON_C_INPUT | HWMON_C_MAX),
>>   	HWMON_CHANNEL_INFO(in,
>>   			   HWMON_I_INPUT),
>>   	NULL

