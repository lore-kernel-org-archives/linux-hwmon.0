Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17198C10F11
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 00:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBBF820818
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 00:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/L6NSMS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfDKAfY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 20:35:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35914 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfDKAfY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 20:35:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id 85so2553358pgc.3
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 17:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0Cx1VVM0xQLabuQqW9dJnBzsCrt8V4iOL9P3Y9pMVmg=;
        b=P/L6NSMStMGMwyIxV8cWtg5qV/9H2fnqzPmxC7PfXqukY/7yTuYspi0onCdtwOzHOO
         w45GZBpGFgHFsvpof6tcTktZqImIvx28+2o+mHduFyK8Ev+mwiC+6eHmQvMoVKvUjjj5
         cqr0tNiXHk9i4IN8UVL4Xov7zdXooc0ouMB8YWF6kn4HHul8Ig/sarbDLRs8EoJLIgle
         TmpyuLhxZVIiAchreKjQC/Ynfi0RXZL4k3t1uzrYewScyFR1rnOoG4OmyF739MiVvvcj
         zTpEzTI4THGarM5k09mzf5c14LjG1b0U4Appqp4xjb0TjxgDCgoyJKozp8qP9hDml696
         trig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0Cx1VVM0xQLabuQqW9dJnBzsCrt8V4iOL9P3Y9pMVmg=;
        b=DgoG5KIHkO/qz0EDwktsNPt1fM5PwTUnaVuSFIXZv3SEvLRuNv42K4lBOskASs55dw
         cr70eveXtsT3irTzCBW6+nrADL+RFUcX4zseCUinLtgcIb2eQ8Jcq+VnlsTYucEozmRO
         3DVEDMgpsODqUcE7MiAOiku2/iqqVTIFVpKe1BIivtE9YXkOABxZsXaciCuC+nnobhrn
         TG2LNPdV34VRdoAlonJpk2MjYnK2K4Ti+AOi+naZYlOHhusxdNN8p7c95BwAMHfUm5GA
         yufm5vAyl+Z4j+DlOsOx9B2nZODFKx81gEf9vpQ9J8lv/WT5XiJT/cy+9dDEuuest+Fp
         sjsQ==
X-Gm-Message-State: APjAAAXitxmZaIKPemPSySu5j8HNTbis5pQwLmF4uy60iLKwUjJkZSaB
        vHhtxLL6jO1vX3oRT0DNZHM=
X-Google-Smtp-Source: APXvYqxV4WiVxirB6/pY/OO92aSe9doHKfCN7yluFjz5wRIQ3hiOqWSHjw2eHTH2bBz3Qvq7orVTVw==
X-Received: by 2002:a65:4589:: with SMTP id o9mr26933097pgq.381.1554942923578;
        Wed, 10 Apr 2019 17:35:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b16sm51041026pfo.168.2019.04.10.17.35.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 17:35:22 -0700 (PDT)
Subject: Re: [PATCH 1/3] pmbus: support for custom sysfs attributes
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Jean Delvare <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <28f92a8e63ce4b0e1071e8fdb2315a057daee9c6.1554934898.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b3f0de78-e3bc-5c73-e732-9fa62c3404cf@roeck-us.net>
Date:   Wed, 10 Apr 2019 17:35:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <28f92a8e63ce4b0e1071e8fdb2315a057daee9c6.1554934898.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/10/19 3:38 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> This patch makes it possible to pass custom struct attribute_group array
> via the pmbus_driver_info struct so that those can be added to the
> attribute groups passed to hwmon_device_register_with_groups().
> 
> This makes it possible to register custom sysfs attributes by PMBUS
> drivers similar to how you can do this with most other busses/classes.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/pmbus/pmbus.h      |  3 +++
>   drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++++-
>   2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 1d24397d36ec..fb267ec11623 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -417,6 +417,9 @@ struct pmbus_driver_info {
>   	/* Regulator functionality, if supported by this chip driver. */
>   	int num_regulators;
>   	const struct regulator_desc *reg_desc;
> +
> +	/* custom attributes */
> +	const struct attribute_group **groups;

I can understand the need and desire for one additional group. More than one
is highly questionable. Please explain why you think that more than one extra
attribute would ever be needed. It does add substantial complexity, so
there should be a good reason.

Thanks,
Guenter

>   };
>   
>   /* Regulator ops */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 2e2b5851139c..7a7dcdc8acc9 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -103,7 +103,7 @@ struct pmbus_data {
>   	int max_attributes;
>   	int num_attributes;
>   	struct attribute_group group;
> -	const struct attribute_group *groups[2];
> +	const struct attribute_group **groups;
>   	struct dentry *debugfs;		/* debugfs device directory */
>   
>   	struct pmbus_sensor *sensors;
> @@ -2305,6 +2305,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>   	struct device *dev = &client->dev;
>   	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
>   	struct pmbus_data *data;
> +	size_t groups_num = 0;
>   	int ret;
>   
>   	if (!info)
> @@ -2319,6 +2320,15 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>   	if (!data)
>   		return -ENOMEM;
>   
> +	if (info->groups)
> +		while (info->groups[groups_num])
> +			groups_num++;
> +
> +	data->groups = devm_kcalloc(dev, groups_num + 2, sizeof(void *),
> +				    GFP_KERNEL);
> +	if (!data->groups)
> +		return -ENOMEM;
> +
>   	i2c_set_clientdata(client, data);
>   	mutex_init(&data->update_lock);
>   	data->dev = dev;
> @@ -2346,6 +2356,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>   	}
>   
>   	data->groups[0] = &data->group;
> +	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
>   	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
>   							    data, data->groups);
>   	if (IS_ERR(data->hwmon_dev)) {
> 

