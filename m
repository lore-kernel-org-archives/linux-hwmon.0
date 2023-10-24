Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2828C07545
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Oct 2023 18:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjJXSVn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Oct 2023 14:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbjJXSVm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2023 14:21:42 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B4410DE
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2023 11:21:40 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so57849276.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2023 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698171699; x=1698776499; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w423fNxwEGBoNo/NcTUYZ30xP6Gor9I+bo5eC1JTkPs=;
        b=NYSG3H0FpMxXvWqynkswJzzwVsX8RXnkGzdANuR+e+/vCHYFYhS5C0ZBRRS8I3MqJ0
         nnMxaJST+qV9M0fzG9Jb7bvBeozptk8HP5mgw3994VQpcxARo1HRU87CZvF7GhwzLMz0
         s3k9FVGpPfIqG1ZXVxksiJAmaZ0IXuA88/6pNJ5nnGQyM3bQ+D8WF8+wsI21JGJ1BDMy
         frV9HuYkYHtIl/TytdOJPeDPhq0bXQGssDo7VtGIjUWG5KPO8drs64rdnAm6oN5gaVga
         7GBL0MDCt0S+XLNjYf2SmCc78aj3W6b/s53oRuYybSpxYg8wbu/86+VQ9WnBqeGw6RUC
         hPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698171699; x=1698776499;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w423fNxwEGBoNo/NcTUYZ30xP6Gor9I+bo5eC1JTkPs=;
        b=Lo+IJJ1hy6moDkI08YsUUPQX+wAo/G7rSUIQydMLhDIZ4svkPjTXmmAI4MzEI3bg5u
         TjPRAMBnsMGDOouis/8cKvTWdItWwluQrEiKHfSckT64Jp6kTeZ4rfxi1IJ20uSlkOwk
         MPxReJ1rOzcz1eXIeF5V+B1AXK6zT0Xrx+HOy1UG6BsMUdQ84ZWzKk5DRDALjcCI3MzQ
         PEhf9WCm3xd7s6X7JrsA9DVY83AzKFDFZSltKhrrLVhnzAL+z/LnINaGLe7YvSWmSb7Z
         co5KeI8xfUWiyuPb/kcBsSEU//5oNeB99Jm0Ez4XD37Lm+bkrCWZmUNVjRTHOXKltb+n
         H0Tg==
X-Gm-Message-State: AOJu0YxlMH0GElrI+QDBQ/aRS2vlMP6qfqpSOm4TuUJqdJOaamDt2TN0
        pNo4s9luAbXdP436QfYQKmE=
X-Google-Smtp-Source: AGHT+IH2/cNGejwv/ulEjaT86Xjg/wt4zTd/CeBaqdhwn/pXzo6rTMxKqQVi5u9KYDPXFs2QvrgxkQ==
X-Received: by 2002:a25:44:0:b0:d9d:38cd:e054 with SMTP id 65-20020a250044000000b00d9d38cde054mr10156472yba.13.1698171698922;
        Tue, 24 Oct 2023 11:21:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m10-20020a258c8a000000b00d9a4aad7f40sm3676802ybl.24.2023.10.24.11.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 11:21:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 Oct 2023 11:21:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Ian Nartowicz <deadbeef@nartowicz.co.uk>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: sch5627 on Fujitsu Celsius W280
Message-ID: <48d6b407-5431-4cb9-a43f-d0ca767d8a13@roeck-us.net>
References: <20231024150438.68dd079b@debian.org>
 <9c099de7-4290-5699-122b-927e39577439@roeck-us.net>
 <7d9b4557-5e4b-44ea-be6f-2d23632dcf77@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d9b4557-5e4b-44ea-be6f-2d23632dcf77@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 24, 2023 at 07:42:11PM +0200, Armin Wolf wrote:
> Am 24.10.23 um 16:48 schrieb Guenter Roeck:
> 
> > On 10/24/23 07:04, Ian Nartowicz wrote:
> > > I just upgraded a Celsius W280 to the 6.1 kernel and noticed that
> > > hardware
> > > monitoring was gone.  Was working in 5.10.  When I added it to the
> > > dmi_override_table, it started working again (with a slightly
> > > different device
> > > name).  dmidecode shows it as an on board device, type other, status
> > > disabled
> > > (just the watchdog?), and description "SMsC SuperI/O".
> > > 
> > 
> > Weird, this is the second private e-mail I get in a single day.
> > Is there some information out there suggesting that kernel maintainers
> > should be contacted without copying the mailing list ? If so, tell them
> > it is wrong. As warning to everyone, I won't reply any further
> > to private e-mails like this.
> > 
> > Looking at the code, try adding ignore_dmi=1 as module parameter when
> > loading the driver. I think commit 393935baa45e5c messed it up and
> > prevents the driver from loading if the parameter is not provided.
> > Maybe the conditions in sch56xx_init() are wrong or too generic.
> > Armin, any comments ? Do we need to revert your patch ?
> > 
> > Guenter
> > 
> I think so, it seems that the DMI devices are not always present.
> We better revert the DMI autodetection patch to prevent anymore
> regressions like this.
> 

Not sure what I'd need to revert. Would it be all of the following ?

fd2d53c367ae hwmon: (sch56xx-common) Add DMI override table
393935baa45e hwmon: (sch56xx-common) Add automatic module loading on supported devices
4db3c09228a0 hwmon: (sch56xx) Autoload modules on platform device creation

Alternatively, we could add Celsius W280 to the dmi override table.
After all, the code has been present since 6.1, and the functional
gain seems to be sufficient. Adding W280 with a Fixes: tag pointing
to fd2d53c367ae would make more sense to me than reverting the above
patches.

Guenter
