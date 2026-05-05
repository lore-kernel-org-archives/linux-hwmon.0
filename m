Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CD2304976
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992035; cv=none; b=ZWDOcgM4nch1TFp9QKDCiwc5FqikEvRGp67y75QuZx88WCs+VfyvE0kAl9mN53JohCD+b1aI+FAt5d6+hm8FitzKyzXwHsTvxT+PBqhmviSpXKJzl0A0swNN7FPU7KsexFglH/MfCNF21vBz7vDolpYEiy3Ab+bvf+KkV9bex2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992035; c=relaxed/simple;
	bh=7EXeEn5Lojw/dTJtXqgpww5CPlD7bASoIZDJ/U6LtHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSLMCtlFkpf1tAIbxWhOrq6qpgYMiehee7f2skTAuJ12NYOKihCTnUSNQ+A17BC5skk8xJLovBTQmUWVZQjb4F+i5zeKjxKtYpmXdSRVIAV5HO62te148DRID7BTkcI/3BUBzhHFutTMQorSDeWfWXcDrNczfk8f8jIibdH+UY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUCOUlxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUCOUlxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE31C2BCC7
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777992035;
	bh=7EXeEn5Lojw/dTJtXqgpww5CPlD7bASoIZDJ/U6LtHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tUCOUlxmElRClTeK1JZUFqTewIeyNbZpdYT6oSjHqk1Ym38tp48mLg1u2thE1Q2b0
	 lGIvnadrnKa9F+fBWnfoXRIIlvXUUb0kI9E9XZBSWwoFRpB2cOi/yqc26c3KeMwR+i
	 WLY3tG8mUOoJmylvFI7fbLO+ySikvNXvIFSkOdG/n2Wh1AjGuzIfui2nl+lbxbc+Sd
	 uS3ALaeYd+/nSvt7mC9oNJLNpNtY9aGHcBT+cDHRTTm0mAEz4jJOip6f4v+hiEE4dr
	 rURWrKlBF0Qo1xeDs6HGDrI+5bsuqGIBdLdtTbmv56NUHrnHBLyjL4UDAAaKsu2Pp0
	 nAqPmZhD7JleQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a884ebba7dso159241e87.0
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 07:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DClJK4rNEGvX9hX2gElGD209TrIOLsaAJRTjLYaXWSK1EWNvpoG3tLTSpX8GUIivKw/cjUsV8M3LSsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHtK+3I+WHSMlaP2M2s2Zc8jELhshb2yjsvakJ4JMnCvrfm5h3
	sLQp7NmxiAmx7fasMChkxBroB8s13ZJiB8A5mmQHWI/RZG85VS8by/nlxF8gLSVGBsn3HoKhUF2
	+g+Fk2p/GSw4v20/l6QiOSch3dtvR0Yw=
X-Received: by 2002:a05:6512:3095:b0:5a8:6eb1:2b6d with SMTP id
 2adb3069b0e04-5a86eb12d46mr3679237e87.9.1777992033459; Tue, 05 May 2026
 07:40:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3070412.e9J7NaK4W3@rafael.j.wysocki> <20260505124114.87E85C2BCB9@smtp.kernel.org>
In-Reply-To: <20260505124114.87E85C2BCB9@smtp.kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 5 May 2026 16:40:21 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hcJFk-M27AEkHugqPZ-rH4td8HZnMc209kgpDFnmbs9g@mail.gmail.com>
X-Gm-Features: AVHnY4IAY3mPgiOdxOj1j9rPu27IV73cn9UoM7iMSC3vuxXzf-XchlwQ6iEP8fA
Message-ID: <CAJZ5v0hcJFk-M27AEkHugqPZ-rH4td8HZnMc209kgpDFnmbs9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal: hwmon: Register a hwmon device for each
 thermal zone
To: sashiko@lists.linux.dev
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 2:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Changing the hwmon device name and splitting aggregate devic=
es breaks userspace hwmon tools and configurations.
> --
>
> commit ef04f4845b76df7ab7442699654ee8214cc3a4ea
> Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> thermal: hwmon: Register a hwmon device for each thermal zone
>
> The current code creates one hwmon device per thermal zone type and regis=
ters
> it under the first thermal zone of that type. This commit addresses remov=
al
> issues by registering one hwmon device for each thermal zone individually=
,
> appending the zone ID to the hwmon name, and giving each its own temp1_in=
put.
>
> Link: https://lore.kernel.org/linux-pm/20260402021828.16556-1-liujia6264@=
gmail.com/
>
> > diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_=
hwmon.c
> > index 597c33c8a5550..223ae1571655b 100644
> > --- a/drivers/thermal/thermal_hwmon.c
> > +++ b/drivers/thermal/thermal_hwmon.c
>
> [ ... ]
>
> > @@ -137,54 +101,39 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_d=
evice *tz)
> >  {
> >       struct thermal_hwmon_device *hwmon;
> >       struct thermal_hwmon_temp *temp;
> > -     int new_hwmon_device =3D 1;
> >       int result;
> >
> > -     hwmon =3D thermal_hwmon_lookup_by_type(tz);
> > -     if (hwmon) {
> > -             new_hwmon_device =3D 0;
> > -             goto register_sys_interface;
> > -     }
> > -
> >       hwmon =3D kzalloc_obj(*hwmon);
> >       if (!hwmon)
> >               return -ENOMEM;
> >
> > -     INIT_LIST_HEAD(&hwmon->tz_list);
> > -     strscpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
> > -     strreplace(hwmon->type, '-', '_');
> > +     /*
> > +      * Append the thermal zone ID preceded by an underline character =
to the
> > +      * type to disambiguate the sensors command output.
> > +      */
> > +     scnprintf(hwmon->name, THERMAL_HWMON_NAME_LENGTH, "%s_%d", tz->ty=
pe, tz->id);
> > +     strreplace(hwmon->name, '-', '_');
>
> Could this change to the hwmon name attribute cause a regression for user=
space
> tools?
>
> Tools and configuration files, such as sensors.conf, typically use the na=
me
> attribute for matching devices (for example, matching acpitz-*). Appendin=
g an
> instance-specific ID to the name might prevent these configurations from
> applying correctly.

Or not.

> >       hwmon->device =3D hwmon_device_register_for_thermal(&tz->device,
> > -                                                       hwmon->type, hw=
mon);
> > +                                                       hwmon->name, hw=
mon);
> >       if (IS_ERR(hwmon->device)) {
> >               result =3D PTR_ERR(hwmon->device);
> >               goto free_mem;
> >       }
> >
> > - register_sys_interface:
> > -     temp =3D kzalloc_obj(*temp);
> > -     if (!temp) {
> > -             result =3D -ENOMEM;
> > -             goto unregister_name;
> > -     }
> > +     temp =3D &hwmon->tz_temp;
> >
> >       temp->tz =3D tz;
> > -     hwmon->count++;
> >
> > -     snprintf(temp->temp_input.name, sizeof(temp->temp_input.name),
> > -              "temp%d_input", hwmon->count);
> > -     temp->temp_input.attr.attr.name =3D temp->temp_input.name;
> > +     temp->temp_input.attr.attr.name =3D "temp1_input";
>
> Does splitting aggregate devices break existing sysfs access patterns?
>
> Previously, a single hwmon device might have contained multiple temperatu=
re
> inputs, like temp1_input and temp2_input. Since each zone now gets its ow=
n
> hwmon device with only a temp1_input, scripts or tools that explicitly re=
ad
> temp2_input from the old aggregate device path will likely fail with a mi=
ssing
> file error.

Does this happen in practice though?
