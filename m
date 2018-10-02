Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vk1-f194.google.com ([209.85.221.194]:37797 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbeJBTle (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Oct 2018 15:41:34 -0400
MIME-Version: 1.0
References: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
 <CAMuHMdXOQdJL14xNj3AHL6RC-fu=SWReXmh1JOS4s9cc-ZL5iQ@mail.gmail.com>
 <4ed65427-ce94-5586-82ef-f73d7ff413ed@jinso.co.jp> <3fd89cff-4e3f-b4b5-6f45-6a6363003646@roeck-us.net>
In-Reply-To: <3fd89cff-4e3f-b4b5-6f45-6a6363003646@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Oct 2018 14:58:07 +0200
Message-ID: <CAMuHMdW_WnRxg1m17UgukKQ4Lwu0_fLbSFoaihw2Y9kdR27Wrg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Fix the 'No sensors found' error after replacing
 the parameter NULL by the actual device
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>, Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-hwmon@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>,
        Marc Zyngier <Marc.Zyngier@arm.com>,
        Eduardo Valentin <edubezval@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

CC  Marc, Eduardo

On Tue, Oct 2, 2018 at 2:56 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/02/2018 02:06 AM, Cao Van Dong wrote:
> > Dear Geert-san,
> >
> > Thanks for your comment!
> >
> >>> In __hwmon_device_register() function of hwmon.c, we have assigned 'dev' directly to 'hdev->parent'.
> >>> Formerly, when registering the hwmon device, we pass NULL as the device. This is not affected.
> >>> Recently, the developer has replaced the parameter NULL as the device by the actual device.
> >> Do you know the commit ID of this recent change?
> >> It's useful for review of your change, and to know to which versions your
> >> patch should be backported.
> >
> > The commit ID of this recent change is"f6b6b52 thermal_hwmon: Pass the originating device down to hwmon_device_register_with_info".
> >
> If thermal doesn't want hwmon to use the thermal zone device, it should pass
> the parent of that device as parameter.
>
> >>> This causes the "No sensors found" error. This patch is to fix this error.
> >> On which platform do you see this failure?
> >> Thanks again!
> >
> > This error is found on Gen2 Lager board v4.19-rc2 by RVC team.
> >
>
> Some more details about the error would be useful.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
