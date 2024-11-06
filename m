Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02B93211;
	Wed,  6 Nov 2024 04:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730867216; cv=none; b=akpyHwVR9Y3ImZFWIdGTV7icXIbjb8KsXG9xKEQaHTsj/tyXGc5rDyRA/fq+WJCDxz5+aBUVK4wehjDQxAr6Kv+aXlXpQ/G1V2v4bFnfZ291JnyUVih+w9iGu2I077P/xvtjif1u3FEx/6dKaEc8FEoY7POWNNPNHgMw+up1Yqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730867216; c=relaxed/simple;
	bh=QWsFNva3D3odHmFXFvjKeO6XxY5H8q9gWK5oab1XrMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7tQGE1IWVte2P90WXbyofXX66jut4PQe66LdwB0PPHOasQexZ6ZUb4LKK6ivyb8ntMTVCl4gDD+kaeJtG6Q7QgGbfrKoOADAInhyZnc9VXuz3xenJIeeg+5cPbiXtZ4nNMUE6/ZKcVcP+hngWrgoHKXO8K+L64AdCydbnesVgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiNWkYIz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiNWkYIz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20cf3e36a76so65851765ad.0;
        Tue, 05 Nov 2024 20:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730867214; x=1731472014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Vka2+xS6d11Bx+AotKWFoWQqoGQ48Cu+nA6gnQShaqs=;
        b=BiNWkYIz4WmutKrKu14rlZ3+2kqe8lGElohFDVyUsUu5SP2Yl5Uy7nRe5Gc5bhLo6d
         GZebI/LT1S2Z5Vosg+eK1/G6qz7io5wos18h35HDrHwGkIX6sooxC8B2Li9cxCgqGQ0u
         1huQ5trV4OaRGNBDOVE3ybBYHxFLkOmaPcA+21cnDA4f9afGCMcPhSqD/Wrc7A/wBn3g
         AmvlSEfbm7LO7o3D0npy1TJPNdTOaNneerG4zUCilGmWY4oDBm3QjIHOsPMjlRRHnXVv
         z0frleoug8qcI75dO/40Fs5eTtWLl12jQhYWwURZ6H/7u1HdY/CKwpt+5tGBFDw5r1ni
         AfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730867214; x=1731472014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vka2+xS6d11Bx+AotKWFoWQqoGQ48Cu+nA6gnQShaqs=;
        b=PDffW+Ta66BZ55ekr4RMBFiPb99WhnSuWtHEeqKcgPlNOUc6PwAd3Ni7nmP3WVImrc
         JjV9jGrKGHcXECVYCwg58sEfj3JKDxDHdFhnsZXK6iJhuWaGCUx+n/EI3Wug6bU8R2C7
         +7lCQ2mrdQhviAZSHTnvyP0pIqdDoXd8BldMcNUnpvBT2bgR+1jJ5/vZyd4CKr7sswQb
         n8IZZOj0evYMq03L4eJ17cJ0h9cXraFawuhe9+gwgl+P7DO/XaEcTSrg8cjLb9esjScb
         FBXERALsr3bBcYwKsdOjvHp3nvlyN6tU49/JGJJBQ0op1zNVQ/M6VTKHbW6rGZoIxfRB
         jw0A==
X-Forwarded-Encrypted: i=1; AJvYcCXHR+aCdpXNbhZ7HR8AcFrT/qEDBgxSmOKJDTxI0y+VbkoWQrt3u4QRqj3KorCWmDfwbwvjer3mejgT7/Q=@vger.kernel.org, AJvYcCXrxaAR6uYR6nQusn3jdlp6gdLoF73WbywHOO+OX9cmQBj82YWD5S1YHauUlv0AR48Xs9wxso3bg3i+@vger.kernel.org
X-Gm-Message-State: AOJu0YydK1Rb62kWVgw61TdMs6jqbYSCIuhCMwK+yu0ZLqPnDwU+lL1V
	YZYtJ+5+wpFQT6e5aqg2jTPQh5UY8xj/6uNqE7/HTFQ2CMIzTi0l
X-Google-Smtp-Source: AGHT+IHKPAXLSb5s9fpKrLze81opkOvsVCbizLNZa+n2uu6C3tW6H4kI4yf1X7T7fi7b6HGlP9BQLw==
X-Received: by 2002:a17:902:c409:b0:20e:b1ed:819d with SMTP id d9443c01a7336-21103c58e31mr294511355ad.42.1730867213962;
        Tue, 05 Nov 2024 20:26:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056eda38sm86978695ad.48.2024.11.05.20.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 20:26:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eb635646-17fa-4380-bc9e-b872af227e21@roeck-us.net>
Date: Tue, 5 Nov 2024 20:26:51 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (pwm-fan) Introduce start from stopped
 state handling
To: Marek Vasut <marex@denx.de>, linux-hwmon@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20241106021559.175105-1-marex@denx.de>
 <20241106021559.175105-2-marex@denx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106021559.175105-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/24 18:14, Marek Vasut wrote:
> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
> to spin up from a stopped state, and can be afterward throttled down to
> lower PWM duty cycle. Introduce support for operating such fans which
> need to start at higher PWM duty cycle first and can slow down next.
> 
> Introduce two new DT properties, "fan-stop-to-start-percent" and
> "fan-stop-to-start-us". The former describes the minimum percent
> of fan RPM at which it will surely spin up from stopped state. This
> value can be found in the fan datasheet and can be converted to PWM
> duty cycle easily. The "fan-stop-to-start-us" describes the minimum
> time in microseconds for which the fan has to be set to stopped state
> start RPM for the fan to surely spin up.
> 
> Adjust the PWM setting code such that if the PWM duty cycle is below
> the minimum duty cycle needed by the fan to spin up from stopped state,
> then first set the PWM duty cycle to the minimum duty cycle needed
> by the fan to spin up from stopped state, then wait the time necessary
> for the fan to spin up from stopped state, and finally set the PWM duty
> cycle to the one desired by user.
> 
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
> V2: - Rename fan-dead-stop-start-percent to fan-stop-to-start-percent
>      - Rename fan-dead-stop-start-usec to fan-stop-to-start-us
>      - Rename variables containing dead_stop to contain stopped
> ---
>   drivers/hwmon/pwm-fan.c | 33 ++++++++++++++++++++++++++++++++-
>   1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index c434db4656e7d..27f449b65f285 100644
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
> +	u64 pwm_duty_cycle_from_stopped;
> +	u32 pwm_usec_from_stopped;
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
> +		update = state->duty_cycle < ctx->pwm_duty_cycle_from_stopped;
> +		if (update)
> +			state->duty_cycle = ctx->pwm_duty_cycle_from_stopped;
> +		else
> +			state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
>   		ret = pwm_apply_might_sleep(ctx->pwm, state);
>   		if (ret)
>   			return ret;
>   		ret = pwm_fan_power_on(ctx);
> +		if (!ret && update) {
> +			pwm = final_pwm;
> +			state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
> +			usleep_range(ctx->pwm_usec_from_stopped,
> +				     ctx->pwm_usec_from_stopped * 2);
> +			ret = pwm_apply_might_sleep(ctx->pwm, state);
> +		}
>   	} else {
>   		ret = pwm_fan_power_off(ctx, false);
>   	}
> @@ -480,6 +497,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   	struct device *hwmon;
>   	int ret;
>   	const struct hwmon_channel_info **channels;
> +	u32 pwm_min_from_stopped = 0;
>   	u32 *fan_channel_config;
>   	int channel_count = 1;	/* We always have a PWM channel. */
>   	int i;
> @@ -620,6 +638,19 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   		channels[1] = &ctx->fan_channel;
>   	}
>   
> +	ret = of_property_read_u32(dev->of_node, "fan-stop-to-start-percent",
> +				   &pwm_min_from_stopped);
> +	if (!ret && pwm_min_from_stopped) {
> +		ctx->pwm_duty_cycle_from_stopped =
> +			DIV_ROUND_UP(pwm_min_from_stopped *
> +				     (ctx->pwm_state.period - 1),
> +				     100);

Since "period" is u64, this results in the "ERROR: modpost: "__aeabi_uldivmod"
[drivers/hwmon/pwm-fan.ko] undefined!" error as reported by 0-day. Or at least
I think that is the problem. I'd suggest to try building the driver on a 32-bit
system to be sure.

Guenter

> +	}
> +	ret = of_property_read_u32(dev->of_node, "fan-stop-to-start-us",
> +				   &ctx->pwm_usec_from_stopped);
> +	if (ret)
> +		ctx->pwm_usec_from_stopped = 250000;
> +
>   	ctx->info.ops = &pwm_fan_hwmon_ops;
>   	ctx->info.info = channels;
>   

