Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E8BC10F11
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 00:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BB6B20818
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 00:30:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn7ZMGLl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfDKAaM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 20:30:12 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41494 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfDKAaM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 20:30:12 -0400
Received: by mail-pf1-f193.google.com with SMTP id 188so2461794pfd.8
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 17:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FbbYgpGuUs5IXlg3mbfGgDusywqQryBfEY3LJ16U8ho=;
        b=Tn7ZMGLl0VPyaOFBvKE1q6iOe1Y6JGzepCzX3992RXOkDlPPaqVRKzQO7DwGlKtYqg
         yDnTMngpLl7Ll0MEAKechQL3Xlks/W6cgoDWuSn2IxyVKHiry9+2SCE/YupJoTYk7mmL
         Ro6FoMxuYXCynt55GY9pGQq6+ScWY089k0NyelI4TssP6fu8QYc8xGLCJu2BL+8oOdkC
         HJthkCA5LoC9mpbAbGI+3YYAZne1Ut5+nUIVkWzyFC5t81Niu/Yo4M7QqZHQCHfZnt0k
         Mblld54s/xGH4ao73yZrnSNbbzLmrx2phfOScUv+MAexyQfQS9ZaWWgzXf8Gd3fJ+dPo
         RpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FbbYgpGuUs5IXlg3mbfGgDusywqQryBfEY3LJ16U8ho=;
        b=dPy36erxl7atFB3hqWvZcR/sWTQa20dnA+ZYFh22BMBePL6dUnV+bJ7WhBunHYjEZr
         UoEDbBdeS/hVvrsMq532/lPem9ENZUTMhZbqefUDruzSBdo/UQzPCjV+kcbify4DFC49
         F5cVyvyU6F/QOxLUe7eRh9Wta9u40xMim/AjyFmg2tm1Z30GMa9z7dU50IxXDPnIPUWh
         OsrCNC/8+Fy4TfmGOsfZLsXhtGBn5uzBKt8eDx42dl2mg9v5ZMeUE7UgqKYS7qZNb0z0
         qKo5xx3t+U00ejYmJz6Izd8P3dM5qbgIF7937M2+6rMWGp1M6SDfkFcR/EO3n9YzpKt0
         tGJw==
X-Gm-Message-State: APjAAAX+8foQpc89EFIX81QPrCpE0INSBsTc3agd5Mx/a4+0Io/EjBDs
        sWC0bVBX0oZUFD0RH48umok=
X-Google-Smtp-Source: APXvYqwbRS2mFj5XxbyYMU2VmnbC8yVvBUzt1mb2uVGlDqh1XAQhzvtlVLz3xNTkmPRiQAkqqLHV5Q==
X-Received: by 2002:a62:388d:: with SMTP id f135mr46522555pfa.103.1554942611488;
        Wed, 10 Apr 2019 17:30:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23sm51773274pfd.11.2019.04.10.17.30.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 17:30:10 -0700 (PDT)
Subject: Re: [PATCH 3/3] pmbus: export coefficients via sysfs
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Jean Delvare <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <8087920a011662114ca151d4e04186c121a9a737.1554934898.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6366cab6-8db2-9d22-a43b-7df0377f75fb@roeck-us.net>
Date:   Wed, 10 Apr 2019 17:30:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8087920a011662114ca151d4e04186c121a9a737.1554934898.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/10/19 3:39 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> In order to get best accuracy, in case of some devices it is required to
> tweak coefficient values. This is especially true for devices using
> some external shunt resistor or being operated in non-usual environment.
> Those values may be measured during device production and stored as
> calibration values in some place (like EEPROM or even a file).
> 
> To support wide range of possible use cases, lets export those to
> user space via sysfs attributes so that it can implement its own
> policies about them. All those attributes are put into separate
> attribute_group struct so that we can set its name to group all of them
> in a "coefficients" subdirectory in sysfs.
>

Coefficients are hardcoded into the chip, and the hwmon ABI reports raw
values. Any correction should be done using sensors3.conf.

Guenter

> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com> > ---
>   drivers/hwmon/pmbus/pmbus_core.c | 100 ++++++++++++++++++++++++++++++-
>   1 file changed, 97 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 7a7dcdc8acc9..8cb61fc977db 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -57,6 +57,8 @@
>   
>   #define PMBUS_NAME_SIZE		24
>   
> +static const char * const coeff_name[] = {"m", "b", "R"};
> +
>   struct pmbus_sensor {
>   	struct pmbus_sensor *next;
>   	char name[PMBUS_NAME_SIZE];	/* sysfs sensor name */
> @@ -98,11 +100,12 @@ struct pmbus_data {
>   	int exponent[PMBUS_PAGES];
>   				/* linear mode: exponent for output voltages */
>   
> -	const struct pmbus_driver_info *info;
> +	struct pmbus_driver_info *info;
>   
>   	int max_attributes;
>   	int num_attributes;
>   	struct attribute_group group;
> +	struct attribute_group group_coeff;
>   	const struct attribute_group **groups;
>   	struct dentry *debugfs;		/* debugfs device directory */
>   
> @@ -1901,6 +1904,88 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>   	return 0;
>   }
>   
> +static struct attribute *pmbus_init_coeff_attr(struct pmbus_data *data,
> +					       const char *prefix,
> +					       const char *coeff, int *target)
> +{
> +	struct dev_ext_attribute *ext_attr;
> +	char *name;
> +
> +	ext_attr = devm_kzalloc(data->dev, sizeof(ext_attr), GFP_KERNEL);
> +	if (!ext_attr)
> +		return NULL;
> +
> +	name = devm_kasprintf(data->dev, GFP_KERNEL, "%s_%s", prefix, coeff);
> +	if (!name)
> +		return NULL;
> +
> +	pmbus_dev_attr_init(&ext_attr->attr, name, (S_IWUSR | S_IRUGO),
> +			    device_show_int, device_store_int);
> +	ext_attr->var = target;
> +
> +	return &ext_attr->attr.attr;
> +}
> +
> +static int pmbus_add_coeff_attributes_class(struct pmbus_data *data,
> +					    const char *prefix,
> +					    enum pmbus_sensor_classes class,
> +					    struct attribute **attrs)
> +{
> +	int *coeff_val[] = {data->info->m, data->info->b, data->info->R};
> +	struct attribute *ret;
> +	int i, count = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(coeff_name); i++) {
> +		ret = pmbus_init_coeff_attr(data, prefix, coeff_name[i],
> +					    coeff_val[i]);
> +		if (!ret)
> +			return -ENOMEM;
> +		attrs[count++] = ret;
> +	}
> +
> +	return count;
> +}
> +
> +static const char * const classes_names[] = {
> +	[PSC_VOLTAGE_IN] = "vin",
> +	[PSC_VOLTAGE_OUT] = "vout",
> +	[PSC_CURRENT_IN] = "iin",
> +	[PSC_CURRENT_OUT] = "iout",
> +	[PSC_POWER] = "p",
> +	[PSC_TEMPERATURE] = "temp",
> +};
> +
> +static int pmbus_add_coeff_attributes(struct i2c_client *client,
> +				      struct pmbus_data *data)
> +{
> +	struct attribute **attrs;
> +	int i, n = 0, ret = 0;
> +
> +	attrs = kcalloc(ARRAY_SIZE(coeff_name) * (PSC_NUM_CLASSES + 1),
> +			sizeof(void *), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(classes_names); i++) {
> +		if (classes_names[i] == NULL)
> +			continue;
> +
> +		ret = pmbus_add_coeff_attributes_class(data, classes_names[i],
> +						       i, &attrs[n]);
> +		if (ret < 0) {
> +			kfree(attrs);
> +			return ret;
> +		}
> +
> +		n += ret;
> +	}
> +
> +	data->group_coeff.name = "coefficients";
> +	data->group_coeff.attrs =  attrs;
> +
> +	return 0;
> +}
> +
>   static int pmbus_find_attributes(struct i2c_client *client,
>   				 struct pmbus_data *data)
>   {
> @@ -1932,6 +2017,11 @@ static int pmbus_find_attributes(struct i2c_client *client,
>   
>   	/* Fans */
>   	ret = pmbus_add_fan_attributes(client, data);
> +	if (ret)
> +		return ret;
> +
> +	/* Coefficients */
> +	ret = pmbus_add_coeff_attributes(client, data);
>   	return ret;
>   }
>   
> @@ -2324,7 +2414,8 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>   		while (info->groups[groups_num])
>   			groups_num++;
>   
> -	data->groups = devm_kcalloc(dev, groups_num + 2, sizeof(void *),
> +	/* Two default groups + ending NULL makes 3 groups minimum */
> +	data->groups = devm_kcalloc(dev, groups_num + 3, sizeof(void *),
>   				    GFP_KERNEL);
>   	if (!data->groups)
>   		return -ENOMEM;
> @@ -2356,7 +2447,8 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>   	}
>   
>   	data->groups[0] = &data->group;
> -	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
> +	data->groups[1] = &data->group_coeff;
> +	memcpy(data->groups + 2, info->groups, sizeof(void *) * groups_num);
>   	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
>   							    data, data->groups);
>   	if (IS_ERR(data->hwmon_dev)) {
> @@ -2379,6 +2471,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>   	hwmon_device_unregister(data->hwmon_dev);
>   out_kfree:
>   	kfree(data->group.attrs);
> +	kfree(data->group_coeff.attrs);
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(pmbus_do_probe);
> @@ -2391,6 +2484,7 @@ int pmbus_do_remove(struct i2c_client *client)
>   
>   	hwmon_device_unregister(data->hwmon_dev);
>   	kfree(data->group.attrs);
> +	kfree(data->group_coeff.attrs);
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(pmbus_do_remove);
> 

