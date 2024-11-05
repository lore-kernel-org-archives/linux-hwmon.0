Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ABB1D5AB2;
	Tue,  5 Nov 2024 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815966; cv=none; b=a1pM1We17sPEFMTNb3Rr4Tj5SAY5mRl+X5yRbDXvb/FCHxcB9hyjAUxI7QcDfcz8oUDXTxF7jUt2PyTFCvY+WLBttiAQ3H9+cAm576q+NrzlJiJhx1a249ntyeJkGEVjDm9m6q1qXEGBsg79/NbCU4kNSE8EVfL6aaj92YNS2ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815966; c=relaxed/simple;
	bh=bOdM7QTxL5XnzD0/f0/HgRtJuN20FxRy3HEuMvNP51s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clYu5JDurb04NmI+3IaHee7UyvasZrVzykiLzqZ2CfXkXy2ca8V4QG67fpjGnpbkoo8HOkctpO4CgVAi3AIBaxpYAaKv4i/aM1WevHJLw1ZYalS5Q4eW43JNBlxxHsuCvsthN1H9l645vMO8kSRa+qLiXyPyMxFlyKsOfR5cK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWuue1z4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWuue1z4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cbca51687so52324765ad.1;
        Tue, 05 Nov 2024 06:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730815964; x=1731420764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=huvQb84k9zFRsY6lvh/t2ldg8OxUrx7o2jsYpgN4XRQ=;
        b=iWuue1z4mC0DA0F7gaskFfVJ/vNgQlytInIR1E7LU1pTt9MJ0XsL6s2QnPpnwavdzF
         n2dCfuQvah7vYlc3oOMy8tabC7fteULYAVqoKQpSXaQeCs/+FTI3UkjhF7hFCjZMllQE
         aApPPq92FP9UDOBgyZGbGhyrgC94Aa85+t4fx850OokNkvf80Ww6Mh4AJ9o6ubXVEFGW
         siQA2PIHnbHl9ESO+5UTwu5ks9xmCJW3TJ8KMSZLZDqa6dmJRtlPLsE5fOzY6fOGpUEH
         tGIhCoUHJ8xO40PrfpGEpd2mxDR+8c0g063CAaKUgv1nRQ40EbL1TfXWV6+lGbNrJsOK
         eRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815964; x=1731420764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huvQb84k9zFRsY6lvh/t2ldg8OxUrx7o2jsYpgN4XRQ=;
        b=okNTVcW6hvUbcwxdN9p7UpGu8kXkXemEILZ2mNcPnR5BZKgS+ohvRQV2uyVbmaF5nJ
         m9uRT7v6GU4O+AqaPog9Z3POL8C8rJSww/H1g5IFCdEgkU8bg2NHnM56XXcm4eXNqDgc
         91AJFbBAk1UUM18BFHSBxIyLtstIHDv+/v2qGWi26swY/WV/NhK37MZZVV6PVcz1UhTH
         dFuM2JfMSwPb0UmFK+isABXna+KsXpBENemdSSy1rsGT7bToAyUR+O4Qe/MWkkGpgqBE
         oUAK5+xMDN0A49wVHwUl3vtCw3oikT6T+fqa5Fs721guNR7ML7FlMxDsgIspid7+cqe5
         UJHg==
X-Forwarded-Encrypted: i=1; AJvYcCVnHofcPxjxGGDZpypP5CetFK7KGYIdPS4GsC+v1ZBtK99R7sKcQYrOk33MuA64zUlyjtg2GR1NfQaiGSs=@vger.kernel.org, AJvYcCWu60mtGp9yMSOTr6Hs0GGVbPQY7rKKFcljfHP0P25xy2NlGNTFaDBjyMu6ixbgHC0VtKNqJudY8S39@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/9sJjI5kpnWleMvwhYCYw4GOwieDVE/U6jhS2Uerdln3v5tBn
	6JcaRJC+RDhJN4LpA46JhgdUOim0DpfiHEkYMxFcM7Zz9Iz9rGFPdl62Aw==
X-Google-Smtp-Source: AGHT+IH+f4g0IgcY+43tADscIQn+U9PKHENhgbG6TvlHMyrUCXErktXhXaG7iDx2h+za3VT4qiCC+Q==
X-Received: by 2002:a17:902:ec83:b0:20c:9d79:cf82 with SMTP id d9443c01a7336-2111af968efmr209914645ad.58.1730815964289;
        Tue, 05 Nov 2024 06:12:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110572008dsm77597575ad.114.2024.11.05.06.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 06:12:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7d761be5-15c8-4d73-9ee8-34025769d08e@roeck-us.net>
Date: Tue, 5 Nov 2024 06:12:42 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pwm-fan) Introduce start from dead stop
 handling
To: Marek Vasut <marex@denx.de>, linux-hwmon@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20241105135259.101126-1-marex@denx.de>
 <20241105135259.101126-2-marex@denx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241105135259.101126-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/24 05:52, Marek Vasut wrote:
> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
> to spin up from a dead stop, and can be afterward throttled down to
> lower PWM duty cycle. Introduce support for operating such fans which
> need to start at higher PWM duty cycle first and can slow down next.
> 
> Introduce two new DT properties, "fan-dead-stop-start-percent" and
> "fan-dead-stop-start-usec". The former describes the minimum percent
> of fan RPM at which it will surely spin up from dead stop. This value
> can be found in the fan datasheet and can be converted to PWM duty
> cycle easily. The "fan-dead-stop-start-usec" describes the minimum
> time in microseconds for which the fan has to be set to dead stop
> start RPM for the fan to surely spin up.
> 
> Adjust the PWM setting code such that if the PWM duty cycle is below
> the minimum duty cycle needed by the fan to spin up from dead stop,
> then first set the PWM duty cycle to the minimum duty cycle needed
> by the fan to spin up from dead stop, then wait the time necessary
> for the fan to spin up from dead stop, and finally set the PWM duty
> cycle to the one desired by user.
> 

As with the other patch, I don't think "dead" adds any value anywhere.

Guenter

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> ---
>   drivers/hwmon/pwm-fan.c | 33 ++++++++++++++++++++++++++++++++-
>   1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index c434db4656e7d..264b7ddf8bb40 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -7,6 +7,7 @@
>    * Author: Kamil Debski <k.debski@samsung.com>
>    */
>   
> +#include <linux/delay.h>
>   #include <linux/hwmon.h>
>   #include <linux/interrupt.h>
>   #include <linux/mod_devicetable.h>
> @@ -60,6 +61,9 @@ struct pwm_fan_ctx {
>   
>   	struct hwmon_chip_info info;
>   	struct hwmon_channel_info fan_channel;
> +
> +	u64 pwm_duty_cycle_from_dead_stop;
> +	u32 pwm_usec_from_dead_stop;
>   };
>   
>   /* This handler assumes self resetting edge triggered interrupt. */
> @@ -199,7 +203,9 @@ static int pwm_fan_power_off(struct pwm_fan_ctx *ctx, bool force_disable)
>   static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
>   {
>   	struct pwm_state *state = &ctx->pwm_state;
> +	unsigned long final_pwm = pwm;
>   	unsigned long period;
> +	bool update = false;
>   	int ret = 0;
>   
>   	if (pwm > 0) {
> @@ -208,11 +214,22 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
>   			return 0;
>   
>   		period = state->period;
> -		state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
> +		update = state->duty_cycle < ctx->pwm_duty_cycle_from_dead_stop;
> +		if (update)
> +			state->duty_cycle = ctx->pwm_duty_cycle_from_dead_stop;
> +		else
> +			state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
>   		ret = pwm_apply_might_sleep(ctx->pwm, state);
>   		if (ret)
>   			return ret;
>   		ret = pwm_fan_power_on(ctx);
> +		if (!ret && update) {
> +			pwm = final_pwm;
> +			state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
> +			usleep_range(ctx->pwm_usec_from_dead_stop,
> +				     ctx->pwm_usec_from_dead_stop * 2);
> +			ret = pwm_apply_might_sleep(ctx->pwm, state);
> +		}
>   	} else {
>   		ret = pwm_fan_power_off(ctx, false);
>   	}
> @@ -480,6 +497,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   	struct device *hwmon;
>   	int ret;
>   	const struct hwmon_channel_info **channels;
> +	u32 pwm_min_from_dead_stop = 0;
>   	u32 *fan_channel_config;
>   	int channel_count = 1;	/* We always have a PWM channel. */
>   	int i;
> @@ -620,6 +638,19 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   		channels[1] = &ctx->fan_channel;
>   	}
>   
> +	ret = of_property_read_u32(dev->of_node, "fan-dead-stop-start-percent",
> +				   &pwm_min_from_dead_stop);
> +	if (!ret && pwm_min_from_dead_stop) {
> +		ctx->pwm_duty_cycle_from_dead_stop =
> +			DIV_ROUND_UP(pwm_min_from_dead_stop *
> +				     (ctx->pwm_state.period - 1),
> +				     100);
> +	}
> +	ret = of_property_read_u32(dev->of_node, "fan-dead-stop-start-usec",
> +				   &ctx->pwm_usec_from_dead_stop);
> +	if (ret)
> +		ctx->pwm_usec_from_dead_stop = 250000;
> +
>   	ctx->info.ops = &pwm_fan_hwmon_ops;
>   	ctx->info.info = channels;
>   

