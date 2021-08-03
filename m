Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2ADC4338F
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Aug 2021 19:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D663260F93
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Aug 2021 19:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbhHCTZ7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Aug 2021 15:25:59 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:41512 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239545AbhHCTZ7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Aug 2021 15:25:59 -0400
Received: by mail-il1-f178.google.com with SMTP id j18so17488110ile.8;
        Tue, 03 Aug 2021 12:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UpHZ/8ZTnB7d7niiI0QFLOIkAGoRjFKEkf1Gh71oryk=;
        b=pZ18rEo1uTVhMTxbFvDAjyirFuLhxnouTgOG202p7A5ZHdP9w7H+lOFG7UlQpt/apV
         aWZd8dqK6DuQ2EykVdcsbhtsWHQG2Tre3kBXnnYRjpnaFp2xfeGomuJhSVrLxJ8lX7wT
         9hqnZz13p31ZSfAjS3w19N++OOkkU2UpBi2NidKaMO00VW+291j62ESZWHhbFlh8k5Yq
         rjAEkDkU+8p9DWrQfMsEwSmgSgwni1uz71LbD626h60OamsLwZfKsihViSfCMTFqZ6b5
         D9VOInUCd1buroBx+g4Kxn3GBpq2XprAxKev+Nxf7/V+pCnwzCWfE5qUgb0KcRuM9ubw
         UvvQ==
X-Gm-Message-State: AOAM530izKWqsnXvw7utj9eOpZQTj1cC6JQGGT7Tj2v2tMiKnfQyfm2v
        Mvd5UyWyJYNKKRk+tGVr8Q==
X-Google-Smtp-Source: ABdhPJw3SsP0H3r0oHJp+c743fUswWrIx5YwssBTe7fL46qc0bv8Y3bTyNClxqdWPAvcnZgtWU+9FA==
X-Received: by 2002:a92:7d08:: with SMTP id y8mr845094ilc.111.1628018747673;
        Tue, 03 Aug 2021 12:25:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q1sm10205197ioi.42.2021.08.03.12.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:25:47 -0700 (PDT)
Received: (nullmailer pid 3597959 invoked by uid 1000);
        Tue, 03 Aug 2021 19:25:45 -0000
Date:   Tue, 3 Aug 2021 13:25:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add bindings for Winbond W83781D
Message-ID: <YQmYOWUO+iULHzHO@robh.at.kernel.org>
References: <20210729230543.2853485-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729230543.2853485-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 30 Jul 2021 01:05:42 +0200, Linus Walleij wrote:
> This adds a device tree binding for the Winbond W83781D and its
> sibling HW monitoring ICs. This is used in for example the Freecom
> FSG-3 router/NAS.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/hwmon/winbond,w83781d.yaml       | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/winbond,w83781d.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
