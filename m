Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E2CC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Mar 2022 01:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbiCVBXO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Mar 2022 21:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbiCVBXM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Mar 2022 21:23:12 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808BF10CB
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Mar 2022 18:21:45 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id o6so22160744ljp.3
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Mar 2022 18:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V7BLAt/fJYUj0OsISV5J6z9qzVDh6CQrx7wQ/ZZuGFs=;
        b=PsdAyGqfgTpjhTv0nYwzSdVRaR+CB/53R2SZpWfxShtuAAHGPlf2B/Jg5PWRg3yudw
         UotUSXTbQYjhSyEJ9OSNmmJ3VZtgRBv58AMCF7LrO3EJBDZ7K5tuaRPDCVNMbfm8qm9X
         9ID6wa/EDvmSMzIdAZ+B3zN/k2wJoO6rHAcLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V7BLAt/fJYUj0OsISV5J6z9qzVDh6CQrx7wQ/ZZuGFs=;
        b=kNPQR+q4DGESfowEcNxpxsrGeFKEEbBAQmu2M9ivldj0fygGJpsQmvcp+gsJCK0yDo
         K+XBIz6vTyFoaFcLRXoR0WpqmweTXAP0uKcc38kSaqin89fmlc9AYiyFlTmre7yWfgii
         bQlm1RQBxPO0femmg3LiRZkdwSnxCAIwqHcfuowUWLinP4I7rfUB1MG2wQjCZECF4PAZ
         bVTwz+3Lxc5fWErLVuunUOuRfEOFtSZu7HTc8XZBucHpfg9as2otevxKRD5SCPNiKh6X
         AJrarmXjKLA8aME0C1G9H2TcAhnmyfeQ+GN8bZMIlHzvwNB/sMKXevnvyLhRqqQYBMgr
         a+mg==
X-Gm-Message-State: AOAM533SS+l4xHp8NROGavOpTTh8HWszcziE3NZZ+6d5VDVM+ANzBKjt
        BYNptmnUUukUt42S6/UmqH9i+guTbLaS/W9RxpQ=
X-Google-Smtp-Source: ABdhPJxoQglPN7BooJSqdchHVwyWKphe8s/yv8YHZ2w8F/LvezJTVYiEu0DX9w+Te3sc+XuWzGmDqA==
X-Received: by 2002:a2e:7a1a:0:b0:246:210:65cd with SMTP id v26-20020a2e7a1a000000b00246021065cdmr17114487ljc.99.1647912103635;
        Mon, 21 Mar 2022 18:21:43 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id bt23-20020a056512261700b0044400161095sm1983044lfb.168.2022.03.21.18.21.42
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 18:21:43 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id g24so20935845lja.7
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Mar 2022 18:21:42 -0700 (PDT)
X-Received: by 2002:a05:651c:1213:b0:247:e2d9:cdda with SMTP id
 i19-20020a05651c121300b00247e2d9cddamr17545979lja.443.1647912102735; Mon, 21
 Mar 2022 18:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220320231317.2171300-1-linux@roeck-us.net>
In-Reply-To: <20220320231317.2171300-1-linux@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Mar 2022 18:21:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgM1uHH1WJ47Zt5OGK5qjtFkvVCZLff+TKA2ahXAM1xQg@mail.gmail.com>
Message-ID: <CAHk-=wgM1uHH1WJ47Zt5OGK5qjtFkvVCZLff+TKA2ahXAM1xQg@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon updates for v5.18
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Mar 20, 2022 at 4:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Improvements to existing drivers:
> - adt7x10: Convert to use regmap, convert to use with_info API,
>   use hwmon_notify_event, and other cleanup
> - aquacomputer_d5next: Add support for Aquacomputer Farbwerk 360
> - asus_wmi_sensors: Add ASUS ROG STRIX B450-F GAMING II
> - asus_wmi_ec_sensors: Support T_Sensor on Prime X570-Pro
>   Deprecate driver (replaced by new driver)
[...]

To make my life easier, can I ask you to try to format these things a
bit more sanely and legibly?

You had this odd mix of sometimes using new lines to separate
different things (eg that asus_wmi_ec_sensors entry), and sometimes
just multiple different things in a list that then had line-breaks in
the middle.

That kind of stuff is _very_ hard to parse as anything but a random
jumble of words all crammed together.

Whitespace to separate things is good, and some kind of consistent
indentation makes it more legible. I edited it all up (hopefully
correctly), but it would be nice to get it in a readable form to begin
with..

Yeah, if everything does well, nobody will ever need to read that
merge message, but let's try to aim for nice and informative commit
messages anyway.

             Linus
