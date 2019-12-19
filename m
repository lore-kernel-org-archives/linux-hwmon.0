Return-Path: <SRS0=pEIx=2J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23420C43603
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Dec 2019 03:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5A022072B
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Dec 2019 03:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ajb5T/ks"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfLSDxx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Dec 2019 22:53:53 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34554 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfLSDxx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Dec 2019 22:53:53 -0500
Received: by mail-pg1-f195.google.com with SMTP id r11so2406352pgf.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2019 19:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fk0nPzAUeuLgNCRVt1AoKukAcF0h7NmaTn9F9bQK2do=;
        b=Ajb5T/ksbciKzWoUDDHJ8F/ezUxXRJGm9o7BI+kkVW4kd7LHNoNuXkxR4StKM62sZ2
         RNsaB7NzdovijDFjd3AVb+SLtZM4Aob/9tD+DvSjHlqsT3UgnZ2DJDJze7NjjfaG732d
         36nijwC7DbrjS0N6A69bORiax645kNXZyslvvED0gRk9+4AsqkVv7UrK+QF646hfYGR7
         BuhFJPl5wqOFGlPY+GVoF2lHpdnS8aV2ADPxY4Lsrwxpfae+uETV1OcdfHRXdF3XD3ME
         0H3ve5WkEa+tbBAIhYfoxjb+sdPXzPtfJuWNW5ks/gnl+Jmb9L7a1ITEXXpibjRJjLJb
         LSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fk0nPzAUeuLgNCRVt1AoKukAcF0h7NmaTn9F9bQK2do=;
        b=tuXr+wEFAhB3dn1+a4kf03txc4GMLQlWfgqsDqld5GQ3pxwwysgk712ItMQNPe4VHD
         0rf6g/e+nUvNkl32hTebCh4Aa1aa8XC0RYeIPmHi6NHeXNyrafzKTJRCb8RERDKIqgKi
         YxFiZctHIyQ3eCf9bcTaXBrLUhYkRamecJMeO2YV2RK2UWBg1D+vYM7ztoUaC+mBfG5b
         hB5NpKZS7KSy1/kPgNUpldlB+YLED+hgNe4tPN/mc9zkpp05GZukWngmXnt0HYqIQCQX
         b9Ek1dFgy8xWySACGV2wH4pqcX0RNZG5168UUy4bwe/jo8PYN1783r1PUVIw/5+aPPbR
         xJPQ==
X-Gm-Message-State: APjAAAUoXMdpODR6ks5RIys7nAYveW6CEsG44U9oRSktswRwmv/n2EgH
        nyDqIHBFHK9W+mMIsFn1dhzuebLj
X-Google-Smtp-Source: APXvYqyzr/qGy+mZvCCNQj2ETqEgPvEZWeymrW3y2sIpWyM6MNKbBHxBORHOBCLUXuDuak6742+frA==
X-Received: by 2002:a63:1e47:: with SMTP id p7mr6677660pgm.339.1576727631880;
        Wed, 18 Dec 2019 19:53:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q12sm4568786pjq.10.2019.12.18.19.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 19:53:50 -0800 (PST)
Subject: Re: [PATCH v2 2/2] hwmon: (adt7475) Added attenuator bypass support
To:     Logan Shaw <logan.shaw@alliedtelesis.co.nz>, jdelvare@suse.com
Cc:     joshua.scott@alliedtelesis.co.nz, linux-hwmon@vger.kernel.org
References: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
 <20191219033213.30364-3-logan.shaw@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e88b029b-dbb3-e423-5c37-0917d7716b66@roeck-us.net>
Date:   Wed, 18 Dec 2019 19:53:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219033213.30364-3-logan.shaw@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/18/19 7:32 PM, Logan Shaw wrote:
> Added a new file documenting the adt7475 devicetree and added the five
> new properties to it.
> 
> Signed-off-by: Logan Shaw <logan.shaw@alliedtelesis.co.nz>
> ---
> ---
>   .../devicetree/bindings/hwmon/adt7475.txt     | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> new file mode 100644
> index 000000000000..388dd718a246
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> @@ -0,0 +1,35 @@
> +*ADT7475 hwmon sensor.
> +
> +Required properties:
> +- compatible: One of
> +	"adi,adt7473"
> +	"adi,adt7475"
> +	"adi,adt7476"
> +	"adi,adt7490"
> +
> +- reg: I2C address
> +
> +optional properties:
> +
> +- bypass-attenuator-all: Configures bypassing all voltage input attenuators.
> +	This is only supported on the ADT7476 and ADT7490, this property does
> +	nothing on other chips.

Both adt7473 and adt7475 do support configuring an attenuator on VCCP

> +		property present: Bit set to bypass all voltage input attenuators.
> +		property absent: Registers left unchanged.
> +
> +- bypass-attenuator-inx: Configures bypassing individual voltage input
> +	attenuators, where x is an integer from the set {0, 1, 3, 4}. This
> +	is only supported on the ADT7476 and ADT7490, this property does nothing
> +	on other chips.
> +		property present: Bit set to bypass specific voltage input attenuator
> +			for voltage input x.
> +		property absent: Registers left unchanged.
> +
This is interesting. It essentially means "retain configuration from ROM
Monitor", but leaves no means to _disable_ the bypass.

> +Example:
> +
> +hwmon@2e {
> +	compatible = "adi,adt7475";
> +	reg = <0x2e>;
> +	bypass-attenuator-all;
> +	bypass-attenuator-in1;

What would be the purpose of specifying both all and in1 ?

> +};
> \ No newline at end of file
> 

