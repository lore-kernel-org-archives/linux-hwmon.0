Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A459210184
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Apr 2025 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056218; cv=none; b=InxXf+ACjV5+Hvi+2EELcqkk8WDOjgxEHFR8+Ztc4c7v3gNzUbu9zVqC997qpncyfHvn+6ZWnZg7KgRvYKHfp/qRSzGlbNuG+xLM5WVZF50u9lBNC7xu4FZLLIFIuhwMWoc4/R3QDXhTRiL5ymJArspMlJZk5PmWfj1mzuLPaCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056218; c=relaxed/simple;
	bh=nW81ZxcGfceZ28laz0V0pRLhUO4sPGuzy1YnlLBNCJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HAR9xFzM1twiX30C0TkMfRYbdHeUkWoKR1GypFwqtYkWU6j8c89cH0128Kkx8pWIQ8wOvNkxpzms48eKQmWs6l5QbArfXULxnAyPVuOYL1KDfEVNwxRW5VP/7sBal6iAnw+5ngDuzZ6DrYyXQLFGIUMwRui4TBNufWnYCb6G5b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=Cb/UfNyP; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="Cb/UfNyP"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e904f53151so40692396d6.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Apr 2025 13:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744056215; x=1744661015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3+o7VisTxG5ntH0+PwnOB4IgCUPGMMK0nmH4xIirwY=;
        b=Cb/UfNyPirKg6y9qbqQnG1XEce11HhJCNRBEF8uejuRIaDzXH5kzZxsWJcdkJwrXHQ
         fCH1nzAERY9WUl37H9jT8wTG5ImzfNQQ78msUMt85gv+BRfItdi1rQUs7f3ASxmTlwyz
         cnL0mCy/eRF7vfGYDNCPNOdFqlJPGikjYwMQIftNBMKVStnQZXTMkoxDYBAP2g+OTqz+
         68GJ5UAgYPLfBok8IKRIwU1xa+I9SvVH2WeBj4LjkFfOe3+1vG9XoKkSqmV7u317S2a0
         DERM6580qbfe1+AxQPxsplFM9mpWfsdtSUkLEmMQ6+dGsOaJjZQ0rYsLV+iX0NK+qeDH
         9QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744056215; x=1744661015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3+o7VisTxG5ntH0+PwnOB4IgCUPGMMK0nmH4xIirwY=;
        b=NuFUT+oXMkzv5AHKBxG8qgIkzTLpiA7OYSbpOYnZODu/ED/rJw8fhIEB0dBHQSw0rn
         VqqJLolL+Wtq9MCtkl5vzcc58MpAze+aQS+5mDQfvw31NKRVk6k4QkAy1M50EwVsibBF
         WMGm2Af4YrAsCNjJi+YZCcSLD4vxCJprVUkP1Y0T502MCkfhm2MU5WxJpGB7ES7Jo0en
         0mgui/mNmtFVUDwQwdVy/RTLsqVDCLtlL1oQmYLxosH2VK0XMD+y9cTLqHU30vVXpObu
         7k/baz8Qi1qeIszQZ1yjHoz/H4noERThsdkrC3YvH7ZPgly38hJP4A5ZJ/I55GAA+DQV
         yjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN/xUqMl1zTIK5s+pPa8vn+zqQxVAwSlaaZpgFMmeDUhK/GiWIE7m7fAbdafd9jrGnuk+mwl73/6kX7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRXFTOhtQ+A6XQbf0fLfJ4tvxJmdRcHKpX3GiyQ2+ktefOVdN7
	bQCaspDmdVxv6cRjtjKCYcCi63gyKtMx7lakrDE+95e+DJ6VzIbP1QYMwqWSww6nRFb0J6YBSBJ
	beVDyLL0ONZ4qQD4SzdOQQIlrKgUO7lxyXAV/ht1GlvA/UnYjSgM=
X-Gm-Gg: ASbGncvwOOFOa+uRL4I4Ifcy+AkuQr7DxiQgfmswQi451BkG+X1bFxyFih0WtNcv7uC
	rLrJJArjvTShK+f1RoxkZpaV2lr35CsZ5jgGzwZogD4BEp0DXC9vT77m84R+7PL0chSyHZbhbJu
	GOMY2n7YeIryPzJJEzZ5/8o+ga8hH9E8kfKeUNekkGQceacuBvliimP5ptPML1
X-Google-Smtp-Source: AGHT+IEhKzcci0dj/WtrjK9AwJLOoo25VycX/FtSpV2jgjjyibJeaWSyoNdmRTAq7Yl/O5wDf060/Lk7G5i4RBIM8P8=
X-Received: by 2002:a05:6214:c2e:b0:6e8:efd0:2dad with SMTP id
 6a1803df08f44-6f05842d160mr192203616d6.12.1744056215192; Mon, 07 Apr 2025
 13:03:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202741.3593606-1-william@wkennington.com>
 <20250403211246.3876138-1-william@wkennington.com> <444f9411-851b-4810-8f6e-35306ac9bfdb@roeck-us.net>
 <CAD_4BXg3WzRZWiRo42JF0-oxffdj+N0agkyeE_m0Gd1YGda8+w@mail.gmail.com> <7d6d8740-9d9e-4cc4-9e7b-d005fb87fa2c@roeck-us.net>
In-Reply-To: <7d6d8740-9d9e-4cc4-9e7b-d005fb87fa2c@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Mon, 7 Apr 2025 13:03:21 -0700
X-Gm-Features: ATxdqUGRUr0GdMRv-jOz9jeYvk5Q354lDK49MqHOPAEG3dsX2bQCdfPQpUVT9lo
Message-ID: <CAD_4BXjV7ob6SEcmo2z8QPcY0-GcgKg-X_Dr9NQbUu9q5svSfg@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (pmbus): Introduce page_change_delay
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 4:46=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 4/4/25 12:31, William Kennington wrote:
> > On Thu, Apr 3, 2025 at 5:28=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
>
> >>> @@ -2530,7 +2527,7 @@ static int pmbus_read_coefficients(struct i2c_c=
lient *client,
> >>>        rv =3D i2c_smbus_xfer(client->adapter, client->addr, client->f=
lags,
> >>>                            I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
> >>>                            I2C_SMBUS_BLOCK_PROC_CALL, &data);
> >>> -     pmbus_update_ts(client, true);
> >>> +     pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);
> >>
> >> I'd argue that this does not warrant a PMBUS_OP_WRITE in the first pla=
ce.
> >>  From the chip's perspective, the operation is complete after the data
> >> is returned. This is just as much a write as any other SMBus read oper=
ation
> >> (a write of an address followed by a read). If you think otherwise, pl=
ease
> >> explain.
> >>
> >> Either case, the change warrants an explanation in the patch descripti=
on.
> >
> > The previous behavior was to treat this as a write though? I updated
>
> That dpesn't mean that the previous code was correct.

Yeah i 100% agree, I just didn't think this is the place to be
figuring out if the old decisions were accurate or not. I was keeping
the behavior the same (respecting write_delay) for this operation
because it's unclear to me what the purpose of the delay is for. It
seems like it's actually meant to delay around the concepts of smbus
read / write, not PMBUS logical reads / writes. Anyway, I left this
the same for now.

>
> > the description about picking the maximum delay in the code change
> > above, but this specific instance is still classified the same.
> >
> > I think technically we shouldn't do a single smbus transfer, but do
> > the write followed by read with a write delay injected between them. I
> > don't want to make that change here but it doesn't make sense to
> > ignore the write delay IMHO.
> >
>
> Every single SMBus read transfer is a write (chip address plus register a=
ddress)
> followed by a read. Following your logic, every read should be treated as=
 a write,
> followed by the write delay, followed by the read.

Understood, but I think that was the purpose of the delays when
originally contributed. It's about SMBUS related issues in specific
device implementations and not PMBUS logical operations.

>
> Guenter
>
