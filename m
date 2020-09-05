Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD96FC433E2
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 15:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74BF620C09
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 15:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjDX5y51"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgIEPSD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 11:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEPR5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 11:17:57 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968A3C061244
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 08:17:56 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id v15so5851363pgh.6
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hko6h85IGbY5f87JhDRZvzqwM0ViizdmHTDY2ZL9oxQ=;
        b=gjDX5y51BSme+n/QAhbU6AdiJZsLUCa7qDwWg56Ofe/5YAUALbw3z1R8F7vuz/L8Gn
         H1qFsRLJm+CUTG+Sg9fLhZcUOpKz8USTpyL8Y5DHDovwj7CZc78PqSx4jESbieJLI+qH
         C/mzB+bpUWYOjMz9m9inJ8YSQTRHGQNnLO7e7lhAJOaZbCrMwS3ImyU5kGns0VMDrFtG
         kDWKIwngz5LMFcwWDF/qvddSz2J7xWiif6ZEWk0BiHEx9DF2buaaEZX13+cJ0IZCeNCT
         GE16qe+n+eDOh4OuzK1dAXhiL5I8YfCjuHBwHiTxcR2oQkD9XfX9rOjrppHUghCL+2Rg
         EYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Hko6h85IGbY5f87JhDRZvzqwM0ViizdmHTDY2ZL9oxQ=;
        b=VtVm3jV0zpFORStQfkCkat+7wsuV2XgSzolmQvH8apT1yeexpCWC7AioUBOeBljD3k
         BDVNCT+GmEHLH6TcsA+C/At0tLZe+8tACFLVppspQlu7EWSAISOeRNPFi3Xkf/+vM2/E
         GEWQlrLxcxBLhpzK151TSUcdODoeInCukBsPHsX9Zu/bpMHhE3dmXgf+ENgXKkPgs5EA
         TmiLH9sF9sM9IFn6tbHuYtuxQbZgn1cIIGaxxPxTLAIvfa2o7DaZdR7TTzQ6sRU24etV
         FrZlN7Qvp/7HXCtAlCm+AjfLN2WfEU0QnpQnmEru0/3/rN7k4EQw26aE/uMu9fo606YU
         1TdA==
X-Gm-Message-State: AOAM531SjG3E3FzadlrADz3mpzidPsGU1fMXXJcBjITvhNgO5AD8eyFP
        caqFyC4/prSLaxyzgqRE9G+c2pZDQmU=
X-Google-Smtp-Source: ABdhPJyDUbOjpnVKVnbSgOfFEIjOdKdNin0OrylIifLopKujJS2kHpwO42OriuCI/TbUsnAV4bXvfA==
X-Received: by 2002:a63:355:: with SMTP id 82mr10791351pgd.384.1599319071332;
        Sat, 05 Sep 2020 08:17:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b12sm8618724pgr.34.2020.09.05.08.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 08:17:50 -0700 (PDT)
Subject: Re: [PATCH 4/6] hwmon: amd_energy: let user enable/disable the sw
 accumulation
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200905143230.195049-1-nchatrad@amd.com>
 <20200905143230.195049-5-nchatrad@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <850781c9-8332-1618-f4f1-1722a8491f2f@roeck-us.net>
Date:   Sat, 5 Sep 2020 08:17:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905143230.195049-5-nchatrad@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> Provide an option "accumulator_status" via sysfs to enable/disable
> the software accumulation of energy counters.
> 
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

I am quite substantially opposed to this. I'd be willing to
accept a module parameter. However, the code is there, and it is
enabled by default, and it should stay enabled by default.
I don't want to have to deal with people complaining that
it suddenly no longer works.

Also, there needs to be an explanation for why this is needed.

Guenter

> ---
>  drivers/hwmon/amd_energy.c | 104 ++++++++++++++++++++++++++++++-------
>  1 file changed, 86 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index 96c61784d05c..c294bea56c02 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -32,6 +32,8 @@
>  #define AMD_ENERGY_UNIT_MASK	0x01F00
>  #define AMD_ENERGY_MASK		0xFFFFFFFF
>  
> +static struct device_attribute accumulate_attr;
> +
>  struct sensor_accumulator {
>  	u64 energy_ctr;
>  	u64 prev_value;
> @@ -42,10 +44,12 @@ struct amd_energy_data {
>  	const struct hwmon_channel_info *info[2];
>  	struct hwmon_chip_info chip;
>  	struct task_struct *wrap_accumulate;
> +	struct device *hwmon_dev;
>  	/* Lock around the accumulator */
>  	struct mutex lock;
>  	/* An accumulator for each core and socket */
>  	struct sensor_accumulator *accums;
> +	bool accumulator_status;
>  	/* Energy Status Units */
>  	u64 energy_units;
>  	unsigned int timeout;
> @@ -128,13 +132,15 @@ static void amd_add_delta(struct amd_energy_data *data, int ch,
>  	rdmsrl_safe_on_cpu(cpu, reg, &input);
>  	input &= AMD_ENERGY_MASK;
>  
> -	accum = &data->accums[ch];
> -	if (input >= accum->prev_value)
> -		input += accum->energy_ctr -
> -				accum->prev_value;
> -	else
> -		input += UINT_MAX - accum->prev_value +
> -				accum->energy_ctr;
> +	if (data->accumulator_status) {
> +		accum = &data->accums[ch];
> +		if (input >= accum->prev_value)
> +			input += accum->energy_ctr -
> +					accum->prev_value;
> +		else
> +			input += UINT_MAX - accum->prev_value +
> +					accum->energy_ctr;
> +	}
>  
>  	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
>  	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
> @@ -264,9 +270,67 @@ static int amd_create_sensor(struct device *dev,
>  	return 0;
>  }
>  
> +static ssize_t amd_energy_accumulate_show(struct device *dev,
> +					  struct device_attribute *dev_attr,
> +					  char *buf)
> +{
> +	struct amd_energy_data *data = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%d\n", data->accumulator_status);
> +}
> +
> +static ssize_t amd_energy_accumulate_store(struct device *dev,
> +					   struct device_attribute *dev_attr,
> +					   const char *buf, size_t count)
> +{
> +	struct amd_energy_data *data = dev_get_drvdata(dev);
> +	bool input;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &input);
> +	if (ret)
> +		return ret;
> +
> +	if (data->accumulator_status == input)
> +		return count;
> +
> +	if (input) {
> +		memset(data->accums, 0, (data->nr_cpus + data->nr_socks) *
> +			sizeof(struct sensor_accumulator));
> +
> +		if (!data->wrap_accumulate) {
> +			data->wrap_accumulate =
> +				kthread_run(energy_accumulator,
> +					    data, "%s", dev_name(dev));
> +			if (IS_ERR(data->wrap_accumulate))
> +				return PTR_ERR(data->wrap_accumulate);
> +		}
> +	} else {
> +		if (data && data->wrap_accumulate) {
> +			ret = kthread_stop(data->wrap_accumulate);
> +			if (ret)
> +				return ret;
> +			data->wrap_accumulate = NULL;
> +		}
> +	}
> +	data->accumulator_status = input;
> +
> +	return count;
> +}
> +
> +static int create_accumulate_status_file(struct amd_energy_data *data)
> +{
> +	accumulate_attr.attr.name = "accumulator_status";
> +	accumulate_attr.attr.mode = 0664;
> +	accumulate_attr.show = amd_energy_accumulate_show;
> +	accumulate_attr.store = amd_energy_accumulate_store;
> +
> +	return sysfs_create_file(&data->hwmon_dev->kobj,
> +				 &accumulate_attr.attr);
> +}
> +
>  static int amd_energy_probe(struct platform_device *pdev)
>  {
> -	struct device *hwmon_dev;
>  	struct amd_energy_data *data;
>  	struct device *dev = &pdev->dev;
>  	int ret;
> @@ -290,12 +354,12 @@ static int amd_energy_probe(struct platform_device *pdev)
>  	mutex_init(&data->lock);
>  	get_energy_units(data);
>  
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
> -							 data,
> -							 &data->chip,
> -							 NULL);
> -	if (IS_ERR(hwmon_dev))
> -		return PTR_ERR(hwmon_dev);
> +	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
> +							       data,
> +							       &data->chip,
> +							       NULL);
> +	if (IS_ERR(data->hwmon_dev))
> +		return PTR_ERR(data->hwmon_dev);
>  
>  	/* Once in 3 minutes for a resolution of 1/2*16 */
>  	if (data->energy_units == 0x10)
> @@ -305,10 +369,12 @@ static int amd_energy_probe(struct platform_device *pdev)
>  	if (data->energy_units == 0x6)
>  		data->timeout = 3 * 24 * 60 * 60;
>  
> -	data->wrap_accumulate = kthread_run(energy_accumulator, data,
> -					    "%s", dev_name(hwmon_dev));
> -	if (IS_ERR(data->wrap_accumulate))
> -		return PTR_ERR(data->wrap_accumulate);
> +	/* Disabling the energy accumulation by default */
> +	data->accumulator_status = 0;
> +
> +	ret = create_accumulate_status_file(data);
> +	if (ret)
> +		return ret;
>  
>  	return 0;
>  }
> @@ -317,6 +383,8 @@ static int amd_energy_remove(struct platform_device *pdev)
>  {
>  	struct amd_energy_data *data = dev_get_drvdata(&pdev->dev);
>  
> +	sysfs_remove_file(&data->hwmon_dev->kobj, &accumulate_attr.attr);
> +
>  	if (data && data->wrap_accumulate)
>  		kthread_stop(data->wrap_accumulate);
>  
> 

