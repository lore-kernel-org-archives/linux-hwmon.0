Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52E33345E
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764352804; cv=none; b=RhmGy+rkV3CW2lf2PinZjH2QmeiyfWpg5B7dLWPLxI8++XWnvHmBQDxO/V8Kea+V3a90Kue1iUR26ib/Tzv8jo2/8+/Z73kfrttgJSv6S/s+rAcPOc4wXq6XKCmiffHpYpcreUxmJB2WqZJDDCRn0wbtLFDnUSSw4qSd3qAkirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764352804; c=relaxed/simple;
	bh=ECUXSR4U96orJixpkWssmGfOVBqVIhjeWDFsBnEHe70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cI54wPREjGmZqlPdCcEuRoJ74v7ZHDb8su+rQhDXPU45bzGaQZBWDtdYKI9VoZWbUZDoux58oLvWxWOLd/lz8If20eL+b9zswRdhXXjFys1Sdh5nEnHM1wt7xjN1jCqhpquo8mKDVZNKV4nojfLdkY/1dOAqFUBnh0eEZjr9mNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7vqab36; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7vqab36"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3ec46e3c65bso1728694fac.0
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 10:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764352802; x=1764957602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from:sender
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECUXSR4U96orJixpkWssmGfOVBqVIhjeWDFsBnEHe70=;
        b=R7vqab36kFJQV9EWoa+e0klNq7eU5zb5SwnCd6fDMnUE3NSAFyPrcsLG/6YyjBOv1v
         UQ0akpM8wIrNFOFJKBDPk874g5HviPcw7SZSqY+ZA85En70mFyAsN/nYgYqBCpd+X+r3
         ZAo1DxTbH94Pwvyswq0i4CFfSj0fDkzmkbpipSkDv54Xtw3kO1YzMbFHDXCLpQMdgNdm
         CQplOREhuBmYM3lV+zb+9l5BHgTleQfJX9Go4D5wQhlL77Jm1M62rcpIq1W7ge+Ta9Tn
         KlbJ2FNoFzluJaxPNDXRHTefn8R9H6Genf8GHOWaqFJvcRrJ8CFEuy9UIvVmEQ/j1YmC
         A0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764352802; x=1764957602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :x-google-sender-delegation:sender:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECUXSR4U96orJixpkWssmGfOVBqVIhjeWDFsBnEHe70=;
        b=viBw5oYWLeAAXkV0GENVczaypNDYHwZLpoLi2J0sMsWBg+PKGIMwO32UWngKPwgDiV
         jvtV+tWiYp9DmvOtB79ptjKNKH1HofZZRF3neGWJui6iPHXbJtJS7Eu3mIUouyXxK22a
         aMss5YsJgGnelnUud+gzhYWchx0BfMDTzsYsVja6CsI0YXc8cjifvKh2JduAyj9JdxGT
         xfEGJ1BNw1kXpNh1gX53dN2GR2egLfWu3eLeXqgpC12/KLKo6ewkYuGsaxFMEX58uaFh
         s1BD3Ff7YVilzJUlOO8UWpKyc3Z9q1N0z5nUBI4rcp9DBXU8iJ+XINAY3XSkE1xsJ0Rt
         lNQg==
X-Gm-Message-State: AOJu0YyJf8EM0uI6x/p/HJkY9Eg51ncqq/Zwvc57hXi1B32uMy7r4i2a
	SyWixoqcdnhXs6T3alfUOi4BqJCBd7qYMWlws1MrRzSWlO7XJBBHK8xVUDMPY6c3OqIP13gMuWY
	+AcuDhF72IKo+2tJcAVCOmRKPrRfFSrg=
X-Gm-Gg: ASbGncuPUJVkwEabQx8v2BrpwzKskp4ylgN/gX55ggvbT4GYn99blF/mS+QFeovwqmq
	BkUMlnTKO0abihv1D0jr8RFofkNTpDqAwnAvhDijPXaZtszwL0rGaMT7RTeXYefkuChVb7iVcqu
	/YhnhQIQveL7DpKDU9VUc9/0Ba8sE+9GUKw5uiUR/3y5dFwdRUUCDTEabRywZ9M8WT1KjA817GM
	Aty3COQjTsp4oxbTRmAWKOM0UVtVdI5ydtZOlMw0N4AOULJQf7V+DzkOhJ6JT/1Vu+NnVQqvkOm
	CCs=
X-Google-Smtp-Source: AGHT+IGwQdWkwD3oLqoEjcg38f4Ne9W3YQFdwdBnTRDIOapB6SkiW3MAoWautq5VTQ/9khFBGQUsvoAEjStwjacGWvY=
X-Received: by 2002:a05:6808:1b2c:b0:44f:e211:856e with SMTP id
 5614622812f47-45115b8889fmr11673023b6e.50.1764352801286; Fri, 28 Nov 2025
 10:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128124351.3778-1-hanguidong02@gmail.com> <f5a0e99d-306a-4367-8283-b5790a74dfcb@roeck-us.net>
In-Reply-To: <f5a0e99d-306a-4367-8283-b5790a74dfcb@roeck-us.net>
Sender: 2045gemini@gmail.com
X-Google-Sender-Delegation: 2045gemini@gmail.com
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Sat, 29 Nov 2025 01:59:51 +0800
X-Google-Sender-Auth: p50osYshLPhQwT0JjSmXxGP18EU
X-Gm-Features: AWmQ_bmBarVYMquAekr27ZrtklPwTLh9JPE_EWhAWm3IyhQmO6wdSHTyPZngemE
Message-ID: <CALbr=LbzgLK7Y-e3TTpusXGZEq4+DJJ=mbVMP=M3gt6XDGNUGA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (max6620) Add locking to avoid TOCTOU
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 12:34=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Fri, Nov 28, 2025 at 08:43:51PM +0800, Gui-Dong Han wrote:
> > The function max6620_read checks shared data (tach and target) for zero
> > before passing it to max6620_fan_tach_to_rpm, which uses it as a diviso=
r.
> > These accesses are currently lockless. If the data changes to zero
> > between the check and the division, it causes a divide-by-zero error.
> >
> > Explicitly acquire the update lock around these checks and calculations
> > to ensure the data remains stable, preventing Time-of-Check to
> > Time-of-Use (TOCTOU) race conditions.
> >
> > This change also aligns the locking behavior with the hwmon_fan_alarm
> > case, which already uses the update lock.
> >
> > Link: https://lore.kernel.org/all/CALbr=3DLYJ_ehtp53HXEVkSpYoub+XYSTU8R=
g=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/
> > Fixes: e8ac01e5db32 ("hwmon: Add Maxim MAX6620 hardware monitoring driv=
er")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> > ---
> > Based on the discussion in the link, I will submit a series of patches =
to
> > address TOCTOU issues in the hwmon subsystem by converting macros to
> > functions or adjusting locking where appropriate.
>
> This patch is not necessary. The driver registers with the hwmon subsyste=
m
> using devm_hwmon_device_register_with_info(). That means the hwmon subsys=
tem
> handles the necessary locking. On top of that, removing the existing driv=
er
> internal locking code is queued for v6.19.

Hi Guenter,

Thanks for the information. I missed the new hwmon subsystem locking
implementation earlier as it wasn't present in v6.17.9. I have since
studied the code in v6.18-rc, and it looks like an excellent
improvement. I will focus exclusively on drivers not using
devm_hwmon_device_register_with_info() going forward.

In our previous discussion, you also suggested adding a note to
submitting-patches.rst about "avoiding calculations in macros" to
explicitly explain the risk of race conditions. Is this something you
would still like to see added? If so, I would be happy to prepare a
patch.

Best regards,
Gui-Dong Han
