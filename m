Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0242C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 22:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA7BB61100
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 22:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235711AbhITWYu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 18:24:50 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:40616 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhITWWt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 18:22:49 -0400
Received: by mail-oi1-f174.google.com with SMTP id t189so14373526oie.7;
        Mon, 20 Sep 2021 15:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KrcziNLPR64P4vH1r/goSQ0mT97xB7BxraGxlhTDprk=;
        b=OkROm2NX/WMLvx4ij0u7eNDSV18MSWAbur45i8vzH7NudvQn0xY644pX/wAsW7zmL7
         9WqR48KQOtOr2iFoNjM5Y4A9/vG76aufWwkAiixEOGSVhA6Pu6DkIxMMDtL9Y3fRyNjk
         /njC/ZIk+Zv4mxXWHcOym9N6OoAvPs9FQrLJi27hyUO35SL50876MJNlIjkjJ0GA65uO
         V1PwrPnwjGWK4gtxXb+LA+LTR4dMugM4LFME/37IDas9cg8/zPYJw2qVcOOaW+7RIPEI
         3IPKVv/lv47gbpQL31o01i8cT1ZTxm0aCwhlsqyHrDodT2U6htz5/IdtVnWkkwwME7Xq
         6aFg==
X-Gm-Message-State: AOAM531DbwPh0AaLXpgr1j09LezfZzLVE8QL55ClAVihh0N6nszrnAs6
        emMXv/lAarEsDPqUOSfecE21t2x0EQ==
X-Google-Smtp-Source: ABdhPJz3P2m/ISRUBEz7AItSgwV8bEqr8ysjfsgekZYnKe0DiDmW7Hzmush65q1rJHwVqAGt17wRdw==
X-Received: by 2002:aca:b686:: with SMTP id g128mr1104384oif.171.1632176482330;
        Mon, 20 Sep 2021 15:21:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w23sm1090075ooj.19.2021.09.20.15.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 15:21:21 -0700 (PDT)
Received: (nullmailer pid 901061 invoked by uid 1000);
        Mon, 20 Sep 2021 22:21:20 -0000
Date:   Mon, 20 Sep 2021 17:21:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <YUkJYHMa9948biLh@robh.at.kernel.org>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <08a5f07c635ec09a0852ba5e2c7332c4d8794798.1631021349.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08a5f07c635ec09a0852ba5e2c7332c4d8794798.1631021349.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 07 Sep 2021 15:42:24 +0200, Krzysztof Adamski wrote:
> Add basic description of the tmp421 driver DT bindings.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  .../devicetree/bindings/hwmon/tmp421.yaml     | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp421.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
