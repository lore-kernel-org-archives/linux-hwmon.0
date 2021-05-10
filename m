Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045A7C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3FBC611BE
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbhEJPgB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 11:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233683AbhEJPf6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 11:35:58 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D606C061574
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:34:54 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso14790781otm.4
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SEdBzfB637fNU6YRdhXOs5PE/7xWIYG3CwtA3DnthuQ=;
        b=dK3YjkrHjzw5G00yFiny47uTC2eghTuC2X1e+urFsOVNYepqlu6qr5DtVSRiRwMNSs
         N6ifZZRImMteh4LBvA3ptpZske1YenTmT6m1uS/uExC4TFjFzpSjJmxJQgu7TGJerVmr
         ljn/MNVqzom/Lk712VPvaz9/AyOIj7EDns/XLRM+IlLzUlsHgqkXPrbLmG4Nsvs9Himf
         heHKe1S0XFx8uWANnLGSzRZoDyKHeR4PdPeMM/w4lGZKCCr1h2O7rCqB8jS+bBnDuHWy
         KGZmj+tlQwlAGRqFk4qds8hBU/Dy2Ha7vGPmGV3xpye5eYbbUT+459lA/Qb4mXXSXUJ8
         xW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=SEdBzfB637fNU6YRdhXOs5PE/7xWIYG3CwtA3DnthuQ=;
        b=q6OQlKDbuxhaxfU6OQmUp1Aa6fpSanL5fnuMHQG1Kr1V8iWYI6hyzrzsvNFSsdACnT
         uwBKnakpkkgEVXbaE270IiMidC26CzkaODT3Ko0IABIwOcAY/WBG1ToHEojEeFiyBWW7
         aTL5cyuY0cDUFqbXynmJ9UBCgeB7Dsl2K1kPgmw3wSPOMTg62yPV8WVNYoJiBtyjgZ1e
         9rFStL6V7WmxNi0sBN/wmlwjWhNWVJo/CQ7xHrIAzYu3j/sciKxrGg7ndU5z26F41aHP
         +mXsk8Hslh9EXDkWHrT8xv0HKKqXOJtIn3L/5HwBQEc/Sexb+AuxYQi/8OdoEk45D6+8
         W7tw==
X-Gm-Message-State: AOAM531mr6GlJPNFC3lUZbrTp2DRSnRonWZyXGvPup15KlkM+nslzbsm
        v60FV4PKE9z59CCbHZMYb+KnG45glqc=
X-Google-Smtp-Source: ABdhPJxeFJ7a1hQD8/9ac80woBfqNUtOy7dWgm80S1PYYSzQp6tPNi6kA8drpqcrCt8M1PqQmJUKJw==
X-Received: by 2002:a9d:674e:: with SMTP id w14mr7513928otm.309.1620660893309;
        Mon, 10 May 2021 08:34:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 68sm3134857otc.54.2021.05.10.08.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:34:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 10 May 2021 08:34:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
Cc:     hdegoede@redhat.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2 1/4] hwmon: (sch56xx) Use devres functions for watchdog
Message-ID: <20210510153450.GA3212231@roeck-us.net>
References: <20210508131457.12780-1-W_Armin@gmx.de>
 <20210508131457.12780-2-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508131457.12780-2-W_Armin@gmx.de>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, May 08, 2021 at 03:14:54PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use devm_kzalloc()/devm_watchdog_register() for
> watchdog registration since it allows us to remove
> the sch56xx_watchdog_data struct from the drivers
> own data structs.
> Remove sch56xx_watchdog_unregister since devres
> takes care of that now.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied, with cosmetic change.

[ ... ]
> -	return data;
> +	return;
>  }

Dropped unnecessary return statement.

Guenter
