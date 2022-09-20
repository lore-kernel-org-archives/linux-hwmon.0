Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CEBECAAD8
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Sep 2022 14:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiITO12 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Sep 2022 10:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiITO1I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2022 10:27:08 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DE21403A
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 07:27:07 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id q9so2785207pgq.8
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=hUW5Ls+vnUOdsGVK45yERWjdFQtt4XK06Dg95u25C5E=;
        b=Ep7RmTpST7k/2TMVZ9HcXG2FBIqVp3pLjbJS1X6zzd8BrtLsaf6j+x9ULP45+KJEoU
         aEjGOyT8C8Uudcfb/6SmaH5DOzK+lh2mzErg99FwHv8NJtntm7G7HuxQibucsR9UxbWz
         hemozaUs/af4WWjqQYSGzTBhUHjcbcg0p5ZkYiaawOL4KDFSjXkovnhxWR9prqWoNeL9
         7h5I4/X0xfTBZrG9s+76I4GV65bOdQw0uYnvhpy9gry0K67zfGwX6WRPTKj2Ks1x6yE6
         J3ILVkot48b5NfMWLHZwq91apnquTgSaOwnNevBjutnYWsalO9GisTJP7riM3qM4QAfA
         gWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hUW5Ls+vnUOdsGVK45yERWjdFQtt4XK06Dg95u25C5E=;
        b=JiATN5AYE82qdcEdGbM+iXJ9v6KgTo+ZtGYBVuVj340OTfFerU/LC1LkU1lCZUJuC4
         FgG/s39fspgS7ALR52wC+JCjvUuDdjby7wZXbiSYuTnLFzDzIekA50N01ldvVY7ziYX4
         jTiQwV7ff0waPQUWw14jUINVTCzGCQk0w5E4O7g00JLFGTf8bH2SfW9jw9TfMEe1S2ar
         vBTR+750YRuYz1uF+A0PTu/uKytQXKWP0ag4kiCwp91rp4lutmFBpfNnVinGauLQ8x0I
         Oq68Z4GbGaVb5ySALFQlxOazptlzrb2cxQQmrfTYlXb9+rR8l81pqeyZyfxNLnhhFeDz
         Lj3Q==
X-Gm-Message-State: ACrzQf1Q58RWxZTAwEHd841nmrHtpxOrAoAvjhfC5y5XxW8sz2QWEaMR
        UdcP+VSS3M4l6DEyZiBMfMY=
X-Google-Smtp-Source: AMsMyM4MYB1VN6zjJ6lyI7d338xNclQLjQAEMBC53rDtfMsqB6ip2hKq5wG+k87uBgLtfnC4dmV6Gg==
X-Received: by 2002:a05:6a00:140a:b0:540:bdb4:aa54 with SMTP id l10-20020a056a00140a00b00540bdb4aa54mr23538381pfu.17.1663684026751;
        Tue, 20 Sep 2022 07:27:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 201-20020a6305d2000000b00439c1e13112sm1078pgf.22.2022.09.20.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:27:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 20 Sep 2022 07:27:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jim Cromie <jim.cromie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] hwmon: pc87360: Introduce a #define for the driver
 name and use it
Message-ID: <20220920142705.GA3971239@roeck-us.net>
References: <20220919103155.795151-1-u.kleine-koenig@pengutronix.de>
 <20220919103155.795151-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220919103155.795151-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 19, 2022 at 12:31:54PM +0200, Uwe Kleine-König wrote:
> Make use of the cpp symbol DRIVER_NAME to set the driver's name and also
> as name for devm_request_region(). While at it add a module alias using
> the new define.
> 
> This is a preparation for the next cleanup commit that removes a cyclic
> dependency between pc87360_driver (which references pc87360_probe in
> .probe) and pc87360_probe() (which used pc87360_driver.driver.name).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter
