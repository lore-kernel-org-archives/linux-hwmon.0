Return-Path: <SRS0=13Sa=SA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79780C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 16:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48275218D0
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 16:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H073EUew"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbfC2QwX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Mar 2019 12:52:23 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40515 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729762AbfC2QwX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Mar 2019 12:52:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id c207so1325738pfc.7;
        Fri, 29 Mar 2019 09:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cpQPNU/R4Kx6x0B8bjpeY8PUKFIiBLFrZX2FasTwC7Y=;
        b=H073EUewkTRpOTgIekkeG+AW594yat0Rgv07D80coZRKPHEqVqLCRqnc3Er+ortnMx
         OCwQ/9IhGyXTiB2V2DVJ48jnYq8ZlNa99CTyddIdfqwtnpHUXl4MEzhxvSRHfWPfGI6o
         wNWaOv4f4tp48zv5aV/ZT+HIHU5XksdQCHnbJDaFkbB4GHYfeFmyCWiLpo1oD1Thrmax
         WBqgVepIGJDEClGYKLKjNmkD2JKSqqSH2JnI9naieBqnL4AQqdizHgQXBy623HbpjhHH
         Zi6Wwch/3632qE8kp5WtFRt63/8Gs+kLx/xryAwx9kM7JpEMZiYapiQ3cXysQakCCx7r
         2hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cpQPNU/R4Kx6x0B8bjpeY8PUKFIiBLFrZX2FasTwC7Y=;
        b=b7lJ0MwJdAIEjMWOTA2Q5RZ5Te8YggcN29I4n+TtKW/T1UuF0uhNF/OML011YuZVGt
         hQS76V+UrpX4aZi2QdIVFC7j5WtrLf47eVCa/irUuRQ9eX7Bq1d0kUgAe2RqdaEnAjY+
         JvSJphEhRZA36EsLEvBSgW8GEJEjMcagWg/hR2Gjen24hylx8/Zn2uQYoUE+RvGequR3
         PuLtBQOYIM3ltABf6EXQER3mJ84J2HOL0aZw2yQtXvEuq+Um7br0ZuAmRDP3pzCa3fH7
         V6iF1ITKaz898nqj42NjoeWaM4OrRiwnRr1x0gnpPzlFFCFjsWH7/aVB2aWfJ8hGX5Hs
         8e7Q==
X-Gm-Message-State: APjAAAVoyzqtjRkCdykitVjvLiZckECKmLhlcJZ67SL5QzlYpI3SrxZv
        Bcua9JYQPnuGdw4HlKjKgu0=
X-Google-Smtp-Source: APXvYqyzYKrSa08Ih0/9e5e25W6xqjry18vBQKcJ5Qdd1jPKL1Fr04QYH/zbo6q3OWh3GVg9P5o6ZQ==
X-Received: by 2002:a63:3d85:: with SMTP id k127mr31547109pga.152.1553878342804;
        Fri, 29 Mar 2019 09:52:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u17sm3602465pfn.19.2019.03.29.09.52.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2019 09:52:22 -0700 (PDT)
Date:   Fri, 29 Mar 2019 09:52:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Carlos Menin <menin@carlosaurelio.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: (adc128d818) Specify ti,mode
 property size
Message-ID: <20190329165221.GA28218@roeck-us.net>
References: <20190313141125.GA26062@carlosaurelio.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313141125.GA26062@carlosaurelio.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Mar 13, 2019 at 11:11:26AM -0300, Carlos Menin wrote:
> By default, cells in DT are 32-bit in size. The driver reads "ti,mode"
> using the function of_property_read_u8() which causes the value to be
> read incorrectly in little-endian architectures if the size is not
> specified.
> 
> Make it explicit in the binding documentation that this prorperty must
> be set as a 8-bit value.
> 
> Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/adc128d818.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adc128d818.txt b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
> index 08bab0e..d0ae46d 100644
> --- a/Documentation/devicetree/bindings/hwmon/adc128d818.txt
> +++ b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
> @@ -26,7 +26,7 @@ Required node properties:
>  
>  Optional node properties:
>  
> - - ti,mode:     Operation mode (see above).
> + - ti,mode:     Operation mode (u8) (see above).
>  
>  
>  Example (operation mode 2):
> @@ -34,5 +34,5 @@ Example (operation mode 2):
>  	adc128d818@1d {
>  		compatible = "ti,adc128d818";
>  		reg = <0x1d>;
> -		ti,mode = <2>;
> +		ti,mode = /bits/ 8 <2>;
>  	};
