Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6884C3A3820
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779545869; cv=none; b=thtC/Mka7EO/rwpB3ePqXtE9t9mnY9P99LlCh3sFXveqMpnNSjN37KyA898UdZej7P2nTX9zSnfBfEW2ZuoM8lCMT2ZzFb/0+BJnSz1m3BZHawwfjTPok1M4wJ6OJVSaRCS1C4tJQZr3vU+tyTUOKge0odfWpNp06WdNqK6FZwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779545869; c=relaxed/simple;
	bh=HTcufpixSFvsos10KMatl2USvpTpbTqhl9ZbNxpNKpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2kcENm0VTE/nSRuP1L7f0WpWztdJJUzMrmNQPDcRKV0w27tT9J44TbQaWVX6GKhSvA9o5aFdl/kK7W9P80D5jSGJoaN51dWO5o2ydwMpglLHhU+K79om3AFNZWtYjyfqkJQCW8Yb/4ySiQrC6FzSBPu8LhHh5Vs9VjDNjDwPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T40TDdY/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T40TDdY/"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-83f674f978fso3043544b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 07:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779545864; x=1780150664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IGQq1yhYm6aObOVGgJk1IPE6ojqXxlF3lV8nupT/5m4=;
        b=T40TDdY/UPmscUfpAWoJ4eKxivRIOHBgnDI61X5Ac5vPpYSdMOSkxkh52Gu9XamsGk
         l6sQRNidxq6obJzSUUh0qBly17LJiByR64ylTcqbmGcNPuLLwEZP9/aC3+lpViWUfH9k
         hTC7eeAwQdV64nkSyArSU1KAv16g2hMPze4cNkepaCtd/lpwrCKwVW4ZVxKJ3weOKNgV
         9PYln1WNX0YgYJJ65MaG9dJRcnN5S0qfR9xX4QdshqTsOhVuCIaz0yzl8pMMssw41/aH
         wKdDQWAR9pl25jD683osj0WpiJ/iCJEf0QbhnBRRvJoCasecEB1TwoCgZ+1955tHQwKQ
         vi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779545864; x=1780150664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGQq1yhYm6aObOVGgJk1IPE6ojqXxlF3lV8nupT/5m4=;
        b=oM+Aw6XM6XRU/RhPxViX/3vMA/BbfwZ+zZjrB5+PDOYhDElOX9m14W/QZMOvGjhfqJ
         lclpwhUyPK0nJcq6kkQ9z+zhYFey9DfrdPQt4xHIyDrcj0cqxysHS1qG5CGB0f6uklj8
         hSJs0MZsReq9wJ6nmstQ04tskQfUb7y/PU9GeNs8IC9hmyDexYHIhvvUPleaaLKy75pM
         evgdiOwSho7PAlr2rqvr0RDpAFEiWJLGXhanjPdZhx2PgPB5YYr8QoBThFShRqrjbIE4
         LfSt+c8vzbtluEoCO9fzIIvDFcE7EK0uw8IgNNIp3vMOGvKzLWga3d95rUr6ggpZOD//
         lIsw==
X-Gm-Message-State: AOJu0YxDmIJGxd60e4qigmld8D5jnJe+saSE6YtlRsNvbzu5ulYfkoLG
	mQObWGHBy3kK1cXKp1FtGgEiyU0gquCglkPm9Ae0q0LgZS4kgCifaywJ
X-Gm-Gg: Acq92OFRe5cGL8YBeWzDFfF04L8/dIqDjOURvmjn3hlNUuBCUS2pU/DUaVz+UEeItlv
	BnMmeS61VRAuRwX1EBaivNCky9F+Z28K2p9eGYxYaCQJPOvupsvmKhXrHz4AdZnyWiN1PX2w5Wx
	ZSc0nASklY0ksY08vC1Se6Z8ORGgt3IzxdkTJSRz7BWokM1OtYPIXeE+QLPW2ePlMFfhsm07oYk
	4bGvNdUn9/ZEGwuJLj3Jaoy7Zkvlk7mUJLaGfAvfHDpGjLZyabR5BBJ7rCb+Pp4f9INcNXGAaqe
	afXfjlgqSO61sDKwUMF1RzqHHNj8Fps+5ZKcl9/Iyi9ozuZiJCiAERYroL3Z+uxYYeoU+uGnHTp
	0XbWwLrlOTbO8Je4H0NsYJd7ED4PXoc50yl3ttDfWmOMrEmrw4DPzdpw93pCXLRseTuDfLkBIM/
	mDWboZrxcOm7GYoaqBr/emtYr3NlC+pMcR6Xs8y9oOj1LVMYnYos6Z8yywnBV9gFg9XFZI2yHD
X-Received: by 2002:a05:6a00:1818:b0:83a:78ac:edb7 with SMTP id d2e1a72fcca58-8415f1dcfacmr7897643b3a.5.1779545863767;
        Sat, 23 May 2026 07:17:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e635sm5451255b3a.38.2026.05.23.07.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 07:17:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <66c665fc-5dc7-4323-8439-1afa1ad1be4d@roeck-us.net>
Date: Sat, 23 May 2026 07:17:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] hwmon: (pmbus/tps25990): Rework TPS25990 direct
 conversion handling
To: Stoyan Bogdanov <sbogdanov@baylibre.com>, jbrunet@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
 <20260522082349.2749970-3-sbogdanov@baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260522082349.2749970-3-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 01:23, Stoyan Bogdanov wrote:
> Rework the existing implementation of direct format conversion for
> TPS25990 non-standard parameters to improve code reusability and
> integration with the PMBus direct conversion helpers.
> 
> Changes include:
>   - Add an enum describing the supported parameters
>   - Add structure to hold m, b, R per-device coefficients
>   - Add data structures for pmbus_driver_info and local direct values
>   - Use the generic PMBus conversion helpers:
>       pmbus_reg2data_direct_calc()
>       pmbus_data2reg_direct_calc()
>   - Replace previously used defines with structured data
> 
> This reduces duplicated conversion logic and makes handling of
> non-standard parameters more maintainable.
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> ---
>   drivers/hwmon/pmbus/tps25990.c | 197 +++++++++++++++++++++------------
>   1 file changed, 127 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> index 05c6288ecafc..1e252844217b 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c
> @@ -36,17 +36,63 @@
>   #define  TPS25990_UNLOCKED		BIT(7)
>   
>   #define TPS25990_8B_SHIFT		2
> -#define TPS25990_VIN_OVF_NUM		525100
> -#define TPS25990_VIN_OVF_DIV		10163
> -#define TPS25990_VIN_OVF_OFF		155
> -#define TPS25990_IIN_OCF_NUM		953800
> -#define TPS25990_IIN_OCF_DIV		129278
> -#define TPS25990_IIN_OCF_OFF		157
>   
>   #define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
>   					 PK_MIN_AVG_RST_AVG  | \
>   					 PK_MIN_AVG_RST_MIN)
>   
> +enum chips {
> +	tps25990,
> +};
> +
> +enum tps25990_parameters {
> +	TPS25990_VIN_OVF = 0, /* VIN over volatage fault */
> +	TPS25990_IIN_OCF, /* IIN Over currect fault */
> +	TPS25990_DIRECT_VALUES_COUNT,
> +};
> +
> +struct tps25990_local_direct_value {
> +	int m[TPS25990_DIRECT_VALUES_COUNT]; /* mantissa */
> +	int b[TPS25990_DIRECT_VALUES_COUNT]; /* offset */
> +	int R[TPS25990_DIRECT_VALUES_COUNT]; /* exponent */
> +};
> +
> +struct tps25990_data {
> +	struct pmbus_driver_info info;
> +	struct tps25990_local_direct_value info_local;
> +};
> +
> +static s64 tps25990_reg2data_direct(struct i2c_client *client, int param, s32 raw)
> +{
> +	struct pmbus_driver_info *info = i2c_get_clientdata(client);
> +	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
> +	struct tps25990_local_direct_value *info_local = &data->info_local;
> +	s64 b, val;
> +	s32 m, R;
> +
> +	val = (s16)raw;
> +	m = info_local->m[param];
> +	b = info_local->b[param];
> +	R = info_local->R[param];
> +
> +	return pmbus_reg2data_direct_calc(val, b, m, R);
> +}
> +
> +static u16 tps25990_data2reg_direct(struct i2c_client *client, int param, s64 val)
> +{
> +	struct pmbus_driver_info *info = i2c_get_clientdata(client);
> +	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
> +	struct tps25990_local_direct_value *info_local = &data->info_local;
> +	s32 m, R;
> +	s64 b;
> +
> +	m = info_local->m[param];
> +	b = info_local->b[param];
> +	R = info_local->R[param];
> +
> +	return pmbus_data2reg_direct_calc(val, b, m, R);
> +}
> +
>   /*
>    * Arbitrary default Rimon value: 1kOhm
>    * This correspond to an overcurrent limit of 55A, close to the specified limit
> @@ -184,9 +230,7 @@ static int tps25990_read_word_data(struct i2c_client *client,
>   		ret = pmbus_read_word_data(client, page, phase, reg);
>   		if (ret < 0)
>   			break;
> -		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> -					TPS25990_VIN_OVF_DIV);
> -		ret += TPS25990_VIN_OVF_OFF;
> +		ret = tps25990_reg2data_direct(client, TPS25990_VIN_OVF, ret);

The result is again evaluated by the PMBus core as direct register value,
not as calculated fault limit. I don't think this works as expected.
This isn't about converting a register value to a voltage, it is about
converting one direct format into another. Using (or trying to use)
reg2data_direct is at the very least misleading, if not completely wrong.

The m/b/R parameters below are the coefficients from the datasheet to convert
the register values into voltages. The PMBus core will take that value and
convert it again into a voltage, this time using the m/b/R coefficients
for input voltages. This can not be correct. To be technically correct,
the core would have to convert the register value to a voltage using one
set of m/b/R coefficients and then convert it back to direct format using
the other set of m/b/R coefficients. The current code does that by adjusting
the values directly. I don't think changing is really beneficial. If anything,
documenting it would be more helpful.

Thanks,
Guenter

