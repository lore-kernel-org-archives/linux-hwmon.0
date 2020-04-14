Return-Path: <SRS0=wRoL=56=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3356CC2BA19
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Apr 2020 08:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF84E2072D
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Apr 2020 08:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qi+aAYqV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406970AbgDNIIQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Apr 2020 04:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406955AbgDNIIH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Apr 2020 04:08:07 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601A0C0A3BE2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Apr 2020 01:08:07 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h9so13208783wrc.8
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Apr 2020 01:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Of87X/gGHd7WK7J8InDBiy0jDOtLSnaghXrcb3fjgfk=;
        b=Qi+aAYqVu1eN15qmGiNzA8fNa4lIaXjb7w8Ocp8Gc0hvk+JIaKlkVXzyxUG8n0kj+r
         UO5wQRuYWMusYRen73PY8mnpxj7c2gEagVixnKH7uYpOo25BzIAhsiy4AwByxwVKgDTX
         3usXFCaxp+gOky+4ixr3sYj7SJeR2HTcyBG8WdE5NSYpwB+WADiE6Jvju2AScK2TrryU
         m0Nbcv9ajXflZubAOOw8jM1w57tWTxiDu8rNj7uzuriDtcDYZAa3eT9hU0TcjfE4Hm8v
         K5mfMgvUSBew+h/w06khwgn9kCDZAA34fzfhg7vHcnzLGX4BOXe2yx/so+jE4QPF1o8e
         YT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Of87X/gGHd7WK7J8InDBiy0jDOtLSnaghXrcb3fjgfk=;
        b=eO6LNcOMlwR5LJuIYADsibwEQh1KC1MgmEKAp6Xf5fYyCML+APagI2YPgWbHVSsTaK
         685obyJ6ibm68MclhyQaBI3Y9rwsU8xizTX0QNNy8k9dzFGXgL9/7XPrqRJ0BzGqXwnF
         BXipcicn7BZf5YRxl0U7CjXish8kozoyqOIVz9eE9qf2nzqltITnJeoqC1ppr9G6suNR
         NBfUHC7grD2ulZG4sdlW64Z4crA2grCbuZuQ8snYIxlrV9mB45koDSq4RMkuLzR+wqjW
         3YjRH7IKX0iqvxLGmGQrnzQkXQbirDgyYeQ+1NZiUB+h9plbHpK4Au2x/x2vWkqNCGjQ
         9oCw==
X-Gm-Message-State: AGi0PuYVyYCVhYAHW5TTEmVdj6tddmOKbMAcchGaGPhQXMt6OeVUOhjW
        82RWvZUL/NIG2P9Nnx1963DQvQ==
X-Google-Smtp-Source: APiQypLIN3SbXV7PM0uFFyvMDh857863ygqy9yht/XtufvHAtOL8FPNIeAgdp7UPDBUQOVQgcQy0GQ==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr10371255wrq.222.1586851685895;
        Tue, 14 Apr 2020 01:08:05 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id f63sm17383374wma.47.2020.04.14.01.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 01:08:05 -0700 (PDT)
Date:   Tue, 14 Apr 2020 09:09:05 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Robert Jones <rjones@gateworks.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v8 2/3] mfd: add Gateworks System Controller core driver
Message-ID: <20200414080905.GC2167633@dell>
References: <1585341214-25285-1-git-send-email-tharvey@gateworks.com>
 <1585341214-25285-3-git-send-email-tharvey@gateworks.com>
 <CAJ+vNU1GWFKv8f-ihhoVTWgD8G5UyupOek1fmBPaU0QXKC1qHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+vNU1GWFKv8f-ihhoVTWgD8G5UyupOek1fmBPaU0QXKC1qHw@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 08 Apr 2020, Tim Harvey wrote:

> On Fri, Mar 27, 2020 at 1:33 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > The Gateworks System Controller (GSC) is an I2C slave controller
> > implemented with an MSP430 micro-controller whose firmware embeds the
> > following features:
> >  - I/O expander (16 GPIO's) using PCA955x protocol
> >  - Real Time Clock using DS1672 protocol
> >  - User EEPROM using AT24 protocol
> >  - HWMON using custom protocol
> >  - Interrupt controller with tamper detect, user pushbotton
> >  - Watchdog controller capable of full board power-cycle
> >  - Power Control capable of full board power-cycle
> >
> > see http://trac.gateworks.com/wiki/gsc for more details
> >
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > ---
> >  MAINTAINERS                 |   8 ++
> >  drivers/mfd/Kconfig         |  10 ++
> >  drivers/mfd/Makefile        |   1 +
> >  drivers/mfd/gateworks-gsc.c | 288 ++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/gsc.h     |  73 +++++++++++
> >  5 files changed, 380 insertions(+)
> >  create mode 100644 drivers/mfd/gateworks-gsc.c
> >  create mode 100644 include/linux/mfd/gsc.h

[...]

Please clip your responses.

> Lee,
> 
> Do you have time to look at this? Rob has reviewed the dt-bindings and
> Guenter has reviewed the hwmon driver so this is the only patch
> remaining in the series that needs review/sign-off.

It's on the list.

Please bear in mind that the merge-window has been open for the past 2
weeks.  Usually reviewing cadence slows down during this period.  It
should be ramping up again this week.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
