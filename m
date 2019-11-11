Return-Path: <SRS0=0ZqG=ZD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1114AC43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Nov 2019 15:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B65712184C
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Nov 2019 15:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ev+yJRQU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfKKP4g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Nov 2019 10:56:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37987 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfKKP4g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Nov 2019 10:56:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id v8so14374537ljh.5
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Nov 2019 07:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a/EPVkqkTx36HfXIr/IJ0OeApjO/gL81yUwC3qXGV2Q=;
        b=ev+yJRQUijejosb5HpInKCRl4w062HhzpVdnztw82RyvXq/72WNps3c+5luu6y/YWl
         OBUx6HXNpLvIrscz9DwiJXHlxqUsBZJdBVzDEu7uezH4J+m5xYTCdlLzLLpRK8kU5J6O
         QnDwYotvsAZkY/CW+4ce+aHMlgaltuHipUA72hGuiMMQsWF7unoFoivdjtd4OJAYU3n9
         lzaPsQenwkk4VZzGuBuv7KQpqvZXhE/6yv/nBc+M1xx9R/Ttq7vd55/sux1WjuCaw0Zd
         VEvvuB8rnD7PmpdyiRF0EBWEb2Jg+z3kMltywiG3jzJR6Fc2ua7DlVNgo9mZmLIR3lgy
         J0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a/EPVkqkTx36HfXIr/IJ0OeApjO/gL81yUwC3qXGV2Q=;
        b=gPO1okF6wklPRhp2WPuqiW2L/zwnVQhtRlZ6K3DZo6Zfo8BtCZ6mAA/XmcleDDQglm
         bZqigGodUoA2IGeDM08SqTGvf5n0+B7X7WWjOm7glsmCwbxRMH54tuGUDY1AUXJNQKwc
         MBOFuYkj0pqqpHzQGGD6zIScMGrMW0BA8i1g3DdLOivgA02uT+PlURVk3McOCN8q/b//
         hUzXz+BmNayQCkWh0Py0Kqqi78HD9ppCi8DNnNNHZbkKGWYu7LD7cZjZmlm3jYsU/52i
         lzBCSjNIuSJ6y/AQX7bgdU6yQsXDuPOpdbynzGuD5v/r76KpXCRw/jk0N41p06eyqk7u
         9woA==
X-Gm-Message-State: APjAAAWqCZE6hEan66Mhe2a3xoYzarlX4eyJhaZQXkimrfHzCR7BoK5Y
        N33Po5Wcnar7C2oid2m2/ip+PMPlB9Y5RqPis8c=
X-Google-Smtp-Source: APXvYqw1wE1vBBzycxXbjqa3Kx2n/DrVEVwZ33/qQa5wl6/YBKOZgKpftdsGtmY5/dclRl3PDLjC+YYZK4mDKsajDb0=
X-Received: by 2002:a2e:9842:: with SMTP id e2mr16764697ljj.93.1573487792694;
 Mon, 11 Nov 2019 07:56:32 -0800 (PST)
MIME-Version: 1.0
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com> <d3c0c9a7-00b9-0465-16e1-6fd7ba97dfd0@roeck-us.net>
In-Reply-To: <d3c0c9a7-00b9-0465-16e1-6fd7ba97dfd0@roeck-us.net>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Tue, 12 Nov 2019 00:56:21 +0900
Message-ID: <CAC5umyiju2Q2fdfVaFyX+Q=sMKr5Gsc_GDVYmSa0vB+w8acvAw@mail.gmail.com>
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

2019=E5=B9=B411=E6=9C=8811=E6=97=A5(=E6=9C=88) 1:30 Guenter Roeck <linux@ro=
eck-us.net>:
>
> On 11/10/19 6:17 AM, Akinobu Mita wrote:
> > According to the NVMe specification, the over temperature threshold and
> > under temperature threshold features shall be implemented for Composite
> > Temperature if a non-zero WCTEMP field value is reported in the Identif=
y
> > Controller data structure.  The features are also implemented for all
> > implemented temperature sensors (i.e., all Temperature Sensor fields th=
at
> > report a non-zero value).
> >
> > This provides the over temperature threshold and under temperature
> > threshold for each sensor as temperature min and max values of hwmon
> > sysfs attributes.
> >
> > The WCTEMP is already provided as a temperature max value for Composite
> > Temperature, but this change isn't incompatible.  Because the default
> > value of the over temperature threshold for Composite Temperature is
> > the WCTEMP.
> >
> > This also provides alarm attributes for each temperature sensor.  But a=
ll
> > alarm conditions are same, because there is only a single bit in
> > Critical Warning field that indicates one of the temperature is outside=
 of
> > a temperature threshold.
> >
>
> I think it would be more appropriate to report the alarm only for the
> composite temperature, reason being that we don't really know which indiv=
idual
> sensor it is associated with.

OK.

> > Example output from the "sensors" command:
> >
> > nvme-pci-0100
> > Adapter: PCI adapter
> > Composite:    +53.0 C  (low  =3D -273.0 C, high =3D +70.0 C)
> >                         (crit =3D +80.0 C)
> > Sensor 1:     +56.0 C  (low  =3D -273.0 C, high =3D +65262.0 C)
> > Sensor 2:     +51.0 C  (low  =3D -273.0 C, high =3D +65262.0 C)
> > Sensor 5:     +73.0 C  (low  =3D -273.0 C, high =3D +65262.0 C)
> >
>
> Have you tried writing the limits ? On my Intel NVME drive (SSDPEKKW512G7=
), writing
> any minimum limit on the Composite temperature sensor results in a temper=
ature
> warning, and that warning is sticky until I reset the controller.
> I don't see that problem on Samsung SSD 970 EVO 500GB; I have not yet tri=
ed others.

I have Crucial CT500P1SSD8 and WDC WDS512G1X0C-00ENX0, and I have no
problem with these devices.

> root@jupiter:/sys/class/hwmon/hwmon0# sensors nvme-pci-0100
> nvme-pci-0100
> Adapter: PCI adapter
> Composite:    +30.0=C2=B0C  (low  =3D -273.0=C2=B0C, high =3D +70.0=C2=B0=
C)
>                         (crit =3D +80.0=C2=B0C)
>
> root@jupiter:/sys/class/hwmon/hwmon0# echo 0 > temp1_min
> root@jupiter:/sys/class/hwmon/hwmon0# sensors nvme-pci-0100
> nvme-pci-0100
> Adapter: PCI adapter
> Composite:    +30.0=C2=B0C  (low  =3D  +0.0=C2=B0C, high =3D +70.0=C2=B0C=
)  ALARM
>                         (crit =3D +80.0=C2=B0C)
>
> It doesn't seem to matter which temperature I write; writing -273000 has
> the same result.
>
> [This is actually why I didn't use the features commands; not that I had =
observed
>   the problem, but I was concerned that problems like this would show up.=
]

Maybe we should introduce a new quirk so that we can avoid changing
temperature threshold for such devices.  Could you tell SSDPEKKW512G7's
vendor and device ID?  Quick googling answers it's 8086:f1a5, but I want
to make sure.

> > Cc: Keith Busch <kbusch@kernel.org>
> > Cc: Jens Axboe <axboe@fb.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Sagi Grimberg <sagi@grimberg.me>
> > Cc: Jean Delvare <jdelvare@suse.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> > This patch depends on the patch "nvme: Add hardware monitoring support"=
 [1]
> > [1] http://lists.infradead.org/pipermail/linux-nvme/2019-November/02788=
3.html
> >
> >   drivers/nvme/host/nvme-hwmon.c | 98 +++++++++++++++++++++++++++++++++=
+++------
> >   include/linux/nvme.h           |  6 +++
> >   2 files changed, 90 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/nvme/host/nvme-hwmon.c b/drivers/nvme/host/nvme-hw=
mon.c
> > index 5480cbb..79323b2 100644
> > --- a/drivers/nvme/host/nvme-hwmon.c
> > +++ b/drivers/nvme/host/nvme-hwmon.c
> > @@ -15,6 +15,46 @@ struct nvme_hwmon_data {
> >       struct mutex read_lock;
> >   };
> >
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
> > +}
> > +
> > +static int nvme_set_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bo=
ol under,
> > +                             long temp)
> > +{
> > +     unsigned int threshold =3D sensor << NVME_TEMP_THRESH_SELECT_SHIF=
T;
> > +     int status;
> > +     int ret;
> > +
> > +     temp =3D temp / 1000 + 273;
> > +     if (temp > NVME_TEMP_THRESH_MASK)
> > +             return -EINVAL;
> > +
>
> Traditionally we use clamp_val() in hwmon drivers to adjust value ranges
> for limit attributes, reason being that we can't expect userspace to dig
> through per-sensor-type documentation to identify valid limits. Also, not=
e
> that the above does not handle negative values well (-274000 -> -274 -> -=
1).
> I would suggest something like
>
>         temp =3D temp / 1000 + 273;
>         temp =3D clamp_val(temp, 0, NVME_TEMP_THRESH_MASK);
>
> or, if you want to be fancy;
>
>         temp =3D DIV_ROUND_CLOSEST(temp, 1000) - 273;
>         temp =3D clamp_val(temp, 0, NVME_TEMP_THRESH_MASK);

Either way looks good.

> > +     threshold |=3D temp;
> > +
> > +     if (under)
> > +             threshold |=3D NVME_TEMP_THRESH_TYPE_UNDER;
> > +
> > +     ret =3D nvme_set_features(ctrl, NVME_FEAT_TEMP_THRESH, threshold,=
 NULL, 0,
> > +                             &status);
>
> I am a bit baffled here. The last parameter of nvme_set_features() (and n=
vme_get_features)
> is a pointer to u32, but status is declared as int. I would have assumed =
this generates
> a compiler warning, but it doesn't, at least not with my version of gcc.
>
> Either case, it might be better to declare status as u32 (unless I did no=
t have enough
> coffee and I am missing something).
>
> Also, I assume that the returned status value is irrelevant. I don't find=
 useful
> information in the specification, but I may be missing it.

You are right.  I'll change the last parameter of nvme_set_features()
with NULL.

> > +
> > +     return ret <=3D 0 ? ret : -EIO;
> > +}
> > +
> >   static int nvme_hwmon_get_smart_log(struct nvme_hwmon_data *data)
> >   {
> >       int ret;
> > @@ -39,8 +79,12 @@ static int nvme_hwmon_read(struct device *dev, enum =
hwmon_sensor_types type,
> >        */
> >       switch (attr) {
> >       case hwmon_temp_max:
> > -             *val =3D (data->ctrl->wctemp - 273) * 1000;
> > +             err =3D nvme_get_temp_thresh(data->ctrl, channel, false, =
val);
> > +             if (err)
> > +                     *val =3D (data->ctrl->wctemp - 273) * 1000;
>
> This would report WCTEMP for all sensors on errors, including errors seen=
 while
> the controller is resetting. I think it should be something like
>
>                 int err =3D 0;
>                 ...
>
>                 if (!channel)
>                         *val =3D (data->ctrl->wctemp - 273) * 1000;
>                 else
>                         err =3D nvme_get_temp_thresh(data->ctrl, channel,=
 false, val);
>                 return err;
>
> assuming we keep using ctrl->wctemp (see below). If changing the upper Co=
mposite
> temperature sensor limit changes wctemp, and we don't update it, we shoul=
d not
> use it at all after registration and just report the error.
>
> >               return 0;
> > +     case hwmon_temp_min:
> > +             return nvme_get_temp_thresh(data->ctrl, channel, true, va=
l);
> >       case hwmon_temp_crit:
> >               *val =3D (data->ctrl->cctemp - 273) * 1000;
> >               return 0;
> > @@ -73,6 +117,23 @@ static int nvme_hwmon_read(struct device *dev, enum=
 hwmon_sensor_types type,
> >       return err;
> >   }
> >
> > +static int nvme_hwmon_write(struct device *dev, enum hwmon_sensor_type=
s type,
> > +                         u32 attr, int channel, long val)
> > +{
> > +     struct nvme_hwmon_data *data =3D dev_get_drvdata(dev);
> > +
> > +     switch (attr) {
> > +     case hwmon_temp_max:
> > +             return nvme_set_temp_thresh(data->ctrl, channel, false, v=
al);
>
> Does this change WCTEMP if written on channel 0 ? If so, we would have to=
 update
> the cached value of ctrl->wctemp (or never use it after registration).

At least for the devices I have, setting the over temperature threshold
doesn't change the WCTEMP.
I have checked with  'nvme id-ctrl /dev/nvme0 | grep ctemp'.

> > +     case hwmon_temp_min:
> > +             return nvme_set_temp_thresh(data->ctrl, channel, true, va=
l);
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return -EOPNOTSUPP;
> > +}
> > +
> >   static const char * const nvme_hwmon_sensor_names[] =3D {
> >       "Composite",
> >       "Sensor 1",
> > @@ -105,13 +166,13 @@ static umode_t nvme_hwmon_is_visible(const void *=
_data,
> >                       return 0444;
> >               break;
> >       case hwmon_temp_max:
> > +     case hwmon_temp_min:
> >               if (!channel && data->ctrl->wctemp)
> > -                     return 0444;
> > +                     return 0644;
> > +             else if (data->log.temp_sensor[channel - 1])
> > +                     return 0644;
>
> This ends up with a negative index into data->log.temp_sensor
> if data->ctrl->wctemp =3D=3D 0. It needs to be

Oops.

>                 else if (channel && data->log.temp_sensor[channel - 1])
> It can also be written as a single conditional since the return value is =
the same.

Sounds good.
