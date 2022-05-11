Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF063C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 01:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240898AbiEKB5y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 21:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240897AbiEKB5w (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 21:57:52 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DF849F15
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 18:57:50 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id q8so1050165oif.13
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 18:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BRzv3RY9Ga7H4cWjCS6g0LmFnAidN5ABvWdmTv/9bqI=;
        b=Dm9lLzDJGoF17J2urWXb+YvjQzff0B3znzV8GyirjO8npYAsHQeTz5FuWcWNS/F+Ll
         jdYAqgNpHRhYohME1uOTCMInROO7WvT5A9aXZBaWAuFykQ32mKhtAL0YoHmy6u6/G/Ru
         0RAHXamBpqEZ+vLdMFjv20o0sri6HkLdsFszHSmp012c+ubPl8Y90ZuO9lf4oa2mExPn
         22qmvLeqCMZlvXOZBGi+pejrBoypDkf5ic65tm4K0crN05U9m1u8B4bfwIXZWA5Q29j/
         7D+6EFRam2qfREHQBGX2g5RR3SaLjmAocgRSwOfDW82EqG7qsOtJbY1tz3QkDelMFnOa
         CjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=BRzv3RY9Ga7H4cWjCS6g0LmFnAidN5ABvWdmTv/9bqI=;
        b=OL3euwS9CuDNxuom8j5SvwUDio0R0ryTV4TlMZc+CWPmxaOYE+rIQNxFZzZp6ONXb0
         ZXmYOtYNfraWYGfZIdxWvj35smC6ZJkjxw77tha9f0bbrhneDbcp4nldUoXkWuPW5fwG
         ETaeoEnQuOsrLXEwYM6izjw7kfIRb/RDE3eO5KHC+6fmSgPO87UZ6LAfVM9A71gcvOwE
         Rqt3qooqlqb04OAs0sEM8xKJb1zKXRohsGxu1rQbruOwd3NoYvEX2HU81/7Qct1GK3cL
         Lguv0aDPXNs6W/6wQ/ZQcnQJufHjYhXLfJfoDfykEwkbw8NhAhzn/KY5+Y1q30FaPuFd
         darQ==
X-Gm-Message-State: AOAM531dPD+f2Hy5qpQ9RYuCNhjzHgHo6ErNI088P/Y8awwvsDY/YJpk
        RIL/HuwrprMoDArMaNu0ABLXmrq1elDPFw==
X-Google-Smtp-Source: ABdhPJwfh5pyzP6PPapQFIunzfhQmHUO22az9N5qS79/JetjvRPWoI8ekc7qnrMjOYXhxGsTqr0W6g==
X-Received: by 2002:a05:6808:ed0:b0:2f9:c6f8:8b38 with SMTP id q16-20020a0568080ed000b002f9c6f88b38mr1420087oiv.215.1652234270337;
        Tue, 10 May 2022 18:57:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z29-20020a056870461d00b000e686d13876sm231831oao.16.2022.05.10.18.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 18:57:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 10 May 2022 18:57:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Greg.Schwendimann@infineon.com
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: trivial-devices: Add xdp152
Message-ID: <20220511015748.GA2324005@roeck-us.net>
References: <871b255e183e4468a9affce6defb0292@infineon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871b255e183e4468a9affce6defb0292@infineon.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 27, 2022 at 06:40:13PM +0000, Greg.Schwendimann@infineon.com wrote:
> Add Infineon Digital Multi-phase xdp152 family controllers.
> 
> Signed-off-by: Greg Schwendimann <Greg.Schwendimann@infineon.com>
> ---

I just noticed that DT maintainers were not copied on this patch, so
it is not entirely surprising that there was no feedback.
Please resend and copy Rob Herring <robh+dt@kernel.org>,
Krzysztof Kozlowski <krzk+dt@kernel.org>, and devicetree@vger.kernel.org.

Thanks,
Guenter

> Separated the device tree bindings documentation
> 
>  Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 550a2e5c9e05..fc2164c4d108 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -143,6 +143,10 @@ properties:
>            - infineon,xdpe12254
>              # Infineon Multi-phase Digital VR Controller xdpe12284
>            - infineon,xdpe12284
> +            # Infineon Multi-phase Digital VR Controller xdpe152c4
> +          - infineon,xdpe152c4
> +            # Infineon Multi-phase Digital VR Controller xdpe15284
> +          - infineon,xdpe15284
>              # Injoinic IP5108 2.0A Power Bank IC with I2C
>            - injoinic,ip5108
>              # Injoinic IP5109 2.1A Power Bank IC with I2C
