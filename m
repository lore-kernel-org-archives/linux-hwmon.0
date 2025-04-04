Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3963721D5AF
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Apr 2025 19:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795088; cv=none; b=Vqn+JxnKjdeoSbpAoeHYCm0NAJ+goPOKfVwqkz0t0c28eeQUBZfeW591Vc+JOYfUGrKbIAjnNNK8lHG8tuGHF3KlavLhvWJDsnNaSzWLecdNJ9cCIC+oLYPi79EQzQTfYzrk7UbKZoBN2G9UsjK5W3E4yPKFTh9eVcXu8KV5DnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795088; c=relaxed/simple;
	bh=VwiRV/e28I9bnPygUuh/jqIi0NGSfuLpQnfxaSZf7mQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cS1mOd0y1vwetR/HexYfvPM22DWQMdtsE5ZDcUl0FM8jq4PuoTytEDQblVdd1ZnyUzUyrY7+tDiqHQm4wVHsjsEQcLZs819YFK4C+kz+9pm/04Mx6e77Xuw/WG0HEJPUHTHsOwF/4SFddfUNMnu/CKe+qBuT9uZ7jFXQEHeEK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=ztKtvLvR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="ztKtvLvR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736e52948ebso2758865b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Apr 2025 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743795085; x=1744399885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9ak9CiviRuGzfJfjnoKlDnbc66wFb4O0ILw2ZpMgXY=;
        b=ztKtvLvRYOhKNYOHKD+6bMsrNBAa743NmPovG2yCxtzG6YJUNBhCksYWQoBELT1gAw
         GUWbos3kzwpw/L+qp8JPlACA3q+sU2Rn2q3Nbv+ux8YdhYYgTBQGsVoVyfJVAFJ9ZPtn
         c6AU+s1V/FghK7F+MCc0aR2wZESe6oafr8Bjmp8DOanhot+45EKPW8nN8aZRjy3VdtPf
         3Hn2ayXcEaoKuErrigQoqGjmJgp2nyc9VFdV6ccSG1UzYj3rKlUkqXB5ybKwoJM2RCRN
         m1pPJMtWGxevNjMl4PCSKDPxUZ4Fp/bODDLVP8DX6vR+Gaz13+gFuZnKjTLM/8A/bm1o
         TCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795085; x=1744399885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9ak9CiviRuGzfJfjnoKlDnbc66wFb4O0ILw2ZpMgXY=;
        b=NDLaW90VDEa69Vd77a2TarmAdwUoIpD/iS/Zws4YR/KafBYzQtM+nRpkTbI5Z6JWer
         sddHbQ2ITpyVaT60a30K2L9ojv79vC7XoIoympiqMGIwIfBL6vEgB246a6sp1ofO+T0l
         7TmtQkr2lt+zI6ZhzSMJFbf1VYixmcur/oXXHThBNLYXy1mN8mGltZPvx6UnsH94hXog
         9UkKlah0AUJQC2IRywRi0XomvEqKxLCOxNhWqWR1JNfmgnnNFS5iYbq1NY4HSAwTe4dt
         3zaJrvs2myoi38IqkjsEl90WkgA24VNJ3/G+ZKMP88JO5TiYpgEyRtBRt6j+lTiqyTcU
         U6XA==
X-Forwarded-Encrypted: i=1; AJvYcCU0dR/4GSuUP0Z/71om2NG053bfclbn/3XcvgHDFQdvGVsR7s44ZuA2SGvWJ+ByK1Z6DlVIXub80pUMzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrWksdl9mFUf59AwWSxI2O504IyfJuANzr4SkGg54bE7cF5RT
	5Fhl+uJYsXEzCpf618o76Pfkwx0sD+XhsZOQU5V/3fJXJJ6w6simDkVAF4NTS1XZ/ZzfRtKzhTr
	tE2ssMRoh+m2XaoOONHWnuFtrQIRl2Qr7yUO1rvsaERDANKP7WNAQGQ==
X-Gm-Gg: ASbGncvqutiOUo76kT0vX2+YOGKGtycAhpBZ5GWNCaPfLJio4+Wvrzz/pyyPHvmCYJ4
	hfy4CFG+jxja364V4sNrn/gHRXj/UIZjelL0p5koAlBenPpSLmoGbHZBVSfzI4veB85m7t5CaYh
	gg+JrdzYaeUpcN6UiTGRRmjcKt+uGXThz9Rca6cNqtIjA2GF/zgDnR7Nfhou9l
X-Google-Smtp-Source: AGHT+IGFwB4zt/PdfiXH+ur93rYROPkDM8m0gCZjvh6xPu1u1ZUNrLgLZe+281AL1D/QzaaZZFT6wVzuZUClt609Qcw=
X-Received: by 2002:a05:6a20:c995:b0:1fd:f55f:881e with SMTP id
 adf61e73a8af0-20108182fd0mr6394281637.36.1743795085425; Fri, 04 Apr 2025
 12:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202741.3593606-1-william@wkennington.com>
 <20250403211246.3876138-1-william@wkennington.com> <444f9411-851b-4810-8f6e-35306ac9bfdb@roeck-us.net>
In-Reply-To: <444f9411-851b-4810-8f6e-35306ac9bfdb@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Fri, 4 Apr 2025 12:31:13 -0700
X-Gm-Features: ATxdqUEfP1dne_1Ecc0vgWxHxv28B79fPP6sUUrlDCWkLaeUUMo4l2ixdkeFm_I
Message-ID: <CAD_4BXg3WzRZWiRo42JF0-oxffdj+N0agkyeE_m0Gd1YGda8+w@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (pmbus): Introduce page_change_delay
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 5:28=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Thu, Apr 03, 2025 at 02:12:46PM -0700, William A. Kennington III wrote=
:
> > We have some buggy pmbus devices that require a delay after performing =
a
> > page change operation before trying to issue more commands to the
> > device.
> >
> > This allows for a configurable delay after page changes, but not
> > affecting other read or write operations.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> > V1 -> V2: Simplify how the backoff time is stored and computed
> > V2 -> V3: Use the BIT macro
> >
> >  drivers/hwmon/pmbus/pmbus.h      |  1 +
> >  drivers/hwmon/pmbus/pmbus_core.c | 67 +++++++++++++++-----------------
> >  2 files changed, 33 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index ddb19c9726d6..742dafc44390 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -482,6 +482,7 @@ struct pmbus_driver_info {
> >        */
> >       int access_delay;               /* in microseconds */
> >       int write_delay;                /* in microseconds */
> > +     int page_change_delay;          /* in microseconds */
> >  };
> >
> >  /* Regulator ops */
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmb=
us_core.c
> > index 787683e83db6..3aa5851610b2 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -114,8 +114,8 @@ struct pmbus_data {
> >
> >       int vout_low[PMBUS_PAGES];      /* voltage low margin */
> >       int vout_high[PMBUS_PAGES];     /* voltage high margin */
> > -     ktime_t write_time;             /* Last SMBUS write timestamp */
> > -     ktime_t access_time;            /* Last SMBUS access timestamp */
> > +
> > +     ktime_t next_access_backoff;    /* Wait until at least this time =
*/
> >  };
> >
> >  struct pmbus_debugfs_entry {
> > @@ -170,33 +170,30 @@ EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
> >  static void pmbus_wait(struct i2c_client *client)
> >  {
> >       struct pmbus_data *data =3D i2c_get_clientdata(client);
> > -     const struct pmbus_driver_info *info =3D data->info;
> > -     s64 delta;
> > -
> > -     if (info->access_delay) {
> > -             delta =3D ktime_us_delta(ktime_get(), data->access_time);
> > -
> > -             if (delta < info->access_delay)
> > -                     fsleep(info->access_delay - delta);
> > -     } else if (info->write_delay) {
> > -             delta =3D ktime_us_delta(ktime_get(), data->write_time);
> > +     s64 delay =3D ktime_us_delta(data->next_access_backoff, ktime_get=
());
> >
> > -             if (delta < info->write_delay)
> > -                     fsleep(info->write_delay - delta);
> > -     }
> > +     if (delay > 0)
> > +             fsleep(delay);
> >  }
> >
> > -/* Sets the last accessed timestamp for pmbus_wait */
> > -static void pmbus_update_ts(struct i2c_client *client, bool write_op)
> > +#define PMBUS_OP_READ BIT(0)
> > +#define PMBUS_OP_WRITE BIT(1)
> > +#define PMBUS_OP_PAGE_CHANGE BIT(2)
>
> I guess you really don't like tabs. Ok, no problem, I can fix that up whe=
n
> I apply the patch. Either case, please move the defines ahead of the firs=
t
> code block.

Done

>
> > +
> > +/* Sets the last operation timestamp for pmbus_wait */
> > +static void pmbus_update_ts(struct i2c_client *client, int op)
> >  {
> >       struct pmbus_data *data =3D i2c_get_clientdata(client);
> >       const struct pmbus_driver_info *info =3D data->info;
> > +     int delay =3D info->access_delay;
>
> Hmm, this is a functional change. It always sets the minimum wait
> time to access_delay, even if the operation is a write. I guess
> it makes sense because otherwise there would be no delay after
> a write if only access_delay is set. However, that means that
> PMBUS_OP_READ is not really needed anymore and can be dropped.
>
> This should be explained in the patch description.

Done

>
> >
> > -     if (info->access_delay) {
> > -             data->access_time =3D ktime_get();
> > -     } else if (info->write_delay && write_op) {
> > -             data->write_time =3D ktime_get();
> > -     }
> > +     if (op & (PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE))
> > +             delay =3D max(delay, info->write_delay);
> > +     if (op & PMBUS_OP_PAGE_CHANGE)
> > +             delay =3D max(delay, info->page_change_delay);
> > +
>
> I would have set PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE in the calling cod=
e,
> but this is ok too. However, please make it

Sure, I'll just move it to the callsite

>
>         if (op & (PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE)) {
>                 delay =3D max(delay, info->write_delay);
>                 if (op & PMBUS_OP_PAGE_CHANGE)
>                         delay =3D max(delay, info->page_change_delay);
>         }
>
> After dropping PMBUS_OP_READ, that can be simplified further to
>
>         if (op) {
>                 ...
>         }
>
> > +     if (delay > 0)
> > +             data->next_access_backoff =3D ktime_add_us(ktime_get(), d=
elay);
> >  }
> >
> >  int pmbus_set_page(struct i2c_client *client, int page, int phase)
> > @@ -211,13 +208,13 @@ int pmbus_set_page(struct i2c_client *client, int=
 page, int phase)
> >           data->info->pages > 1 && page !=3D data->currpage) {
> >               pmbus_wait(client);
> >               rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page=
);
> > -             pmbus_update_ts(client, true);
> > +             pmbus_update_ts(client, PMBUS_OP_PAGE_CHANGE);
> >               if (rv < 0)
> >                       return rv;
> >
> >               pmbus_wait(client);
> >               rv =3D i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> > -             pmbus_update_ts(client, false);
> > +             pmbus_update_ts(client, PMBUS_OP_READ);
> >               if (rv < 0)
> >                       return rv;
> >
> > @@ -231,7 +228,7 @@ int pmbus_set_page(struct i2c_client *client, int p=
age, int phase)
> >               pmbus_wait(client);
> >               rv =3D i2c_smbus_write_byte_data(client, PMBUS_PHASE,
> >                                              phase);
> > -             pmbus_update_ts(client, true);
> > +             pmbus_update_ts(client, PMBUS_OP_WRITE);
> >               if (rv)
> >                       return rv;
> >       }
> > @@ -251,7 +248,7 @@ int pmbus_write_byte(struct i2c_client *client, int=
 page, u8 value)
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_write_byte(client, value);
> > -     pmbus_update_ts(client, true);
> > +     pmbus_update_ts(client, PMBUS_OP_WRITE);
> >
> >       return rv;
> >  }
> > @@ -286,7 +283,7 @@ int pmbus_write_word_data(struct i2c_client *client=
, int page, u8 reg,
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_write_word_data(client, reg, word);
> > -     pmbus_update_ts(client, true);
> > +     pmbus_update_ts(client, PMBUS_OP_WRITE);
> >
> >       return rv;
> >  }
> > @@ -408,7 +405,7 @@ int pmbus_read_word_data(struct i2c_client *client,=
 int page, int phase, u8 reg)
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_read_word_data(client, reg);
> > -     pmbus_update_ts(client, false);
> > +     pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >       return rv;
> >  }
> > @@ -471,7 +468,7 @@ int pmbus_read_byte_data(struct i2c_client *client,=
 int page, u8 reg)
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_read_byte_data(client, reg);
> > -     pmbus_update_ts(client, false);
> > +     pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >       return rv;
> >  }
> > @@ -487,7 +484,7 @@ int pmbus_write_byte_data(struct i2c_client *client=
, int page, u8 reg, u8 value)
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_write_byte_data(client, reg, value);
> > -     pmbus_update_ts(client, true);
> > +     pmbus_update_ts(client, PMBUS_OP_WRITE);
> >
> >       return rv;
> >  }
> > @@ -523,7 +520,7 @@ static int pmbus_read_block_data(struct i2c_client =
*client, int page, u8 reg,
> >
> >       pmbus_wait(client);
> >       rv =3D i2c_smbus_read_block_data(client, reg, data_buf);
> > -     pmbus_update_ts(client, false);
> > +     pmbus_update_ts(client, PMBUS_OP_READ);
> >
> >       return rv;
> >  }
> > @@ -2530,7 +2527,7 @@ static int pmbus_read_coefficients(struct i2c_cli=
ent *client,
> >       rv =3D i2c_smbus_xfer(client->adapter, client->addr, client->flag=
s,
> >                           I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
> >                           I2C_SMBUS_BLOCK_PROC_CALL, &data);
> > -     pmbus_update_ts(client, true);
> > +     pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);
>
> I'd argue that this does not warrant a PMBUS_OP_WRITE in the first place.
> From the chip's perspective, the operation is complete after the data
> is returned. This is just as much a write as any other SMBus read operati=
on
> (a write of an address followed by a read). If you think otherwise, pleas=
e
> explain.
>
> Either case, the change warrants an explanation in the patch description.

The previous behavior was to treat this as a write though? I updated
the description about picking the maximum delay in the code change
above, but this specific instance is still classified the same.

I think technically we shouldn't do a single smbus transfer, but do
the write followed by read with a write delay injected between them. I
don't want to make that change here but it doesn't make sense to
ignore the write delay IMHO.

>
> Thanks,
> Guenter
