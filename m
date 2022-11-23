Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F06DC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Nov 2022 16:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235641AbiKWQWZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Nov 2022 11:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238271AbiKWQWX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2022 11:22:23 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6968F3F6;
        Wed, 23 Nov 2022 08:22:22 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-142612a5454so20712471fac.2;
        Wed, 23 Nov 2022 08:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJIRLpu6ZgoR6Ullt/AKW3jUuRoGfuYCFpIP5fDX8i8=;
        b=eOe4rfwulZ7w+wGOSfNP2iJH73IEpX251lzrXrmErDCu7rvlcNhFOltBri4bQZxBqI
         tJvpGp2YRFJtkPxtr7kOfxXqRM5jNu8reKaiHtoBfxkL4CIDygVH7S9QquyRCmGohd5u
         I2i5N8bTF5fAueX5BqEZtF7/30kgYlfbAOTc5R/SvJASAYvqbuwKc48SYWIfj80eOZAi
         mtTCSEaKND30OelgxGbZKNKeOFXImRP0i8GWFj6PoPKNQyNVccEE0HkmI4+dwqMvRy7P
         W4MhS5+NfeiUpOG9+WOT8Ll1TLGpAbCqldJ4Vf2emznKQV8wCr0QHqGXnZdfhMOA0x7c
         HKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJIRLpu6ZgoR6Ullt/AKW3jUuRoGfuYCFpIP5fDX8i8=;
        b=Icgt2emL9VVoyaKnZZjS8jfDcTCoQJu79uRlbwA0neQcUHlzfGG6axty2IOAhoeyO4
         teB4FR75UKEF/e/OKf78Msbi7DLgJfHTVy2+Qt1ZmAR2DjiCnhOyBunDpzJC/OxNu0Ej
         Rbu5VH6FAZDvJDpZYukBxX435KdIiWA/LiGpymAoRVWdedgaJCau3FHYJe7B70852UaX
         imWfcSPnuCtGmUkyvjk71FzQCOGW9o893jOs8sa7KSo65W/pemAWsvP190TepVbmoyGi
         /V+88+ly5rDBIyP+cnBs7MjsTTsiuIkMuDPEz4z+PL4avIc+/5ss/bFEAOLP2DSdnUvz
         EQig==
X-Gm-Message-State: ANoB5pkxjfB9C/fQ78UmDV7Hkcq+XqMm5P4GbaYsDUKd7oud2NzUhE4F
        UA/OrxeL+/sKxMN7Wscy/VA=
X-Google-Smtp-Source: AA0mqf4GRI36OOFuoDFTUbo9s4kEkUuCA7LFIdHA14zp5+yFctHTwXW2k3e5XQ/gIkggCmfTwICpmQ==
X-Received: by 2002:a05:6870:a2cd:b0:132:8d60:358f with SMTP id w13-20020a056870a2cd00b001328d60358fmr8757629oak.102.1669220542008;
        Wed, 23 Nov 2022 08:22:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd32-20020a056870d7a000b0013d6d924995sm9344370oab.19.2022.11.23.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:22:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 23 Nov 2022 08:22:20 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joaquin Aramendia <samsagax@gmail.com>
Cc:     w_armin@gmx.de, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH] hwmon: (oxp-sensors) Add AOK ZOE and Mini PRO
Message-ID: <20221123162220.GA3019010@roeck-us.net>
References: <20221119162347.36698-1-samsagax@gmail.com>
 <20221120134650.GA1787156@roeck-us.net>
 <CABgtM3g+g9PSXaTxaywJLQ18Y7pZybeDDrvycN-KzCczZ_0UPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgtM3g+g9PSXaTxaywJLQ18Y7pZybeDDrvycN-KzCczZ_0UPg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Nov 20, 2022 at 10:01:09PM -0300, Joaquin Aramendia wrote:
> El dom, 20 nov 2022 a la(s) 10:46, Guenter Roeck (linux@roeck-us.net) escribió:
> >
> > On Sat, Nov 19, 2022 at 01:23:48PM -0300, Joaquín Ignacio Aramendía wrote:
> > > Add support for the AOK ZOE A1 and OXP Mini PRO handheld devices.
> > > DMI strings are added to this driver since the same EC layout is used and
> > > has similar specs as the OXP mini AMD.
> > >
> > > The added devices are:
> > > - OneXPlayer mini PRO (AMD 6800U)
> > > - AOK ZOE A1 (AMD 5800U)
> > >
> > > Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> >
> > Applied to hwmon-next.
> >
> > Thanks,
> > Guenter
> 
> Oh, great! Thanks Guenter. I just realized I made a typo in the commit
> message. Would you mind if I correct it and resend a v2 of the patch?

I don't mind, but I don't see the typo. What is it ?

Guenter

> -- 
> Joaquín I. Aramendía
