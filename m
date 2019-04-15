Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F485C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 21:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 656A4206B6
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 21:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNfbmeNp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbfDOVts (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 17:49:48 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39875 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfDOVtr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 17:49:47 -0400
Received: by mail-pl1-f195.google.com with SMTP id a96so9232129pla.6
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uGLJpoTvYi8iD5pZpLtDwg/5yimZoLkSdaHs/IEm1xk=;
        b=CNfbmeNphovoTipDqH2hbGmqVSw2uD33k4j64UIUFZh7a/XFWDq8sfor5aMx8mAI7i
         UphTFNikwoyEgRYtMuoMn4rpUG9vTWouiTAOo3DtEs+nG1IcKIN5G1p1IDz/6xZpM3c2
         jYb+H6xDeV7hqFze6DOxZr9fMXYNRq6RZH0T3T2oio60xqq+vzRESMlzuQo24sCRBV5X
         wzqhala14wB2A6TGJYJNa7EZ+JqSUo1EJy5FFLhmrrLFM1SkwFBunXPZVkvUK+b97rxo
         OBCzT6Jy0XS0ZFfDE7x2oNWszP/o9BVDbg+NJ1y7KqK5fK4NuH7NifvRz0xZy1oX9xti
         HIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=uGLJpoTvYi8iD5pZpLtDwg/5yimZoLkSdaHs/IEm1xk=;
        b=EWD5Ak8c9EimoZF14NxiVudDFJYPEpWHT7wpZCscGBnrjR2pJXm4Ew772ADwd7gHtG
         lPCEfTI7DnKb5/3RD6q8XLQegndPi6XCKAVMKgINhtOKL7ELlRzlu0cWdoaxMyirYnTG
         fItHHArUICIo52icZMT6tE8iIzRLuLAm+iDKDqUnivTm6tm5MWTb0OkOT7mSKAZO9Iay
         EE6cVpbBPvbIiY85ZM8736QRkrk1+cUGqvNk8jHQrSk/OkEnA1XbgTRr0eB87YC/2pC1
         MwBRRdvjWhFZrDtWekZi7r0bgc0kYfj4Mz+n5W7z/a7QN0KVY/zJ6Yv+Bf8vzANTF6J9
         MRCA==
X-Gm-Message-State: APjAAAWWeVmTZf/rlAjsKFenItec1ifln4sBnI8w3kY3uZZ9+ytKKyB+
        dzs2ovqnmITUpVI8kwKX31k=
X-Google-Smtp-Source: APXvYqy0zo5FDQRBHX3z+xv0T89f1jAyU9ztpDLr+lG+zLbPIrGqtm1V5m13YnU6fA4w2a5crzXlkA==
X-Received: by 2002:a17:902:2827:: with SMTP id e36mr67078982plb.45.1555364987115;
        Mon, 15 Apr 2019 14:49:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f1sm69862393pgl.35.2019.04.15.14.49.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 14:49:46 -0700 (PDT)
Date:   Mon, 15 Apr 2019 14:49:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Patrick Venture <venture@google.com>
Cc:     jdelvare@suse.com, krzysztof.adamski@nokia.com,
        linux-hwmon@vger.kernel.org, alexander.sverdlin@nokia.com
Subject: Re: [PATCH v5 1/2] pmbus: support for custom sysfs attributes
Message-ID: <20190415214945.GA28302@roeck-us.net>
References: <20190415214405.120110-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415214405.120110-1-venture@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 15, 2019 at 02:44:05PM -0700, Patrick Venture wrote:
> From: krzysztof.adamski@nokia.com
> 
> This patch makes it possible to pass custom struct attribute_group array
> via the pmbus_driver_info struct so that those can be added to the
> attribute groups passed to hwmon_device_register_with_groups().
> 
> This makes it possible to register custom sysfs attributes by PMBUS
> drivers similar to how you can do this with most other busses/classes.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied to hwmon-next.

Guenter

> ---
> V5:
>  None
> v4:
>  None
> v3:
>  - staged before v3 hwmon/pmbus/isl68137 driver
> ---
>  drivers/hwmon/pmbus/pmbus.h      |  3 +++
>  drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 1d24397d36ecd..fb267ec116235 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -417,6 +417,9 @@ struct pmbus_driver_info {
>  	/* Regulator functionality, if supported by this chip driver. */
>  	int num_regulators;
>  	const struct regulator_desc *reg_desc;
> +
> +	/* custom attributes */
> +	const struct attribute_group **groups;
>  };
>  
>  /* Regulator ops */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index e2366428a9a91..d6170a802c0f7 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -103,7 +103,7 @@ struct pmbus_data {
>  	int max_attributes;
>  	int num_attributes;
>  	struct attribute_group group;
> -	const struct attribute_group *groups[2];
> +	const struct attribute_group **groups;
>  	struct dentry *debugfs;		/* debugfs device directory */
>  
>  	struct pmbus_sensor *sensors;
> @@ -2305,6 +2305,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>  	struct device *dev = &client->dev;
>  	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
>  	struct pmbus_data *data;
> +	size_t groups_num = 0;
>  	int ret;
>  
>  	if (!info)
> @@ -2319,6 +2320,15 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>  	if (!data)
>  		return -ENOMEM;
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
>  	i2c_set_clientdata(client, data);
>  	mutex_init(&data->update_lock);
>  	data->dev = dev;
> @@ -2346,6 +2356,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>  	}
>  
>  	data->groups[0] = &data->group;
> +	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
>  	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
>  							    data, data->groups);
>  	if (IS_ERR(data->hwmon_dev)) {
