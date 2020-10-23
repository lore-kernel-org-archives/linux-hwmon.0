Return-Path: <SRS0=gn2i=D6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F59CC388F9
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Oct 2020 21:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7BC321D6C
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Oct 2020 21:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sij1l/Cq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755634AbgJWVPP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Oct 2020 17:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755437AbgJWVPP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Oct 2020 17:15:15 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E8FC0613CE;
        Fri, 23 Oct 2020 14:15:13 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id c10so784815oon.6;
        Fri, 23 Oct 2020 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nivdWhdjmwmXXwWHH0ujQVWH0+nRhW8NuKzonNv+j1Y=;
        b=Sij1l/CqiTFRKBk7oTI7YI3Wde5ahXr9pIMx1G9Bh07aGz0ILDt3qsS6/wvWUctinH
         lKStq+GsY/+DD9uZ+2ehw1hTFMuxN3ZYsF5TB4l+28sYCUhISPh/nuXaqdCeG0HeN1mk
         unQ3+EbscXJ1JvcTy6zG0tH95F2c0Pt3WN4mWEqMrO+Q3PLO+FSB4Mw6wgTDU4tvwLNd
         OVYZbBsEaUAJUa+eMueM5jCl2i8m0jAT6mgsLPKsOPzp9LiYN2PsacSQPdfxUhVDXHQW
         jPpNBoX6/65ALKg+CQDhTQ+5Rg+mfEKqmGLlXk3MkZtggf4r0Qw3BB6BvyjgAgfou2e2
         ixQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=nivdWhdjmwmXXwWHH0ujQVWH0+nRhW8NuKzonNv+j1Y=;
        b=KLTckBLqYfM8C52dDMZBYMWpVhSoTvynXx/p66kNRiay4wwNlC1cNdb7pZzuN7+UTj
         GSybebtFxUwd9dO/9QtGALHft/UszdL9MWjKho3OunLJPc+EnG3rvVYHdC1QH97ucEeo
         IuiPZK0ojEEpwe0dW2+gDEdh7vUMXB5rZ+n/rq9KPYlZzEovvCRhca0Gw5e5t4hivpzy
         O6MlomlI3tFCmfC+QqI1McWLJbjOVnukv/xQKrglRbUnPUHl8MGaEpwOyySSj/ztQhS9
         258jSmRvC+MPZvb0poHCJJ2dvI36qvtLfbOUK7zFWwWYZciUms4CyUk8GHa2VTRdBYrp
         HFTg==
X-Gm-Message-State: AOAM533NpngbhrqaIAywgDRM2el2j+RsVr9nl7Tu+vqdPTkNWkD2c+Gk
        NrQfGBmJf7lNvjo3BI+Ckdw=
X-Google-Smtp-Source: ABdhPJyx8/AIk2GXr4LnL3eC8AaqYs7ZGiY4RA1M47NbVijdt4f6plFj+1eEm5f3JsZXXITs4ezBYQ==
X-Received: by 2002:a4a:c218:: with SMTP id z24mr3415385oop.9.1603487711408;
        Fri, 23 Oct 2020 14:15:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b13sm775194oib.4.2020.10.23.14.15.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 14:15:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 23 Oct 2020 14:15:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ugur Usug <Ugur.Usug@maximintegrated.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max20730) use scnprintf() instead of
 snprintf()
Message-ID: <20201023211509.GA28238@roeck-us.net>
References: <20201022070824.GC2817762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022070824.GC2817762@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 22, 2020 at 10:08:24AM +0300, Dan Carpenter wrote:
> The snprintf() function returns the number of characters which would
> have been printed if there were enough space, but the scnprintf()
> returns the number of characters which were actually printed.  If the
> buffer is not large enough, then using snprintf() would result in a
> read overflow and an information leak.
> 
> Fixes: 8910c0bd533d ("hwmon: (pmbus/max20730) add device monitoring via debugfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/max20730.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
> index 57923d72490c..be83b98411c7 100644
> --- a/drivers/hwmon/pmbus/max20730.c
> +++ b/drivers/hwmon/pmbus/max20730.c
> @@ -122,8 +122,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
>  	switch (idx) {
>  	case MAX20730_DEBUGFS_VOUT_MIN:
>  		ret = VOLT_FROM_REG(data->mfr_voutmin * 10000);
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d.%d\n",
> -			       ret / 10000, ret % 10000);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d.%d\n",
> +				ret / 10000, ret % 10000);
>  		break;
>  	case MAX20730_DEBUGFS_FREQUENCY:
>  		val = (data->mfr_devset1 & MAX20730_MFR_DEVSET1_FSW_MASK)
> @@ -141,7 +141,7 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
>  			ret = 800;
>  		else
>  			ret = 900;
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
>  		break;
>  	case MAX20730_DEBUGFS_PG_DELAY:
>  		val = (data->mfr_devset1 & MAX20730_MFR_DEVSET1_TSTAT_MASK)
> @@ -223,7 +223,7 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
>  	case MAX20730_DEBUGFS_OC_PROTECT_MODE:
>  		ret = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_OCPM_MASK)
>  			>> MAX20730_MFR_DEVSET2_OCPM_BIT_POS;
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
>  		break;
>  	case MAX20730_DEBUGFS_SS_TIMING:
>  		val = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_SS_MASK)
> @@ -241,32 +241,32 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
>  	case MAX20730_DEBUGFS_IMAX:
>  		ret = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_IMAX_MASK)
>  			>> MAX20730_MFR_DEVSET2_IMAX_BIT_POS;
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
>  		break;
>  	case MAX20730_DEBUGFS_OPERATION:
>  		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_OPERATION);
>  		if (ret < 0)
>  			return ret;
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
>  		break;
>  	case MAX20730_DEBUGFS_ON_OFF_CONFIG:
>  		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_ON_OFF_CONFIG);
>  		if (ret < 0)
>  			return ret;
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
>  		break;
>  	case MAX20730_DEBUGFS_SMBALERT_MASK:
>  		ret = i2c_smbus_read_word_data(psu->client,
>  					       PMBUS_SMB_ALERT_MASK);
>  		if (ret < 0)
>  			return ret;
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
>  		break;
>  	case MAX20730_DEBUGFS_VOUT_MODE:
>  		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_VOUT_MODE);
>  		if (ret < 0)
>  			return ret;
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
>  		break;
>  	case MAX20730_DEBUGFS_VOUT_COMMAND:
>  		ret = i2c_smbus_read_word_data(psu->client, PMBUS_VOUT_COMMAND);
> @@ -274,8 +274,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
>  			return ret;
>  
>  		ret = VOLT_FROM_REG(ret * 10000);
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX,
> -			       "%d.%d\n", ret / 10000, ret % 10000);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX,
> +				"%d.%d\n", ret / 10000, ret % 10000);
>  		break;
>  	case MAX20730_DEBUGFS_VOUT_MAX:
>  		ret = i2c_smbus_read_word_data(psu->client, PMBUS_VOUT_MAX);
> @@ -283,8 +283,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
>  			return ret;
>  
>  		ret = VOLT_FROM_REG(ret * 10000);
> -		len = snprintf(tbuf, DEBUG_FS_DATA_MAX,
> -			       "%d.%d\n", ret / 10000, ret % 10000);
> +		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX,
> +				"%d.%d\n", ret / 10000, ret % 10000);
>  		break;
>  	default:
>  		len = strlcpy(tbuf, "Invalid\n", DEBUG_FS_DATA_MAX);
