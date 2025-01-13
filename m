Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0E23236E
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jan 2025 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736754178; cv=none; b=siDrs6B9hCVVQ4I8foO7dZBXMs03QT17rog8l3USRoH1cQo6GvT3n3XT372uO1Ytz2Ma3EGpXb++Dc1TDzOhVgbk4CsEPJEqS7sqVA7CYWP85s0CfjE9agTy2h+LQXx8kbPMY2GWI9ck6HHWjlbxPTuf5MKtS0Xu98CKjBzo7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736754178; c=relaxed/simple;
	bh=hfB4/BMVsk+qNpzDmbACkiRFPMTgeQPmQ7ttP2eG0DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgPjl4gS2B57WLZFAQfnxVZsDTbFvTPpT+1cL8Rf/+H9dQkh68RPpz1dckbZiSk1K4hGImhqNZ04g5vwGmrX3oFa33yqxr0fcg9VOOLKAjvhGmJP26NgHDOiYqEFzxWjmB1ec4Gr86rfyCQghMccfRtGhtqigaALfgEvjfVwLVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpL6LG8g; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpL6LG8g"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso390943a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jan 2025 23:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736754176; x=1737358976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBfCS4f3GB98NtQEO3qoTOxmU652vWLY8h98oZesbJM=;
        b=MpL6LG8gZBkzZpHyjHtHScqoi7jlue6mrYmxnbF4qsbzbJ3ZvhNPilOcAcxk8W/kBz
         W8MuEUC0RcE56TIGDHqXh5KPPTBZ5tXnS6Ix7bx3mT32GB2zhOllt5R4ZTVHvxJ7bE3V
         nebwvImK+eLnjhuCzbtRJq6qRMMXPTUqLQOqHwtaXsTBw8dnhCSPtEPpjee41C5rzQFU
         HPh9erMzY6dXuoSVG+E3apxJDwVZZBrkbkLrTiNp5pAhWxZbJRRmS5JrGxv97eeMo7wn
         GqaMHnKgf9Y8qrYDk5br1en106PeMD640AOYZ/YSCdP4zgd1MSjzkbGgzgD4IUYDl9gC
         0YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736754176; x=1737358976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBfCS4f3GB98NtQEO3qoTOxmU652vWLY8h98oZesbJM=;
        b=ngpW5QkFaEwXi7ddiSAnWlZNnIT4e+HWqP25/gilaJr8/K2an0m/5ibYc5TiyVYaMa
         r9Va2+aDIwCH47s1uXHc8lm4U05SfpKzTe3KVEiYpLcg9W/lrd6rn7BQzs7KDlWlzQSw
         3kjOL8OU4FmRI6wjbH68cP3kMUSryCkvfCoIE7R0dMM+GnVO3Iv3P2d5wEK623qanIjt
         ZK84a6kpas/4/WLM6deECun7CLuzDqQ2ar3ht8kZz93vjJz6vwc+i13JYbMCotM5U3Pl
         oJEK6A1hFlwrPmhIWhyCPIVOJN1EQnl+3bztgZ7wFbbbBd931GsE+A7g2z+7sLFaW/8O
         ZGzw==
X-Forwarded-Encrypted: i=1; AJvYcCUvJBgGJb4xLA54Qkxce3KAgG3tacLld2s/STC6XT0QuR+hTMst2Ej+nW9TZCDI6uZWjSCikKLMO/lGLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydx40Iblc9jP8s2E3tCVL3WsS9gSG2evES33TZUigbyn7Z7UIJ
	6EC8bMeGaIK3hHRUc2GoH1Mir0zN0HuyRsO+whoWrKuwc7C/UfT1Dytha0OM0kYsJi+YRoSV/KW
	tYU7BjiF6LzcIQEtGsrb9u/46BAk=
X-Gm-Gg: ASbGncvDkgi0vYCLzAdR+ww3+mH3BBEklSBcUO9+aewMdPDV+DscWLoGQtH946oRVLT
	5PP7Ngnh9rKtaosiiSwpGf7A5qhJcGoyzA3wz9X0=
X-Google-Smtp-Source: AGHT+IH9BNq2JSD5qTfbjAMQ9632YxtevhYgSQVQo0T+HHaqnh56Wt5eyW662YY4KuPKM+W46OrUAo42TCPJH8GJFRs=
X-Received: by 2002:a05:6402:1ed1:b0:5d0:d208:4cad with SMTP id
 4fb4d7f45d1cf-5d98a105e8emr14550351a12.2.1736754175332; Sun, 12 Jan 2025
 23:42:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501130056.dNRlSRuE-lkp@intel.com> <543a7c55-cc06-4825-a37e-29017fb4fe3f@roeck-us.net>
In-Reply-To: <543a7c55-cc06-4825-a37e-29017fb4fe3f@roeck-us.net>
From: Denis Kirjanov <kirjanov@gmail.com>
Date: Mon, 13 Jan 2025 10:42:43 +0300
X-Gm-Features: AbW1kvYXEZ5QzH2Bb2YsZcNHsjw5TZ20UX5u5MksB-8YM_D-5R6vDTqOg-YdNGI
Message-ID: <CAHj3AVm3EZNZ6szO-f1xEgBCD+JY7zFO7Je7Ju6SwPD+iVHHSg@mail.gmail.com>
Subject: Re: [groeck-staging:hwmon-next 41/43] drivers/hwmon/pmbus/dps920ab.c:205:21:
 error: 'dps920ab_device_id' undeclared here (not in a function); did you mean 'dps920ab_driver'?
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've sent from the wrong repo, sorry, I'll send the proper patch shortly

On Sun, Jan 12, 2025 at 7:46=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/12/25 08:15, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-st=
aging.git hwmon-next
> > head:   ffd30617d9ea248f5766778227bc2b59ee2e691a
> > commit: 139c3e32b53bdb1ee06f2f67adeccbcb4ad9288c [41/43] hwmon: pmbus: =
dps920ab: Add ability to instantiate through i2c
> > config: loongarch-randconfig-r131-20250112 (https://download.01.org/0da=
y-ci/archive/20250113/202501130056.dNRlSRuE-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 14.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20250113/2025011300=
56.dNRlSRuE-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501130056.dNRlSRuE-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> drivers/hwmon/pmbus/dps920ab.c:205:21: error: 'dps920ab_device_id' un=
declared here (not in a function); did you mean 'dps920ab_driver'?
> >       205 |         .id_table =3D dps920ab_device_id,
> >           |                     ^~~~~~~~~~~~~~~~~~
> >           |                     dps920ab_driver
> >
> >
> > vim +205 drivers/hwmon/pmbus/dps920ab.c
> >
> >     198
> >     199       static struct i2c_driver dps920ab_driver =3D {
> >     200               .driver =3D {
> >     201                          .name =3D "dps920ab",
> >     202                          .of_match_table =3D of_match_ptr(dps92=
0ab_of_match),
> >     203               },
> >     204               .probe =3D dps920ab_probe,
> >   > 205               .id_table =3D dps920ab_device_id,
> >     206       };
> >     207
> >
>
> I dropped this patch as not even compile tested.
>
> Guenter
>


--=20
Regards / Mit besten Gr=C3=BC=C3=9Fen,
Denis
