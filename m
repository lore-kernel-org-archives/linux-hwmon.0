Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05B4C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Apr 2022 16:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350343AbiD1Qwk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbiD1Qwj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Apr 2022 12:52:39 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A852B42EC
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 09:49:24 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id v65so5916398oig.10
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 09:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=5c/Bofn+qNOnNRiBAi9nR2I4Y0EneNO4VEDSAsCJiRg=;
        b=XXqgBfUL7ymk8vlWUU9pTpi96XLvDMt9gvGA9xnkucU2p3Qb5pJ8VvFb5IV9BuozTz
         UYbMHlRdu+j/mYbsev7jheOKR7NgH0+jmv+t6ic/Bgy1odlA/Y5ZvWqNwtU0eFwl4Bfj
         RS1m/DNnoOdXLEq6DprNB4yUCzk+NcQ36NFxXkLD66eEu4oasiF5QXEr89wHlUNJTix8
         A4jDdlQricOkDiC9Yxao1tJ1jv8eNktS8kShjLorI3eAtLQlMXbUv5SSpxkPP9BUGCEj
         BMMpCO9nkIWZFLDE/BekKoF5lBqadqLReFlWg/0MQx5X7T+hRT0a/XmAYSx5VTi2k2OZ
         nkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=5c/Bofn+qNOnNRiBAi9nR2I4Y0EneNO4VEDSAsCJiRg=;
        b=6UUKgtirC+P5YRCd3TjJ2ZxzCTs/vmzE5gvU7fk6WztGvWHa0Il3/o30+d9WsUhWWO
         G45QfElHXRD4P57hzzjK9AB2HQ941VLx0TnWc+20tDTe3f3ZaI9MPZBlzR3KQFYhWGk8
         fuDx4z2keRVPpc1tarpjCIlGUdrmqP1hgqewaqMSIXQc1S5j5fSnDGjZ5x4APDDoYNWG
         4Seqc1oGLmSxI9fPdC+CrRgk5y/09JQj3TqI5f9Uv+iyDZOB+JH8G97Zt6UIm/6HSip2
         lsBR7K799DQUSZq5VB2FHtXGxcLY6dWK6jc5Rhx26V3gvmkyGqVzkXf3kkyuoNi8oXcg
         k88g==
X-Gm-Message-State: AOAM532fAQPIW3REoXRF20f/L67Q9qJdM457EC+gw54/w8My+M5M+P6j
        P5A1GwFCi6FvneHv2eYfmRCbQlr+Jto=
X-Google-Smtp-Source: ABdhPJyn47gXb2GxIh5iorLjK9uf974nEJ6KB0hnz7+LIMDjL09omR2x89RMR5A09R43aohQTHbwUA==
X-Received: by 2002:a05:6808:1a18:b0:325:b690:125f with SMTP id bk24-20020a0568081a1800b00325b690125fmr64336oib.91.1651164563516;
        Thu, 28 Apr 2022 09:49:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 30-20020a9d0ba1000000b005e95b29b95dsm171762oth.5.2022.04.28.09.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 09:49:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6cc1561c-c4dc-076d-d9bf-1cc1cc60eac4@roeck-us.net>
Date:   Thu, 28 Apr 2022 09:49:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, kernel@axis.com
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
 <20220428144039.2464667-5-marten.lindahl@axis.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
In-Reply-To: <20220428144039.2464667-5-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/28/22 07:40, Mårten Lindahl wrote:
> The pmbus core does not have operations for getting or setting voltage.
> Add functions get/set voltage for the dynamic regulator framework.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 63 ++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index bd143ca0c320..fe7dbb496e3b 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1531,6 +1531,11 @@ static const struct pmbus_sensor_attr voltage_attributes[] = {
>   		.gbit = PB_STATUS_VOUT_OV,
>   		.limit = vout_limit_attrs,
>   		.nlimit = ARRAY_SIZE(vout_limit_attrs),
> +	}, {
> +		.reg = PMBUS_VOUT_COMMAND,
> +		.class = PSC_VOLTAGE_OUT,
> +		.paged = true,
> +		.func = PMBUS_HAVE_VOUT,
>   	}

Ok, you lost me here. This adds an inX_input attribute. Why ? This is completely
unrelated to the intended scope of this patch. It also doesn't report a measured
voltage, but a configuration value. If anything, it would have to be a separate
patch, and you'd have to argue hard why it makes sense to report it as measured
voltage.

>   };
>   
> @@ -2563,11 +2568,69 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>   	return 0;
>   }
>   
> +static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor *sensor;
> +	u8 page = rdev_get_id(rdev);
> +	int ret;
> +
> +	sensor = pmbus_find_sensor(data, page, PMBUS_READ_VOUT);
> +	if (IS_ERR(sensor))
> +		return -ENODATA;
> +
> +	mutex_lock(&data->update_lock);
> +	pmbus_update_sensor_data(client, sensor);
> +	if (sensor->data < 0)
> +		ret = sensor->data;
> +	else
> +		ret = (int)pmbus_reg2data(data, sensor) * 1000; /* unit is uV */
> +	mutex_unlock(&data->update_lock);
> +

Same question. Why ?

> +	return ret;
> +}
> +
> +static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
> +					 int max_uV, unsigned int *selector)
> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor *sensor;
> +	u8 page = rdev_get_id(rdev);
> +	s64 tmp = DIV_ROUND_CLOSEST_ULL(min_uV, 1000); /* convert to mV */
> +	u16 val;
> +	int ret;
> +	*selector = 0;
> +
> +	sensor = pmbus_find_sensor(data, page, PMBUS_VOUT_COMMAND);
> +	if (IS_ERR(sensor))
> +		return -ENODATA;
> +
> +	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
> +	if (ret < 0)
> +		return ret;
> +
That actually makes me wonder: What about VOUT_MARGIN_HIGH ?
Also, there are optional MFR_VOUT_MIN and MFR_VOUT_MAX registers.
Would it possibly make sense to determine the valid range once
during probe and then compare against it ?

Thanks,
Guenter

> +	val = pmbus_data2reg(data, sensor, tmp);
> +
> +	/* Do not fall shorter than low margin */
> +	if (ret > val)
> +		val = ret;
> +
> +	ret = _pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND, val);
> +
> +	return ret;
> +}
> +
>   const struct regulator_ops pmbus_regulator_ops = {
>   	.enable = pmbus_regulator_enable,
>   	.disable = pmbus_regulator_disable,
>   	.is_enabled = pmbus_regulator_is_enabled,
>   	.get_error_flags = pmbus_regulator_get_error_flags,
> +	.get_voltage = pmbus_regulator_get_voltage,
> +	.set_voltage = pmbus_regulator_set_voltage,
>   };
>   EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
>   

