Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2083B47C1
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 13:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776344719; cv=pass; b=hacACbY0aRvfKioBMni9VdEMRG/2VhiMAidg2f8XTEiBN1srEP52qMSgNZQ99LWLjFdpUKc0Hqko11dk59ZBusz1PGzt1G8rXSKWBjVk+kGiIBONElqXQtKQ7aSvTj1QK31v8SOAfNGjFcpl6X/4RP7Dr39NB/RVI6jW2boLDz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776344719; c=relaxed/simple;
	bh=SsOPNc4PG4suc15/ZkrHIELOjx8naGqvG9NY6bVyWe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZVH62PEq0Nt/xH2/jHI0kjL7Czdrn9FEcpSD0WFTH6y1XCPSMlh2fHdeTLkFt1UjGARtGGaoDvpB/bJGAeEcb+t8nQ0q7M4MpNbVW+EIe4+faizxJ/+/QwB3y+BAGLfd6mbFJ9uLEY/elJGU4cNIi2h3S5vlA5eq1s7roPoC6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QniUt0to; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QniUt0to"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-46aa216a65aso4248925b6e.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 06:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776344717; cv=none;
        d=google.com; s=arc-20240605;
        b=TW8CBQMNITStWPZpn23H38frOyv3D83PXcGmy898nUPrpr8ddkCwOeBYw0mV8Nx7de
         hFKVvkUHQGMOn1g+KgLxh4tB57+4A31snmWYB8pPcO3Xt3tpQsbqu8Win2gNS3WolEkJ
         ZAYzVDRS1IBT0+lVdaCxUvKfKoLyN657eM9YauSd8Zlj37mDF7h5063v0iVffrqKqJZm
         gU6RuQ3d4txOrXE0Z9dUgyUhAL3j3zQscUpnhx7H9bbXk/n7Vbc65Ov1vj32C9IV167A
         joUw+lpB1ks9TVauKxKniCKqDI0pV+Myn1pN4xb+L48yK66IUmj/dZxbhQd613X8DV5c
         SZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TxTRERAjxAXioUkoPmpUtJ4F8p4du/e5+8knu4FTJYg=;
        fh=LIRAVtNkvFebIJTmd3sXQRhyI56KpQNcHjhAac0CiC0=;
        b=JTG3Im16cggR3es5iHUsqfght2aWaRnrPRhicM3R89mwICDfI9dA2UomuyRiVSl6ts
         6unfMOOzcf8kLvXkVAfnnPj8DSnG0oxe/F3oN2EVRozMK36IvVoAuQN1B8CaWUzoIo4x
         ITf5J/zCkwyI9cT1lmBgnUK4698jsZkONY1h1EfJhX+BkISNt/eQxlI/FmY9f/WReSmT
         weWItSa1danu68C0ckTe0yS8DX4CVu1aK7qR+0uCuSJUwEBGzLszi92TUaa4sXaxdc8I
         AZxgz091kzkbxy1vGqqPo5/TmT1T5QO/hJJ289/uWArP7QXmHTwDJhtmUxKUqZ6TpHu8
         hq1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776344717; x=1776949517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxTRERAjxAXioUkoPmpUtJ4F8p4du/e5+8knu4FTJYg=;
        b=QniUt0tosIcUqQwaC5RW+fkYX6/zFoOI89tnopg+HGhFdZie2VR5/y4KtYPBAqGU0k
         WFObN29jOSiTu3K3VC6aq+t0tGg4P3Zu0isKUwMkuJCBh/6CgjAnkHVnmWhr5TlYRPFJ
         tbcPMynt4Zh4u9KJfZ23DQb6grtXGkCDDFAptYzJ2KvGoxIohYpY8jkRG4rT11GkKF3E
         duXiA1EqffR0hlXaFvk9a8Uk/mJljytzFFIlCTEJUCldSTM3DL3UJGTybpSPT/hsNGIb
         6+pwEuBu8hWJQuZOycmhBsPM+475xM9Dn+/1DNkF2L5N47ndZcJGhyH6a9Dw9T5qAfYb
         9/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344717; x=1776949517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxTRERAjxAXioUkoPmpUtJ4F8p4du/e5+8knu4FTJYg=;
        b=Lxt7XR3CabLC8RcDjGI4nZ0PjkRtbwdR0hP0g7dv6huDw3wFGl4pdX0X38jEzkymGf
         /do5EmRIaTf4dV38nw9zg/zqsprk2KxKQMRkJ1fjpxgF1BT8wz4A1berWpZB0reHy452
         3c90rrJVvdiM/IjOfbDEjvZEXWxpbGFDqEJTaCNgVR12oF0uvWn24+r1bhEj+lo+MrVY
         DXIuslIElzc8aI4wHreqi55KnDzqDgSKpDGO506Aw5hS1+2MR6iO2h3jlT4XPu+8dZpd
         OJqopdXYVWazyrmVITrXb/re1zufqsjfKcjh2mJ2m0n5glua44xOEXmM7O4rR+oxPPyI
         iipQ==
X-Gm-Message-State: AOJu0YwvMeSj3odgZdF1o1Pdf4OUMcdwW6dtC+Ndryakn1WiXkaFuplE
	RhBiqAxlCRV80S7G19JI0XYxzmfHd6V4yLNpfasMdOLPpPsir/fTppsLqzMJxwDfq2/wJEo1AAJ
	t1fTjRJe9V409n0S3A7G4EVaalH+eWXw=
X-Gm-Gg: AeBDietKcfdWhPROKThNPmsXyCb5ZhfNA/kGAXlgfI3MAq4hu8TQQiL+IYBz4X/eTPW
	IkFoVpSPIM42eMOegIVZ6mi9zv6mClhzpSvqh0vUclQapDyKi8gPEJ6aaR63pqjUUJz5G+MRvfr
	iLY+1lht0Z6asnDBZMwXPXKHlPul5pRZnzi2T2wf8RIx78h64xdofpszvpRRMDFbNbPu+2GaWMY
	TitkKHgxbMVc/kObPr9qRjn+PCTtT0EpQ4ijLl0fSC3vk7xo0375A07x8MczDG+XwH66lZVN+yl
	yg/Zvuh4KrGs3LjXFTCK0dxs9JooCg4f11MiHeZJlSNHCWGbbjaCs40973037sIgczpQLXEdO0N
	2t3ufvdeubwXr9nzQNKXMGXXl1wuJ
X-Received: by 2002:a05:6808:5293:b0:468:776:1e9e with SMTP id
 5614622812f47-4789e4298d6mr13014056b6e.16.1776344716721; Thu, 16 Apr 2026
 06:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416091754.310-3-hanguidong02@gmail.com> <20260416122131.A220FC2BCAF@smtp.kernel.org>
In-Reply-To: <20260416122131.A220FC2BCAF@smtp.kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 21:05:05 +0800
X-Gm-Features: AQROBzDFKGM1KrvS_5SNFUMSqLNhAf_XLT5a0wHFM6sFxCbpM9gxR5yAp3YRFUg
Message-ID: <CALbr=LY+pid1TGvMydd-K8CnTzX7EB25+z_BBYyBpOn3EEu62w@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (adm1031) Serialize update rate changes
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 8:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [High] Missing I2C error handling leads to hardware register corruption=
 and state desynchronization.

Thanks for the review.

I will look into the I2C error handling, but I cannot confirm the
exact fix just yet. If there is an issue, I will send a new patch to
resolve it.

Again, this is a pre-existing issue with the current codebase, not
something introduced by this patch.

> --
>
> commit ffbce3cc3043a4bfb1c8f7ba4a9010b9c8a23c2c
> Author: Gui-Dong Han <hanguidong02@gmail.com>
>
> hwmon: (adm1031) Serialize update rate changes
>
> This commit expands the locked section in update_interval_store() to cove=
r
> the hardware register read-modify-write sequence and the software state
> update. This ensures the hardware updates and cached state updates occur
> together.
>
> > diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> > index 887fba9ea149f..a46db83471f2c 100644
> > --- a/drivers/hwmon/adm1031.c
> > +++ b/drivers/hwmon/adm1031.c
> [ ... ]
> > @@ -897,13 +897,14 @@ static ssize_t update_interval_store(struct devic=
e *dev,
> >       }
> >       /* if not found, we point to the last entry (lowest update interv=
al) */
> >
> > +     mutex_lock(&data->update_lock);
> > +
> >       /* set the new update rate while preserving other settings */
> >       reg =3D adm1031_read_value(client, ADM1031_REG_FAN_FILTER);
>
> Could the truncation of the error code lead to register corruption?
>
> Looking at adm1031_read_value(), it returns a u8:
>
> static inline u8 adm1031_read_value(struct i2c_client *client, u8 reg)
> {
>         return i2c_smbus_read_byte_data(client, reg);
> }
>
> If i2c_smbus_read_byte_data() returns a negative error code like -EIO, it=
 gets
> silently truncated to an 8-bit value (like 0xFB). This garbage value is t=
hen
> masked, modified, and written back to the register.
>
> >       reg &=3D ~ADM1031_UPDATE_RATE_MASK;
> >       reg |=3D i << ADM1031_UPDATE_RATE_SHIFT;
> >       adm1031_write_value(client, ADM1031_REG_FAN_FILTER, reg);
>
> Does ignoring the return value of adm1031_write_value() leave the softwar=
e
> and hardware states desynchronized?
>
> If the I2C write fails, data->update_interval is updated anyway, meaning
> the cached software state no longer matches the actual hardware state
> despite the expanded lock.
>
> > -     mutex_lock(&data->update_lock);
> >       data->update_interval =3D update_intervals[i];
> >       mutex_unlock(&data->update_lock);
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416091754.31=
0-1-hanguidong02@gmail.com?part=3D3
