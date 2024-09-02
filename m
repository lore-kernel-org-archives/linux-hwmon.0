Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE7155A47
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Sep 2024 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263962; cv=none; b=PhYgZdAja9gH6yp9UJncpm3sJA0RLgXvvMw6CkuhuS56uS3mVXJ4x2xqkDwS1TzKMH1KTrRypyZmlZq+ubSnBdSTsbSCTbOkTCuPL5/dqomVy8AZa2cQcoN1nHLIojHQq+DqELfNubyStbOdgadoGKt687BkS2K2Kyaupl9lahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263962; c=relaxed/simple;
	bh=vhV4BVVQM6CAG7RwBEC00SZcvreLlPa1U2nyzEKmfJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTSWRuj88aAQb4k3Kty42rj8WMvr2m5wcJZogPGMajT/klrzqYmtmeso95+V8YftCKtNEka8zI45Pe4xNTvdK4tOQAJqM2Tr+mUPrIK5T4lT3gE6mHJVB2DAKAxTm0iQyA08QIL8zthkwgrnyvdX39/OstBLRuEL2AsuVeud74w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Hv7jFPoy; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Hv7jFPoy"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e1a819488e3so2609218276.3
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Sep 2024 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1725263960; x=1725868760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ven0VZ9chnd8qNKAFYNxN3g9TOzcbW3MCaO9NwDmZg4=;
        b=Hv7jFPoyFHnvRZgXMF+JyWye5ivRx4IgJn3lAAQQgsO3VV5WhIGmOBs4NzzZCorYZN
         fA8dX33Utk46+ONFfz0X2bNPsvgoVbCI+mIglyoxhPxhhdQFcIDAVQRAoL1YByjWdzda
         loG55Sf1nKbsLUn2qPq/PtUOFiMEoWz/b9A0a1J4g5qjj3qzMVKeywBdxtA09Kkb6ECG
         UKYiY5Z5oVSgvTSFiZIbgNzuJ/NRWz/UHJQhnavggq5AIC7zdHbzKjHFIBGH3Ik7myhp
         JgfIlk3njQ2gYWVsA+afHcnF1+bUcTAh52jVFtjIdpmXIjAf525tMypcHgCrSOM23r3d
         y5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263960; x=1725868760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ven0VZ9chnd8qNKAFYNxN3g9TOzcbW3MCaO9NwDmZg4=;
        b=IDBYGdaYZp2HJkxDNwdr3sDWVzd548LrfnCYN7i/bk3iMniNCAqFMaIb+eaQ6aCMMa
         QEFDK2oGQnHdDKNIRncHHiz7HlqdQBXTCDLcs5uAuwxeuTIwkpibirUcGelZP7+3fpwW
         Xux/prv2i8HLNEGSEvnEPynJZiOMgCGw/ZpgOhcxilo0219r5U/6LcTL6NnSSDq+bCZA
         UiOBxPUYlhQMEpESh9VgG8BjuN0QPLOGObjXoTCBlXbJDYbQAzgRufhao+pzLH7TxnsU
         5BG5oAHRK4BLj7hwiavY/2HJikZHu2rQW3hUjE+Kd2OTbIOfLPRV9gDpseuvhGyxpJF9
         wcYA==
X-Forwarded-Encrypted: i=1; AJvYcCUwFqSVhCCAI7+8Kkt7If28wiQaKyHlzX4SGwdAzZQ5JqHkAWFi77pDVUotNIPQFrPD7q4C0nqFmw12Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQCQUDbV+NkCfIW6eubyTYNMJeC108ILfCCM65cDHvlcJt4nEw
	JqmyEFi2NhO3YN5b8w6gJVuZGGIx13DKx45WF12Qu8DH/eMVYsQqq4uvW3UGhCR/wATIem+d8to
	qoc4/Kp2imZVN9uU3u/3uU8Nt6TRYZqUskGWKHj+RRcwZcTqE
X-Google-Smtp-Source: AGHT+IE6js/hmiiao1RBm1Y4j0GdEjZ3EfEAZOSsLehXrOho4PxrdoWGpDsumgtVPbZAIuPnkZLS88SLfYVNR/kOJCU=
X-Received: by 2002:a05:6902:70a:b0:e0e:8941:c37f with SMTP id
 3f1490d57ef6-e1a7a1a30cemr11053504276.46.1725263959910; Mon, 02 Sep 2024
 00:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717073000.786228-1-patrick.rudolph@9elements.com>
 <e83aada2-79b2-4272-ab10-4453083193cd@roeck-us.net> <bb433a53-47ac-41eb-bd21-013da93b0bb7@roeck-us.net>
In-Reply-To: <bb433a53-47ac-41eb-bd21-013da93b0bb7@roeck-us.net>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Mon, 2 Sep 2024 09:59:08 +0200
Message-ID: <CALNFmy24TreXDf+gGLmJd7h2F5Aaz1WXzw_76gWEuEo+M_GuoA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hwmon: pmbus: Implement generic bus access delay
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 1, 2024 at 3:43=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 7/17/24 07:42, Guenter Roeck wrote:
> > Patrick,
> >
> > On 7/17/24 00:29, Patrick Rudolph wrote:
> >> Some drivers, like the max15301 or zl6100, are intentionally delaying
> >> SMBus communications, to prevent transmission errors. As this is neces=
sary
> >> on additional PMBus compatible devices, implement a generic delay mech=
anism
> >> in the pmbus core.
> >>
> >> Introduces two delay settings in the pmbus_driver_info struct, one app=
lies
> >> to every SMBus transaction and the other is for write transaction only=
.
> >> Once set by the driver the SMBus traffic, using the generic pmbus acce=
ss
> >> helpers, is automatically delayed when necessary.
> >>
> >> The two settings are:
> >> access_delay:
> >>    - Unit in microseconds
> >>    - Stores the accessed timestamp after every SMBus access
> >>    - Delays when necessary before the next SMBus access
> >>
> >> write_delay:
> >>    - Unit in microseconds
> >>    - Stores the written timestamp after a write SMBus access
> >>    - Delays when necessary before the next SMBus access
> >>
> >> This allows to drop the custom delay code from the drivers and easily
> >> introduce this feature in additional pmbus drivers.
> >>
> >> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> >> ---
> >
> > Sigh (sorry, but this isn't your first patch, and you should know).
> >
> > Change log goes here.
> >
>
> Maybe I was not explicit enough, or maybe I offended you with the above.
> If so, I am sorry.
>
> Either case, I am not accepting patches or patch series without change lo=
g.
>
> Guenter
>
Hi Guenter,
Thanks for reminding me and being patient.
It's a good habit to make no exceptions when it comes to the quality
of submitted patches.

Please find my updated patch series, this time with a changelog.
Patrick
