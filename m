Return-Path: <SRS0=EIaL=EM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA2FC55178
	for <linux-hwmon@archiver.kernel.org>; Fri,  6 Nov 2020 13:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61E1F20702
	for <linux-hwmon@archiver.kernel.org>; Fri,  6 Nov 2020 13:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maqFtSTX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgKFNOW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 6 Nov 2020 08:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbgKFNOW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 Nov 2020 08:14:22 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A47C0613CF;
        Fri,  6 Nov 2020 05:14:22 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id j7so1254150oie.12;
        Fri, 06 Nov 2020 05:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HfIcnUOCiqm8KGo7jqQxuAJL9Z7FwR/jRhz/LiZu/ME=;
        b=maqFtSTX4vrARH5CBE7mVuOTfkVnnW44pMzlsUnMesYrvfKn/+r55yhqU+HqUD10VQ
         10UUpxLFi5NNa5LK4EdugOxfDBYBY26bT5jeWvZPoJEEDHpAhgsSoqQPs4BWhFKSktPU
         DWP3q18XbRNPlliCbdAN18r13Ir70QQ7HwZl19mFCT3Kv4ccDItO78b6AbZbdcRfj/03
         6QZ1o6hDPhPEimEmbCnwRenpwoONF0EIv27GNHFb8rRkQI+a1ZNWCFygxWMt/dtZ+amV
         GrLZarc57Md3ICHYlZj6Xn+DcBo3517EvFGTIjp+/Fyng9NK3dcqs9EGJJZ5jp0yBcUu
         t1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HfIcnUOCiqm8KGo7jqQxuAJL9Z7FwR/jRhz/LiZu/ME=;
        b=Yr+tlp9poYPJBTawC3uyn7CMZw5m2TH8NknRJ7qvnCM0ekb6QFi7WcIRdv5EjJizmN
         ymSWihk3sHAncw3XWITTyPJj2TOZnZtcWc5/U66MWD4OK5B3ptGoibDO44IchxyAq3Bm
         a67y0ZG+FU54j6Tm9ragPrLOnb9e1MvT6ah+hrOs6wUyiby1Dv+rZX2jgRzpXT0blObJ
         ZemHBFn6Ee40tI6gNFUWLf045KDWyNAXkolKlIYnztzeH8JJDdEJIbRcrjoMOtXFaexC
         nZbbed6qmVe8p99kJUfdM3A0EbCYLZNht80mbX/n/EPgThNr8GHLYObW2kdSQwxEnM2B
         MMXQ==
X-Gm-Message-State: AOAM532dNilGXkQK9OlwOf2ARwmfIFCNvKMcAjG4DHR/EfbLtkTQmIjO
        RYLLaG64v0h3/xlRnipD9CMs4v7Imuw=
X-Google-Smtp-Source: ABdhPJzotT2iWwpopM/z4OSJeNJ4HRhceFErQXxX+7AkSznwkIJiFdTMX+5R81akFKRHx7dJ4aquFg==
X-Received: by 2002:aca:4387:: with SMTP id q129mr1087787oia.108.1604668461749;
        Fri, 06 Nov 2020 05:14:21 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 62sm281898otj.37.2020.11.06.05.14.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Nov 2020 05:14:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 6 Nov 2020 05:14:20 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com, ardeleanalex@gmail.com, Mark.Thoren@analog.com
Subject: Re: [PATCH 2/3] docs: hwmon: (ltc2945): change type of val to ULL in
 ltc2945_val_to_reg()
Message-ID: <20201106131420.GC14837@roeck-us.net>
References: <20201106101825.30960-1-alexandru.ardelean@analog.com>
 <20201106101825.30960-2-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106101825.30960-2-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 06, 2020 at 12:18:24PM +0200, Alexandru Ardelean wrote:
> In order to account for any potential overflows that could occur.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/hwmon/ltc2945.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/ltc2945.c b/drivers/hwmon/ltc2945.c
> index 1cea710df668..75d997d31e01 100644
> --- a/drivers/hwmon/ltc2945.c
> +++ b/drivers/hwmon/ltc2945.c
> @@ -155,7 +155,7 @@ static long long ltc2945_reg_to_val(struct device *dev, u8 reg)
>  }
>  
>  static int ltc2945_val_to_reg(struct device *dev, u8 reg,
> -			      unsigned long val)
> +			      unsigned long long val)
>  {
>  	struct ltc2945_state *st = dev_get_drvdata(dev);
>  	struct regmap *regmap = st->regmap;
> @@ -181,14 +181,14 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
>  			return ret;
>  		if (control & CONTROL_MULT_SELECT) {
>  			/* 25 mV * 25 uV = 0.625 uV resolution. */
> -			val = DIV_ROUND_CLOSEST(val, 625);
> +			val = DIV_ROUND_CLOSEST_ULL(val, 625);
>  		} else {
>  			/*
>  			 * 0.5 mV * 25 uV = 0.0125 uV resolution.
>  			 * Divide first to avoid overflow;
>  			 * accept loss of accuracy.
>  			 */
> -			val = DIV_ROUND_CLOSEST(val, 25) * 2;
> +			val = DIV_ROUND_CLOSEST_ULL(val, 25) * 2;
>  		}
>  		break;
>  	case LTC2945_VIN_H:
> @@ -197,7 +197,7 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
>  	case LTC2945_MAX_VIN_THRES_H:
>  	case LTC2945_MIN_VIN_THRES_H:
>  		/* 25 mV resolution. */
> -		val /= 25;
> +		val = div_u64(val, 25);
>  		break;
>  	case LTC2945_ADIN_H:
>  	case LTC2945_MAX_ADIN_H:
> @@ -219,7 +219,7 @@ static int ltc2945_val_to_reg(struct device *dev, u8 reg,
>  		 * dividing the reported current by the sense resistor value
>  		 * in mOhm.
>  		 */
> -		val = DIV_ROUND_CLOSEST(val, 25);
> +		val = DIV_ROUND_CLOSEST_ULL(val, 25);
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -247,13 +247,13 @@ static ssize_t ltc2945_value_store(struct device *dev,
>  	struct ltc2945_state *st = dev_get_drvdata(dev);
>  	struct regmap *regmap = st->regmap;
>  	u8 reg = attr->index;
> -	unsigned long val;
> +	unsigned long long val;
>  	u8 regbuf[3];
>  	int num_regs;
>  	int regval;
>  	int ret;
>  
> -	ret = kstrtoul(buf, 10, &val);
> +	ret = kstrtoull(buf, 10, &val);

This part of the change is unnecessary. Just keep 'val' as-is.
ltc2945_val_to_reg() can still accept ull.

Guenter

>  	if (ret)
>  		return ret;
>  
> -- 
> 2.27.0
> 
