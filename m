Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CFD1B4156;
	Sat, 11 Jan 2025 17:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736615710; cv=none; b=I4dLa748zjLf2e1xJcge4Xc+FYFLP53iSHjbYSRE0zj/0CkiK+d65X/E742KZ84SegRvyXL3ljbyxfgjnGSQU2kHQJ3XYLXh9BBf+GGJdPIwGPy5hPPKaRIstEQNHjDAR0q4eFIRsrSpck4kk67h8w0FpUfwXYbOjjjzwNyY6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736615710; c=relaxed/simple;
	bh=vXx+XHp6NBot7yoeYCeI2py7axlr6mmQo5hYV22il5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSUA+zSMvv3dBNpcDlEz9zoNvytvPqv4WB5HL1CdQO+pLD02Pwg8a6QQvJRoiQFr+E9oRAgx5Ta0ZJdAe/C+eW0OX6uLEai+kkFi0Ebw/B9zVBEdc5QmRAfQmYTM+ZANDuBqf7AYoTOSPgduYanm8QphN9A8+gdAfA98+CPNLN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llSCPBrp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llSCPBrp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21636268e43so67670685ad.2;
        Sat, 11 Jan 2025 09:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736615708; x=1737220508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wH+hX4+lfDobaMlIAuh/B70W4752LjE2E15kTIXP5p4=;
        b=llSCPBrpwKEbob2Ct24fnuHZDcUnGV4vTqEkB72exzcBjxAJq8wG5qMlCDkmRVbVMQ
         bL0UFbGJvMcY7XoqpruE4f5CuNmtqIv0wRWghdXQC25+BGCrzTNhOE5JEXqO4nIvu6kb
         DS3GDIfeNxvE+ieXXqp3xqXulIE9aY/QhfGiZEH0phso/yfVnJR7YA/DINF8CcBnn63B
         mVqOCAwgMUNQWV2AyNIECqAZc+RkmXBVHodRdm5qABK78wsqu+q5OAEuV2V+rjlk00OJ
         LCUXarca/vu8BvHwx/pC77TZkUisKyieOVQQZU8msUT5XUt6haXYAqdsJdEn8AroMc7Z
         vGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736615708; x=1737220508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH+hX4+lfDobaMlIAuh/B70W4752LjE2E15kTIXP5p4=;
        b=hKHDJGbfoyMMZVxtgMAn6Qh0levM4wXIMEpTwuov+sadpb9NYUqhnHyGQ87m4GMF6D
         d58dXiINYpFHyOYrZGaRZiug10aXYdaK0zmSL+BfgSFC/UFpAdljhkvEGK2vIz12tb5i
         mej1vEAN1annYsn1Cj18tMrH9pnO55QOvMe7xXa/fwBZQJX8LOTeC9nfifQ9TWlNt2p3
         yprkJ+R/iOjJQYmMAnT6cuAwrSevc8f3hJaztiFN+BkDUSDGwBZ8Yu0nKwTxXM8hY/W5
         p2yvIkG///FiVGTNGneWHZAF1ANslzDps3nj4QaUuRNch1T5grs/i95l2mNw55DrVWv8
         DpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1kuyLYCTTP1+fSk6Bq8Q5z6s2ToEWmzt4fqUJ6k6HLNdKD+gcNQKbt09cUIHMcHR30dSZBVDH+IQE2w==@vger.kernel.org, AJvYcCUR6ZsBFdmYmGVwH2cuvUSP4nR3BZGgc2zvVljidqxsNAyKnMXf0NT582IrCVrzdI2iRF+F4YvvNOzYTowr@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrQ/hbHAa0wVV5AzZMHkMuMU+AXmGoOhv91GCej9pKf5bIiOf
	7EiN4dl2HsKMAqeglPHyZY8oExZQbF2fJqd/TB96CiO1y/4sa9Nn
X-Gm-Gg: ASbGncvKvUPU/qVIrlUw/Httuz703xMwFJpzzXTx/mjBDhhXLjT6OeJAKqt3BTxfHGH
	dNRKSmECxNzpyvHpWRcnjI73dgmJ31CBcLE0OAYmFYhVhz9OBtYbqVS82oeBw5LCOwEv8/qAuib
	QcT/MFFnqfc6yWOmS/mYC0Q6PCY2KFVb9itg9EtsGWQZPfxe8wlaFUOSzvtSgIbTFUFxHDmE9po
	9Tz1OzpAc6TFlfcOm4E0unzeihyAkTbOR3P5HLQd7lX71kS7CYvjbL562rhsiTAsjFuYi9ZLzct
	nWiUzRSVyiCmqu2LQRZPVrxfkPiANQ==
X-Google-Smtp-Source: AGHT+IHrg1QniTccrI6m7UimadAlI5zJ2i0YpAUriM2WJlqVz/Dh7jrWbEQIDVskBeZBLGdAhXrzGQ==
X-Received: by 2002:a17:902:c941:b0:215:7fad:49ab with SMTP id d9443c01a7336-21a83f46a12mr247657425ad.10.1736615707706;
        Sat, 11 Jan 2025 09:15:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21a409sm29670715ad.114.2025.01.11.09.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 09:15:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6ee420b-7c3f-4a21-831b-619fe38408b5@roeck-us.net>
Date: Sat, 11 Jan 2025 09:15:05 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: Peter Korsgaard <peter@korsgaard.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250103101448.890946-1-peter@korsgaard.com>
 <20250103195810.GA2624225-robh@kernel.org>
 <dbf7cdd3-c5ab-4801-be85-163124b8a898@korsgaard.com>
 <20250106173805.GA501301-robh@kernel.org> <87sepq8mcc.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <87sepq8mcc.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/25 12:06, Peter Korsgaard wrote:
>>>>>> "Rob" == Rob Herring <robh@kernel.org> writes:
> On 1/6/25 18:38, Rob Herring wrote:
> 
>>> I am not sure I what you mean with the RPM reference here? The
>>> cooling-levels support in the fan-pwm.c driver is a mapping between cooling
>>> levels and PWM values, NOT RPM value.
>>
>> Did I say RPM anywhere for this option?
>>
>> It is the index of the array that is meaningful to anything outside of
>> the driver. The values are opaque. They are duty cycle in some cases
>> and RPMs in other cases. The thermal subsystem knows nothing about PWM
>> duty cycle nor RPMs.
>>
>> Defining a default-cooling-level would be useful to anyone, not just
>> your usecase.
>>
>> IOW, you are proposing:
>>
>> default-pwm = <123>;
>>
>> I'm proposing doing this instead:
>>
>> cooling-levels = <0 123 255>;
>> default-cooling-level = <1>;
> 
> I don't have CONFIG_THERMAL enabled in my builds (and don't know the
> subsystem), but I see the pwm-fan driver has some logic to default to
> the highest cooling level, it just forgets to actually set the PWM to
> match it, so perhaps we can just fix that?
> 
> E.G. something like:
> 
> commit 02c8ba74eb7dddf210ceefa253385bc8e40f49ae
> Author: Peter Korsgaard <peter@korsgaard.com>
> Date:   Thu Jan 2 18:26:45 2025 +0100
> 
>      hwmon: (pwm-fan): Default to the Maximum cooling level if provided
>      
>      The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
>      always be desirable because of noise or power consumption peaks.
>      
>      The driver optionally accept a list of "cooling-levels" for the thermal
>      subsystem.  If provided, use the PWM value corresponding to the maximum
>      cooling level rather than the full level.
>      
>      Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 53a1a968d00d..33525096f1e7 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -499,6 +499,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   	const struct hwmon_channel_info **channels;
>   	u32 pwm_min_from_stopped = 0;
>   	u32 *fan_channel_config;
> +	u32 default_pwm = MAX_PWM;
>   	int channel_count = 1;	/* We always have a PWM channel. */
>   	int i;
>   
> @@ -545,11 +546,18 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   
>   	ctx->enable_mode = pwm_disable_reg_enable;
>   
> +	ret = pwm_fan_get_cooling_data(dev, ctx);
> +	if (ret)
> +		return ret;
> +
> +	if (ctx->pwm_fan_cooling_levels)
> +		default_pwm = ctx->pwm_fan_cooling_levels[ctx->pwm_fan_max_state];
> +
>   	/*
> -	 * Set duty cycle to maximum allowed and enable PWM output as well as
> +	 * Set duty cycle to default and enable PWM output as well as
>   	 * the regulator. In case of error nothing is changed
>   	 */
> -	ret = set_pwm(ctx, MAX_PWM);
> +	ret = set_pwm(ctx, default_pwm);
>   	if (ret) {
>   		dev_err(dev, "Failed to configure PWM: %d\n", ret);
>   		return ret;
> @@ -661,10 +669,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   		return PTR_ERR(hwmon);
>   	}
>   
> -	ret = pwm_fan_get_cooling_data(dev, ctx);
> -	if (ret)
> -		return ret;
> -
>   	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
>   	if (IS_ENABLED(CONFIG_THERMAL)) {
>   		cdev = devm_thermal_of_cooling_device_register(dev,
> 
> 
> Guenter, what do you say? This way we don't need any new device tree
> properties. I personally find it less clear than a default-pwm property,
> but oh well.
> 

I would not call that "default". It is more along the line of
"If available, use highest cooling level as maximum allowed".

Other than that, I don't like it, but since it looks like we
won't get approval for the devicetree property, I'd say go for it.

Guenter

