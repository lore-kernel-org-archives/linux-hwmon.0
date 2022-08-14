Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BFEC25B0F
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Aug 2022 20:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbiHNUhS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Aug 2022 16:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbiHNUhR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Aug 2022 16:37:17 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E741BEAE
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Aug 2022 13:37:16 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id q16so5071085pgq.6
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Aug 2022 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=xPZlDxtcJcLAf9nOnufKpPaAD51XO8tqiBqKwnKmXAI=;
        b=Y/2FMP6fWT3PQmivfu/l/oK9n02oSzpmXNbc573jsDYycT0hGJ5PdXS5sbDzmjSEJF
         GrW2AN4i7LKq4Xw38EMty875JLVXqj3YDLtDd8OHj+vXc9kzmXsC4fqJCxoFpdMBGV5c
         1gK/XkFHlpWoOSyfc1Lq6JQ4Z3yU5EqqoMjOSlKcD4Xqfjl/mbla5GXHjmnFXIH+KBEJ
         TwgUySnHaJSu0twCDOKG+WYdvATQVLL9UVfHdxQMEJHsEAYLgD6OBjYWX2iXP7WYkGSJ
         +5BrtYlvkyw8DnnYNutEMeD31shNMs8shhSTKbOTqbiiuBpnOaEMutE5i//tJSEvv0fE
         9JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=xPZlDxtcJcLAf9nOnufKpPaAD51XO8tqiBqKwnKmXAI=;
        b=aRd075MWUwdJqR9yUrmwl8bPSqrr2i3Qjw0GFGeBr/IOrwFuxE6ng1rmnlv8WE0n6a
         tpZ+4ScNc9oB3JeGzLtNaJEOULuzLa8ZdD+t92hwGB48KX9aTiANZTkB/b6vxXAwkIn3
         cy/OnGqGmkR3Ejzv7Qp4IdIjIX1HEJZULGOXLN0IWdVL1dIK1BcAeFhzlKqDSx+vKGH2
         EWHU15Mp/s1ALgFnI1YuuVQIRsUnxd+xtAvXcBR7+RxRZBbZDNk7S9h20pwdPACkr4yx
         7rl8yOWR5q+LKRonIw215BTC3aGmUB7Lw/nL7gr6WolJf+j2jVxW2DLyXytIWa2okcYV
         Ji4A==
X-Gm-Message-State: ACgBeo18gm8l0JqYG4q0KbKDZ8ym98YWDF69ZBb12SB4nEKLJ7URpMWu
        K0IIH3Wgxvfx8pM/yd50x1zHpaJHVVg=
X-Google-Smtp-Source: AA6agR4yTNS3mntIXZFn7krSpbTZx0GtkzTqdyA6HzO5nQFauo7a6Mlxkob4xoqrdcnl0D4zWmgXqA==
X-Received: by 2002:a05:6a00:10ca:b0:4f7:5af4:47b6 with SMTP id d10-20020a056a0010ca00b004f75af447b6mr13309308pfu.6.1660509436258;
        Sun, 14 Aug 2022 13:37:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b17-20020a63eb51000000b0041bfa382dfesm4671146pgk.67.2022.08.14.13.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 13:37:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 14 Aug 2022 13:37:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joseph Strauss <jstrauss16@proton.me>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: AS621x driver
Message-ID: <20220814203713.GA3689180@roeck-us.net>
References: <20220814190815.sgybykap5vmdmlwr@libretux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814190815.sgybykap5vmdmlwr@libretux>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Aug 14, 2022 at 07:08:18PM +0000, Joseph Strauss wrote:
> The AS621x is a digital temperature sensor chip with an I2C interface. It has applications in electronic equipment, personal computers, wearables, and HVAC. The datasheet can be found here: https://ams.com/documents/20143/36005/AS621x_DS000677_4-00.pdf
> 
> I wish to write a driver for this device and contribute it to the kernel, as my first module. It being my first module, I wanted to make sure that this was a worthy use of everyone's time and that it could be useful at some point. Sparkfun provides a convenient breakout board already, which is the one that I will be using.
> 
> After searching through the mailing list archive, I found a set of patches from 2016 for the AS6200 as part of the iio subsystem. For reasons I could not find, the driver never got merged. I guess the original developers moved on to something else. Additionally, they were discussing towards the end how the hwmon subsystem may have been a better fit for the driver. Therefore, I wanted to hear everyone's thoughts on writing this driver before I get started on it. From what I can tell, it does not seem much more complex than some other temperature sensor drivers in the kernel, such as the tmp102.
> 

If you look really closely, you'll notice that the chip is LM75 compatible.
Except for the resolution it seems to be fully compatible to TPM112.
Given that, there is no need for a new driver. Extending the lm75 driver
should be sufficient.

Guenter
