Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85414C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 May 2022 13:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbiECNno (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 May 2022 09:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbiECNnn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 May 2022 09:43:43 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA382AE24
        for <linux-hwmon@vger.kernel.org>; Tue,  3 May 2022 06:40:09 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-d39f741ba0so17167145fac.13
        for <linux-hwmon@vger.kernel.org>; Tue, 03 May 2022 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hHgp7hXrPA2Bch2r3j0d3tAGBLNZP7DiGi5tx+OXIWg=;
        b=qxNIvzodSXX/TdmKIlEf6vTZ09+3wUrvAu+KcfMAvH1ZymSyBBWB6MgS4h6XvOUWlv
         lWsAKSk+LGRNSJ+8tHIvUdmuisNKv5zlfA2Js2GDapdLTv5bjF8o19NWojXQGvdoQ/Sf
         hteM3tAGVsaGQNr8hnrFIb1phs0ZnwcvMF14NFjBFV2JCwuzsipCBPpPHI4PKe2pquvd
         nqQMWW0mMKhA0RplKBSOyD2X2jfPs+WM2wMtU4JohkaXCoXIzZI2iM0OELdgXN3gQBkZ
         7FoYkfRCKWUjMWbB61PA/xjzwHIyUWEM2xwNWehZrNgsW++E7L8ngVPcaCdRrcDBXHhp
         bg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=hHgp7hXrPA2Bch2r3j0d3tAGBLNZP7DiGi5tx+OXIWg=;
        b=HriCQgaT1I1uqmETLNCYAUWWjmlTmCLyUCiaDYp9f5t+V5zQiL3QWfQsKPpxwnfCWX
         ErfrdL8q8hOq7pRj2xRYFU6A+p1jZUVYxqpe4JGYw6luxdoEgDuRUHBygVJ/9Z8oVC2U
         5alg40vP+xvRoyb59mZBRPlxSmZV7IqHf01Mn3g4NooQ9JudznuC7GZi8QMbf4BWLrLo
         3OhwEWnDYANmxSZ/VW5yKzd+MoQ/2cERSSBjZ7AbeTkhbjl4lxCjhqQxybVyPQSmHBeq
         EZS0XH+pmtPAjy89iPinguF7YexbTRVUXiKUXxEaNWFLqPlegzpL9VnrkFJ7fxjySdW/
         bz1Q==
X-Gm-Message-State: AOAM533VcngBBr9Ez/yco3IO5P/0eyqOJ/Zo0UHpd1l27eWZcMz6IeXY
        GriHDIet51ZvlYPLkFfPty4=
X-Google-Smtp-Source: ABdhPJyhJFS6CW3YVGwt1XrRyjFY0YMsgBQZ8pgTSl79bM4NQu7yLZlck3QTzjo1oClF1Gqo/UH6gw==
X-Received: by 2002:a05:6870:c105:b0:e9:2cec:ae79 with SMTP id f5-20020a056870c10500b000e92cecae79mr1724793oad.35.1651585209168;
        Tue, 03 May 2022 06:40:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e10-20020a05683013ca00b0060603221259sm4088323otq.41.2022.05.03.06.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:40:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 May 2022 06:40:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v6 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
Message-ID: <20220503134006.GA3078330@roeck-us.net>
References: <20220503104631.3515715-1-marten.lindahl@axis.com>
 <20220503104631.3515715-5-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220503104631.3515715-5-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 03, 2022 at 12:46:31PM +0200, Mårten Lindahl wrote:
> The pmbus core does not have operations for getting or setting voltage.
> Add functions get/set voltage for the dynamic regulator framework.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 66 ++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index bd143ca0c320..f2cf0439da37 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2563,11 +2563,77 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>  	return 0;
>  }
>  
> +static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor s = {
> +		.page = rdev_get_id(rdev),
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +	};
> +
> +	s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_READ_VOUT);
> +	if (s.data < 0)
> +		return s.data;
> +
> +	return (int)pmbus_reg2data(data, &s) * 1000; /* unit is uV */
> +}
> +
> +static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
> +					 int max_uv, unsigned int *selector)

Multi-line alignment is off.

> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor s = {
> +		.page = rdev_get_id(rdev),
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +		.data = -1,
> +	};
> +	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
> +	int low, high;

There should be an empty line here. Interesting, checkpatch doesn't complain.
No need to resend, I'll apply and fix it up.

Thanks,
Guenter

> +	*selector = 0;
> +
> +	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
> +		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MIN);
> +	if (s.data < 0) {
> +		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_LOW);
> +		if (s.data < 0)
> +			return s.data;
> +	}
> +	low = pmbus_reg2data(data, &s);
> +	s.data = -1;
> +
> +	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
> +		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MAX);
> +	if (s.data < 0) {
> +		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_HIGH);
> +		if (s.data < 0)
> +			return s.data;
> +	}
> +	high = pmbus_reg2data(data, &s);
> +
> +	/* Make sure we are within margins */
> +	if (low > val)
> +		val = low;
> +	if (high < val)
> +		val = high;
> +
> +	val = pmbus_data2reg(data, &s, val);
> +
> +	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
> +}
> +
>  const struct regulator_ops pmbus_regulator_ops = {
>  	.enable = pmbus_regulator_enable,
>  	.disable = pmbus_regulator_disable,
>  	.is_enabled = pmbus_regulator_is_enabled,
>  	.get_error_flags = pmbus_regulator_get_error_flags,
> +	.get_voltage = pmbus_regulator_get_voltage,
> +	.set_voltage = pmbus_regulator_set_voltage,
>  };
>  EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
>  
