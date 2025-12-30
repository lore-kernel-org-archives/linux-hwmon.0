Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A24238C2F
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105198; cv=none; b=NMsOK/834Djnn8b2cjFR/x9B9wAlfVxNLhUkSVg7FKfAGN3JsjygV+IpqiTjdNeovPJRqLi2xVX227mWOBoyUW6NFU2Hb9evAH+H4CrWMEQwYd6+g+ZHBqkyf38Ki1mcAgSg4F/sdnxeMbLQj0S5ofLWcQGfeOE5Opv+TStKtKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105198; c=relaxed/simple;
	bh=KunfU9CiyU08bAvs3zwe8a8Sz4+i9wJ9jB8yL0XNj0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPo6GtBwWeFk/LQ8SHPiYF90NuNIge4gE+S0Watx3rd5JXEmj16mLyXkVmXm8LrwXlrsFis3XJUu3Q7uHAcU1pRM8VL/DpzAidS1LiHsaehIcLXL94anIeUl8T3LwJGN2CMXSQUvQULr/6uzIXaqKvKDpaEP3lrT0m5KcfUn7mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4477bNF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4477bNF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so8379489a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 06:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767105196; x=1767709996; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jeORyyYDYkSbyJvNmNvW6nrc/284HDtM+eQ3+Nxnq8U=;
        b=P4477bNFwdSM2185w/OAL08hSltiQfklIKNFXyykam5U2gXq/UPO/StT8QnprSgsJ1
         YM6r81FzuVjw9eQ/fA0ttPVusimMAMJmIFgKgpp4ldiFRTSRNcULCXDuj6VjHJGm3NOf
         RTXu60uN4JxGSxvt0maEwI+Gwx6C1tCdTlP7Usr+Du6RJ8LkOTvBIyuIoxmsTt++n+BD
         i17k6RY+sgo9hkm5tAUEecyn1C8fZfVRV6yDn9Wlfq9l9XDLC1yYDOeLkljJGg9Sl1ad
         MQcQZDU72l7sp2iywzU0s7ZHy6TdmnpvUJnP3OzUt4kIjYvpZgrelWyBoobvuU6M+Oin
         DCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767105196; x=1767709996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jeORyyYDYkSbyJvNmNvW6nrc/284HDtM+eQ3+Nxnq8U=;
        b=nAWK1GKnlVt7dM9bdYGywd6f1FY+wiBuoX6m/RrsXdmTMoq3B89ZphoGxyHhR/hif1
         JQOsgX9TllNgnSl+efDemMQVnGxxn+BTEm7YUvVPASCrRpeZA3xsK/tJy7t72fD8kobT
         FKw1K4BZ7Dk3RCTLwjt+7gvwAbADfK2POnvQvhIcbZu1z6GtKQCDhvDXr9MkNwh6A43U
         RWWQ2I5nMjvSzgqqroRSvMw8i66dYaEYJgc68KZu3I4VvR1yoBcTRIpDxF/DYroIJ1Rk
         HOh6ihTVBbKZieTqyzBWo26ClpMf6STlMZWwadjkxXhOd14RYiMtsqMtOX4LdR/AmbBC
         rZCw==
X-Forwarded-Encrypted: i=1; AJvYcCVgMnbzs5f5yFQ3xnqBalaVgHzH2nJmXBgUjq1DoZyFTI+NS4ulI9eSZdlqoch9rscFv9MAVQr3Ce/5xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjlYCMzB1DhZHKPcHkiBAsYx8cn6KpwD7ft23vERs751GjDhR
	BK5XqbAwh73DjYYfBVF34EZaG4yzNZo7zHj4xGfpeKpdTNyTI+5ubqda
X-Gm-Gg: AY/fxX7QQOzn4788ZGcdcRthaWriAUK16vCUIU5bKGmZ/2FX4GAuP70+UCvIYD8xjoL
	3O8FksVR0e0F1+ItyoWCWRC+iPMf2mnLJdfGeWEjxrm0M9AgzCpmFkiQ0zbJG7lvytYiyybEWq5
	RHkXmW2Oh1wlW7iMhsjXexzR8DJPvRYbxebZWq1pkbdPpsHgoy+tUG4hkra6/VyCuT/uMOEQLCq
	CKmAAHTUfwRPRGfvydk36b1qtdw5B6MKgg9jVbTmTLKOm+fukXmQjoF+b9sZGf/6IAzrmA45XLK
	ZF80+zWguYbHFqXoHXlQy7gwUqD/15SD5qqlo7woFNvhjUyjySY5ntUvuqjnHarZTVPjjB3u8J8
	KOYh9+t0JSThWOJCmRTzjRLr40fi9xvNoFihIk/FZoXX5NnM0uLUEWuZ3PEMIhZO8+KtSZchj4S
	G2zUrocJ7oZRYNPfoDc8c=
X-Google-Smtp-Source: AGHT+IHhQcFQwSL5mw4bTGmbhqwWNMktKpuulypFK5d2RP4sjL99p2VVy51z4NjoqHzyYo9oMV6m7Q==
X-Received: by 2002:a17:90b:33c9:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-34e9211d59dmr27919455a91.6.1767105196128;
        Tue, 30 Dec 2025 06:33:16 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm33464049a91.7.2025.12.30.06.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:33:15 -0800 (PST)
Date: Tue, 30 Dec 2025 20:03:04 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: implement fan keep-alive
Message-ID: <aVPgW8uAi4RNOUbd@archlinux>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
 <20251225142310.204831-3-krishna.chomal108@gmail.com>
 <7072d96f-455a-5249-2553-6e72e6a00577@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7072d96f-455a-5249-2553-6e72e6a00577@linux.intel.com>

On Mon, Dec 29, 2025 at 03:21:42PM +0200, Ilpo Järvinen wrote:
[snip]
>> +/*
>> + * 90s delay to prevent the firmware from resetting fan mode after fixed
>> + * 120s timeout
>> + */
>> +#define KEEP_ALIVE_DELAY	90
>
>For any time related define, please include its unit in the name so a
>person reading code can immediately know it.
>

Renamed to KEEP_ALIVE_DELAY_SECS v2.

[snip]
>> @@ -2159,23 +2174,36 @@ static int hp_wmi_hwmon_enforce_ctx(struct hp_wmi_hwmon_priv *ctx)
>>  	case PWM_MODE_MAX:
>>  		if (is_victus_s_thermal_profile())
>>  			hp_wmi_get_fan_count_userdefine_trigger();
>> -		return hp_wmi_fan_speed_max_set(1);
>> +		ret = hp_wmi_fan_speed_max_set(1);
>> +		break;
>>  	case PWM_MODE_MANUAL:
>>  		if (!is_victus_s_thermal_profile())
>>  			return -EOPNOTSUPP;
>> -		return hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
>> +		ret = hp_wmi_fan_speed_set(ctx, PWM_TO_RPM(ctx->pwm, ctx));
>> +		break;
>>  	case PWM_MODE_AUTO:
>>  		if (is_victus_s_thermal_profile()) {
>>  			hp_wmi_get_fan_count_userdefine_trigger();
>> -			return hp_wmi_fan_speed_max_reset(ctx);
>> +			ret = hp_wmi_fan_speed_max_reset(ctx);
>>  		} else {
>> -			return hp_wmi_fan_speed_max_set(0);
>> +			ret = hp_wmi_fan_speed_max_set(0);
>>  		}
>> +		break;
>>  	default:
>>  		/* shouldn't happen */
>>  		return -EINVAL;
>>  	}
>>
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Reschedule keep-alive work based on the new state */
>> +	if (ctx->mode == PWM_MODE_MAX || ctx->mode == PWM_MODE_MANUAL)
>> +		schedule_delayed_work(&ctx->keep_alive_dwork,
>> +				      secs_to_jiffies(KEEP_ALIVE_DELAY));
>> +	else
>> +		cancel_delayed_work_sync(&ctx->keep_alive_dwork);
>
>This is now duplicating the switch/case, just add these to the existing
>cases.
>
>You may want to introduce ret variable already in PATCH 1/2 and add a note
>there that an upcoming change is going to add keep-alive so the return
>value has to be stored temporarily.
>

Yes, handled the re-scheduling in switch/case itself in v2 and introduced
the temporary ret variable in patch 1/2.

>> +
>>  	return 0;
>>  }
>>
>> @@ -2321,6 +2349,20 @@ static const struct hwmon_chip_info chip_info = {
>>  	.info = info,
>>  };
>>
>> +static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
>> +{
>> +	struct delayed_work *dwork;
>> +	struct hp_wmi_hwmon_priv *ctx;
>> +
>> +	dwork = to_delayed_work(work);
>> +	ctx = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
>> +	/*
>> +	 * Re-apply the current hwmon context settings.
>> +	 * NOTE: hp_wmi_hwmon_enforce_ctx will handle the re-scheduling.
>> +	 */
>> +	hp_wmi_hwmon_enforce_ctx(ctx);
>
>(I only now understand why you named this function like this, and I still
>don't think it's a good name for it as you've other callers besides this
>one real "enforcing" case.)
>

Yes named to "apply_fan_settings" in patch 1/2 of this series.
