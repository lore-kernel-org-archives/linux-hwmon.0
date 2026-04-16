Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E0E42048
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349973; cv=pass; b=nGtU2Fr+TK6VJpI2IqQGZNmapLmdbzfQVuEH4sVoNoMFWyy5GzgN6xtNuCX8w6+d03X+HJ+FzHBkHapWSjadoLV/T+f4TVFx0yFywfuHk5jrMH/FXLqtJcVPmzfDYk/x74r2ObLtUEjlAWRSy2tzfXnddM16hnshdDPRB8Bb/rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349973; c=relaxed/simple;
	bh=54nY/T3OJvGmk4vpg9uL+b60fvRutLVfEfpTplkPi1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m58DRiBNHWUvh8SGZpRRTDMSuvk+gQm4gXY3CJ4cBZ0p7WsP/oKky/9ogyN08X+2i15z9yCOwWS/K/yLmEgWIba9dB9ganYQNr2OA/2KVy+IID2obNDSQ56svrV0jw+WHtzf/tRYUA55mDUqqZLB77rJU+smPEHauJWScc/oVnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lW2V88E6; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lW2V88E6"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-470145d7df5so4780617b6e.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 07:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776349971; cv=none;
        d=google.com; s=arc-20240605;
        b=DgsWPSJBkae2zWSPCTcnqlWLdsWzHEp1aI/7bAsvXoyZ8kZaj5AQHSDPxsPQBla3G8
         9a5OizE5gHUXbhHoAJcCqBDZjYkZRonlCLHFaQYJJBa2ceYq4zMJwVdI6ArZ42IgOOAu
         I4yjBXrXA6bSqhfWITewQ9H4K30+0laVYysAO32ZMx0SrPpTv6Qvy/nQrlPJJRebmPTB
         gW4o2N9xRyIddmLyKgUddrC+EOb0fgFotG5rG5z9qyHSjg72tsqxQ8TC09UTHNxHJU0Z
         s7SsWhtpQIGyk77Yb25f8JqBf8C0GpYzGMXZLvAhtSZfRnFL/tQpExID/2xRCNb1xstD
         Ux9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0ztQZ6dxvg2w7yWD7M7B9Qv4AHUbexyfoq42YT+dZI=;
        fh=TllT+VqNqdU2Nk77XvV/WSvZHQRtovMegxanYPCgf7w=;
        b=Kh/Qj4XMPJlvQVRm2lt5SB4CwSkp74eFVbRZFFbOW4DZTBeqSB0VPPYSush4IXktYG
         ci5kZHywn/0r3hVPqNsHobkF1uIFFxEC+5g3ZFEK4kyv3GQ1RhigRYtuY3nqaoHseYCx
         o+jo392YAc7zTQj3+g3vW6JQ/89vXK9HLg/iDARjhYdoSncs9nz0VtzZB8hrFPs4OB94
         KLfuIxb+4xnBra8/tntoLiiHuJc2yh8PslbrsgWpPh0T2X678usjfOfVSLBrIJ4C8esU
         /1wqmyaSCBWAuZo/7zERh50XT/vi3ZRRSZzneVYOg+HzU3IE8UsC2sU4KQ3obQZop4u7
         h4Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349971; x=1776954771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0ztQZ6dxvg2w7yWD7M7B9Qv4AHUbexyfoq42YT+dZI=;
        b=lW2V88E6xqrT24h84B+P7ZDSOTPE+aYHdpwy5okkYMQlISjs7+LHEnyqpYQ/QrA7DQ
         V3joQLsiZoEASmMpCSp4utcMgvG9JpQMZkKh7dTqUYphTymmMSx4E36RPFc4H3c6Jr72
         LMaI/kXb+Pl/Y2MJnfkxLcEAZ9ADBDrYA+PfVKdfdQtVrBsZTl1qsWJNdigTS4XnTLvy
         pAYIbxzASG0s2zLOclmwgq9PGhKGTPr9Ui7S0JTeYksWKyYmru78UA8IVWq28AomGPTR
         D3GgVW3uH69pOfTCSHsWvZ7tS9K0h1aJdwAZb/sb2GNEZTtRNjAHUNSBpsZjrPVKoMyc
         udYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349971; x=1776954771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0ztQZ6dxvg2w7yWD7M7B9Qv4AHUbexyfoq42YT+dZI=;
        b=alozcosFTRJg9VKMbkMd1fIIObPU301tFRJglPtEBAEPNtEJavUZqf7ew72mQmq8qn
         AEu7X4iNlNBRhg4GnYHF5+Y7PO5B9x4CpSYIuubnR0RlLGsUsqnpb1yh1rDtF2QFMEOz
         gyhMuVDl5HGpGXrQvUFkiVcu4nR32Dmo2tXT72xhKJVVQ/slhI3o6SN6Z4PXnnckJHEe
         zt+tm2/Y2b6TaWiDLOdgtaGltFejMXpnbpSvMS2I4GvANVsmaoBSFRWF6YvqCDZE2Jof
         6ltYO63ADy/SPyrSSxFOVuZm1W3vQ47CMcbITqTke9CYwxWRpnzzJMxZQ38miDLgokra
         IUUA==
X-Forwarded-Encrypted: i=1; AFNElJ+2+TIE+zE20AX/OFeDgHm0Oeos6tK/U0fQYS3thpM4iWyc+fY/b7NX6oi3yz7VNHMuYm/8qAD1XjPx7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6aJQM6xIDSUCjYKTSdYSnvqDixJHL+JjAq3ikgFE1kJM1QW7
	+TE6Z2XCa6pe+4FkvspP6+b2OVopGqiX1JnFtyJd3N5HjgTLVk2QZyaHtmooagHZT2zb0DBnIiT
	hkKPJ9tHw1M85HPmZkScFo+QwjsJQx8GW7UAT
X-Gm-Gg: AeBDievZ32pDEFDcjrSw9axnLXgRuklBCNXpEKJ15d2dZzDLq5N8lpcWdehoVONuT4+
	VO7grlwHCtVfH4FLFUNYVlhJLm3BeiPFRwC39tmlKaeWuucEC2aw4DI4xtoHvpCcJzazp8KH9UF
	cr6+E1p4eW5PkilESYxApmKn9alGQ6ZkNOBOxhSxLqnYu7rM27xkpqgvsqRU3VtWhC80X9uZnu7
	VfVZnlmy7Y2pX1rOM0OEcTIFA6x1ZowGqhbsYAfplroH0ZYlqQIipNDSqsV/8nE6EYrKKTBgRXi
	wWVoIYtwhI4dONwc9sRoPxoM4EC7lrgohFfnQPFlz2gJsc3hxVikLKY1Hi+W+Yd824A3LfWfLr3
	6+fhNZo77EpV5DN6BXoxPqp5Lklwl
X-Received: by 2002:a05:6808:6787:b0:467:272e:886 with SMTP id
 5614622812f47-4789e91dc16mr13297083b6e.26.1776349971370; Thu, 16 Apr 2026
 07:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416091754.310-3-hanguidong02@gmail.com> <20260416122131.A220FC2BCAF@smtp.kernel.org>
 <CALbr=LY+pid1TGvMydd-K8CnTzX7EB25+z_BBYyBpOn3EEu62w@mail.gmail.com> <5dc159b7-326b-43ff-a2fa-4bc50a03ebde@roeck-us.net>
In-Reply-To: <5dc159b7-326b-43ff-a2fa-4bc50a03ebde@roeck-us.net>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 22:32:40 +0800
X-Gm-Features: AQROBzDmu0jR-UwnLvlp4Z6cnzslZ3snx9jHgqJMPwQWXXd2XDD_GDiJAIszyGw
Message-ID: <CALbr=LaRYkY2MrPtfw0YatfnOokhPiwRpQ9cO9VCtAb7vSvKGw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (adm1031) Serialize update rate changes
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 10:05=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Thu, Apr 16, 2026 at 09:05:05PM +0800, Gui-Dong Han wrote:
> > On Thu, Apr 16, 2026 at 8:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > >
> > > Sashiko AI review found 1 potential issue(s):
> > > - [High] Missing I2C error handling leads to hardware register corrup=
tion and state desynchronization.
> >
> > Thanks for the review.
> >
> > I will look into the I2C error handling, but I cannot confirm the
> > exact fix just yet. If there is an issue, I will send a new patch to
> > resolve it.
> >
> > Again, this is a pre-existing issue with the current codebase, not
> > something introduced by this patch.
> >
>
> FWIW, that happens a lot. The AI is surprisingly good at finding all
> those old problems. Personally I'd prefer to convert all the old drivers
> to the with_info hwmon API - that alone solves most of the locking
> problems. Unfortunately I don't have enough time to do that.
> The latest Claude/Gemini models actually do it quite well with the
> appropriate prompts, but it still needs mnaual verification.

Sounds good. I might give the with_info conversion a try. Since it
would be my first time, I expect to hit a few roadblocks, so it
probably won't be a quick process.

>
> Either case, for me it only makes sense to touch those old drivers if
> all their problems are fixed. This driver is a good example: Ignoring
> I2C errors is much worse than its locking issues.

Understood. If you prefer to drop this series and wait for a complete
rewrite, that's completely fine. Otherwise, if you think these simple
fixes are still useful in the meantime, feel free to apply them.

>
> Also, please note that you can often use guard() or scoped_guard()
> to add lock-protection to a function.

Thanks for the tip. I will use them in future patches.

Thanks.

>
> Thanks,
> Guenter
>
> > > --
> > >
> > > commit ffbce3cc3043a4bfb1c8f7ba4a9010b9c8a23c2c
> > > Author: Gui-Dong Han <hanguidong02@gmail.com>
> > >
> > > hwmon: (adm1031) Serialize update rate changes
> > >
> > > This commit expands the locked section in update_interval_store() to =
cover
> > > the hardware register read-modify-write sequence and the software sta=
te
> > > update. This ensures the hardware updates and cached state updates oc=
cur
> > > together.
> > >
> > > > diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> > > > index 887fba9ea149f..a46db83471f2c 100644
> > > > --- a/drivers/hwmon/adm1031.c
> > > > +++ b/drivers/hwmon/adm1031.c
> > > [ ... ]
> > > > @@ -897,13 +897,14 @@ static ssize_t update_interval_store(struct d=
evice *dev,
> > > >       }
> > > >       /* if not found, we point to the last entry (lowest update in=
terval) */
> > > >
> > > > +     mutex_lock(&data->update_lock);
> > > > +
> > > >       /* set the new update rate while preserving other settings */
> > > >       reg =3D adm1031_read_value(client, ADM1031_REG_FAN_FILTER);
> > >
> > > Could the truncation of the error code lead to register corruption?
> > >
> > > Looking at adm1031_read_value(), it returns a u8:
> > >
> > > static inline u8 adm1031_read_value(struct i2c_client *client, u8 reg=
)
> > > {
> > >         return i2c_smbus_read_byte_data(client, reg);
> > > }
> > >
> > > If i2c_smbus_read_byte_data() returns a negative error code like -EIO=
, it gets
> > > silently truncated to an 8-bit value (like 0xFB). This garbage value =
is then
> > > masked, modified, and written back to the register.
> > >
> > > >       reg &=3D ~ADM1031_UPDATE_RATE_MASK;
> > > >       reg |=3D i << ADM1031_UPDATE_RATE_SHIFT;
> > > >       adm1031_write_value(client, ADM1031_REG_FAN_FILTER, reg);
> > >
> > > Does ignoring the return value of adm1031_write_value() leave the sof=
tware
> > > and hardware states desynchronized?
> > >
> > > If the I2C write fails, data->update_interval is updated anyway, mean=
ing
> > > the cached software state no longer matches the actual hardware state
> > > despite the expanded lock.
> > >
> > > > -     mutex_lock(&data->update_lock);
> > > >       data->update_interval =3D update_intervals[i];
> > > >       mutex_unlock(&data->update_lock);
> > > >
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026041609175=
4.310-1-hanguidong02@gmail.com?part=3D3
> >
