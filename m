Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F3FC4320E
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Aug 2021 19:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53BB560BD3
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Aug 2021 19:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240201AbhHCTkA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Aug 2021 15:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240175AbhHCTj4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Aug 2021 15:39:56 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE66C0617BF;
        Tue,  3 Aug 2021 12:39:34 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 68-20020a9d0f4a0000b02904b1f1d7c5f4so21773285ott.9;
        Tue, 03 Aug 2021 12:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V4vipJEwRDwHM4259+MlHhYFZKy0AF5AfY/rL666hI0=;
        b=gP2AWen6BuDUXo1SqKbvrPqjHYThh1x6YXxD7ykh8cqEfdx+HK5AgGNuoJGAJNsm/E
         4iTaF8s8H88Witb9rbDytdVr34FXrMruJmYu4UPMyHg7JRZNrUXEmlC61VJMXU3dRcD7
         6Z2Ly6OqLllaFBuvTf+KkqFEM2fQvwZICKJ8+Ana0OT3ED621f7KGuOkJJF/zZug2H9z
         9kljfcCtvsnDjX/FyCJ5HNwvFcwmPHNiqpz6ocoJTRQuGBUVYU1cXi5JQ6G4DwrkRrqg
         +MmjqPfsyo7EgyEg38hiRT6idpG2LgrL5U6/zpijo7iPBMO+sdGTSEQmJrdPUDaF2bRC
         zMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=V4vipJEwRDwHM4259+MlHhYFZKy0AF5AfY/rL666hI0=;
        b=RWM9mVXxXqBeRjWxxV6HENdvjWD6SdfnSb0hpYskrYF82LZ3TdVxX/J/p3jlWQBWm0
         +j989gwhcptu9lPESqnlOiI0F1Eco8gsBJ2fMKczacreGHjTCGYiIQwpvdJTynb2j3Q7
         9TRoXftVGscS21PoOp1N/8m/xBYXa6r0rg2NYHZedxi9L7leHJ0Czo76MHXh42EIQ3UH
         b8IpVyBWO7+4rqPo24wCkl0WmJOl1sGKoDLXRegWHDcTOLtOZguubgqqTdOY52gZHA2m
         xQHwEVd7x85VTN0OAFWERuPpf46IX5tMfdzdLylCbtHeOJ9dPry7p2JokTUdYqtBViTx
         b1kg==
X-Gm-Message-State: AOAM532eV0oQUS7ekEHyJI45SYNLk2OHuoY2q5o5USXyZoa60VF3MD1G
        2rlZNL4zuqmblgEJdk52p+M=
X-Google-Smtp-Source: ABdhPJwYyKPPT9p/GInHz0roMUDO5XFvdCr9ZmDHuvR2OGtgCyYgsq4Sjv/IEXPrJ+LkIcZcCZBpVA==
X-Received: by 2002:a05:6830:128b:: with SMTP id z11mr17101494otp.124.1628019574292;
        Tue, 03 Aug 2021 12:39:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z22sm2361140ooz.20.2021.08.03.12.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:39:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 Aug 2021 12:39:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add bindings for Winbond W83781D
Message-ID: <20210803193932.GA3055806@roeck-us.net>
References: <20210729230543.2853485-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729230543.2853485-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 30, 2021 at 01:05:42AM +0200, Linus Walleij wrote:
> This adds a device tree binding for the Winbond W83781D and its
> sibling HW monitoring ICs. This is used in for example the Freecom
> FSG-3 router/NAS.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter
