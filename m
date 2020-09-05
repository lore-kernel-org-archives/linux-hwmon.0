Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B05C433E2
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 15:33:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF8832078E
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 15:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5jCGten"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgIEPdi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 11:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEPde (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 11:33:34 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C497C061244
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 08:33:34 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s10so2513737plp.1
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:references:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a+wtWsBfv35OvBwujL24qFVU/m+Jv2SRdGhT6x2+nWA=;
        b=c5jCGtengEl8fOZCwEfTgrTBtWLvn6Et27wBNGTsfIKrMCOy4IzcWWk6s5u+HYL1xt
         1z5JeyA9GWaLUnVNCqRqpfDp18EYobve6itVn6T0YVtIL2onazMY9nIjvg4EsU15clel
         yOhD3q578QwDYTzzNc1X27d+RVUXo+gHRTdtdCb42IxB34kcFhZbhK7o6wyl7czPO4Lz
         Q8OrwFCtVdLjk/PRllEM3cVgvpsA5+c8CCPd1/lDRcqtU4sXAWPP2oj16vhNLt+qnMoQ
         VY8KH3GxmlLgwei2jaVvAm74VlsxnkBThKoKWacsmdazEb7Ozp/97HTuOBrVBfbAH/lL
         sPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=a+wtWsBfv35OvBwujL24qFVU/m+Jv2SRdGhT6x2+nWA=;
        b=F8MYJGpXvquXMiZZ4Wa6NADIOzfZW1OeaNmM+MbWihayYjvhmiOsT0HdG/Bgm4avL9
         aFwZTc4ZnzpkyDlPTcgsgKxKxLgfOgj5xHiahSsgS3yfJOq4GmfNlFRypXB1g8114zoQ
         5flumWruLXunsBhJhUzuHDPepV99cnCS5LlSElK7wCfJGTVPDt2JRzF0HdvopFJvdiGm
         MKflzJ21zVhDFxsKsU9LrE3jkuHXQmRY/lVDyGu4OJQ/72/kj2mjRVWdErMGRY15dfQs
         psTY4CQddUs6flwPca6W0BFVMHqsRPcZyaYNOW95ukjElKvTsObf3VptRPsNqLxJlLhW
         VhIg==
X-Gm-Message-State: AOAM531WkUrMVqtzYO/UowyZdYB4n34KgYb966dRMY6MLqg9cWm7t9Ju
        3NmivfKBttwWrsNfi8CQBkWCH+DKlKE=
X-Google-Smtp-Source: ABdhPJxImEDCi7YBvbIViLPt4Gw+zK7hf9PCpuJIGZIjIAx2zYU8R+Pj8yREX+3vvTl2mtLIwHKn0g==
X-Received: by 2002:a17:902:988f:b029:d0:4c09:c1 with SMTP id s15-20020a170902988fb02900d04c0900c1mr12903878plp.3.1599320013417;
        Sat, 05 Sep 2020 08:33:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a7sm10286325pfd.194.2020.09.05.08.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 08:33:33 -0700 (PDT)
Subject: Re: [PATCH 4/6] hwmon: amd_energy: let user enable/disable the sw
 accumulation
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200905143230.195049-1-nchatrad@amd.com>
 <20200905143230.195049-5-nchatrad@amd.com>
 <850781c9-8332-1618-f4f1-1722a8491f2f@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <53f9b993-20e2-92b0-4957-c444b23cb37f@roeck-us.net>
Date:   Sat, 5 Sep 2020 08:33:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <850781c9-8332-1618-f4f1-1722a8491f2f@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/5/20 8:17 AM, Guenter Roeck wrote:
> On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
>> Provide an option "accumulator_status" via sysfs to enable/disable
>> the software accumulation of energy counters.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> 
> I am quite substantially opposed to this. I'd be willing to
> accept a module parameter. However, the code is there, and it is
> enabled by default, and it should stay enabled by default.
> I don't want to have to deal with people complaining that
> it suddenly no longer works.
> 
> Also, there needs to be an explanation for why this is needed.
> 

No, wait, without accumulator this driver has zero value.
Users should just not load the driver if they don't want the
overhead associated with accumulation.

Guenter

> Guenter
> 
>> ---
>>  drivers/hwmon/amd_energy.c | 104 ++++++++++++++++++++++++++++++-------
>>  1 file changed, 86 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
>> index 96c61784d05c..c294bea56c02 100644
>> --- a/drivers/hwmon/amd_energy.c
>> +++ b/drivers/hwmon/amd_energy.c
>> @@ -32,6 +32,8 @@
>>  #define AMD_ENERGY_UNIT_MASK	0x01F00
>>  #define AMD_ENERGY_MASK		0xFFFFFFFF
>>  
>> +static struct device_attribute accumulate_attr;
>> +
>>  struct sensor_accumulator {
>>  	u64 energy_ctr;
>>  	u64 prev_value;
>> @@ -42,10 +44,12 @@ struct amd_energy_data {
>>  	const struct hwmon_channel_info *info[2];
>>  	struct hwmon_chip_info chip;
>>  	struct task_struct *wrap_accumulate;
>> +	struct device *hwmon_dev;
>>  	/* Lock around the accumulator */
>>  	struct mutex lock;
>>  	/* An accumulator for each core and socket */
>>  	struct sensor_accumulator *accums;
>> +	bool accumulator_status;
>>  	/* Energy Status Units */
>>  	u64 energy_units;
>>  	unsigned int timeout;
>> @@ -128,13 +132,15 @@ static void amd_add_delta(struct amd_energy_data *data, int ch,
>>  	rdmsrl_safe_on_cpu(cpu, reg, &input);
>>  	input &= AMD_ENERGY_MASK;
>>  
>> -	accum = &data->accums[ch];
>> -	if (input >= accum->prev_value)
>> -		input += accum->energy_ctr -
>> -				accum->prev_value;
>> -	else
>> -		input += UINT_MAX - accum->prev_value +
>> -				accum->energy_ctr;
>> +	if (data->accumulator_status) {
>> +		accum = &data->accums[ch];
>> +		if (input >= accum->prev_value)
>> +			input += accum->energy_ctr -
>> +					accum->prev_value;
>> +		else
>> +			input += UINT_MAX - accum->prev_value +
>> +					accum->energy_ctr;
>> +	}
>>  
>>  	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
>>  	*val = div64_ul(input * 1000000UL, BIT(data->energy_units));
>> @@ -264,9 +270,67 @@ static int amd_create_sensor(struct device *dev,
>>  	return 0;
>>  }
>>  
>> +static ssize_t amd_energy_accumulate_show(struct device *dev,
>> +					  struct device_attribute *dev_attr,
>> +					  char *buf)
>> +{
>> +	struct amd_energy_data *data = dev_get_drvdata(dev);
>> +
>> +	return sprintf(buf, "%d\n", data->accumulator_status);
>> +}
>> +
>> +static ssize_t amd_energy_accumulate_store(struct device *dev,
>> +					   struct device_attribute *dev_attr,
>> +					   const char *buf, size_t count)
>> +{
>> +	struct amd_energy_data *data = dev_get_drvdata(dev);
>> +	bool input;
>> +	int ret;
>> +
>> +	ret = kstrtobool(buf, &input);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (data->accumulator_status == input)
>> +		return count;
>> +
>> +	if (input) {
>> +		memset(data->accums, 0, (data->nr_cpus + data->nr_socks) *
>> +			sizeof(struct sensor_accumulator));
>> +
>> +		if (!data->wrap_accumulate) {
>> +			data->wrap_accumulate =
>> +				kthread_run(energy_accumulator,
>> +					    data, "%s", dev_name(dev));
>> +			if (IS_ERR(data->wrap_accumulate))
>> +				return PTR_ERR(data->wrap_accumulate);
>> +		}
>> +	} else {
>> +		if (data && data->wrap_accumulate) {
>> +			ret = kthread_stop(data->wrap_accumulate);
>> +			if (ret)
>> +				return ret;
>> +			data->wrap_accumulate = NULL;
>> +		}
>> +	}
>> +	data->accumulator_status = input;
>> +
>> +	return count;
>> +}
>> +
>> +static int create_accumulate_status_file(struct amd_energy_data *data)
>> +{
>> +	accumulate_attr.attr.name = "accumulator_status";
>> +	accumulate_attr.attr.mode = 0664;
>> +	accumulate_attr.show = amd_energy_accumulate_show;
>> +	accumulate_attr.store = amd_energy_accumulate_store;
>> +
>> +	return sysfs_create_file(&data->hwmon_dev->kobj,
>> +				 &accumulate_attr.attr);
>> +}
>> +
>>  static int amd_energy_probe(struct platform_device *pdev)
>>  {
>> -	struct device *hwmon_dev;
>>  	struct amd_energy_data *data;
>>  	struct device *dev = &pdev->dev;
>>  	int ret;
>> @@ -290,12 +354,12 @@ static int amd_energy_probe(struct platform_device *pdev)
>>  	mutex_init(&data->lock);
>>  	get_energy_units(data);
>>  
>> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
>> -							 data,
>> -							 &data->chip,
>> -							 NULL);
>> -	if (IS_ERR(hwmon_dev))
>> -		return PTR_ERR(hwmon_dev);
>> +	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
>> +							       data,
>> +							       &data->chip,
>> +							       NULL);
>> +	if (IS_ERR(data->hwmon_dev))
>> +		return PTR_ERR(data->hwmon_dev);
>>  
>>  	/* Once in 3 minutes for a resolution of 1/2*16 */
>>  	if (data->energy_units == 0x10)
>> @@ -305,10 +369,12 @@ static int amd_energy_probe(struct platform_device *pdev)
>>  	if (data->energy_units == 0x6)
>>  		data->timeout = 3 * 24 * 60 * 60;
>>  
>> -	data->wrap_accumulate = kthread_run(energy_accumulator, data,
>> -					    "%s", dev_name(hwmon_dev));
>> -	if (IS_ERR(data->wrap_accumulate))
>> -		return PTR_ERR(data->wrap_accumulate);
>> +	/* Disabling the energy accumulation by default */
>> +	data->accumulator_status = 0;
>> +
>> +	ret = create_accumulate_status_file(data);
>> +	if (ret)
>> +		return ret;
>>  
>>  	return 0;
>>  }
>> @@ -317,6 +383,8 @@ static int amd_energy_remove(struct platform_device *pdev)
>>  {
>>  	struct amd_energy_data *data = dev_get_drvdata(&pdev->dev);
>>  
>> +	sysfs_remove_file(&data->hwmon_dev->kobj, &accumulate_attr.attr);
>> +
>>  	if (data && data->wrap_accumulate)
>>  		kthread_stop(data->wrap_accumulate);
>>  
>>
> 

