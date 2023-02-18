Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB23C61DA4
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Feb 2023 14:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjBROmi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Feb 2023 09:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBROmi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Feb 2023 09:42:38 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3931118170
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Feb 2023 06:42:37 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id u5so194495ilk.9
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Feb 2023 06:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27W8CUyexh2vu12/gxgNlkkmgM6sdtK1sFdSW2Pyqg0=;
        b=RuufT0yiCG9HfEUVfZW3Vp4gXhqEZF9wxtkYMuMmrB8iGfwuvzKaIBOB3ain7nFZeo
         hXDBrSaFg//xXCGlc+ZYoLFRKF0itCfGY13XwrA9j8y33rMBhEhYFCdebO2yEV30LMu2
         zQMjCFKg2F2xBgQL5SeE9BkdS0n7Aw56BX/nRpf7AbC7B6hcMVgWBXrPym65mWoz/abw
         LDMT3ytwJS0/38cb63tYVLwByQgPm8+CB/7cmz6byiOAiXIqkMW+FsiQoq2WTZJar2AZ
         i2FY/NNe17QdxxyKEgqqEKi1Y+4mhr0r/N9cnSUrIdaSI3x7trZcy+NUNqLIqVKC9CHw
         w2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27W8CUyexh2vu12/gxgNlkkmgM6sdtK1sFdSW2Pyqg0=;
        b=KpOSkCP50zQcElt4SU42kyQz0DQLgNzBGw3ujEpCFgxWI08uJd1Rxgz3zbGaNFGhV9
         ImT4G3UH3xUfgj+Z42fgxrpqS6YpaX402zptAYf5OnUDbOIiUxcGsMRc3Zadhf6uH2hV
         NUCny4hsrwO1LhXrLV0DYTAwhAKYkuZtVsdgGPrc112GJnMyXM8JNWtFNzN14LB6I29i
         iKAEFP3EKRRvGc1yIv1LozbA9UVWouqZ0O8Dbt8UYXWduFOqKA/qAndaYZXmkjIvfPYe
         Z0f+IPF5e7XHOnlY14KFGaV1DplvXodrFySTYVrLjd9eMkoJFU+0/DXdo0FihymjF3cU
         jSHQ==
X-Gm-Message-State: AO0yUKVgbTkKk6AUmR6ycoqg1BSl6rS0NTI4rVmMg9iNlpjTT7tVFCw6
        nfuHQmocf4e6bf1jLKWz90mEKvSJIOY=
X-Google-Smtp-Source: AK7set+6I0n+xIIWYgJrI7Ymxl5/UwQ6yquap6CpzPB6Bbhd/O7y9NIAmlRxiB0c1IQ6MuTtHxrtww==
X-Received: by 2002:a05:6e02:1ca9:b0:313:ce4b:a435 with SMTP id x9-20020a056e021ca900b00313ce4ba435mr3809656ill.25.1676731356559;
        Sat, 18 Feb 2023 06:42:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1-20020a056e020c2100b0031537da6ba3sm93267ilg.87.2023.02.18.06.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 06:42:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 18 Feb 2023 06:42:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Enrico Mioso <mrkiko.rs@gmail.com>, linux-hwmon@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] net: phy: aquantia: clamp temperature value in
 aqr_hwmon_set
Message-ID: <20230218144234.GA2652402@roeck-us.net>
References: <20230217231647.968107-1-mrkiko.rs@gmail.com>
 <Y/AtxyXsMVHf0ygt@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/AtxyXsMVHf0ygt@lunn.ch>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Feb 18, 2023 at 02:45:43AM +0100, Andrew Lunn wrote:
> > diff --git a/drivers/net/phy/aquantia_hwmon.c b/drivers/net/phy/aquantia_hwmon.c
> > index 19c4c280a6cd..6444055e720c 100644
> > --- a/drivers/net/phy/aquantia_hwmon.c
> > +++ b/drivers/net/phy/aquantia_hwmon.c
> > @@ -70,8 +70,7 @@ static int aqr_hwmon_set(struct phy_device *phydev, int reg, long value)
> >  {
> >  	int temp;
> >  
> > -	if (value >= 128000 || value < -128000)
> > -		return -ERANGE;
> > +	clamp_val(value, -128000, 128000);
> 
> It could be argued that value < -128000 should return
> -EUNOBTAINABLE. I've had trouble getting DRAMS to work at -40C, even

Hmm, I don't see that one anywhere.

> those listed as industrial. Setting an alarm for -128C is pointless.
> 
> +128C is also a bit questionable. The aQuantia PHYs do run hot, you
> often see a heat sink, and they are supposed to support up to 108C. So
> an alarm for 128C probably also does not work.
> 

It has been an endless argument if limits should be clamped to the
limits supported by the chip registers or to the limits supported by
the chip according to its datasheet. I personally see that as the
responsibility of the person actually configuring the limits, not the
driver. After all, there could be chip variants supporting different
limits, and who knows what chip variants are going to be available
in the future. Anyway, as I said, this has been an endless argument,
and it is another detail that I usually let driver developers decide
because they often feel passionate about it.

Guenter

> Anyway, as Guenter suggested, please change -ERANGE to -EINVAL.
> 
>      Andrew
