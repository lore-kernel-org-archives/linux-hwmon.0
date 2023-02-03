Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2E5C05027
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Feb 2023 22:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbjBCWfK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Feb 2023 17:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233327AbjBCWfJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Feb 2023 17:35:09 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE1154575
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Feb 2023 14:35:07 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id m13so6714604plx.13
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Feb 2023 14:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2+qUrmoLWhGhHQ0JM3LtDsxkWWGF/Tpngyo6lTedI5Q=;
        b=S2aplzJ/n1MkROMxkRG8h8Z13X5qxY+hzIVW3kQdcsio94dYqqnQl08+0VGYNqriQr
         Ir4ldh4hW29MFt4yUXmYeYH9MBAZQLM8b5HJCx8p9YGYDKQ48BdUH+xflfkSE22XWIoU
         qfWtkY4oD+UA9XNZsKBivBKR0zHQRjY8qQ590=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+qUrmoLWhGhHQ0JM3LtDsxkWWGF/Tpngyo6lTedI5Q=;
        b=aU999el4wQsEy0Yjwmnf1L3WI7lSchhshDZ1uuT2SVNCJUroDqG5/uCstHMsfhMfFJ
         kXl+gceR7SZ2ZEut3uUT3U+IenT7Ne1h/PlpLH92GrYaKqP5Ot2tupVRJCf2Nl/Yu8/E
         jyQOJ3mVVuQU4OzeHOKoCTxQn+dWpALce57ndy+IxqeJKHUZWkaP4keE3E+l7E20D0tM
         8ze6hIb+pPbQKRT7O/xvdXIXJnxixLnhglGeS+XNsZGcErjMF78owpKFyctoR351coAe
         RnpfmxSWNooFG4iKqw28wjXaKcTDgH8oVCQWMsQTWi7K0slbFytgPuV2nClBqxdeNaUH
         Miwg==
X-Gm-Message-State: AO0yUKWECY5VqXlrlTCteOQ7pP1xBuuzK5EYskaDiiyrE/0PR6LP3mEt
        VSlm8foUNHEDGHMGsU+2sFp0lQ==
X-Google-Smtp-Source: AK7set+ivoTQ9g7ZsTsBrucNZ/YN7Eo6brIp6IR1b30qK2V9FeFukDCIB5g4XrUDFICA2DCmS+773A==
X-Received: by 2002:a17:902:e34c:b0:196:3650:63e3 with SMTP id p12-20020a170902e34c00b00196365063e3mr10248303plc.1.1675463706890;
        Fri, 03 Feb 2023 14:35:06 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b00198e12c499dsm1829704plg.282.2023.02.03.14.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 14:35:06 -0800 (PST)
Message-ID: <63dd8c1a.170a0220.d3456.3451@mx.google.com>
X-Google-Original-Message-ID: <202302032233.@keescook>
Date:   Fri, 3 Feb 2023 22:35:05 +0000
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] lm85: Bounds check to_sensor_dev_attr()->index usage
References: <20230127223744.never.113-kees@kernel.org>
 <20230128131319.GA4173006@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230128131319.GA4173006@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jan 28, 2023 at 05:13:19AM -0800, Guenter Roeck wrote:
> On Fri, Jan 27, 2023 at 02:37:45PM -0800, Kees Cook wrote:
> > The index into various register arrays was not bounds checked. Add
> > checking. Seen under GCC 13:
> > 
> > drivers/hwmon/lm85.c: In function 'pwm_auto_pwm_minctl_store':
> > drivers/hwmon/lm85.c:1110:26: warning: array subscript [0, 31] is outside array bounds of 'struct lm85_autofan[3]' [-Warray-bounds=]
> >  1110 |         if (data->autofan[nr].min_off)
> >       |             ~~~~~~~~~~~~~^~~~
> > drivers/hwmon/lm85.c:317:29: note: while referencing 'autofan'
> >   317 |         struct lm85_autofan autofan[3];
> >       |                             ^~~~~~~
> > 
> 
> This is a false positive. The value can never be >= 3.
> It is derived from the last value of the following
> SENSOR_DEVICE_ATTR_RW() entries.
> 
> I resist making changes like this to the code just because
> the compiler can not determine the range of a variable.
> It blows up code size amd makes it hard to read just to
> make the compiler happy.

I think it's worth it given the index is an "int" and it'd be very easy
for things to go wrong in the face of other memory corruption, etc. I've
sent a v2 that I think is much more readable and non-invasive but
provides similar robustness.

-Kees

-- 
Kees Cook
