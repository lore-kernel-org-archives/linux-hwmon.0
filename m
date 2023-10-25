Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8722C07545
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 19:57:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjJYT54 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Oct 2023 15:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJYT54 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2023 15:57:56 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7706C12A
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 12:57:54 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-27d1fa1c787so63347a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 12:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698263874; x=1698868674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYKowwlkn1BHKHRc9JhBeWa2xMY1+E1zm1gAHR59v1Y=;
        b=bSmRZbQE96JRRQCPAAlw3qTQux5C70nrkt8b6t/Li+BRIntRjZPYRx5U4tjONDMlTb
         eN8/7Y7ZTZY5hEL535mPvgRzZTc1TASxFeJ7SXpaaV1Trx0oa0UlsUNAgwicySCciUk/
         NVt+odM++BwsfX+EcAhnICx9q/zc4lxKXedTVgrgjK+Z4sLXhqjhker/0L6357OlfeXb
         sKxR+z7ehlazyORyc96/6wa0OpnBmufI1mzlZhzO060EZI8XtJEATgp9BmhbMq1G38DX
         /6W7eC2R+nAdjMI9+/tNLfVl9ly8wUJLt2rvp52nCjK7rqMgsmf+omXxErRF2tHWfHcO
         n0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698263874; x=1698868674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYKowwlkn1BHKHRc9JhBeWa2xMY1+E1zm1gAHR59v1Y=;
        b=GK2ZL8ffj4hgvERS/KmWw6x9mkzcyQsasEmjhnE2VMqINSu+Ohi3FOfCfH7WXh0XmX
         QW4lMPHraNUyAG0IVeoHpkIS41sD2Pk1QjFbCnbooiWk1AinWghIjO+cWGbJZuGg+u8P
         ldBTakD0JWJBklZPp+rI8Htk7NiJAnYhWoGouKWpzScz5iQSIl5m4lltTrzul50bLHzh
         /kXkA/T+RGmEj7dvapR6jywClAvJbivHo6fJ3VbXHup3FTELuxvX8tN6pD55V+ebVW1f
         igbL/J5ZKprjtrwyFfp3dlS4WGNxR/oBU59zQafKn4m9n/PLpipDQLVZM1A2mi4IzLfV
         Pr/Q==
X-Gm-Message-State: AOJu0YyJw4weptCJ2JsjaXVC9g8DAuMQ+7PrbDPV7QRJ1fHS4oAtbCAi
        rV21V+So985pC5d266q93WImSRUCpzM=
X-Google-Smtp-Source: AGHT+IEXz3w96QOizdtMAgffTFHSy7zzOjRErxAvpPJekEk2up/e5faZbQxJGFrqKvbEYk1OCxaG2Q==
X-Received: by 2002:a17:90a:4f45:b0:27e:3880:d03d with SMTP id w5-20020a17090a4f4500b0027e3880d03dmr9372001pjl.7.1698263873870;
        Wed, 25 Oct 2023 12:57:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 12-20020a17090a194c00b00279060a0fccsm305823pjh.9.2023.10.25.12.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 12:57:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 25 Oct 2023 12:57:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexander Koskovich <AKoskovich@pm.me>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] hwmon: (nct6683) Add another customer ID for ASRock
 X670E Taichi
Message-ID: <2ee3669e-4366-4664-8525-70859dac4074@roeck-us.net>
References: <20231023182442.21943-1-akoskovich@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023182442.21943-1-akoskovich@pm.me>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 23, 2023 at 06:24:59PM +0000, Alexander Koskovich wrote:
> This value was found on an ASRock X670E Taichi with an
> NCT6686D chip.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Applied.

Thanks,
Guenter
