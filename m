Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B15C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 14:20:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6803B2084F
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 14:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQye6WKN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfKLOUB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 09:20:01 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45315 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfKLOUB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 09:20:01 -0500
Received: by mail-lj1-f195.google.com with SMTP id n21so17995449ljg.12
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2019 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=InWYQ6EDE1UwAi29n8OvoJ68XjWPUmv8Cb0X5ROSwiE=;
        b=iQye6WKNcdQxY1qQqzRwCZQoEFJlLcsmRMf12S+29lJJJkVHdwTlh2Ml35WI0sDxx4
         iBLRcUs7FzgRKgO3GGCIxrYjvzrmIRHONdKyMFFfXtawC/6hTRXD2+IX1XVtsKPGKsHM
         SPgo1y5tqw8iF6FE2rVKu3+rCHmix2yY3wgFDktT8XIDHGTict9VbW85FifoTI2nkWem
         tfPTewwyZ1cLzQE85807vXCFt76rWN0SM76V99DjNdyySbdVuTLRrM7XKCKN+r/d3baF
         tASuZdu23IDpp8++5cjW/Z++dlETAM5F40p2msGSxk0OKueOg+ZQDYBePLRRDWKgeLu/
         6WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=InWYQ6EDE1UwAi29n8OvoJ68XjWPUmv8Cb0X5ROSwiE=;
        b=Iwq7aY1zoWICflLlpLPf3YgUgjTcm1/DcqpGUlrj/TysZ/O/2zy+8fdCXoaX5NP5zH
         HIb0TajOnMpf5eUPBRVTDKO5MtBCuq8mdgqK02TYw/eCN+fSdUZFUgkL8h5QEWoWVa2O
         YdyXSFB2TafDejg9CuoU3a4BScVFYwwqFw4POaVGQML7ewIVhSG/BCgpFQbiK5w4fkxj
         c3Ozx4FifUpPEZJAa4PUD7A2s6CX+7j4/bCs3cmHrv3kseWnaGG0wVQJxP8p3WCEr3QK
         OiwVJmzeNqxPSyFpWNiLhuubGcmgI+CB+xqcbHgU/lcFj8X3B6P5TCSEcbMYYMayelod
         bD3w==
X-Gm-Message-State: APjAAAXtVSPcuraEWCaZwhYmtMhzsTKut4FlNEpIry2UUNbEkfqrkUb9
        6WZgu8aXpQxPuqfYdcbjLlRXx5MwXaaw30XQWyoqosdH
X-Google-Smtp-Source: APXvYqwwL3b6kisFGamAPBxCgIElSoqmEJ+MGMEpAx6WBeIcEuxhDCpeK7UqIuD/AZJZvdI+N9xw3q+dWaHVKvOItuw=
X-Received: by 2002:a2e:9842:: with SMTP id e2mr20371028ljj.93.1573568398829;
 Tue, 12 Nov 2019 06:19:58 -0800 (PST)
MIME-Version: 1.0
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com> <20191111165306.GA19814@lst.de>
In-Reply-To: <20191111165306.GA19814@lst.de>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Tue, 12 Nov 2019 23:19:46 +0900
Message-ID: <CAC5umyi97UJZzk+4soD+th0BZ71WfnOqnTWWuTYKyo6aWTdLXA@mail.gmail.com>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2019=E5=B9=B411=E6=9C=8812=E6=97=A5(=E7=81=AB) 1:53 Christoph Hellwig <hch@=
lst.de>:
>
> On Sun, Nov 10, 2019 at 11:17:46PM +0900, Akinobu Mita wrote:
> > +static int nvme_get_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bo=
ol under,
> > +                             long *temp)
> > +{
> > +     unsigned int threshold =3D sensor << NVME_TEMP_THRESH_SELECT_SHIF=
T;
> > +     int status;
> > +     int ret;
> > +
> > +     if (under)
> > +             threshold |=3D NVME_TEMP_THRESH_TYPE_UNDER;
> > +
> > +     ret =3D nvme_get_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold,=
 NULL, 0,
> > +                             &status);
> > +     if (!ret)
> > +             *temp =3D ((status & NVME_TEMP_THRESH_MASK) - 273) * 1000=
;
> > +
> > +     return ret <=3D 0 ? ret : -EIO;
>
> This looks a little obsfucated.  aI'd prefer something like:
>
>         if (ret > 0)
>                 return -EIO;
>         if (ret < 0)
>                 return ret;
>         *temp =3D ((status & NVME_TEMP_THRESH_MASK) - 273) * 1000;
>         return 0;

Sounds good.

> > +     return ret <=3D 0 ? ret : -EIO;
>
> Similarly here, something like:
>
>         if (ret > 0)
>                 return -EIO;
>         return ret;

OK.

> > +             err =3D nvme_get_temp_thresh(data->ctrl, channel, false, =
val);
> > +             if (err)
> > +                     *val =3D (data->ctrl->wctemp - 273) * 1000;
>
> Can we have a helper for this (x - 273) * 1000 conversion?  It is
> repeated quite a bit over the code in this file.

OK. I'll add two macros.

#define MILLICELSIUS_TO_KELVIN(t) ((t) / 1000 + 273)
#define KELVIN_TO_MILLICELSIUS(t) (((t) - 273) * 1000)
