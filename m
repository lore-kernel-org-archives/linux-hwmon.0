Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0648DC43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 14:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C64FA20818
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 14:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvAzMbTC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfKLOkr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 09:40:47 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36588 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLOkr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 09:40:47 -0500
Received: by mail-lf1-f68.google.com with SMTP id m6so13054581lfl.3
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Nov 2019 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D0+mCwJvHZZGpXOrejwBvoUrE1rKqIxcVrLLV65g3dU=;
        b=nvAzMbTC2bmnHwdji1J7sYUrM9QAPLElBkYCTZ0Zth9vuKzqOXYwgIZbgEpLjrGpyk
         RPhBLA1BMjgApnaEwfa2kU6dpw9mDYD887VzTydqNNffU1a0wLaMOo3lM5D/RiLnfHSa
         cInD9O75RNCtkHSHF4Iz4Yl5Qv8QvNAD3Vf/iUyIRtodsCR0C2PxApxNGJTbIUka3bi8
         n5HkTa3VNpMebLtauG2tGOQA35bGFZjqkQJmB9IMBXh5uG5vgL13rdu8gdLA9dWpCO1v
         9dazDp74rTFZx1qthy1/SL7z1GgMlq3iQvMJlVF5t/87pPd/vLwYEB0r9LeQZ8M+2ezE
         2itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D0+mCwJvHZZGpXOrejwBvoUrE1rKqIxcVrLLV65g3dU=;
        b=Kee3iNczdDB72nSOh1rYX8tCepUcznYVSPMfpUPTdrAL+NpOBhIV6XfKdlk9T30uVM
         5w7OddR9tNLckchQvXut23CEQp1YxUhQlvFByjuN7sVeVH5X769dDzWytl8Lm00fx3xW
         ttTyYlTTNnTfde2dYTRN3/FE0/nRzjnficQ/Bw4L8twbAoBpRPIuDypXC4nd9hn31yco
         y58E2R35YmrUCXtBI1krSwofoACv4KeSlSUCvbW+qFXUlog38fdkgRm9y4Uoqpsxp3YP
         npYUbx2XaZc1NaLtW+h65jKKY29fvgoubPMTHrGig/v+0YMuv5VTcZcsJP/zPd4Y5gns
         c6gA==
X-Gm-Message-State: APjAAAVk2Vc/qHKwkjHJsqjZRNq//Zz9xITsOeEjF0DykxRHqotdnmqm
        KjNEhT1i4Rjgwj0TH4sGeHxZqkWs5DAao1993Ik=
X-Google-Smtp-Source: APXvYqwHxZ+IyoJdKVYjIf4LG+E5Mo8okP10vfKBtWf/7bZE5nrjrmrW1YKxzv6NYAzs8mSVtNKlfXkTv+2kMrSMgtE=
X-Received: by 2002:a19:820e:: with SMTP id e14mr19885367lfd.29.1573569644343;
 Tue, 12 Nov 2019 06:40:44 -0800 (PST)
MIME-Version: 1.0
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
 <d3c0c9a7-00b9-0465-16e1-6fd7ba97dfd0@roeck-us.net> <CAC5umyiju2Q2fdfVaFyX+Q=sMKr5Gsc_GDVYmSa0vB+w8acvAw@mail.gmail.com>
 <20191111173505.GB5826@roeck-us.net>
In-Reply-To: <20191111173505.GB5826@roeck-us.net>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Tue, 12 Nov 2019 23:40:32 +0900
Message-ID: <CAC5umyjviR1J5HojE6WBhYQCzu=CFPPoNxXY=T9KRw2yTpO=VQ@mail.gmail.com>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2019=E5=B9=B411=E6=9C=8812=E6=97=A5(=E7=81=AB) 2:35 Guenter Roeck <linux@ro=
eck-us.net>:
>
> On Tue, Nov 12, 2019 at 12:56:21AM +0900, Akinobu Mita wrote:
> > 2019=E5=B9=B411=E6=9C=8811=E6=97=A5(=E6=9C=88) 1:30 Guenter Roeck <linu=
x@roeck-us.net>:
> > >
> >
> [ ... ]
>
> > > > Example output from the "sensors" command:
> > > >
> > > > nvme-pci-0100
> > > > Adapter: PCI adapter
> > > > Composite:    +53.0 C  (low  =3D -273.0 C, high =3D +70.0 C)
> > > >                         (crit =3D +80.0 C)
> > > > Sensor 1:     +56.0 C  (low  =3D -273.0 C, high =3D +65262.0 C)
> > > > Sensor 2:     +51.0 C  (low  =3D -273.0 C, high =3D +65262.0 C)
> > > > Sensor 5:     +73.0 C  (low  =3D -273.0 C, high =3D +65262.0 C)
> > > >
> > >
> > > Have you tried writing the limits ? On my Intel NVME drive (SSDPEKKW5=
12G7), writing
> > > any minimum limit on the Composite temperature sensor results in a te=
mperature
> > > warning, and that warning is sticky until I reset the controller.
> > > I don't see that problem on Samsung SSD 970 EVO 500GB; I have not yet=
 tried others.
> >
> > I have Crucial CT500P1SSD8 and WDC WDS512G1X0C-00ENX0, and I have no
> > problem with these devices.
> >
> > > root@jupiter:/sys/class/hwmon/hwmon0# sensors nvme-pci-0100
> > > nvme-pci-0100
> > > Adapter: PCI adapter
> > > Composite:    +30.0=C2=B0C  (low  =3D -273.0=C2=B0C, high =3D +70.0=
=C2=B0C)
> > >                         (crit =3D +80.0=C2=B0C)
> > >
> > > root@jupiter:/sys/class/hwmon/hwmon0# echo 0 > temp1_min
> > > root@jupiter:/sys/class/hwmon/hwmon0# sensors nvme-pci-0100
> > > nvme-pci-0100
> > > Adapter: PCI adapter
> > > Composite:    +30.0=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D +70.0=C2=
=B0C)  ALARM
> > >                         (crit =3D +80.0=C2=B0C)
> > >
> > > It doesn't seem to matter which temperature I write; writing -273000 =
has
> > > the same result.
> > >
> > > [This is actually why I didn't use the features commands; not that I =
had observed
> > >   the problem, but I was concerned that problems like this would show=
 up.]
> >
> > Maybe we should introduce a new quirk so that we can avoid changing
> > temperature threshold for such devices.  Could you tell SSDPEKKW512G7's
> > vendor and device ID?  Quick googling answers it's 8086:f1a5, but I wan=
t
> > to make sure.
>
> Yes, that is correct.
>
> 01:00.0 Non-Volatile memory controller [0108]: Intel Corporation Device [=
8086:f1a5] (rev 03)

OK.  I'll add NVME_QUIRK_NO_TEMP_THRESH_CHANGE and mark the device.

> I'll see if I can test this tonight on my other NVMEs. I also dug up an o=
ld
> NVMe drive from Toshiba; I'll see if I can connect and test it as well.

That's nice.

> [ ... ]
>
> > > >        */
> > > >       switch (attr) {
> > > >       case hwmon_temp_max:
> > > > -             *val =3D (data->ctrl->wctemp - 273) * 1000;
> > > > +             err =3D nvme_get_temp_thresh(data->ctrl, channel, fal=
se, val);
> > > > +             if (err)
> > > > +                     *val =3D (data->ctrl->wctemp - 273) * 1000;
> > >
> > > This would report WCTEMP for all sensors on errors, including errors =
seen while
> > > the controller is resetting. I think it should be something like
> > >
> > >                 int err =3D 0;
> > >                 ...
> > >
> > >                 if (!channel)
> > >                         *val =3D (data->ctrl->wctemp - 273) * 1000;
> > >                 else
> > >                         err =3D nvme_get_temp_thresh(data->ctrl, chan=
nel, false, val);
> > >                 return err;
> > >
> > > assuming we keep using ctrl->wctemp (see below). If changing the uppe=
r Composite
> > > temperature sensor limit changes wctemp, and we don't update it, we s=
hould not
> > > use it at all after registration and just report the error.
> > >
> > > >               return 0;
> > > > +     case hwmon_temp_min:
> > > > +             return nvme_get_temp_thresh(data->ctrl, channel, true=
, val);
> > > >       case hwmon_temp_crit:
> > > >               *val =3D (data->ctrl->cctemp - 273) * 1000;
> > > >               return 0;
> > > > @@ -73,6 +117,23 @@ static int nvme_hwmon_read(struct device *dev, =
enum hwmon_sensor_types type,
> > > >       return err;
> > > >   }
> > > >
> > > > +static int nvme_hwmon_write(struct device *dev, enum hwmon_sensor_=
types type,
> > > > +                         u32 attr, int channel, long val)
> > > > +{
> > > > +     struct nvme_hwmon_data *data =3D dev_get_drvdata(dev);
> > > > +
> > > > +     switch (attr) {
> > > > +     case hwmon_temp_max:
> > > > +             return nvme_set_temp_thresh(data->ctrl, channel, fals=
e, val);
> > >
> > > Does this change WCTEMP if written on channel 0 ? If so, we would hav=
e to update
> > > the cached value of ctrl->wctemp (or never use it after registration)=
.
> >
> > At least for the devices I have, setting the over temperature threshold
> > doesn't change the WCTEMP.
> > I have checked with  'nvme id-ctrl /dev/nvme0 | grep ctemp'.
> >
>
> Interesting. I just tested this, and the result is the same with Samsung
> SSD 970 EVO. With that in mind, maybe we should really not use wctemp
> at all after initialization, as I had suggested above. What do you think =
?

Yes. We only need to use the WCTEMP in nvme_hwmon_is_visible().
