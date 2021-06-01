Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D519EC47080
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 12:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B505260FE3
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Jun 2021 12:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhFAMKl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Jun 2021 08:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhFAMKk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Jun 2021 08:10:40 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1B3C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Jun 2021 05:08:59 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id l19-20020a0568301553b02903beaa8d961aso1244139otp.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Jun 2021 05:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VAg69ATmKr5AP4CFhmeKMoqZOcePiygfklvBJ2CXeL8=;
        b=iYfNn6BSQpuRyvOr9128fRpNXixwwusXWhIXW5ruxbc5241RooIzX+pyTagswZRa2U
         NbrayuUuZJqzgaPkSY/+ml27UYL7qHy8EW6nYgQ33cVJp65MDYpp2rOhvNu8+UBtDmk4
         Aa7j6B/rqwwP/8Ni9t9vvJWlNtTPA4jPYgSeuhywYZ/zmNmHjAhckhHMcsu2eQWBiYJq
         9ZDxqg5d2ClD4dSJG3V4pdourqZY1G0SeOIH5zYk2KD4K5P45bPLZRy+FbaV2IQIWQ2Y
         aQqsuyihQgn0Wb7UNdr8R8Q0w/ecsIou0zN4tSLCpRipTA6rvJP/HLSr+l3tqnig1OwN
         e04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=VAg69ATmKr5AP4CFhmeKMoqZOcePiygfklvBJ2CXeL8=;
        b=oGb/pRvu58oeTtRYcYTluYvhuGeIRadOe8YQdGXmVvHxumIPnQovIp2jkEGfgOR8HP
         6IuZZvQJRQP25u+dpWdbTwStPjC6DJkTW60URsyj7vTmEDIBIHWDFdRtd0lbLBSIcPyh
         yuNLYExLyig+Tk5jK8GZQ/4KElB6/3KKa0aT1QXvklA4YXnSDwLT0wQBILPhPhcGh4jf
         aQ+XyAHnD+s0IAzLgteKtAjy5/AOsBClXyQJq0i+btKP55D2X2D/VcL6rmwp8Y+MHvfJ
         YJcuZscdaqAqgC61Mgih5V3uSg3/FwktjX2uilDkfS/9hYdKxfE9K1lKgsmCziyjRyV2
         14lw==
X-Gm-Message-State: AOAM530vKA5z5gMVJ/pEUvJhIBuHFbN/sPcSl+P87C1iV9fEVAoilLN+
        4HTX5ZocO4JF32ab7Qa/OJM=
X-Google-Smtp-Source: ABdhPJyRICUc6RmEJbLT/ij4YQr3VmpMY0Ku79Ubq2ayO4h0HDJC5e7SpmAo9qKCIbRFV5w5yA3WNg==
X-Received: by 2002:a9d:624a:: with SMTP id i10mr20487224otk.7.1622549339042;
        Tue, 01 Jun 2021 05:08:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v9sm3806635otn.44.2021.06.01.05.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 05:08:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 1 Jun 2021 05:08:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?V=E1clav_Kubern=E1t?= <kubernat@cesnet.cz>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH 0/7] hwmon: (max31790) Fixes and improvements
Message-ID: <20210601120855.GA2663270@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
 <CABKa3noz1=o4KQV6hv7dSsgHQah2wY7=2yvUSC8t+r6riRSRBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABKa3noz1=o4KQV6hv7dSsgHQah2wY7=2yvUSC8t+r6riRSRBA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 01, 2021 at 10:29:48AM +0200, Václav Kubernát wrote:
> Hello,
> 
[ short reply - I am on the road. I'll look into your replies in
more detail later ]

> I have tested your patches. It seems like the driver is now a lot more
> usable, thanks. What seems to be still unusable for me, is RPM mode.
> The chip creates an effort to set the RPM, but it almost never
> stabilizes. I think the reason is mainly because the driver doesn't
> work with registers like "window" and "pwm rate of change". PWM mode
> seems to work fine.
> 
Agreed; I found the same problem. I actually tried to implement support
for an attribute to support the window registers, but could not find
working settings. I only played with window registers, though, so we'll
probably need attributes for both window mode and pwm rate of change.

> I think some of the patches in my patch series on the chip are now
> obsolete. However, I do think at least fanX_div should be implemented.
> When testing with Sunon PF36281BX-000U-S99 (its max RPM is 23000), the
> default divisor is not enough (one bit of change equals to about 500
> RPM). The only way to change the divisor right now, is to set the
> target RPM or min RPM.
> 
Agreed.

> There is also the regmap patch, but I've implemented that one mainly
> because it made the driver a bit easier to debug.
> 
Only reason for me to omit that was because it was buggy (FWIW, I didn't
know either that the defalt caching mode is "do not cache", and that all
the 'volatile' declarations were useless).

Guenter
