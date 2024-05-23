Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE5B662
	for <linux-hwmon@vger.kernel.org>; Thu, 23 May 2024 23:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716507289; cv=none; b=VnRUPDr0FIR1tRvy0jxazcs8jRrL2aY2uy10IHe6S/HvHgx+MI1aO4v9nN7xt/b3AL/H16tZlkSV0gtNkQXrXwMfwM9IeNx5WTPeI/RNFOW90UsYugzsfmPvUsRvUd3pVQ7Jy8otw0Q+XqPiqlwCHwvKq6vEkIEmTuQZIbiHy/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716507289; c=relaxed/simple;
	bh=SIfqUmeI4LiSuiERz3xJB+fpmiJNRdXcyrM9pou+fn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhPgAOdUpqgnLNNkaEiob3/6Wk3afZm6w0HZA9Hi0q07UUzf2OfI+N3tnGX1/QiQq2Fm8zcEDf1ZqVDwzkRBK7T2cApqoQf/3t15bcaH7RGZygKX57Nf7fu4sAfd8TFz5oqAPBa74znRdkrJZ6cSfLG667zXzRpob5b/9YxVi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3DPkbUV; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3DPkbUV"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-575070cff74so2002879a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 23 May 2024 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716507286; x=1717112086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ifsrLv6PV82LH0JBUlGCUEEpDlBY75MuH5qi84wEkE=;
        b=M3DPkbUVGsYwh7GbmWs9DGI5/0Ebr5ZNhEY2JVV+npy2s92YUncVDE+1a164fft/q0
         r9JfNR11FFQBLu9/GBGuRSZgUt8yI/uj8Zq3Rr7cA98y9BqukorS+7nt1tD0NQYcJSdb
         toH83QAJfjatZ+Zgx3MoDQhnzuE5WeJ6rSLzopMn6IUA9zjG/6vHf9pzZUIsNqo0OcyL
         GTueQSLxrTpBOPWYStTokgrx+cXNo3xSmv+zkUjFWoP+GArpLccWzEGHRJJnfUrPHQoU
         UwzWPIR4Vy4E38mt1KQ+DS/0aBvMMgsdwxrRX+5VOJghC0lVgYoidMMbygMUeMad8wfY
         k1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716507286; x=1717112086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ifsrLv6PV82LH0JBUlGCUEEpDlBY75MuH5qi84wEkE=;
        b=r3zpw0/yY5q3NrUpxR5ozKbtRVsnI/bb5WgnPGwSpYrmnwerAvxdJgua8Hc4IrQeKg
         rK9W16k4EqL5BvokCBkX4PbFLPlJjA5LnJaEOIl6ZbTrM/qKR37rRUd4uqWC9zBy2p0E
         01CJIh4CdGJEnFD47gZuloQO+yRBdJz2HREBJU8UsmO4+fhbl0xmrfuRx5b9oEwrnQ5u
         sxqVFTcr1hsyI96DRIHKhDNFvlOg1HautGw8/cp222HZmNBG3KDyp485kHyLJy3qX5s0
         9QwMjgowElZtl7cmm1CJVhPNfwefx5swJV5HfyexIXUCmo95kMx+M5qZE9lplTs98Q6D
         gsgQ==
X-Gm-Message-State: AOJu0Yyn11K1/CbMkAjJ/5Z04isRxljDLDwimpzP5EvQy2ibQ/pa/P3S
	wdJSED1jmn/Bl5cShmgc60dkx0hgCh5sNLNQkPFYBsUvSIldosAP2DD1cX/e+6zmADhSSjwIPK3
	kNBmWpvwi5ykKJeYO9i6Vd7AXEc8=
X-Google-Smtp-Source: AGHT+IHCtE6XHGdH6Wqi54SNLTjkEsq0ZxOwP8GtxCNeYS59J71y6Z2NCVpj+AZs+nD4pj0G1pGdkc/cjmSh8rPDI0k=
X-Received: by 2002:a50:951b:0:b0:578:4cca:e742 with SMTP id
 4fb4d7f45d1cf-57857e0f399mr78204a12.0.1716507285497; Thu, 23 May 2024
 16:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523203130.75681-1-mezin.alexander@gmail.com> <cd58922f-711e-4125-8214-57e1f83f6777@roeck-us.net>
In-Reply-To: <cd58922f-711e-4125-8214-57e1f83f6777@roeck-us.net>
From: Aleksandr Mezin <mezin.alexander@gmail.com>
Date: Fri, 24 May 2024 02:34:34 +0300
Message-ID: <CADnvcfJK7yuQvQyCu4Sjtgx4To05yanf-ibD9++DBHT+v-gDog@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (nzxt-smart2) add another USB ID
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry, I don't understand what exactly is wrong with the
description. Especially because patches with similar descriptions were
accepted before.

On Fri, May 24, 2024 at 12:47=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 5/23/24 13:31, Aleksandr Mezin wrote:
> > Fan speed control reported to be working with existing userspace (hidra=
w)
> > software, so I assume it's compatible. Fan channel count is the same. N=
o known
> > differences from already supported devices, at least regarding fan spee=
d
> > control and initialization.
> >
> > Discovered in liquidctl project:
> >
> > https://github.com/liquidctl/liquidctl/pull/702
> >
>
> That is not an appropriate commit description.
>
> Guenter
>
> > Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
> > Cc: stable@vger.kernel.org  # v6.1+
> > ---
> >   drivers/hwmon/nzxt-smart2.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> > index 7aa586eb74be..df6fa72a6b59 100644
> > --- a/drivers/hwmon/nzxt-smart2.c
> > +++ b/drivers/hwmon/nzxt-smart2.c
> > @@ -799,6 +799,7 @@ static const struct hid_device_id nzxt_smart2_hid_i=
d_table[] =3D {
> >       { HID_USB_DEVICE(0x1e71, 0x2010) }, /* NZXT RGB & Fan Controller =
*/
> >       { HID_USB_DEVICE(0x1e71, 0x2011) }, /* NZXT RGB & Fan Controller =
(6 RGB) */
> >       { HID_USB_DEVICE(0x1e71, 0x2019) }, /* NZXT RGB & Fan Controller =
(6 RGB) */
> > +     { HID_USB_DEVICE(0x1e71, 0x2020) }, /* NZXT RGB & Fan Controller =
(6 RGB) */
> >       {},
> >   };
> >
>
