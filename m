Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBF4EB64DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 02:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjGSCv6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 22:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjGSCv5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 22:51:57 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6586BE5
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 19:51:56 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3a3efebcc24so4695769b6e.1
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Jul 2023 19:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689735115; x=1692327115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XekIZwug8DgO+v7tyysgtTJcPDFYvzXnkmobKGetfDI=;
        b=J/Wy+x7M24VySwbFT12WuKJnTWG+LYl3aJBKWxvekfXzcA58bNHX96DbHUNQN6sAO3
         l/oZqtLd9pswaAiU2uMFm5wKKLfWqKd0Vgf/yeoxmpObPHOjJAFmwAhc/0EFBJlYm5gb
         2Z+lNJVC+HtvTNrsFfq9Dl/TLNaFmaKPfAKrAwq5lFklpX2X8inFUpowXs3Qf4iBXNb5
         LXY3yfbqYywqENlM5Z8oV66lBBE4zyBUYRVKV7W+Mw3KhD+FTBtEomEIv7CtobVzbsf1
         jaRRYhZSnGAu/+eSXxdN99RUxRJLx+RlZDYFsSjEp9qYjd+hKtQxgetFU2zUaEQNDTUp
         knyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689735115; x=1692327115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XekIZwug8DgO+v7tyysgtTJcPDFYvzXnkmobKGetfDI=;
        b=HE2bdQkmzwiOahW+O1Xk0Oyoe/CeZHcN0L8Zfjtj+CRz2oTIVzh1A34//FDhpxWVh+
         KoliiD2fALNr1y7YYicgpwSC1I3yRXn2GXHPHgIM2RAONeoKDqE8Yk7BckPzJ/MM1ksY
         oHNdkfUxLXzdboiz8B9PSqU+7N7ODHJDgIx9kg3+/buQS2or5LuTleMbKt/oIa98nJnC
         QU1WaeZ17Y2TnJAxpvOpuam55XtEEiGcFrDQVLAKOFG5i6OtqRUzYCDw1/43ze/iJyXF
         WybwM9yII78tNReiN56rLHxl/Tk97IxDUnvxqGRbDODtRf10fI7mIMEmauTcwtCG3v9T
         8fgw==
X-Gm-Message-State: ABy/qLbecfa2G2J6199lP9exIFe3EovTagHFFHnCmjqbkFfEK2k/ApQW
        e8Mt4KAdumT6GrLS+ujuNrY=
X-Google-Smtp-Source: APBJJlHb/AtBkpn1xt1Qbas1WybieuldMDr8kA3WQMvwshjrQE5O1E2lmQECalro6PLRNztegaTMQg==
X-Received: by 2002:a05:6808:1149:b0:3a1:b67c:5555 with SMTP id u9-20020a056808114900b003a1b67c5555mr5500297oiu.58.1689735115635;
        Tue, 18 Jul 2023 19:51:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o6-20020a637e46000000b005634bd81331sm544390pgn.72.2023.07.18.19.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 19:51:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 18 Jul 2023 19:51:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (it87) Split temperature sensor detection
 to separate function
Message-ID: <528ad08a-f8f1-4daf-aefb-5cfcd71c9804@roeck-us.net>
References: <20230707123005.956415-1-frank@crawford.emu.id.au>
 <20230707123005.956415-2-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707123005.956415-2-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 07, 2023 at 10:29:50PM +1000, Frank Crawford wrote:
> The temperature sensor type will need to be used in multiple places, so
> split it out into its own function.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied. Nit inline.

> ---
> 
> v2:
>  * Split single patch into multi-patch set following review.
> 
> ---
>  drivers/hwmon/it87.c | 43 ++++++++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 5deff5e5f693..7a1224ddc8b1 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -1159,28 +1159,45 @@ static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
>  static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
>  static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
>  
> +static int get_temp_type(struct it87_data *data, int index)
> +{
> +	/*
> +	 * 2 is deprecated;
> +	 * 3 = thermal diode;
> +	 * 4 = thermistor;
> +	 * 5 = AMDTSI;
> +	 * 6 = Intel PECI;
> +	 * 0 = disabled
> +	 */
> +	u8 reg, extra;
> +	int type = 0;
> +
> +	reg = data->sensor;	/* In case value is updated while used */
> +	extra = data->extra;
> +
> +	if ((has_temp_peci(data, index) && (reg >> 6 == index + 1)) ||
> +	    (has_temp_old_peci(data, index) && (extra & 0x80)))
> +		type = 6;	/* Intel PECI */
> +	else if (reg & BIT(index))
> +		type = 3;	/* thermal diode */
> +	else if (reg & BIT(index + 3))
> +		type = 4;	/* thermistor */
> +
> +	return type;
> +}
> +
>  static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
>  			      char *buf)
>  {
>  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> -	int nr = sensor_attr->index;
>  	struct it87_data *data = it87_update_device(dev);
> -	u8 reg, extra;
> +	int type;
>  
>  	if (IS_ERR(data))
>  		return PTR_ERR(data);
>  
> -	reg = data->sensor;	/* In case value is updated while used */
> -	extra = data->extra;
> -
> -	if ((has_temp_peci(data, nr) && (reg >> 6 == nr + 1)) ||
> -	    (has_temp_old_peci(data, nr) && (extra & 0x80)))
> -		return sprintf(buf, "6\n");  /* Intel PECI */
> -	if (reg & (1 << nr))
> -		return sprintf(buf, "3\n");  /* thermal diode */
> -	if (reg & (8 << nr))
> -		return sprintf(buf, "4\n");  /* thermistor */
> -	return sprintf(buf, "0\n");      /* disabled */
> +	type = get_temp_type(data, sensor_attr->index);
> +	return sprintf(buf, "%d\n", type);

The type variable is really unnecessary. I dropped that while applying.

Thanks,
Guenter
