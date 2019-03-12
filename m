Return-Path: <SRS0=gDtV=RP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E853EC43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Mar 2019 15:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B81B52054F
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Mar 2019 15:27:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGCsKchf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbfCLP1C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Mar 2019 11:27:02 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44414 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfCLP1C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Mar 2019 11:27:02 -0400
Received: by mail-pf1-f194.google.com with SMTP id a3so2060398pff.11
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Mar 2019 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5onZcB4Kx1sA6z3poglGUeR66ZutvqKzCd0nCvcPU4M=;
        b=bGCsKchfZ0LDej/PzRhc7x4wCXSWEzxLCs3A9xTLv0ipIe0/ZXgOICXYP3bgsGuf5M
         9BfD1e8coMRMWaFIoqpJowSly7WwFhMS+DeRUg92l0K4AF0xbH2eCQ2t1xT1qIsB+MXm
         q0g3VvSlajfyPolRm5Oob5+1dnRwPA3akeuf3fYd8YoHdQurCvkY4OEQGsW/0LcWnMk3
         XmfbhfIX3yF4pSNzLBa7uqZwPFvl46DkPRtCY9HgkSVh8xTLoEMgrQQbNB1Q03WV3+/6
         NTvHZ/RlxSZgJ/n2JWO37o9ql75KU1U2Ik/tQanuGXTz4fE6a79INRvlOiT/TcfwZAjs
         0OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5onZcB4Kx1sA6z3poglGUeR66ZutvqKzCd0nCvcPU4M=;
        b=KEUS94qcE3DPpLI/NKYUTEwFDO4yyhRElf0gGqrAaQqOYokH9Io01VL6AFq5w8ZhMn
         cW37ueaPsvoaUh9qMD+yIc5FcPyT3gs0CRkCn7gWPczpL1DY43YecwfxnbVNJdJchcxx
         +1kLr74H2gB1OmbvI913RY1tuDd+/Fn/LAr+Q6a/SXFCbbNEdux1whqWL1sCXtsGoksk
         rM+m0hYRKI9A6aM1eHqyNwYqog0jq8EmQbvJch9LW+ceN2CmBVar6m9Y5O8bdTP5eqnT
         otlhORiyYKer5/m21lfiMrDwtrMvWaNWbBZ/jtVkbNsWXJerOAZ816u2EPdQRrHWzh/U
         2CmQ==
X-Gm-Message-State: APjAAAXOgb/4/4AF0aIos5ZUmhRvMUxhRKZKw7iK+2MOtpQ8uaSwYUpL
        ckPA/CP94gdkj00EOGHDtAfJUJny
X-Google-Smtp-Source: APXvYqzhHBywFmliNFpyoVKPmTdWmmQXS0cRuqTNzyffu6Cy/66aNAf9Biyht/oQwiLdXp5eRbuIfQ==
X-Received: by 2002:a17:902:7896:: with SMTP id q22mr2510886pll.66.1552404421264;
        Tue, 12 Mar 2019 08:27:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a2sm12031279pff.58.2019.03.12.08.26.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2019 08:26:59 -0700 (PDT)
Date:   Tue, 12 Mar 2019 08:26:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Carlos Menin <carlos.menin@outlook.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: adc128d818: Fix value read from Device Tree
Message-ID: <20190312152658.GA11644@roeck-us.net>
References: <FR1P152MB28554B3FC5B4F6303019337993490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FR1P152MB28554B3FC5B4F6303019337993490@FR1P152MB2855.LAMP152.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 12, 2019 at 01:14:39PM +0000, Carlos Menin wrote:
> Cells in DT are 32-bits in size. of_property_read_u8() does not work
> properly as it returns incorrect values in little-endian architectures.
> Fix it by using of_property_read_u32() instead.
> 
Are you saying that pretty much all callers of of_property_read_u8()
have this problem ? I would not rule that out, but it seems hard to
believe.

Guenter

> Signed-off-by: Carlos Menin <carlos.menin@outlook.com>
> ---
>  drivers/hwmon/adc128d818.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> index ca794bf..b5eb3c0 100644
> --- a/drivers/hwmon/adc128d818.c
> +++ b/drivers/hwmon/adc128d818.c
> @@ -70,7 +70,7 @@ struct adc128_data {
>  	struct regulator *regulator;
>  	int vref;		/* Reference voltage in mV */
>  	struct mutex update_lock;
> -	u8 mode;		/* Operation mode */
> +	u32 mode;		/* Operation mode */
>  	bool valid;		/* true if following fields are valid */
>  	unsigned long last_updated;	/* In jiffies */
>  
> @@ -467,7 +467,7 @@ static int adc128_probe(struct i2c_client *client,
>  	}
>  
>  	/* Operation mode is optional. If unspecified, keep current mode */
> -	if (of_property_read_u8(dev->of_node, "ti,mode", &data->mode) == 0) {
> +	if (of_property_read_u32(dev->of_node, "ti,mode", &data->mode) == 0) {
>  		if (data->mode > 3) {
>  			dev_err(dev, "invalid operation mode %d\n",
>  				data->mode);
> -- 
> 2.7.4
> 
