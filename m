Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F39B440655
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 16:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278982; cv=none; b=fhJAiE3XimyYouYijwoMFHwI0Cgi0C0s4/NcxmVNbANvUeL86qLSlWK34LNLihmvhvhT5Cz6fM1AHUxoFL4oIzDyEjH5tvpBhQ8TheHqSbpG7+jaqiuAxzXhLG1bUQ6wWAC4NhIbXCqdYNH+OtzhkS2TxJqI22g+jtFn1agovX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278982; c=relaxed/simple;
	bh=LGzyyAE1NTeO9Xl0hCpc17B47STwwX7obsMRjL/B7gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otXnLC9Js8IRE0C3/nKnkx0pz1wERn8zNqzqZucqihTM0STprBjmtk5YaESxzeq/cd4VfNdxow5BctrBQ/i14mZCi5NljY6fZ/AqgJLEettCJ4KKPz1cfQf7J6ZeUN4co2rCPQ4DskrYtCf1YE+RUP4NspSm+NQ1WYfwZq+sphs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxEmLelP; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxEmLelP"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so18271a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278980; x=1788883780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X2dLzM1w1od6jsp2DvQ7mFaAdeIHcTJiR2FYSd46rQ=;
        b=TxEmLelP3SFt+Z0V6FSN7VzrviFXznqcp11Q3WE57Skk/H6V4ey+zhxF9VS3GaVVgj
         +qAuV4VJmAq9VuPfTUwTZ1yDAYqXNmdgxR9xBXY5t6NP9vCNih+Om9W4uKA7wRaPE3uf
         eZtx5ohz8FjphFMCJbnR6MJ8bltBo0DhFG7jkkmwejpQjtmTKQC4OIYrlag0Z0npRX8z
         H8HxXxkfsx4zbK+yls1tHsWZpMIXFsKP91cFf9jLW9gS8MxjRdBz7U4/1TejTYeXM24v
         Y4GhjIC5fJtnp3dUPCIwLSj8kQbRPGtZaZzKzK4kqB/+RxPfDFNCTrjjDjgtVpLEiAEc
         eU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278980; x=1788883780;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4X2dLzM1w1od6jsp2DvQ7mFaAdeIHcTJiR2FYSd46rQ=;
        b=m8MucGXJNytPV5sh3jKHTVuPDtoBi1OtuqaYcfVnJdB6BlbkLScWS2qSLWi3TbZ/ms
         aohlUN+F5libmdmAqfZjmOn4hP7WI7GOemApm/AmNWku0XXCA6R190dvDnSLkGb5+fZT
         nRq/bHfS5pvgWt8jz/O3dhrJUWjvgBTN2apuIemwkgE2Vs2b4yy6GQ6bKGxmDp8NuxA8
         i6GGi+TtcMIzb08QiB1/F8WyzKySD7bVZ67SFJ9yteYddebcyuydLnPgTwy1F/brGCHY
         JtCWrUTaBJYfnVZGL9YTGhcOWKhY2nkF6kJTSSGkYeMTHj/MLkuVHOkJT8OJ7PuyhgXe
         2gAQ==
X-Gm-Message-State: AFuF++n/5NdQ9O6P1U86ffdPiNGtwYvIEKuikNn+82yOj2v/+x0m0ChV
	+xl8AHiq7f+h3HCcpFzEN42Y9/l3pREcBx9l08ZoaRqbkuQKrBp3HThY/ORhRg==
X-Gm-Gg: AYBFou0HemnAPX/b18l+YMo5vxMC0u+oqQC48nRqlekpX9aRIUspG3MBmdMuWPo7iJo
	B4MKWHv9uZmkAa9sidj18k5TIX5jnR/UFpUGvnOILiuPkgGzf9sl6V/3cclou5rHUP0knFp4xP7
	8pT+3Qb7EcRl5fvaOP+GDYHKK3zJzwo2bJy+1rHbM/uoZ/LgZdwziXaQ9fTuganbu1UoxO8H21d
	kPaLFRKmBB/tJO9vPvwiuMAUed2nbK2GjUjRvp/pSc9UlcdFPHddaFV8rkDOL2zC+QCxXCHgWg3
	Fce7KF0R2HIKVsR7lx2npT0cxzV0LtWHRR4WbccQxy6LZeCbj+WWTzaZGhDtMB/3d4O2qidk/H5
	Klxr64AuUeKjpqu72Bc9MY5JeuQZKHej74DBfDJc2Qic391V8mOSGnbQOqcrT9QH9uxycBkCKll
	kNjPrIYLR9KWf4E+GnlLPuJaD38Wdgw+Rp/2K1K6vzQMH62YZ4XVoL40cOY7v1ym99OzEwt2lIg
	ZAdbjGQlGtFDoZrVgpzNh/zbnWMElqJFKiiMA==
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr41094686a91.17.1788278980435;
        Tue, 01 Sep 2026 09:09:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfe6b6sm362937a91.1.2026.09.01.09.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:09:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <010f7863-1cbb-45c1-83fb-6d76c92792b4@roeck-us.net>
Date: Tue, 1 Sep 2026 09:09:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpio-fan) return IRQ_HANDLED from the shared
 alarm IRQ handler
To: Cong Nguyen <congnt264@gmail.com>, Simon Guinot <sguinot@lacie.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sashiko AI review <sashiko-bot@kernel.org>
References: <20260901155648.1538876-1-congnt264@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260901155648.1538876-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 08:56, Cong Nguyen wrote:
> fan_alarm_irq_handler() is IRQF_SHARED but unconditionally returns
> IRQ_NONE, even though it always schedules work in response. Enough
> "unhandled" reports on a shared line trips the kernel's spurious-
> interrupt detection and disables it, taking every device sharing it
> down too.
> 
> Return IRQ_HANDLED, matching what the handler actually does.
> 
> Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>   drivers/hwmon/gpio-fan.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 084828e1e281..a55a7ea07fc0 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -67,7 +67,7 @@ static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
>   
>   	schedule_work(&fan_data->alarm_work);
>   
> -	return IRQ_NONE;
> +	return IRQ_HANDLED;
>   }
>   

That makes me wonder if IRQF_SHARED is appropriate for this driver's
interrupt handler. I think that should be dropped as well.

Thanks,
Guenter

>   static ssize_t fan1_alarm_show(struct device *dev,

