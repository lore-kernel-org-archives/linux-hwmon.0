Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:45653 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbeJBTlJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Oct 2018 15:41:09 -0400
MIME-Version: 1.0
References: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp> <031294c5-2fd5-f6cc-6762-30e987c5029c@roeck-us.net>
In-Reply-To: <031294c5-2fd5-f6cc-6762-30e987c5029c@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Oct 2018 14:57:42 +0200
Message-ID: <CAMuHMdXozo5_+XTM2k4DYX-XP9HF6R1Ej9gmm4HEg6d2pHPh2Q@mail.gmail.com>
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

On Tue, Oct 2, 2018 at 2:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 10/02/2018 01:35 AM, Cao Van Dong wrote:
> > In __hwmon_device_register() function of hwmon.c, we have assigned 'dev' directly to 'hdev->parent'.
> > Formerly, when registering the hwmon device, we pass NULL as the device. This is not affected.
> > Recently, the developer has replaced the parameter NULL as the device by the actual device.
> > This causes the "No sensors found" error. This patch is to fix this error.
> >
> > This patch is based on the v4.19-rc3 tag.
> >
>
> NACK.
>
> This is wrong. The passed device is the hwmon driver's parent device. Using that device's
> parent would be wrong. Indeed, that device could be a platform device with no parent.
> The problem must be fixed in the calling code.
>
> Guenter
>
> > ---
> >   drivers/hwmon/hwmon.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> > index 33d5128..7c8d3cb 100644
> > --- a/drivers/hwmon/hwmon.c
> > +++ b/drivers/hwmon/hwmon.c
> > @@ -610,7 +610,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
> >
> >       hwdev->name = name;
> >       hdev->class = &hwmon_class;
> > -     hdev->parent = dev;
> > +     hdev->parent = dev->parent;
> >       hdev->of_node = dev ? dev->of_node : NULL;
> >       hwdev->chip = chip;
> >       dev_set_drvdata(hdev, drvdata);
