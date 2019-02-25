Return-Path: <SRS0=SUeP=RA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E05C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 14:36:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74EF920842
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Feb 2019 14:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/Y15jv+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfBYOgn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Feb 2019 09:36:43 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40914 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbfBYOgn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Feb 2019 09:36:43 -0500
Received: by mail-pf1-f193.google.com with SMTP id h1so4589825pfo.7;
        Mon, 25 Feb 2019 06:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pQ2J6rQM6+foEe28BDRFr9abanukqPnZf0fCCvA+QFQ=;
        b=Y/Y15jv+MjR+R/53bDDppA556FI1RQxFOCQRnHcw2Rs0HFErmVKuduKT69skr0R5Op
         OSmIuLewqi+LiGR0mTRXmBZWcd0QAYFwj1qcTZ2P1svBbppRk27PwxOkjqHxmCZB2Njv
         QFvl+QSKE4Hts1X16SvZCpYqsRR8Qbf4TKjXd/z+ofDabXll2IoPhCA8uZL0XGEx6QNb
         gw54RVTPPgSRsIMkmv5kJ937ZJM1rQ+pdj8sb3QWMtBEosebz0Xr+muf8/3RYC1H63MM
         6IZJfrrJoBKiAwhn6UchDqSfRV9kJxqCtUUhwnUuP1yHPJkh3A5nXgNLCVXIOLRrwFyM
         zyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=pQ2J6rQM6+foEe28BDRFr9abanukqPnZf0fCCvA+QFQ=;
        b=jt0Cdb5Ehr1jhE1eLOtpMw6nuO9a43llWVPxnehrf1Hkh+OLtJgEj02lcomcOY7lVt
         9yK50nzFePGW9JbCPHpcdYQ3WQFea3YMFM8Z22FQlc5K2CJLhsYAKHbDPnQppa8PN0xE
         EM3kzqDx8xU3xHjrupmiZqey1v23Ep9hNKgfijSMlIiR9ZjId7gjNknEf1Fk2zoYeB98
         8U04Rn49cdD3uDSDc++LyMxRGaIlYunAtV/I54fBsTVVYY5ObZvi9+fVgIqNQ8wrYmFW
         lOaYgcqMlTNo/4HI/799mOuvyaZTDXYk6aabrIld7+U/RqUOSSZrtqipNFsn1pSLKVbe
         5xvQ==
X-Gm-Message-State: AHQUAuZSNGBNiUpW0KRJaV5WPqwnileNR4L6+XC3iFrzsQ9MPwt57Brs
        rXLZdkurNhTd/Ri82hlrWMpxzCKm
X-Google-Smtp-Source: AHgI3IbFb+51adq2mLWJalpjEgKBiuq25t03rNF2bwGg873DFYrt4t311qZcedIVWaC9IgnLgNWg+g==
X-Received: by 2002:a65:60c7:: with SMTP id r7mr19840706pgv.37.1551105402348;
        Mon, 25 Feb 2019 06:36:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z185sm18184485pfb.17.2019.02.25.06.36.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Feb 2019 06:36:41 -0800 (PST)
Date:   Mon, 25 Feb 2019 06:36:39 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (ad741x) Add DT bindings for Analog Devices
 AD741x
Message-ID: <20190225143639.GA5781@roeck-us.net>
References: <20190128210637.22323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128210637.22323-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 28, 2019 at 10:06:36PM +0100, Linus Walleij wrote:
> This adds device tree bindings for Analog Devices AD741x
> as found in Gateway routers.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/ad741x.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ad741x.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ad741x.txt b/Documentation/devicetree/bindings/hwmon/ad741x.txt
> new file mode 100644
> index 000000000000..9102152c8410
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ad741x.txt
> @@ -0,0 +1,15 @@
> +* AD7416/AD7417/AD7418 Temperature Sensor Device Tree Bindings
> +
> +Required properties:
> +- compatible: one of
> +		"adi,ad7416"
> +		"adi,ad7417"
> +		"adi,ad7418"
> +- reg: I2C address
> +
> +Example:
> +
> +hwmon@28 {
> +	compatible = "adi,ad7418";
> +	reg = <0x28>;
> +};
