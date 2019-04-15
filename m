Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E44C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 18:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC09E205ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 18:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K7ydN7hp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfDOSPv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 14:15:51 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34006 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfDOSPv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 14:15:51 -0400
Received: by mail-pl1-f196.google.com with SMTP id y6so8991640plt.1
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 11:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGqsW1dvcbkk7BfTZURUB+w0Ywaxmtx5X3gR9N5GsMU=;
        b=K7ydN7hpIMycrOxEXYSXmyaazI2DE0b6LuoT1MPkYdP9HuyqeQu8oOZdruK7UG/Zsy
         X15no2JKvrilkV/cSPvkZ9KknAh42ocS33paFKhdzy+Vpxd8gN1WvHD8Q6hcyRUzpchR
         FcplW8vXCfxDUa23Xio2aKkXKADf3Uh0L6dx8UhJhZ3zpxwUee/F3sZp3PxY2l038gSu
         AungbRwOuGAzxHEqveWuXmYjDr68hoRB5m042FZEE14YRIXf/QeCPl6fxnfG3vBL1VjQ
         ex0jjAKekzIEJ+Ez7sBctVRhnLdafiL99WQ5c5Oz5f0Gn+N51m8wjTOO/qk4Y65MaFab
         5/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGqsW1dvcbkk7BfTZURUB+w0Ywaxmtx5X3gR9N5GsMU=;
        b=WfeKZZy+z12xMAPbGGaSKacDsp86JNU1rdDu54xfFfjTN/GHc8kbvqsNxjbFhRhdPe
         A6L934dCgMWbcfnEePrhRQLXRrxjM/bsN+fisafl3VM3SdXGuh/kwPICwADqiNhZeIMK
         pI0tZXKPIAYAWIagNGFUNVlkGJX57fRW2HTHvD95TN5sXKwxw/AnTs1f+fcNKM19Lbmc
         VosO/ApKQs9xOvcJrQcSb35cCe+Gxqq8y2r0Tt8tRrCMg5T1F8EROrEpqdb24RiaHQH3
         0ogeBGLenSVdkj+gQar0d2ouG7aAReGM8REaUV6laE33aaON3x7tuoDAGt0Ypi5HFnBc
         IYlQ==
X-Gm-Message-State: APjAAAUy4k77OXM7LZYXdKtvAgd5zXZAVrXskULGoZ3v8g2Ro99TXd2Z
        kSu4uHvkirYlJf9Bs6o8BAmhXSzh6p6tYEQc96ULtA==
X-Google-Smtp-Source: APXvYqw4Cq2+2XnZG1296RZGzudDdmsgleZLBykp7FsAhXK/g3EzzXI/PnpSxnJfU2mYGiCCic2QYaY5eHstIPK6wDQ=
X-Received: by 2002:a17:902:8bca:: with SMTP id r10mr76789321plo.67.1555352150362;
 Mon, 15 Apr 2019 11:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190415181433.195416-1-venture@google.com>
In-Reply-To: <20190415181433.195416-1-venture@google.com>
From:   Patrick Venture <venture@google.com>
Date:   Mon, 15 Apr 2019 11:15:39 -0700
Message-ID: <CAO=notyvN1jBhA04Jk9Nc+sfgy1N70vLKaMj2Ng00c1h4qJjxA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pmbus: support for custom sysfs attributes
To:     Patrick Venture <venture@google.com>,
        Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com
Cc:     krzysztof.adamski@nokia.com, linux-hwmon@vger.kernel.org,
        alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 15, 2019 at 11:14 AM Patrick Venture <venture@google.com> wrote:
>
> From: krzysztof.adamski@nokia.com

My instance of git send-email didn't parse the From line correctly, my
apologies.

>
> This patch makes it possible to pass custom struct attribute_group array
> via the pmbus_driver_info struct so that those can be added to the
> attribute groups passed to hwmon_device_register_with_groups().
>
> This makes it possible to register custom sysfs attributes by PMBUS
> drivers similar to how you can do this with most other busses/classes.
>
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
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
>         /* Regulator functionality, if supported by this chip driver. */
>         int num_regulators;
>         const struct regulator_desc *reg_desc;
> +
> +       /* custom attributes */
> +       const struct attribute_group **groups;
>  };
>
>  /* Regulator ops */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index e2366428a9a91..d6170a802c0f7 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -103,7 +103,7 @@ struct pmbus_data {
>         int max_attributes;
>         int num_attributes;
>         struct attribute_group group;
> -       const struct attribute_group *groups[2];
> +       const struct attribute_group **groups;
>         struct dentry *debugfs;         /* debugfs device directory */
>
>         struct pmbus_sensor *sensors;
> @@ -2305,6 +2305,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>         struct device *dev = &client->dev;
>         const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
>         struct pmbus_data *data;
> +       size_t groups_num = 0;
>         int ret;
>
>         if (!info)
> @@ -2319,6 +2320,15 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>         if (!data)
>                 return -ENOMEM;
>
> +       if (info->groups)
> +               while (info->groups[groups_num])
> +                       groups_num++;
> +
> +       data->groups = devm_kcalloc(dev, groups_num + 2, sizeof(void *),
> +                                   GFP_KERNEL);
> +       if (!data->groups)
> +               return -ENOMEM;
> +
>         i2c_set_clientdata(client, data);
>         mutex_init(&data->update_lock);
>         data->dev = dev;
> @@ -2346,6 +2356,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>         }
>
>         data->groups[0] = &data->group;
> +       memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
>         data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
>                                                             data, data->groups);
>         if (IS_ERR(data->hwmon_dev)) {
> --
> 2.21.0.392.gf8f6787159e-goog
>
