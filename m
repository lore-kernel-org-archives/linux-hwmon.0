Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:43210 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbeJBPak (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Oct 2018 11:30:40 -0400
MIME-Version: 1.0
References: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Oct 2018 10:48:17 +0200
Message-ID: <CAMuHMdXOQdJL14xNj3AHL6RC-fu=SWReXmh1JOS4s9cc-ZL5iQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Fix the 'No sensors found' error after replacing
 the parameter NULL by the actual device
To: =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-hwmon@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Cao,

Thanks for your patch!

On Tue, Oct 2, 2018 at 10:35 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> In __hwmon_device_register() function of hwmon.c, we have assigned 'dev' directly to 'hdev->parent'.
> Formerly, when registering the hwmon device, we pass NULL as the device. This is not affected.
> Recently, the developer has replaced the parameter NULL as the device by the actual device.

Do you know the commit ID of this recent change?
It's useful for review of your change, and to know to which versions your
patch should be backported.

> This causes the "No sensors found" error. This patch is to fix this error.

On which platform do you see this failure?
Thanks again!

> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -610,7 +610,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>
>         hwdev->name = name;
>         hdev->class = &hwmon_class;
> -       hdev->parent = dev;
> +       hdev->parent = dev->parent;
>         hdev->of_node = dev ? dev->of_node : NULL;
>         hwdev->chip = chip;
>         dev_set_drvdata(hdev, drvdata);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
