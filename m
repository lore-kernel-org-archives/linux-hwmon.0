Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EF3ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 19:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiJaTd3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 15:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJaTd2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 15:33:28 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A43313F0F;
        Mon, 31 Oct 2022 12:33:27 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-36a4b86a0abso117498617b3.7;
        Mon, 31 Oct 2022 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ukhsb6WqMTUFdsjnnFX45813HdOsOzUhyx2dmSzAg1I=;
        b=oWIdlB4b7vMOzGu6wAhzcHmuBrqSUpp5cF5EVCjD5hXU0FRy8l2t7vKv75K3hsJ9JU
         v/oL6RhYFmbreFfKMhBFXRlrVhG4vql2E0wl9kNgw4mF3Fcj1Bdx3TSLyeCixN1AGs7v
         i5VbKvdBFc3muXU4fmmlL1oN0O2cNw032t1DY7DqYe85czSqsrlH91MH5HZZ6KhuSgDR
         7TVDWw8kIatBHnOOWMf3ki9+mRTlRKs8D1zGtH6qY+MKQ+yO3la16hl6q2zqf9X58RPI
         u+rQEVPHLppzrSvjbAaLh8BaGFzOg+7aoEVoB4/nfYVVcHMlbwTN1RgpXr4rXyvDJ7ii
         zrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ukhsb6WqMTUFdsjnnFX45813HdOsOzUhyx2dmSzAg1I=;
        b=vloRSR8krVQqYX4tVOzq6wijeb2DqXhzJLl4jvCS4/+lKBTrcPmikeRd67jSXt6Fvj
         z5klF8g5atJTHjqVuSlWp714xJIJeEX5w+UJbqIFUmMMb/tfka9g8rewV8xHrE7oOGfu
         kpXuYo9eRWRlY1TugAL8Ohgrnp/tuU0K3bRIju4szC42byPcQytaGZS8sGkyrUlFxCuy
         RrZxHJBisv2mzIFGfqlAN6O1l0RwsnZRShJNKOLJnlV0ONSxS+tVjfzteWpT8pGUAsl3
         lIhGlCDYlgWDnlaWvXIhFaElouzANKEaW4vLomWBZU0FdohaN4SpbI5bHXzTmojtm4rz
         +TnQ==
X-Gm-Message-State: ACrzQf1HD7BS/VHcbVQ+LUguXaNXqByDqLXY8XcN3MkR0Rzcb0KASTfQ
        qdwbQz3fJTXuNLtttppL5aKRVdnHCttEWJaIWNg=
X-Google-Smtp-Source: AMsMyM4+rtL7u+y3Ly4vAcT8fwX6XpZIaGycxPArPZHfXYefJ2s2hNyvLFBdt4VVIgKRV347gYqpxEhucPRnMc5T2NI=
X-Received: by 2002:a81:7c43:0:b0:369:edc9:aa10 with SMTP id
 x64-20020a817c43000000b00369edc9aa10mr14652955ywc.348.1667244806401; Mon, 31
 Oct 2022 12:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
 <20221031145308.341776-1-samsagax@gmail.com> <MN0PR12MB6101E68C68270C670A854B62E2379@MN0PR12MB6101.namprd12.prod.outlook.com>
 <CABgtM3g7MquMfQckFw4DHeEZjMrOxfJcZkW4kHeT3c6aiZxk9g@mail.gmail.com> <MN0PR12MB61011AF7549FC683BEF6CC50E2379@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB61011AF7549FC683BEF6CC50E2379@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Mon, 31 Oct 2022 16:33:15 -0300
Message-ID: <CABgtM3iTfgV-RzSGxuEgEVkpUUFoDB2VLOfVzRtv9_T4AaSRDA@mail.gmail.com>
Subject: Re: [PATCH v3] Add OneXPlayer mini AMD sensors driver
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi again, Mario. Sad but true

El lun, 31 oct 2022 a la(s) 16:21, Limonciello, Mario
(Mario.Limonciello@amd.com) escribi=C3=B3:

>
> Have you tried comparing all of the DMI strings?  I'm really surprised th=
at
> they would all be the same.  My suspicion would be that at least the SKU
> string should be different.  If it is, you should be able to drop the CPU=
 match
> and use that instead.

I tried all DMI strings: Here is the SKU in particular:

# cat  /sys/class/dmi/id/product_sku
ONE XPLAYER

Is the same as product_name and board_name. product_family is empty,
product version is "Default string", same as chassis_version and
board_asset_tag. Yeah. These devices are a mess... Hope the next ones
can be better and eventually they release a firmware upgrade to change
the strings.
