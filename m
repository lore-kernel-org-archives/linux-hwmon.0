Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D31FC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Feb 2022 08:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238788AbiBGIxv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 03:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351830AbiBGIrp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 03:47:45 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53950C043184
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Feb 2022 00:47:44 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id l43-20020a9d1cab000000b005aa50ff5869so4547765ota.0
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Feb 2022 00:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=ZeCS01IEdnXW1Wj3cmp4yRNIqQFr4WbRVzIRWzhVjio=;
        b=iVUGBFRUCA6XGkEPapEplaYLK+Z3gTDb7+XngA29DTHiPuynAVQ+tx+9kiOpLlIqAY
         zuZxQ7Me9LzcKwYQxhjMqB8OUL4ViF1B5nsyazkxHAQSqg/O+P7OkfrB74QgetSGSlOJ
         i7JIzAO2dYQ/CRyUwyMIUt4i4bnJZG3v9nu3K2FAHW8x/iJ+L1xAYWLLOQAMCKiJzzWz
         jJH12Nqq2zj0jIqIanxlrzDaS03/KXzBRxNr5D0+vyOxhGw5dQsY0W5Evpb/a/dRKVaL
         wqcC0kUS4c1EigjncX3klATOvX/PU6jVGlFyYk7Ij7vXV89/iF6afJPd3xqRuF8Xwb9J
         mFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=ZeCS01IEdnXW1Wj3cmp4yRNIqQFr4WbRVzIRWzhVjio=;
        b=Dw53sinSYniP9zNEzwAUkpBLr1Qu8qwjtfyd3WVLK4hqS1Nsll/zGdo7CZLAnRmhol
         yyXvmCQdD0jm7cNUhUqxNNWatus29xhK1bk3EzH2u+yBqxtBum5j2IXsaesNQ4adTKcW
         k8/fw99gMUUNHoN62PcijYAbSco4orSNdRHrPBHAR7o+d0w7GRbn1iUQ/b077SaZFMWs
         5UMnTlmPPFHT6uRYoGg0K88fUHBi6KZdfmUUsRV1PP97kfKffPnaacH6lFd/z3QUT4ff
         S0oF6KY86ABJ9Or1u/EZu4C+UDQSMjgggAVeX933xpCsHpfw7byEFDD6honSoedipiOO
         MAiA==
X-Gm-Message-State: AOAM5338Gsl1oj+d9Xxkqy2zbCzpm0ELXYICWo1B5Zlu2Z0Qomp6J3GI
        BL2s6gF0LM2GMEi33jWOyjkmRnaGs1hRyg==
X-Google-Smtp-Source: ABdhPJw6twyM37JOVN8gDv99VSPr9V8peXDayZnkqWDIYsRBHk6MVi5oPleBjX1VmdN3s5H5Ou7NGQ==
X-Received: by 2002:a9d:1ca5:: with SMTP id l37mr3782368ota.233.1644223663667;
        Mon, 07 Feb 2022 00:47:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n24sm4076397oao.40.2022.02.07.00.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 00:47:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eac99325-ad4a-a636-9d96-0fa56cda35d3@roeck-us.net>
Date:   Mon, 7 Feb 2022 00:47:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Christian Lamparter <chunkeey@gmail.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220206190517.303483-1-chunkeey@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon: (tc654) Add thermal_cooling device support
In-Reply-To: <20220206190517.303483-1-chunkeey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/6/22 11:05, Christian Lamparter wrote:
> Adds thermal_cooling device support to the tc654/tc655
> driver. This make it possible to integrate it into a
> device-tree supported thermal-zone node as a
> cooling device.
> 
> I have been using this patch as part of the Netgear WNDR4700
> Centria NAS Router support within OpenWrt since 2016.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> v1 -> v2: - Drop imply THERMAL
> 	  - aligned ( so . everything is lining up
> ---
>   drivers/hwmon/tc654.c | 94 +++++++++++++++++++++++++++++++++++--------
>   1 file changed, 77 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
> index cf2a3acd5c91..c8f511a60769 100644
> --- a/drivers/hwmon/tc654.c
> +++ b/drivers/hwmon/tc654.c
> @@ -15,6 +15,7 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/slab.h>
> +#include <linux/thermal.h>
>   #include <linux/util_macros.h>
>   
>   enum tc654_regs {
> @@ -367,36 +368,30 @@ static ssize_t pwm_mode_store(struct device *dev, struct device_attribute *da,
>   static const int tc654_pwm_map[16] = { 77,  88, 102, 112, 124, 136, 148, 160,
>   				      172, 184, 196, 207, 219, 231, 243, 255};
>   
> +static int get_pwm(struct tc654_data *data)
> +{
> +	if (data->config & TC654_REG_CONFIG_SDM)
> +		return 0;
> +	else

Nit: else after return is unnecessary. Sorry for not noticing before.

> +		return tc654_pwm_map[data->duty_cycle];
> +}
> +
>   static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
>   			char *buf)
>   {
>   	struct tc654_data *data = tc654_update_client(dev);
> -	int pwm;
>   
>   	if (IS_ERR(data))
>   		return PTR_ERR(data);
>   
> -	if (data->config & TC654_REG_CONFIG_SDM)
> -		pwm = 0;
> -	else
> -		pwm = tc654_pwm_map[data->duty_cycle];
> -
> -	return sprintf(buf, "%d\n", pwm);
> +	return sprintf(buf, "%d\n", get_pwm(data));
>   }
>   
> -static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
> -			 const char *buf, size_t count)
> +static int _set_pwm(struct tc654_data *data, unsigned long val)
>   {
> -	struct tc654_data *data = dev_get_drvdata(dev);
>   	struct i2c_client *client = data->client;
> -	unsigned long val;
>   	int ret;
>   
> -	if (kstrtoul(buf, 10, &val))
> -		return -EINVAL;
> -	if (val > 255)
> -		return -EINVAL;
> -
>   	mutex_lock(&data->update_lock);
>   
>   	if (val == 0)
> @@ -416,6 +411,22 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
>   
>   out:
>   	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
> +			 const char *buf, size_t count)
> +{
> +	struct tc654_data *data = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	if (kstrtoul(buf, 10, &val))
> +		return -EINVAL;
> +	if (val > 255)
> +		return -EINVAL;
> +
> +	ret = _set_pwm(data, val);
>   	return ret < 0 ? ret : count;
>   }
>   
> @@ -447,6 +458,44 @@ static struct attribute *tc654_attrs[] = {
>   
>   ATTRIBUTE_GROUPS(tc654);
>   
> +/* cooling device */
> +
> +static int tc654_get_max_state(struct thermal_cooling_device *cdev,
> +			       unsigned long *state)
> +{
> +	*state = 255;
> +	return 0;
> +}
> +
> +static int tc654_get_cur_state(struct thermal_cooling_device *cdev,
> +			       unsigned long *state)
> +{
> +	struct tc654_data *data = tc654_update_client(cdev->devdata);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	*state = get_pwm(data);
> +	return 0;
> +}
> +
> +static int tc654_set_cur_state(struct thermal_cooling_device *cdev,
> +			       unsigned long state)
> +{
> +	struct tc654_data *data = tc654_update_client(cdev->devdata);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return _set_pwm(data, clamp_val(state, 0, 255));
> +}

Looking into this further, wouldn't it be more appropriate to limit the
cooling states to [0 .. 15], or in other words use data->duty_cycle
directly ? I don't know how the thermal subsystem reacts if it requests
to set the state to a certain value and the actual state is set to
something completely different. Also, it doesn't seem to make much sense
to bother the thermal subsystem with 256 states if the chip really only
supports 16 states.

Thanks,
Guenter
