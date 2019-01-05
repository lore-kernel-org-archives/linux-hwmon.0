Return-Path: <SRS0=8Zs/=PN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1022C43387
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Jan 2019 17:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 909182070C
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Jan 2019 17:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfAS5u5/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfAERFW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Jan 2019 12:05:22 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37838 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfAERFW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Jan 2019 12:05:22 -0500
Received: by mail-pg1-f194.google.com with SMTP id c25so18827393pgb.4;
        Sat, 05 Jan 2019 09:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/u1mHL7e6w51BOxko9o8h9oQMBHmxcyQg7i9O9Ftpoc=;
        b=OfAS5u5/RDBHie26LMyfKbug6odTXDnFrFYzxRY7O5v3e/NfRQOYEBkcnn/WI1vLOA
         TcKa3MYyoj3JVj3AKBKshK8HFm3Af9xIjQNaSfe4nrY9fxM/HY1stovmaUpkuxOfq12b
         LIihL8+6VwYqMO2Pf0aLT8mLD8knVZaE0h9hR/hrj0cBGerMHtfF1g5ujel068ZNVFMw
         N92gleCWZflhPu3ajRFJVO9DQsGzdeSjgdQOcJMWA+DJwKo8w5SSV3TiyW2IXy1Mgz4f
         I6Z8J8AAVRspkfOIU19S1h5nUd0hf2V9+jz6PAqh+QGSfASq3UBYs1AdcMyv8BCrMgwu
         MFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/u1mHL7e6w51BOxko9o8h9oQMBHmxcyQg7i9O9Ftpoc=;
        b=XVDelzxZI+JSYytF/UCSjuB9BwsRsOy0pVAkN8aQ7nBlsYTaTuLzNrRczHKKc26z0S
         iec74Xqp9SBrOpioYUS7TR31kwxHWRLlLNjf3j5objToCLohjxm3PEficehZ68TchYQo
         U7oJaOrH07PAIAC0GLBlX03p49zuiTzNurbnXvpwzTFeDwQDI9RAgf1QzcP85hkmyHG/
         9A/Y+tabXhoo7A5CwPIi1g+25SPKgQR+a7hFNE7aT16PRt1LBf9/m3Jd8drrm0HU1NOu
         +46LieZ2Cw7RGCSyQh+CM94ZEzc8/af27WUQ3BkoKzCUexGr8UODtKSr5xhpY6ekRgKi
         ouYA==
X-Gm-Message-State: AJcUukdMVzoLH8zYugxlNNeNZNO5qnPz7wajgQ4x/4Zr6R8DzBqZW8jW
        /okk1B2MYI5Dk1MEGviAQyk=
X-Google-Smtp-Source: AFSGD/UXryu3ATsRy5D+w9ZzlEUUuyYFxOV0R8a6VVnhXfzvdnTjoHClaSn+lvmXMljTSLbXfLIjPQ==
X-Received: by 2002:a62:53c5:: with SMTP id h188mr56032408pfb.190.1546707921105;
        Sat, 05 Jan 2019 09:05:21 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 196sm249254319pfc.77.2019.01.05.09.05.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jan 2019 09:05:19 -0800 (PST)
Date:   Sat, 5 Jan 2019 09:05:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, shunyong.yang@hxt-semitech.com,
        dongsheng.wang@hxt-semitech.com
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Message-ID: <20190105170518.GA1879@roeck-us.net>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org
Message-ID: <20190105170518.QGFA9KoMevBUhHoSmeV8l7dzSYvE9uIZrLf037E87IA@z>

On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
> 

Misleading subject. While the DPS650AB may ber a power supply,
it is a PMBus hwmon driver, and should be marked accordingly in the subject.

Guenter

> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> --
> 1.8.3.1
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..bbd601100e66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
> +
> +Required properties:
> +- compatible : "dps650ab"
> +- reg        : I2C address, one of 0x58, 0x59.
> +
> +Example:
> +       dps650ab@58 {
> +                   compatible = "dps650ab";
> +                   reg = <0x58>;
> +       };
