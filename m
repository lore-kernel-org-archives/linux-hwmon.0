Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2485C35F5FC
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449325; cv=none; b=boWBmCh2m+sj3NCgrePziVv7eo909e/7p0TejJDvvRQU3md9l9E8jO0N3jYBslTIu7uuoiW/RSyZHTEHYc4pRquWJXcLfsminekHvwNMxWRVG1ju5W+BAixS+o9N2nWqOO+IGapkyKxPW03oPfrnhZe/mJuXAHTQI9juQkN/Mro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449325; c=relaxed/simple;
	bh=FPUUwSTSnHifTg1q09fFBxiGrVRvJtWxYMGk/Hf/oPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rmBzPUXgEUVHURdw7DdKKXyOfPSVtQliyEFEfj8asiRhZDtxFScWKgILDzycW7PzUuWDqx3P0i3yOKzlSN8HehQGSVZz/gllfPwODh0OCS/xHmsVRWT5gBID13v+bzDJnTbYr8xy15m1vp0yDBN78Y3E1cA5xilzvk1BCuEJW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWbYPDe4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWbYPDe4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b5d78592so860920f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449322; x=1773054122; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=MWbYPDe44zed2KsOUc14yPFYKO+jR1+crKAFR8UALOdYgwe6zoku1UeiELG5KFjJdT
         Z282fgcSIpF0sQSeERm28ejPpbskvZa398Yg2UiSpx2/RC7juHgpDGMjtvTa0Vc0FA9b
         46PvUbwynXZump/jv4UoWLj4K4kXg9K29BluNYLnh7un1liI3grXJDye6PxieBHBLBXl
         ipl2PYX8tQGayaIIpWFrwUqwqay4Rm7K5PsvOdjj9kEMVN+H2IYYMgLJirw5nIQfVKow
         +RsSDNN56oa+ozQd1RHvYBxRt7sUjPfLNeHxZUqmbGeeMXcbFGFqeigVwSnMxRxMEKa2
         Nb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449322; x=1773054122;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=j7nE5C6fdl6vhFT6h3qe0X8H3sNgIC00mLB0HIu6Nzl06qeZW4EpOxYESsvEuNQoH9
         IotknQNU+OcUetpmgkWLFcmF2tFGj5Mskm5EVtLzsyRSxJh98kdTuMQk9+6ZaPGqid1P
         a/NuvzanqWTje59kInFs0fzgMDP/ej2pjvsEA2Jd6IswCcstwGQ/AUtUEpg4xc6eoC4F
         2hFx+WmsgomeAqmlM67CmSFF0kwwgIKDrC4KDI9/thr2RyzKRZU6IM+l6FjsYnp+2ohg
         lF2QLMbharq7uk5nIeukOWG4scIpCwuisZtKUMTJfuR9yHXPoWWcTWV+B6QKSWjcAg6+
         g2wg==
X-Forwarded-Encrypted: i=1; AJvYcCWnVdoRdrpUzu2S4cDSZVXSauvfIgYwYw5OsY+rEl9YBrvY9MMTH+xl3cR2boAn6mOoKSZuuRaWTu8MMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzixD54usoa3qusXp+venrEAKmLQWex8EmoMwouXhQoeHqiqM9U
	0Cnzq7MKC3V6F4vMFH4Komp55HYtmCHimsSeRbjpJiC35OeGHWdFeyxs
X-Gm-Gg: ATEYQzzcSBj/qP2P3lE1EB6cByiLDXcbKy/bkEBaZA3TduQdvVD0A+ffWcc+VBwNNof
	8VuKTTeUzoPQD5zzzUHxgSYgHQIcjpYCXg0BR+tY4tRhZEADaZOeZmfqtPjirmpk/Avlw59l8oF
	QRDT1ZL/tz8RRtWbNjlV+JkDi4RgZ08TQBXhwacR+9Oa0e3s6IchK/LVA0IyIy1qGsEBhQSZAyr
	rAJT5u7G5dWzA/HBcUokruQmnKq2iC3eAmA/w8gF+eqFxFn0qtlIl5wAlJXQjU/McJFmvGgV4c9
	kxTXYePncSg6WVLIrWUVrnwRBjz0CjSRj/iioe8HTjGNcCm3oPSeFTkQRpN0j+b/dzthht1RRfp
	3URAwvvrMTUVnzrimoNEkxqXnYnjM9YZEUcCha1snguiJI4M3q8N8HrMNLdbcsqPWycdZi/Ijzp
	wGv1RiMEt3Ku6N8KpgiBfO5w3pgSVb2e8=
X-Received: by 2002:a05:6000:2483:b0:439:ac53:a94d with SMTP id ffacd0b85a97d-439ac53aa50mr10380328f8f.29.1772449321007;
        Mon, 02 Mar 2026 03:02:01 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm26841661f8f.7.2026.03.02.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:02:00 -0800 (PST)
Message-ID: <de48f967a50b8f780dbadc562833ae6626be5268.camel@gmail.com>
Subject: Re: [PATCH 2/3] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Danilo Krummrich <dakr@kernel.org>, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com,
 nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Mon, 02 Mar 2026 11:02:44 +0000
In-Reply-To: <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
References: <20260302002729.19438-1-dakr@kernel.org>
	 <20260302002729.19438-3-dakr@kernel.org>
	 <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-03-01 at 16:51 -0800, Guenter Roeck wrote:
> On 3/1/26 16:25, Danilo Krummrich wrote:
> > Do not use driver_override as IRQ name, as it is not guaranteed to poin=
t
> > to a valid string; use dev_name() instead.
> >=20
> > Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> > =C2=A0 drivers/hwmon/axi-fan-control.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-co=
ntrol.c
> > index b7bb325c3ad9..ec4bbb104449 100644
> > --- a/drivers/hwmon/axi-fan-control.c
> > +++ b/drivers/hwmon/axi-fan-control.c
> > @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_de=
vice *pdev)
> > =C2=A0=C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NU=
LL,
> > =C2=A0=C2=A0					axi_fan_control_irq_handler,
> > =C2=A0=C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > -					pdev->driver_override, ctl);
> > +					dev_name(&pdev->dev), ctl);
>=20
> The devm_request_threaded_irq() API documentation says:
>=20
> @devname:=C2=A0=C2=A0=C2=A0 An ascii name for the claiming device, dev_na=
me(dev) if NULL
>=20
> So NULL should be sufficient.
>=20
> Nuno, was there a special reason to use driver_override ?
>=20
>=20

Not really. That driver was one of my first patches so most likely it was j=
ust some
copy pasting. NULL should be fine.

- Nuno S=C3=A1
