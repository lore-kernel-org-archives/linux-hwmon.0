Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0C61DA60D
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 04:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784521285; cv=none; b=W3hYJ82Riu3Oc6iN4/UmTGw8ZngD2TQsEA48qsg1oAQzoBRJuJqjdEIXeawrjMTuY7Poc6TWQbytbLM+W9EVMFt0jarCbZnnkv18x8H0SsPfi57JQv0aZXoYgyMxjzF7rDbybVQlCupBHs9BvpVUousvix42UHhLjpK3Dr/iNEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784521285; c=relaxed/simple;
	bh=urULaECE59RZEu9ADc4DXXGJYGQ9SwkmznoHPHteils=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgz9v3SMJCUdQM1EC/oK45dN2DUPeD38xWFBT5s5ruH7EGGstswLyNK3xTAeVh2Fy/kaVvnUYU3j1YptkJcU0M4R/HubJ3eg2Xeo5wInIFgdfj/678j6BBlHuoWcTUpXrKSS7M0trcinOQGmDdo5bCcfNZAU8NLWy4v25s+o8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+Loskkr; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+Loskkr"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so5135885ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 21:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784521283; x=1785126083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6WKNm0qU+rSJG12xVDEjsgwTkXYDkcZZZaMLl49pMY=;
        b=Z+Loskkrv8NtInD8eumJNqmE2yIxI+7zrqjs+jhZKGTCh3bK9l4J0UOmzVavjU7Uo/
         2rrWBcAFIqKz1D2hiitHiwghWp0ZtwzMZDxsCE1sJu0Gho8C2NflDMmWf7hfuGQ0LpGA
         W+LAhIr4Sfn6KLT3K8zX3FFHX7T4QYqexiItfUj5GOAR5yEKQGmFc5mo9v+avsGelzUe
         GVYpA8Fa+fb0oj+2FNJ8ikc39bTzraod0PI3bOG6KPbcAG4YfKtTlwUibU/p1Qfo0zY/
         RjYWO3cR/gs2wF2T8/a++syuaRph9Id+qpNje4r/SVg1Vi8X+Nj39i0WrJiO63Mw89Li
         3+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784521283; x=1785126083;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b6WKNm0qU+rSJG12xVDEjsgwTkXYDkcZZZaMLl49pMY=;
        b=Z+BOC6Xl4NhLJgAiCuD9Hh5cxWnSmXKoSRkqs03xITznnUV/ey2v0AtKTwt5GjoGfH
         4/3flEDTAp0AwKDtpgcRaoKRap8jMhZGOsvu/mTeEPy90jiiBBQkFWdMLM+Dvmr0oEmJ
         5cgrOQ6/CvRwxodC06peHMCNR7O+IP5jLBT0uG1MrPf9Q8e8+9ykpDd3DuUiabrf6vqb
         wk6elrRR3NfnDMrsuAYS64dyuk5eDKEM3IrGMBbg5jt08IWsyx1/IH1BrafY4F6coLON
         WOLsp5SgXpkkGavt7hBILg/dHPBRNeV8YwrJ+HGZVtCrQ2/P0rPoUT6bSj6IKy9GI1gT
         9/NA==
X-Gm-Message-State: AOJu0YxEsTshU6jRA+ynPLAF2W0zmvFDBHFWXesQ6A9rYkQ+AjsVn7Hh
	0kfRrmvXzygsZ/VWUJ3du2XV0IhPTnnwQWAtqUXt3Y/o7ZvXSrUzKqKQ
X-Gm-Gg: AfdE7ckr1cPo30iFqE1i56CJprJZAzdqeXf1ewxxwy6EQLaSQDEtn+hZlii8Xt3GX+y
	tgkpUiat1otP5k+uuD2Zu74iSCbpYNpUcjPHmqg8ny6oJ/6/Ywj/Glnk/qQSkHqjPuj3RCTyksh
	jIeLq5pwivTDObiIOJGMX887N9Z9+sBJ2mkYHkX6HmBcBW/hzP+NTp/X1AdTUGapGrxHsVEHqSi
	b38BOa8w0aEy40MC0grJ7pZ9VZJ/a1ntzti45kpNZGi7RfGQUSHvIPyMkGZ3jGQaMLby04Utc3z
	gO5fuLqz8If4XmQgJIrEmXiyyetkx1zDP8AWfOqsF3gMk63wdD7XhaG1J2WRbvreNUvnsrHvqDH
	urm4JzD+ZsmNSiqhi35iTSyei0p4ZRZ5jsnx0yEfWQpm10EpYMBsGBFp1yCAMwwmoTcOGURGHFD
	DDbTL7epkkxbPztUxq4BWR4eV4hwXKjjcMoSNxemKLhdWAtKIkXYirNpNtXh9N2w==
X-Received: by 2002:a17:903:1a43:b0:2cc:7d4a:3f5a with SMTP id d9443c01a7336-2cf3487711cmr146046185ad.20.1784521283240;
        Sun, 19 Jul 2026 21:21:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346d9b00sm50125975ad.53.2026.07.19.21.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 21:21:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f5189cb4-570e-4eb0-9152-759512d351d5@roeck-us.net>
Date: Sun, 19 Jul 2026 21:21:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
To: sashiko-reviews@lists.linux.dev, tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
References: <cover.1784516953.git.tze.yee.ng@altera.com>
 <a686d2c3ef56a3ce28b059621a237259af314032.1784516953.git.tze.yee.ng@altera.com>
 <20260720033636.A08491F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260720033636.A08491F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/26 20:36, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing break in async poll loop causes severe kernel log spam and unnecessary blocking on hard errors.
> - [High] Synchronous read timeouts leave stale requests in the channel FIFO, causing all subsequent reads to process stale data and return mismatched sensor values.
> --
> 
> --- Patch [2]: [PATCH v6 2/2] hwmon: add Altera SoC FPGA hardware monitoring driver ---
> commit ab6c0c0f95d3890d759e04d9d9aecd151d6406fd
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
> Subject: hwmon: add Altera SoC FPGA hardware monitoring driver
> 
> This commit adds a hardware monitoring driver for Altera SoC FPGA devices using
> the Stratix 10 service layer.
> 
>> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
>> new file mode 100644
>> index 0000000000000..72418201b65d6
>> --- /dev/null
>> +++ b/drivers/hwmon/socfpga-hwmon.c
> [ ... ]
>> +static int socfpga_hwmon_async_read(struct device *dev,
>> +				    enum hwmon_sensor_types type,
>> +				    struct stratix10_svc_client_msg *msg)
>> +{
> [ ... ]
>> +	ret = -ETIMEDOUT;
>> +	while (!time_after(jiffies, deadline)) {
>> +		status = stratix10_svc_async_poll(priv->chan, handle, &data);
>> +		if (status == -EAGAIN) {
>> +			dev_dbg(dev, "Async message is still in progress\n");

This also creates a lot of noise if debugging is active. I don't know
how long the command usually takes, but it does seem to me that this debug
message isn't really helpful.

>> +		} else if (status < 0) {
>> +			dev_alert(dev, "Failed to poll async message: %d\n", status);
>> +			ret = -ETIMEDOUT;
> 
> [Severity: High]
> Does this loop need a break statement here when status < 0?
> 
> If stratix10_svc_async_poll() returns a hard error, the code sets
> ret = -ETIMEDOUT but continues to loop for up to 2 seconds. This could
> flood the kernel log with dev_alert() messages on every 1ms retry.
> 

Sashiko has a good point, especially since the function returns
-EINVAL which, if seen, seems to be  _real_ hard error and retrying
seems pointless. Also, why replace -EINVAL with -ETIMEDOUT ?
That would need an explanation.

On top of that, "ret = -ETIMEDOUT;" is pointless here since ret is
already set to -ETIMEDOUT.

Oh, and the called code already displays an error message unless
the parameters are bad.

>> +		} else if (status == 0) {
>> +			ret = 0;
>> +			break;
>> +		}
>> +		msleep(HWMON_RETRY_SLEEP_MS);

I would suggest to use usleep_range().

>> +	}
> [ ... ]
>> +static int socfpga_hwmon_sync_read(struct device *dev,
>> +				   enum hwmon_sensor_types type,
>> +				   struct stratix10_svc_client_msg *msg)
>> +{
> [ ... ]
>> +	ret = stratix10_svc_send(priv->chan, msg);
>> +	if (ret < 0)
>> +		goto status_done;
>> +
>> +	ret = wait_for_completion_timeout(&priv->completion, HWMON_TIMEOUT);
>> +	if (!ret) {
>> +		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
>> +		ret = -ETIMEDOUT;
>> +		goto status_done;
> 
> [Severity: High]
> If a timeout occurs here, could the unfulfilled request remain in the
> SVC channel's FIFO?
> 
> When the timeout hits, this path calls stratix10_svc_done() which stops the
> worker thread, but it doesn't appear to remove the request from chan->svc_fifo.
> 
> Would the next sensor read enqueue a new request and receive the stale data
> from this timed-out request, permanently desynchronizing all subsequent
> sensor readings?
> 

Please either address or explain why it is not a problem.

Thanks,
Guenter

>> +	}
>> +
>> +	ret = priv->last_err;
>> +
>> +status_done:
>> +	stratix10_svc_done(priv->chan);
>> +	return ret;
>> +}
> 

