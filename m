Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1445EC433E2
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 15:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6BC6208C7
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 15:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAaIYQiU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgIEPOh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEPO2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 11:14:28 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94687C061244
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 08:14:26 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 5so5856454pgl.4
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 08:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q5c2OtxkM8Hg/oHmynneEMwiBa+QBL32Z9ZoycOHj4A=;
        b=SAaIYQiUc8uFanONxTDr7Uo2IzHwW4R6kUwVeouGxEihNGPpQW8vt98cP8NyZy0ktJ
         +39EvrtbkGCkFwSXJNGDApiLSWLuyrlxFtZg/KDZwt+ecZBe/3eeIek1LV3WzWGueNdp
         w8g/Nf9kOoqEaEtFb/qEe/VzA5ZcIjxOVKwGSwPkIf3/wHVItK8FESdR0855mp7rYquQ
         yjUdKIIhXh6aW8KtVIqvhK9FALqgqWykSM9sBqlYDMXdJm9i7ybQFGurTjmgQ6BFQ4SJ
         1RTLYvlIjY/r3GRuwj4I9p4UfsMlJ2l/wrFYJE8w+0W02MjQIeiG4QY7hOPNa4fUoFsP
         WLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Q5c2OtxkM8Hg/oHmynneEMwiBa+QBL32Z9ZoycOHj4A=;
        b=PgpoWmrJCOxiTbFLiqIke26H/5kCgu7x1+YaSN2SocmHLXJs/W5vGK9JHuTPANVlAW
         ffDggPnt2uuPlZG5yDJtKt7c9q69SarWgX+9fd42La2NI3Al5zJoSle6GTxkFZLBDBYQ
         CHtKIpEsK7mGft6EoWccN+RqIXirRBBGnntn+zP2PW5xQuBhkssw9hPEBPUwzDZgbZaA
         5yXTzs8Rk5ZoQGbR+KeWFoOqkkkMmejeUK8NcFGYEoc807irdXJUOXrRRUu1HuuXoQLi
         42EmjKuA37RUuVkA4c+BIc7Jy+IK41+wH6fB+ED1LqJU5U4/waeyPrTmaRA7h34Tv8em
         lEIQ==
X-Gm-Message-State: AOAM532XAWTwaQ6xji/VL35n5eWtjfKJ5cPlzb8ni5+tx14DbFWKMysr
        lljosOPePaIuV6C83s4hEspVK+qmj1U=
X-Google-Smtp-Source: ABdhPJxECZeKI8ttI2giIBZ2afaEt3M2w0+aBY3Kuk7OdrxzHYIjD1UQqq1k/yyIqAVOI95PvZ0Y3w==
X-Received: by 2002:a63:36c6:: with SMTP id d189mr10621065pga.392.1599318861498;
        Sat, 05 Sep 2020 08:14:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s28sm10099976pfd.111.2020.09.05.08.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 08:14:21 -0700 (PDT)
Subject: Re: [PATCH 3/6] hwmon: amd_energy: Improve the accumulation logic
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200905143230.195049-1-nchatrad@amd.com>
 <20200905143230.195049-4-nchatrad@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c84d9f76-beb4-c760-42be-58118c3d13c8@roeck-us.net>
Date:   Sat, 5 Sep 2020 08:14:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905143230.195049-4-nchatrad@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> Factor out the common code in the accumulation functions for core and
> socket accumulation.
> 
> While at it, handle the return value of the amd_create_sensor() function.
> 
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
>  drivers/hwmon/amd_energy.c | 126 +++++++++++++------------------------
>  1 file changed, 45 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index f0a13d6cc419..96c61784d05c 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -74,108 +74,67 @@ static void get_energy_units(struct amd_energy_data *data)
>  	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
>  }
>  
> -static void accumulate_socket_delta(struct amd_energy_data *data,
> -				    int sock, int cpu)
> +static void accumulate_delta(struct amd_energy_data *data,
> +			     int channel, int cpu, u32 reg)
>  {
> -	struct sensor_accumulator *s_accum;
> +	struct sensor_accumulator *accum;
>  	u64 input;
>  
>  	mutex_lock(&data->lock);
> -	rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> +	rdmsrl_safe_on_cpu(cpu, reg, &input);
>  	input &= AMD_ENERGY_MASK;
>  
> -	s_accum = &data->accums[data->nr_cpus + sock];
> -	if (input >= s_accum->prev_value)
> -		s_accum->energy_ctr +=
> -			input - s_accum->prev_value;
> +	accum = &data->accums[channel];
> +	if (input >= accum->prev_value)
> +		accum->energy_ctr +=
> +			input - accum->prev_value;
>  	else
> -		s_accum->energy_ctr += UINT_MAX -
> -			s_accum->prev_value + input;
> +		accum->energy_ctr += UINT_MAX -
> +			accum->prev_value + input;
>  
> -	s_accum->prev_value = input;
> +	accum->prev_value = input;
>  	mutex_unlock(&data->lock);
>  }
>  
> -static void accumulate_core_delta(struct amd_energy_data *data)
> +static void read_accumulate(struct amd_energy_data *data)
>  {
> -	struct sensor_accumulator *c_accum;
> -	u64 input;
> -	int cpu;
> +	int sock, scpu, cpu;
> +
> +	for (sock = 0; sock < data->nr_socks; sock++) {
> +		scpu = cpumask_first_and(cpu_online_mask,
> +					 cpumask_of_node(sock));
> +
> +		accumulate_delta(data, data->nr_cpus + sock,
> +				 scpu, ENERGY_PKG_MSR);
> +	}
>  
> -	mutex_lock(&data->lock);
>  	if (data->core_id >= data->nr_cpus)
>  		data->core_id = 0;
>  
>  	cpu = data->core_id;
> +	if (cpu_online(cpu))
> +		accumulate_delta(data, cpu, cpu, ENERGY_CORE_MSR);
>  
> -	if (!cpu_online(cpu))
> -		goto out;
> -
> -	rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> -	input &= AMD_ENERGY_MASK;
> -
> -	c_accum = &data->accums[cpu];
> -
> -	if (input >= c_accum->prev_value)
> -		c_accum->energy_ctr +=
> -			input - c_accum->prev_value;
> -	else
> -		c_accum->energy_ctr += UINT_MAX -
> -			c_accum->prev_value + input;
> -
> -	c_accum->prev_value = input;
> -
> -out:
>  	data->core_id++;
> -	mutex_unlock(&data->lock);
> -}
> -
> -static void read_accumulate(struct amd_energy_data *data)
> -{
> -	int sock;
> -
> -	for (sock = 0; sock < data->nr_socks; sock++) {
> -		int cpu;
> -
> -		cpu = cpumask_first_and(cpu_online_mask,
> -					cpumask_of_node(sock));
> -
> -		accumulate_socket_delta(data, sock, cpu);
> -	}
> -
> -	accumulate_core_delta(data);
>  }
>  
>  static void amd_add_delta(struct amd_energy_data *data, int ch,
> -			  int cpu, long *val, bool is_core)
> +			  int cpu, long *val, u32 reg)
>  {
> -	struct sensor_accumulator *s_accum, *c_accum;
> +	struct sensor_accumulator *accum;
>  	u64 input;
>  
>  	mutex_lock(&data->lock);
> -	if (!is_core) {
> -		rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> -		input &= AMD_ENERGY_MASK;
> -
> -		s_accum = &data->accums[ch];
> -		if (input >= s_accum->prev_value)
> -			input += s_accum->energy_ctr -
> -				  s_accum->prev_value;
> -		else
> -			input += UINT_MAX - s_accum->prev_value +
> -				  s_accum->energy_ctr;
> -	} else {
> -		rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> -		input &= AMD_ENERGY_MASK;
> +	rdmsrl_safe_on_cpu(cpu, reg, &input);
> +	input &= AMD_ENERGY_MASK;
>  
> -		c_accum = &data->accums[ch];
> -		if (input >= c_accum->prev_value)
> -			input += c_accum->energy_ctr -
> -				 c_accum->prev_value;
> -		else
> -			input += UINT_MAX - c_accum->prev_value +
> -				 c_accum->energy_ctr;
> -	}
> +	accum = &data->accums[ch];
> +	if (input >= accum->prev_value)
> +		input += accum->energy_ctr -
> +				accum->prev_value;
> +	else
> +		input += UINT_MAX - accum->prev_value +
> +				accum->energy_ctr;
>  
>  	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
>  	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
> @@ -188,20 +147,22 @@ static int amd_energy_read(struct device *dev,
>  			   u32 attr, int channel, long *val)
>  {
>  	struct amd_energy_data *data = dev_get_drvdata(dev);
> +	u32 reg;
>  	int cpu;
>  
>  	if (channel >= data->nr_cpus) {
>  		cpu = cpumask_first_and(cpu_online_mask,
>  					cpumask_of_node
>  					(channel - data->nr_cpus));
> -		amd_add_delta(data, channel, cpu, val, false);
> +		reg = ENERGY_PKG_MSR;
>  	} else {
>  		cpu = channel;
>  		if (!cpu_online(cpu))
>  			return -ENODEV;
>  
> -		amd_add_delta(data, channel, cpu, val, true);
> +		reg = ENERGY_CORE_MSR;
>  	}
> +	amd_add_delta(data, channel, cpu, val, reg);
>  
>  	return 0;
>  }
> @@ -249,7 +210,7 @@ static const struct hwmon_ops amd_energy_ops = {
>  
>  static int amd_create_sensor(struct device *dev,
>  			     struct amd_energy_data *data,
> -			     u8 type, u32 config)
> +			     enum hwmon_sensor_types type, u32 config)
>  {
>  	struct hwmon_channel_info *info = &data->energy_info;
>  	struct sensor_accumulator *accums;
> @@ -308,6 +269,7 @@ static int amd_energy_probe(struct platform_device *pdev)
>  	struct device *hwmon_dev;
>  	struct amd_energy_data *data;
>  	struct device *dev = &pdev->dev;
> +	int ret;
>  
>  	data = devm_kzalloc(dev,
>  			    sizeof(struct amd_energy_data), GFP_KERNEL);
> @@ -320,8 +282,10 @@ static int amd_energy_probe(struct platform_device *pdev)
>  	dev_set_drvdata(dev, data);
>  	/* Populate per-core energy reporting */
>  	data->info[0] = &data->energy_info;
> -	amd_create_sensor(dev, data, hwmon_energy,
> -			  HWMON_E_INPUT | HWMON_E_LABEL);
> +	ret = amd_create_sensor(dev, data, hwmon_energy,
> +				HWMON_E_INPUT | HWMON_E_LABEL);
> +	if (ret)
> +		return ret;
>  
>  	mutex_init(&data->lock);
>  	get_energy_units(data);
> @@ -346,7 +310,7 @@ static int amd_energy_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->wrap_accumulate))
>  		return PTR_ERR(data->wrap_accumulate);
>  
> -	return PTR_ERR_OR_ZERO(data->wrap_accumulate);
> +	return 0;

Actually, what you want to remove is the above if() statement, since
PTR_ERR_OR_ZERO() is supposed to replace it.

>  }
>  
>  static int amd_energy_remove(struct platform_device *pdev)
> 

