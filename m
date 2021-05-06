Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9031AC433B4
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 13:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E99161059
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 May 2021 13:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbhEFNu7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 May 2021 09:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbhEFNu7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 May 2021 09:50:59 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FD6C061574
        for <linux-hwmon@vger.kernel.org>; Thu,  6 May 2021 06:50:01 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id c3so5472679oic.8
        for <linux-hwmon@vger.kernel.org>; Thu, 06 May 2021 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2thEecwiSJyrXlm5fzZ38ZXPWcEYeT444EbBt2NVK7E=;
        b=ADeClIOn5hbZoJkEG8V/YgNliM2oiuBsNezNN49ZHCIqn0b8Oysmz/w78ECu5w9/h5
         qM6Q96OucIy9Nw3gShKY3uXlcW6FBiO5ceQlG2Ge7bgQGU2PlzZT5XV/4GDdyD/G8LvK
         XN481h5CEClBFcZFs+ObivDT2WApdnIaXauHpCeNJ1T+5TAPhxLH7470v0A2T/LTZhvr
         uvAvLNE/crdoC+7yNdfD5E5SE9eWZS63eTms0Trx2hy5xTzponaPuyNjoBfX6j0T6hV9
         EYgCqRr+ST+UOguwPJcHmn2dsNQf72xFJA4bbMLzGnS7tRh0e932BYq68KmL8CLjE7Af
         aYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=2thEecwiSJyrXlm5fzZ38ZXPWcEYeT444EbBt2NVK7E=;
        b=MfL+v73B8GTwjR8pMbHT6kWwZNREKms0OhcSq8Cmxhn+76mAy7yRsNeCac9KkTwj9a
         jojhXl+90pNoJZDz/8g+6Ibvl+SZdVhYGrIZb1JTkDz1HVQus1zxOBpQ7e2FSElLW3a+
         K3QSB8lFTR7ePIULS4vuZB3kdMF9puZPxfCecpim4xT+IK66qjUHb91rUBIlhmH51KSg
         +WIgOk2rUHUXC79/t0Z+Nm+GosJ1SNN38O6sclVFmPa5ZtW2yqrrPuRhUNChYrWlHdI6
         3yVr3xdAHWODPQbmI/8rgimvL/mqCrgLfDt98kMdnVf48gyheODStcRlBhOhT2Y4H+xY
         c0nA==
X-Gm-Message-State: AOAM530duHqVEkFXlLiOgcd82wi/5FR0b1Xoyd4NHBuka7MX7cm5FXsl
        zJNmrNOFEjaxSOM0h7I6uT1fGNor4FE=
X-Google-Smtp-Source: ABdhPJwvi5NyO1L3iPWrhTwEF5he2AUCsTw6MNgS32sscaoaqoZlK+3HJZ9T05dtxFkelkivpaTxGg==
X-Received: by 2002:a05:6808:2c2:: with SMTP id a2mr3241985oid.147.1620309000683;
        Thu, 06 May 2021 06:50:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o9sm573459otp.20.2021.05.06.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:50:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 6 May 2021 06:49:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bernhard Seibold <mail@bernhard-seibold.de>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Support access via Asus WMI
Message-ID: <20210506134958.GA2267050@roeck-us.net>
References: <523324cb-4e9d-c8f3-abe1-94158368aa45@bernhard-seibold.de>
 <08262b12-4345-76a9-87be-66d630af3a59@roeck-us.net>
 <de9fba24-eb84-d967-268d-aa114c453f42@bernhard-seibold.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de9fba24-eb84-d967-268d-aa114c453f42@bernhard-seibold.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 06, 2021 at 09:02:01AM +0200, Bernhard Seibold wrote:
> On 06.05.2021 04:04, Guenter Roeck wrote:
> > On 5/5/21 1:12 PM, Bernhard Seibold wrote:
> >> Support accessing the chip via Asus WMI. This enables the driver to work
> >> on boards where the IO region is reserved by ACPI.
> >>
> >> Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
> >> Tested-by: Artem S. Tashkinov <aros@gmx.com>
> > 
> > No, this makes the driver unmaintainable. There should be a separate
> > driver which only makes WMI/ACPI accesses for everything.
> > 
> > Guenter
> > 
> 
> I'm not sure what exactly you are suggesting. I assume your suggestion
> isn't to duplicate 5000 lines of code in order to avoid having 100 lines
> of ifdef'ed code?

No idea, quite frankly. Sprinkling the driver with ifdefs and conditional
code for sure isn't the solution. You might consider dropping the ifdefs
and use dmi detection instead, possibly with a module parameter to bypass
the dmi detection. I'd rather have no ifdefs and miss some platforms where
this is untested.

You could try by splitting the single patch into several patches, with one
or more preparatory patches, and maybe write accessor functions to avoid
the runtime conditonals. Oh, and don't use C++ comments.

Guenter
