Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1521BC43334
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Jun 2022 15:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244916AbiFTPUl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235663AbiFTPUP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 11:20:15 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B499210559
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 08:14:22 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso12269277pjb.0
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YixSdThDvtlMTMkUxeg1TJx0ixLIpMriDx5kc/6xVwY=;
        b=nme+6mnhja3/6hHVK6AXmvNa4jUwEn+Vuo/MgAhvvf367qklzzwtvHnpdRcso5xcG6
         8QTQGYDcnaQ0eWBB+JTYwik6eG2XzYe4qo04nenP0ghONggfvddG7CXzBnwLgKLjzIiU
         MJLOvNxrF9vNE0qaLtblFR/6r+uxoeAEVFKt8XR21S5Ku4Jfi5phqeuevZSUMrBf+XlT
         4k6G9aHCxq5Tc7MYkBUvqdkpwiABvYig9pHCD8EllbSAUBgBIC9XZE+qrE3tz9CUUQQS
         hylrf05fqMai5MZ0IUNglSYeMK4SDslSU4OVWEtH8vEaKCcWVTOEli/Z+TUTWwEMH3wW
         OAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=YixSdThDvtlMTMkUxeg1TJx0ixLIpMriDx5kc/6xVwY=;
        b=hiPD3e009SCXQ5g7LLA1xtoslqN4EkOpxfTFVVraYafiGeQDCaoCbkA6gGizD+58Bc
         bP8Jr0PLsbnZ+m3uu6VVuFnNtjojH2vwUWi8UhO16LsJ4CTjCFH0I/iK/ftH0Xy4wgV/
         JputIOL35Fh5jyFNMYrOu1M2VI7tFqOD9Ln2QMM5gPXXXfihBj03BQPn9/mDXQXgxbf6
         v5B9GcONYEMWxu+0c4BvebbStBigy0xWWOAZJW4TmDSjEzCUrAovKbnLjz8lIcJiAJwX
         khZ8uQC7zn+asTeDCc1+rVmwIumqrbWIHjaIXWgHZT/AxLTzYkDrGAzBdsLTY+Yc4esJ
         aORQ==
X-Gm-Message-State: AJIora9QO7M3P9rWkRua9XTTWxXOaqHUT77lnWOO5WzjuHU4PdpaP0E2
        C9g7qXJjSLzyN49qNfpWKsM=
X-Google-Smtp-Source: AGRyM1sLeiDuEUzpgbc/b8mfX952dAIFtoglptOzH9u+o9tmzzxAaiII24g4gYrBar7lE0C1X1ry5Q==
X-Received: by 2002:a17:902:ecca:b0:166:3e34:4d01 with SMTP id a10-20020a170902ecca00b001663e344d01mr24322706plh.97.1655738062247;
        Mon, 20 Jun 2022 08:14:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w4-20020a63b744000000b003fd4831e6fesm9159997pgt.70.2022.06.20.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 08:14:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 20 Jun 2022 08:14:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v3 2/3] hwmon: (pmbus) Add list_voltage to pmbus ops
Message-ID: <20220620151420.GA2620386@roeck-us.net>
References: <20220614093856.3470672-1-marten.lindahl@axis.com>
 <20220614093856.3470672-3-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220614093856.3470672-3-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 14, 2022 at 11:38:55AM +0200, Mårten Lindahl wrote:
> When checking if a regulator supports a voltage range, the regulator
> needs to have a list_voltage callback set to the regulator_ops or else
> -EINVAL will be returned. This support does not exist for the pmbus
> regulators, so this patch adds pmbus_regulator_list_voltage to the
> pmbus_regulator_ops.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 5e0d16512fa6..f303c2598fb5 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2745,6 +2745,35 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
>  	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
>  }
>  
> +static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
> +					 unsigned int selector)
> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	int val, low, high;
> +
> +	if (selector >= rdev->desc->n_voltages ||
> +	    selector < rdev->desc->linear_min_sel)
> +		return -EINVAL;
> +
> +	selector -= rdev->desc->linear_min_sel;
> +	val = DIV_ROUND_CLOSEST(rdev->desc->min_uV +
> +				(rdev->desc->uV_step * selector), 1000); /* convert to mV */
> +
> +	low = pmbus_regulator_get_low_margin(client, rdev_get_id(rdev));
> +	if (low < 0)
> +		return low;
> +
> +	high = pmbus_regulator_get_high_margin(client, rdev_get_id(rdev));
> +	if (high < 0)
> +		return high;
> +
> +	if (val >= low && val <= high)
> +		return val * 1000; /* unit is uV */
> +
> +	return 0;
> +}
> +
>  const struct regulator_ops pmbus_regulator_ops = {
>  	.enable = pmbus_regulator_enable,
>  	.disable = pmbus_regulator_disable,
> @@ -2752,6 +2781,7 @@ const struct regulator_ops pmbus_regulator_ops = {
>  	.get_error_flags = pmbus_regulator_get_error_flags,
>  	.get_voltage = pmbus_regulator_get_voltage,
>  	.set_voltage = pmbus_regulator_set_voltage,
> +	.list_voltage = pmbus_regulator_list_voltage,
>  };
>  EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
>  
