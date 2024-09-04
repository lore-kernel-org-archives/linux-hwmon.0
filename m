Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63181D6790
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Sep 2024 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725472102; cv=none; b=D8r0B6YQN4cdFtWonlYijvRBkgAhfN36O56rJUFp7mbIO/qTm0cfRRq0oY4NRWJ7I8t9OiHHZu7bEWIZNPsgNDQcNtWWm03s1At/U8nMZH4pjqSYA/QvSi3Bir2MML42QPRwZnymyAzAuoHTzNgjO8g/SzOkJJG1IEvHUZY0WlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725472102; c=relaxed/simple;
	bh=JZJTXjGMZIGlms19ilRtNM2h5GRGLvvojLxKnxVgSog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfwzDRyVL7XKnmITTsDhMjuWA4yrtFEbYadoJEMYtDGhYtXpiTqPCGGV46EBANdxSykT42RDzhyQ4QmZ5LATGeEimlpia/gmUVePbHhU+1iRXVl07swKT+ObKawYgbQvBCb8feqjhrgysfevC1Eo37JuZ9xMI2Q2DMSUNs/lFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iydsm8Ht; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iydsm8Ht"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-277c28fac92so4167146fac.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Sep 2024 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725472100; x=1726076900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoR8Y6O7zGlAFnODxeu0TP17GInqROXGcqXtpSVg06M=;
        b=Iydsm8HtCFnefwixRlMds/w/RRBy4y+g2VsJd3mGFV2qjHvGtzwnbnBZve4OmlRMvf
         KxB18WhELa+gE2vlgPidAlBIsxXxXHVmHxGStoQtqzU5X4GSMmpGhalehSt2NJIYHaVC
         QlJAPdgIGk2h2EWxXI7guF2Nvs7uf6qcF2qRnnIJeZ9fqq1X+g1ISk8qk0qGbz/Q+WBA
         CF99uEjCSY5ntobD9qgKe5mg0RprWvwdZVBCAvLBi3J7bZCmZO/YJLWutgAXjHCPeauC
         /1Tjyq4to/bDPFq+/r8zlujB/FSHcCarlc5IOcOwzdQ3RBTMzzpwP15PqjGqDl9bcTSv
         XxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725472100; x=1726076900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoR8Y6O7zGlAFnODxeu0TP17GInqROXGcqXtpSVg06M=;
        b=fbHPwu1I81bzvFvnqxTEBc1YizqpfVp4/M1PCTGiRk5Guv+5d8ATprG9zbsKLCzILp
         lG+vocy+DEibiO3lgLOKOz9crWJb8awE19B2M6usSUABFh6skKRJgpihuaM/JOLk9oAY
         zfLTT8SGWP1C58SPLMILTW5QWlOfiZ1ClDSPTO4rOB6yqCU55BXLoF0g8bThY/STC552
         erc2/+jBvRzFcDxtshQekOYUGewyX49M8F14AuZb8MpGivvKUtkIMjmnZpz6983ld6FR
         /fx6/m8OD6jtNL5dddT/5s2pshLmt7f9zAx1xZkmW3oxY2xDf0sL+SiTWXTE3vHADb7f
         lRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlASvQM83N4FKlsk9INndtMaqpynLvMuGl9jIM/1+Sk3Q9TFNyFC7dPXQPIR2MfqSEzhgQOUfkvrsoIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7D4iBFwcRRDo7W8USeey5hxV3rR6aAoYXdHlYvqKVL/fYh4Me
	h5RziD5svWMWiYVHEhLRQXnEwqpTeegwZMSPdfV33QmTB3OAo6hWmykutPzDrDS83j4x4cun2qe
	qlnxJjX/p/hK29baCQhIqOnyPPGg06wOo
X-Google-Smtp-Source: AGHT+IH+XZgQjgvi0pv3FHFQoxaK2o757wd42Fhl2plKvpy17qPRwnUUPkL9qW73dHwE291L/FAn/QUmnvj5oU/KjoY=
X-Received: by 2002:a05:6871:48b:b0:277:f51d:3ed3 with SMTP id
 586e51a60fabf-27810b9117dmr8529835fac.16.1725472099566; Wed, 04 Sep 2024
 10:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+DkFDb--ow-Nc35bDh2Nmrf23B2wsrWW82uAQmu9U3_O4r0XQ@mail.gmail.com>
 <97098eef-880d-483c-a6c7-1aa0e46b7c42@roeck-us.net> <CA+DkFDaaqvBDdC-tikGotyKDx+KheRrhaCYatfpMdzReNsHyUQ@mail.gmail.com>
 <9724dc83-8bdc-4b93-ad14-bb561805909d@roeck-us.net> <CA+DkFDY5r4cNS86W6oGAg_g8GJunLRO455hnpTQG9A42t6Mn0g@mail.gmail.com>
 <7e3cb7af-384a-4004-a96a-a59c1d7a0c2c@roeck-us.net>
In-Reply-To: <7e3cb7af-384a-4004-a96a-a59c1d7a0c2c@roeck-us.net>
From: Patryk <pbiel7@gmail.com>
Date: Wed, 4 Sep 2024 19:48:08 +0200
Message-ID: <CA+DkFDbXp5twR2+w6bBbdS=cYR1qsreVtaDyecR+TH17Dfe0YA@mail.gmail.com>
Subject: Re: Question regarding write-back operation to STATUS register
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 4 wrz 2024 o 17:56 Guenter Roeck <linux@roeck-us.net> napisa=C5=
=82(a):
>
> On 9/4/24 08:24, Patryk wrote:
> [ ... ]
> >  >>> We'll need to add some code to detect that condition and
> >  >>> refrain from clearing the status register if the chip doesn't supp=
ort
> >  >>> writes (or maybe ignore errors from the clear operation). Ignoring=
 the
> >  >>> error might be the easiest fix.
> >  >>
> >  >> I will apply this fix to our codebase then, unless I come up with a=
 better idea.
> >  >>
> >  >
> >  > If yyou don't mind and have the time, it would be great if you can s=
end a
> >  > patch to be applied to the upstream kernel. If not, please let me kn=
ow and
> >  > I'll write one myself.
> >  >
> >  > Thanks,
> >  > Guenter
> >  >
> >
> > Sure, I'll send a patch.
> >
>
> Thanks. Additional background: The ability to clear status registers was
> added with PMBus version 1.2, so it is not surprising that older chips
> don't support it. The best fix would probably be to read the revision
> register and use its content to decide if the individual status register
> should be cleared or if the clear_faults command should be executed.
> Something like
>
> struct pmbus_data {
>         ...
>         u8 revision;
>         ...
> };
>
> In pmbus.h:
>         #define PMBUS_REV_10    0x00
>         #define PMBUS_REV_11    0x11
>         #define PMBUS_REV_12    0x22
>         #definw PMBUS_REV_13    0x33
>
> In pmbus_init_common():
>
>         ret =3D i2c_smbus_read_byte_data(client, PMBUS_REVISION);
>         if (!ret)
>                 data->revision =3D ret;
>
> In pmbus_show_boolean():
>
>         if (regval) {
>                 if (data->revision >=3D PMBUS_REV_12)
>                         ret =3D _pmbus_write_byte_data(client, page, reg,=
 regval);
>                 else
>                         ret =3D pmbus_clear_fault_page(client, page);
>
>                  if (ret)
>                          goto unlock;
>          }

Thanks, I'll implement it according to your suggestion, test it (I
have few LTC devices) and if this is working I will send a patch.

BR
Patryk
