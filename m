Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744891E531
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345357; cv=pass; b=KTIK5aSS9Z3Ui5I84eFIz2AbVZyo4i4zoPmsx2HuBYjl+FQExm/OxjrlCiPj4CGJvSoym89PZDVtuLuag8aT0haSSEmtTzToL0+2cksW/NbLTITCcn3aCpsfz5/mo+CHLIo98weyijUcxM/t9KYdszNQ5zsSJJF4pnHI4vN2frI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345357; c=relaxed/simple;
	bh=RQ/nzNjGxdlPsgg0WN5PpATLVNP03uCuIwLlbSw2FgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bddloWkn93cbeICs1oyhBUMWwZUQbI2h7Eio1E+Ktlc+qKtgWl69LweUAXPqw/hwsKNqbjz7BibE4svP54u5OZqJJU7eJKrl+3eR3Dpn3lxmyW7+BWr5MEFcjkBgAswegjXkxWxWdQExD41q7IgsmzT+J0nu7MKNeqsHFB3XkA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcDnFMz8; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcDnFMz8"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-464bc03efd8so4534159b6e.2
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 06:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776345355; cv=none;
        d=google.com; s=arc-20240605;
        b=M/XZXPnD/3oX3yVCySu7il79jDjbafPL4x2tJfuwXjXn75I0Q1hz+6DYlpKWCeNRJr
         5NciBFtcuWfVToQs3+bLASwRP/03GBPbCSSRbFYk1kajRhvLIfIX231D1dBqUXQVArur
         8Vm5XdD7PqVIdsNu/Jx4peMHacX/ELWlfRqFrlFx+qoyE7RNUzFO1kc9E2XX7g34RjiD
         pfTEznnLF2F/j2FBnxA1kqtJMZ2qLYHvF3ttlAWEQfCrxUb94KZsGMqKPacs5fGIx9oE
         Q5xhyyQuFrlE/NjRpqm5f4ajFUptcb/uwUx5ehmmGnh5HVbtbejOJyguxPsR285XEBJh
         RzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eNxy/oU7oyMIUDrrRH+z7VVC6MHx4Yy/gG9DvYfA+T0=;
        fh=LIRAVtNkvFebIJTmd3sXQRhyI56KpQNcHjhAac0CiC0=;
        b=aFfYpzkw8NUpTy2k/+hf5ravgCPaEwno/psR/Wfz20z0Eiay6SozJOGyXMzqK3mD+b
         pb43Cbbj3WVgcGEZ2oz3l5P5CEHzWEduZxFsPrtfW3FgI5xZkzViWMWHW+Vt25D6IX0e
         KkIdL3LE1To2q0Fh0nc8XfeJ1IS/rotXWFj7JB9Dw2HuhzCFRYwernpU29axWW/OJ8Gx
         FrhSX4inIC3SigebHqvsHlR25qTd3AuOFjZXeNpYOEKV4y9YHnySUrV6zcdM7NkW/w0+
         x/xVNMzpTimIDmjwcJfFLtPpHnix3UxLHA3unsWMN4uhNnDWoaOsLd4rMFU2gZBbXwhS
         Bndw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776345355; x=1776950155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNxy/oU7oyMIUDrrRH+z7VVC6MHx4Yy/gG9DvYfA+T0=;
        b=IcDnFMz84v5290FIkJtBgaol6neHiWnu2nKST+P5AKQUuvjh2wk1cEllk0FqteTcOb
         Ecyf5gcayEF4kK57RtUP3aRHGEHxShB19u4x821Rh0F1qyAEv/aSa2AEL6zkKAmRTgz+
         kB4yT6cj5QCh0U9KEQnkgR8avLnEiHza/XanX0gIh+nEOwR2pcIWdq3VSYHD/HBX/M8l
         FMW1dv7HgN6GoLmwvzM8JSL9VBuWTEYEusnbBQogrR8V5tbOLCC2ZDIFDY1zYqxL8osp
         1urs9Zm5kbucjzcQMPV6hXt9UH+Mxhw8jpMWX5vXoWZSRJ7x6QxxVm0dGiilyI0pHlpn
         tieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345355; x=1776950155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eNxy/oU7oyMIUDrrRH+z7VVC6MHx4Yy/gG9DvYfA+T0=;
        b=Sdv00YtUT7wnF3RxbcJ+dIcoeSEwr16n1hi3piwdxArHTIWSXQPDg7smSs2hEIwRwy
         ZDfxrdj4WGU8IdNqlFwzBoMhQ7bZuU2kKXbffvXrvjrmxRFobfY9yRuOA2ozvJGBkgud
         uQB6BuAG719L+ftp2eVkoB+Tsbno4q1w7PRkZxH9yWo8+AC+GBnYAXM6JvGTlrcirear
         ZkbqPQ7gCbnXEBvh59Zc07E4i64CrIcEyTLxAx/fO9LfGyhg9ckEN7Pfzj6pF8y6YHYP
         xTsQJNk6EBqkBEmUewGPyEoE5ownOQX2wNaxgeXxnczZa/+3gymyYfEuHH1Hd6K8yp/t
         yqaQ==
X-Gm-Message-State: AOJu0YwAiazAv+Wj5Z9h2A52TNBhTPjULHsGH10cOlcKMTWwLkPyihti
	aPBOA3gb6pc6VzqLlH09ETjzMHhjLR+7cQiGKZ8eTEGWuv5BW97SoOGXkC+qTaCV4Ft6Jk/MQyR
	WQjy/QiFprzNL7ZhXZYDUcXA0nV2bCleppTRJ
X-Gm-Gg: AeBDieu63fcmIL+U3Wf7B4m3SzAfTMWvw02xTkcug4qqh3igdfRNG8UHn47KoLy2gSS
	rVWVlCBjOUIFbywiv6i0xjYlvHpG9og5BdWsBG+HXnrTI8+GBrkZpPriJazm2r3vx/GeVtU2LH6
	Oj8lEgu0X9QWfd3rADo2cG7GurFbSEmJfN8NlBNrcz9twgS6khRcAb1va8veY0zI02ukTmmNNnI
	G1UvH4wHJPlJTkyLUMbn/FJJ1zZAZFbUtXXg6VrRwsEM5sxwwtS116IsoNhQ5ALiize0amGHqRe
	9Nt0eF5/WYw5VQihpEz3lA0wtWstULik7ZKig2AYOhvwQVSciOStHYmLqVvA13qr1AtWJGdOmi5
	K+fdY+Ss7CahjMa0vGBKzAZjItZnueTbS0xRldq4=
X-Received: by 2002:a05:6808:c168:b0:467:1f38:bc1a with SMTP id
 5614622812f47-4789d95209bmr12935100b6e.7.1776345355123; Thu, 16 Apr 2026
 06:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416090752.97392-1-hanguidong02@gmail.com> <20260416104136.63F14C2BCB0@smtp.kernel.org>
In-Reply-To: <20260416104136.63F14C2BCB0@smtp.kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 21:15:42 +0800
X-Gm-Features: AQROBzD_hzeE2Uyez9rAZ-m57cvFs7xG0KJvMe0ElfA13adQFTx8Hf3KB28IHg8
Message-ID: <CALbr=LZimkhj_R889nV5UxSjwNraB2reNgWF67_9j=r+g=2Rfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (lm63) Convert macro to function to avoid TOCTOU
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 6:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 2 potential issue(s):
> - [High] Incomplete TOCTOU fix allows compiler-induced divide-by-zero cra=
sh in `show_fan()`.
> - [Medium] Lockless sysfs read in `show_fan()` causes torn reads and viol=
ates hwmon subsystem locking guidelines.
> --
>
> commit ebc10731137639981842ea19f80f0b969db71842
> Author: Gui-Dong Han <hanguidong02@gmail.com>
>
> hwmon: (lm63) Convert macro to function to avoid TOCTOU
>
> The patch converts the FAN_FROM_REG macro to a static function
> fan_from_reg() to evaluate its argument only once, avoiding a TOCTOU
> race and potential divide-by-zero error.
>
> Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+X=
YSTU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/
>
> > diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> > index 035176a98ce9c..da132b267c584 100644
> > --- a/drivers/hwmon/lm63.c
> > +++ b/drivers/hwmon/lm63.c
> > @@ -109,8 +109,14 @@ static const unsigned short normal_i2c[] =3D { 0x1=
8, 0x4c, 0x4e, I2C_CLIENT_END };
> >   * adapted accordingly.
> >   */
> >
> > -#define FAN_FROM_REG(reg)    ((reg) =3D=3D 0xFFFC || (reg) =3D=3D 0 ? =
0 : \
> > -                              5400000 / (reg))
> > +static int fan_from_reg(int reg)
> > +{
> > +     if (reg =3D=3D 0xFFFC || reg =3D=3D 0)
> > +             return 0;
> > +
> > +     return 5400000 / reg;
> > +}
> > +
>
> [ ... ]
>
> > @@ -333,7 +339,7 @@ static ssize_t show_fan(struct device *dev, struct =
device_attribute *devattr,
> >  {
> >       struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devat=
tr);
> >       struct lm63_data *data =3D lm63_update_device(dev);
> > -     return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index]))=
;
> > +     return sprintf(buf, "%d\n", fan_from_reg(data->fan[attr->index]))=
;
>
> Since fan_from_reg() is a small static function, won't the compiler likel=
y
> inline it?
>
> If it gets inlined, couldn't the compiler optimize the code by reloading
> data->fan[attr->index] from memory multiple times (once for the 0 check, =
and
> again for the division)?

I am not an expert on compiler optimization. I consulted a few
different models and got mixed answers. Unlike a macro with a side
effect (like ++), an inlined function doesn't strictly force multiple
memory fetches, so it's a bit ambiguous.

>
> If lm63_update_device() concurrently writes to data->fan[0] in two non-at=
omic
> steps (where the first step can momentarily set the value to 0), and a re=
load
> happens exactly when the value is 0, could this still cause a divide-by-z=
ero
> panic?
>
> Note that the subsequent patch in the series ('hwmon: (lm63) Add locking
> to avoid TOCTOU') explicitly skips show_fan(), leaving this unfixed.
>
> Additionally, is it safe to read data->fan locklessly here?
>
> According to the hwmon subsystem guidelines, drivers must implement locki=
ng
> for attributes registered outside the core-serialized info API. Because t=
his
> driver registers its attributes using devm_hwmon_device_register_with_gro=
ups(),
> it should lock its attribute accesses.
>
> Since lm63_update_device() releases the update_lock before returning, and
> data->fan[0] is updated non-atomically in two steps, couldn't a concurren=
t
> sysfs read observe a partially updated 16-bit state?

Your point about data->fan[0] being updated non-atomically in two
steps is a very nice finding. This gives me a solid reason to just add
locking to show_fan() and fix the torn read properly.

>
> Could this torn read result in wildly inaccurate fan speed values being
> reported? The subsequent patch ('hwmon: (lm63) Add locking to avoid TOCTO=
U')
> fixes similar locking issues but explicitly omits show_fan().
>
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416090752.97=
392-1-hanguidong02@gmail.com?part=3D1
