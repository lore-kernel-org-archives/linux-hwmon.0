Return-Path: <SRS0=kUOG=TA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B1CC43219
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 16:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3995820645
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 16:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq8bjf+s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfD3QzO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Apr 2019 12:55:14 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33460 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfD3QzO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Apr 2019 12:55:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id z28so2049460pfk.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2019 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Io0AIQG9+eqoJt7vbIjHlf2ENptY9TLYl30+II0/2/M=;
        b=Tq8bjf+sef+nloY0+bJQIRm0JKUM53txCg/Ep4X0/4JNRQjJ+vZ09P5/CX46/Zzwkh
         ZhwzDXFKOHN4ynHLCeoOCHzyF3mAhvWEV74dbZHkNR2lNKi9dogBz1Pwzyz7m1qPTjDF
         ndf6jvK9mOYPaaqXHKh1IW2g2TTFMmwCA3hagTfrDo4qDMR/mnzp8IcoZxbLkIDtFkht
         g4DFsz4CqjEGObe80nzeb5clLDT5SoZ0vTL8fmAWhWTZJgIdZvANDEl5M27Trg7+AUUu
         DeZlInlwdd2E5phv2ergjsq8mlAIEiqEgp9fQ2Jiw79RQ8XkXDsq3SAHOFnaOcviVUT0
         q7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Io0AIQG9+eqoJt7vbIjHlf2ENptY9TLYl30+II0/2/M=;
        b=fT3kRijBawEN7oa8RioX1zYHOxkenalJ4dqjKYufobUT5Uz/YjSSvaK6+nMFFir74U
         O2YG2lJpFW+7psuZik2ySdr2luCGj2ORwbXS33vSXEaF7iondSmXqO9TWnXxHKp2pCtf
         9C+ZcmSgGA2dq7RSPj4t64DZAfIlNlqVAXj67wBtAsX+EECbXsflYp4ww+EtqvteO4E3
         vsxIVZQe5qeiz/S3/PgQ5Sx45vLx2o8YrC6EnMlCGwKqLHOLipx7YTTdVNWurgv2PqRz
         wHBW2KAx2QUnn+JylifgyIK4vBU0S9SBym8iJ5bRsQL1ndsJFcrDUL9L7I2AxqZVrrOR
         KCDA==
X-Gm-Message-State: APjAAAU9D0ORsdzO70fNnq7w1VJwurKbPfT5dVYXlISIihLhldB8bOV0
        VhjmRQLoFsuigmMcBdNs3rsmn+Sg
X-Google-Smtp-Source: APXvYqyDH3i6g2QUWxa7pKW8A5m/jZ7JTGS9agjj1Btdn/W2fUcYPyfdjr2ZFWy/TM8muU1ruco0BQ==
X-Received: by 2002:a65:4247:: with SMTP id d7mr22922500pgq.114.1556643313818;
        Tue, 30 Apr 2019 09:55:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i15sm49831781pfd.162.2019.04.30.09.55.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 09:55:12 -0700 (PDT)
Date:   Tue, 30 Apr 2019 09:55:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Iker Perez <iker.perez@codethink.co.uk>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (lm75) Add support for TMP75B
Message-ID: <20190430165511.GA2699@roeck-us.net>
References: <20190430144609.19500-1-iker.perez@codethink.co.uk>
 <20190430144609.19500-2-iker.perez@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430144609.19500-2-iker.perez@codethink.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 30, 2019 at 03:46:08PM +0100, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> The TMP75B has a different control register, supports 12-bit
> resolution and the default conversion rate is 37 Hz.
> 
> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> ---
>  Documentation/hwmon/lm75 |  7 +++++--
>  drivers/hwmon/lm75.c     | 11 +++++++++++
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75
> index 010583608f12..0cff924cdbba 100644
> --- a/Documentation/hwmon/lm75
> +++ b/Documentation/hwmon/lm75
> @@ -47,8 +47,10 @@ Supported chips:
>      Addresses scanned: none
>      Datasheet: Publicly available at the ST website
>  	       https://www.st.com/resource/en/datasheet/stlm75.pdf
> -  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75C, TMP175, TMP275
> -    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175', 'tmp75', 'tmp75c', 'tmp275'
> +  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75B, TMP75C,
> +                      TMP175, TMP275
> +    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175', 'tmp75',
> +              'tmp75b', 'tmp75c', 'tmp275'
>      Addresses scanned: none
>      Datasheet: Publicly available at the Texas Instruments website
>                 http://www.ti.com/product/tmp100
> @@ -56,6 +58,7 @@ Supported chips:
>                 http://www.ti.com/product/tmp105
>                 http://www.ti.com/product/tmp112
>                 http://www.ti.com/product/tmp75
> +               http://www.ti.com/product/tmp75b
>                 http://www.ti.com/product/tmp75c
>                 http://www.ti.com/product/tmp175
>                 http://www.ti.com/product/tmp275
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 447af07450f1..cdb1e7833976 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -59,6 +59,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>  	tmp175,
>  	tmp275,
>  	tmp75,
> +	tmp75b,
>  	tmp75c,
>  };
>  
> @@ -378,6 +379,11 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		data->resolution = 12;
>  		data->sample_time = MSEC_PER_SEC / 2;
>  		break;
> +	case tmp75b:
> +		clr_mask |= 1 << 15;    /* not one-shot mode */
> +		data->resolution = 12;
> +		data->sample_time = MSEC_PER_SEC / 4;

Looking into the datasheet, this isn't really correct,
since the configuration register is not updated accordingly.
The default, as mentioned in the description of this patch,
is 37 ms, not 250 ms. There are multiple options:
- Set the sample time to a fixed value, and update the
  configuration register accordingly.
- Read the sample time from the configuration register
  and report it.
- Add support for updating the sample time to the driver.

Either case, the reported value should match reality.

Thanks,
Guenter

> +		break;
>  	case tmp75c:
>  		clr_mask |= 1 << 5;		/* not one-shot mode */
>  		data->resolution = 12;
> @@ -438,6 +444,7 @@ static const struct i2c_device_id lm75_ids[] = {
>  	{ "tmp175", tmp175, },
>  	{ "tmp275", tmp275, },
>  	{ "tmp75", tmp75, },
> +	{ "tmp75b", tmp75b, },
>  	{ "tmp75c", tmp75c, },
>  	{ /* LIST END */ }
>  };
> @@ -537,6 +544,10 @@ static const struct of_device_id lm75_of_match[] = {
>  		.data = (void *)tmp75
>  	},
>  	{
> +		.compatible = "ti,tmp75b",
> +		.data = (void *)tmp75b
> +	},
> +	{
>  		.compatible = "ti,tmp75c",
>  		.data = (void *)tmp75c
>  	},
> -- 
> 2.11.0
> 
