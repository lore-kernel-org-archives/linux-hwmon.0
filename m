Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11123CF49
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Feb 2024 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707753061; cv=none; b=rqr+yLlvRsrRC+A6gME9n1DwWaszg1Cse+uoD6toN7umdr32pC546GkoDkDErSOmCB3PGHCkcSVTc97cuqK4KB7CAFTFIlLs8xHK/qoOVfz9dY3utya8Ob+5r4Pv6hlkIBnA7QXxnobZsyTGAc891fsa1LXtCZ2qO6dgDVsYy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707753061; c=relaxed/simple;
	bh=HU7sh23ZKlZQJiqjnfkF5avlfO8LsJ9tM7qIiMxIo2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3V7f/NfLvzJeZEbBt4/xNqfSgJKwIwWJJgdatEeEjdeM70kxOZrRtwCjzwJx1Eq5qOFtYvFL+x/S1BbzuxFV4h7csFXRLtHHaYsyKMjpizKtmxGqpppv18XIciCkPYGXxGf3WI2t71ReNkLVF96ZGaF9bQrNWv6FnhDVG5Mf/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSjO946X; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSjO946X"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d0cc05abd3so14865991fa.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Feb 2024 07:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707753058; x=1708357858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WVav3yfFUq/XaJiNGal3gkCZxqemZi4kidXH2VRo9E=;
        b=SSjO946XXQRthxox+Vx8h0EbjZNUVzixikZd6xAsVzNEFcc1vU5rucKg5w0k5x4jLt
         3uH7x8B/pzrKHmUV9NRzuhGDPPyDxJ4G7fDY4XbMhiWnwbKdLfJzqNnvSBmvQRFhQ1dc
         OmwIu2hDE6wgu1Wqyew8Vc8Kj0HQ1zVkkk/L/VLbFpqgAabrN378T+D7tTuBtA6YnpYJ
         uKTb3prvXzq00jD74XUrukkFC2fGn2CBw2eqXJCs1CHwS7HcjmZYlTy5mrzRXw47Zmgx
         WHnOIgW6tWH0urrSdnDfVKN9O3cvYFKRXEjIIFdaX6kjVjb+mtcUxC1OsukkhAptqelJ
         WzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707753058; x=1708357858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WVav3yfFUq/XaJiNGal3gkCZxqemZi4kidXH2VRo9E=;
        b=pf5wvCrzHJb16ksZzoKBz4EzM1MM1vkXPpI+zRXvQ0fJhJbSn/C+jt/KiJJfmqFKcu
         KANFgZDPPVx8MyJxJ420Ab9jLH6nwd8n9uwqlwCVP8rLKpvF1tgppM54u0TH311Vygyf
         joZxwXdfeeFv/HvEGHBXwr8A5W8Tht+irMOAWz+MKhP/c5IvQxMIm+piLMuqbhaqVUU9
         zQWUeDzaobaYRF5Zq84T1mjGJjyYLEIE6bggXc94Elj7WMQoQ3cYwzSO2SFwuJyXc3AY
         eEAvtNz45rULDVK4K5iYuX8eUE4y1w5ZKeX/6QWslD94mjQbS9AzudR3WTIJRufmHBvN
         8V9Q==
X-Gm-Message-State: AOJu0YwsC2OLxb2/x6Frz3fe99+XNrzt/tP2YCfdxyCNcblp4/K4OkmY
	d7NI7DrE6bjSgDHO0F5/28dv78PkomW0C9BoVUpPtrG21ua7i4QvxHwo3K0DUSYiysDnRyqoovf
	cE/owGu9pgRFw9Bxk24n01nad1S0=
X-Google-Smtp-Source: AGHT+IGoEJs2U04YgI5ra8rEf5ZA01tqmR/ogzCB28B40fVHBMQ43PwztVvmusNS6JW+xJyNALJSGn1xcS7UTRz6vwY=
X-Received: by 2002:a19:5f59:0:b0:511:6f31:905 with SMTP id
 a25-20020a195f59000000b005116f310905mr3519071lfj.6.1707753057566; Mon, 12 Feb
 2024 07:50:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212141311.110808-1-mezin.alexander@gmail.com> <b553e1f1-0e2f-4b1d-b501-7554bf86d0c7@roeck-us.net>
In-Reply-To: <b553e1f1-0e2f-4b1d-b501-7554bf86d0c7@roeck-us.net>
From: Aleksandr Mezin <mezin.alexander@gmail.com>
Date: Mon, 12 Feb 2024 17:50:46 +0200
Message-ID: <CADnvcfJhwszPE0EiP8cv6-QTzE+y6wJ89YqExz6wX=93=-QfVQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (nzxt-kraken3) Remove buffer_lock
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jonas Malaco <jonas@protocubo.io>, 
	Aleksa Savic <savicaleksa83@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 5:13=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 2/12/24 06:12, Aleksandr Mezin wrote:
> > Instead of pre-allocating a buffer and synchronizing the access to it,
> > simply allocate memory when needed.
> >
> > Fewer synchronization primitives, fewer lines of code.
> >
>
> Trading that for runtime overhead and an additional failure point ?

Because it's a USB device, hid_hw_output_report() calls
usbhid_output_report() -> usb_interrupt_msg() -> usb_bulk_msg() ->
usb_alloc_urb() -> kmalloc(). So there's already the same failure
point, and the overhead is already there, no?

Honestly, I didn't think too much about performance - because I expect
such devices to send and receive not more than 10 reports per second.

I don't insist on this change, I just want to understand when to
prefer simplicity vs potential performance.

> I don't think that is super-valuable, and it doesn't really save
> anything in the execution path except making it more expensive.
>
> You could save as many lines of code by allocating the buffer
> as part of struct kraken3_data, i.e., with
>         u8 buffer[MAX_REPORT_LENGTH];
> instead of
>         u8 *buffer;
>
> I really dislike temporary memory allocations like that, due to the
> added runtime overhead, added failure risk, and the potential for
> memory fragmentation, so unless you provide a much better reason
> for this change I am not going to accept it.
>
> Guenter
>
> > Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
> > ---
> >   drivers/hwmon/nzxt-kraken3.c | 19 ++++++-------------
> >   1 file changed, 6 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.=
c
> > index 5806a3f32bcb..1b2aacf9f44c 100644
> > --- a/drivers/hwmon/nzxt-kraken3.c
> > +++ b/drivers/hwmon/nzxt-kraken3.c
> > @@ -97,7 +97,6 @@ struct kraken3_data {
> >       struct hid_device *hdev;
> >       struct device *hwmon_dev;
> >       struct dentry *debugfs;
> > -     struct mutex buffer_lock;       /* For locking access to buffer *=
/
> >       struct mutex z53_status_request_lock;
> >       struct completion fw_version_processed;
> >       /*
> > @@ -109,7 +108,6 @@ struct kraken3_data {
> >       /* For locking the above completion */
> >       spinlock_t status_completion_lock;
> >
> > -     u8 *buffer;
> >       struct kraken3_channel_info channel_info[2];    /* Pump and fan *=
/
> >       bool is_device_faulty;
> >
> > @@ -186,13 +184,15 @@ static umode_t kraken3_is_visible(const void *dat=
a, enum hwmon_sensor_types type
> >   static int kraken3_write_expanded(struct kraken3_data *priv, const u8=
 *cmd, int cmd_length)
> >   {
> >       int ret;
> > +     u8 *buffer =3D kmalloc(MAX_REPORT_LENGTH, GFP_KERNEL);
> >
> > -     mutex_lock(&priv->buffer_lock);
> > +     if (buffer =3D=3D NULL)
> > +             return -ENOMEM;
> >
> > -     memcpy_and_pad(priv->buffer, MAX_REPORT_LENGTH, cmd, cmd_length, =
0x00);
> > -     ret =3D hid_hw_output_report(priv->hdev, priv->buffer, MAX_REPORT=
_LENGTH);
> > +     memcpy_and_pad(buffer, MAX_REPORT_LENGTH, cmd, cmd_length, 0x00);
> > +     ret =3D hid_hw_output_report(priv->hdev, buffer, MAX_REPORT_LENGT=
H);
> >
> > -     mutex_unlock(&priv->buffer_lock);
> > +     kfree(buffer);
> >       return ret;
> >   }
> >
> > @@ -913,13 +913,6 @@ static int kraken3_probe(struct hid_device *hdev, =
const struct hid_device_id *id
> >               break;
> >       }
> >
> > -     priv->buffer =3D devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_=
KERNEL);
> > -     if (!priv->buffer) {
> > -             ret =3D -ENOMEM;
> > -             goto fail_and_close;
> > -     }
> > -
> > -     mutex_init(&priv->buffer_lock);
> >       mutex_init(&priv->z53_status_request_lock);
> >       init_completion(&priv->fw_version_processed);
> >       init_completion(&priv->status_report_processed);
>
