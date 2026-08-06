Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC41448C405
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040807; cv=pass; b=J1WHFrjOm0ywaLZlBj3VXmH+NC/EMEsoQ4hIC0oIPlMYaBh2Heio4V1EOa1WdqJwCu4THUWzjIFQeXD9Z6B5JRiiy7z2icLhHdv0AKcswccgHQNUmrl03qbUOeh0xl6YzNtNCTUdVuAVvnb/SYrQjAm0UMyh213WbpiyicCMVKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040807; c=relaxed/simple;
	bh=RwtIdOuUBaCLbQp9+V0OEsUOReBDB80z+NUHBK0LwFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQ9XowATmDvlNETxgXeXoZ9Gxo26++Q6wsB9ACWFunoiif6t6ADJpevOBV6wVD+uPCm0Ns2ToYWwE28gJnTCrbBo4s7s0MipcsAw1QXD0die8PyK3pA5NB6WgtZk3xF2xfn/OnXYud3B+8Tgb6EBKzQb+0aCJujhJmV94wyQO/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l40JZ2zQ; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l40JZ2zQ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2aab18795so2871227e87.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 11:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786040804; cv=none;
        d=google.com; s=arc-20260327;
        b=OS2N8Ege9dgJ6QBbiITPmZTspcuQa3jbk3YTuT8BfCzzcEj/TiC4z3j5J8g+XvB3ds
         1gvA1zzpEXZaShjClVREo2bmbrEo7exB8AsqR6cQHIoPzGJINllH+Pq40N3Iu6Ubo4so
         gmdDTxkkgVKVOE2Eq2Tn/XBcxJDIxx0dPFfqLZz6TFN7A0GZo8LVOX7rf6V6PJroUEMJ
         483Y1PsvU2ZC3Xp0CT3Q76mc9A2cdSFTChH08kD5u+Qt5bQdmBldRY++vfmSbdxu2/lc
         pby8xZAthmDvVpaFUhnfWhJn1uMiwCkV6R5U27e3Natc40SFxFG5Z8DJgmTm9bzvNl7z
         w1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwtIdOuUBaCLbQp9+V0OEsUOReBDB80z+NUHBK0LwFQ=;
        fh=CYivIBgjGAqw3cCgPfJocv+X0RZ0Sx5wRwK1mP87MoA=;
        b=BCrOs8p/B9y36STdZy6csoNXrZs2pK60ftylWotRla7nCe0XASHUyyrhqbUGfpZ/n3
         WcGH0qPjrKBGIsAKaJ5kypxxD8uqg5vMGoSWqW+NVgVZ/NWE4SLgX/3yuPKrzP2z7xIL
         tvUJtCk8ckU32ids+0pinzr+Ve/8DWjynpXmKht5bsqeZaQbZcTpSCRuf21ngOpeDVOi
         R4PSePZrU22vHz+vMJf4ztqivOg8G51BY7d3Qv+8RvB406Pa4Z0SXcwuWgJP8/i3TolC
         oiSkHvd0pROlLHBakuu3ueAHoVXQIOWvP+u1vnbwjfZ9jCG+bqp400mURlnwv1Qz8fpI
         phgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040804; x=1786645604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RwtIdOuUBaCLbQp9+V0OEsUOReBDB80z+NUHBK0LwFQ=;
        b=l40JZ2zQMxAfa2NEDfgeSL+xvomqaiYwQo1FLPSMTW73//JpPKD9LAnOo8KvTvlrI5
         Jft4IgfwlNMWiS+RT3ocSKDxWvR4UmyzkW17kuuKlTA3lSujgaKGWRZU1grr3COu55py
         kLcmPkJvvqr0BMktCItmTKEQ6M1CqQnmGZ9Zy9ka3x7obPHuNcAhetCWKPBXc3mJPENK
         rQP26DlUmIBWXl/9WqyNyi58c3tzWGnGv6xJhk6kgG1z6qVSfm4ci9iRO6R5x6DbIDQz
         Vc8tnd3kHJobDAiE6Rog5isG8eSU4xHD6HnpiDS6m9dNfO3tm5p/hC9oFK+ZgZO8glls
         AJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040804; x=1786645604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwtIdOuUBaCLbQp9+V0OEsUOReBDB80z+NUHBK0LwFQ=;
        b=kZfucyccZ6QgyGto2SnGWyUz1bYpKw1q3kVXa8C8vbTXV+VVXuBCRsfX/BZBhcgJov
         qZh1vR6RaLECr7JryrylYnvQ5MFE4fkZnquSf7bpPOU/ZumMaLgbD/jU/NYiGNrO1LPE
         ozhkkOi+20lOmix313mRxMXf8/UyFZcTRDh65bYrjAlJ+PmWuOSwkZsa8CWUTWVoEQHe
         gfSNbp8CHQ4eJ6SCKf9N32uOa9ISo+HePWZi2lyaqbh0Y3W8nju2d73uVwS7pWR1OshD
         40yRnAcnQM/KWv5S4lTqUhxiJVyBRzfSQUKyJnm940bZKnxatNdhlmXkqmELWxAyKsWw
         Kfbg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2r5AnFHdJxWzsmEmi5YkLl8bwo6O/i2O2x7iEVubqCU1MH8CqWb1bdzjcOWfmdy+F2dRoe+julXNRhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxidpcZCgPByEGhyNaWKros+9wVweIHqnTOzfq3UFm80d1CBgpc
	V+ZbNcFyMmZOhC8HwTAWt4dZcFTRrat6alLddTj8YNSfEa5AMGZaBAKuAV+eYbvXC1rXFNWCWCy
	ez4VhTIJUhWjZ9UpQ8cQhg5HVMKc8pZyBINeINVbPIA==
X-Gm-Gg: AR+sD13DZrwgz79Ct0BQMc5CisWYkqE2LdqtSwsAXl6g7lcWTtxJZEb5qWUt9uWhRVc
	A9dXeAo1ZrfZ7UkCLwGI3H+QCZjmymSowcWJhi+0VxIoX+ljHGqjwoPDVrBANs/UqaB7miJKW8x
	tg251NrQMeTdev2Nz32tZEu3cDm6qMWwkIeeE07g3Is5bAZngEQLvAHSQ64A/SRYzcYIF1PSCS3
	V9b+eA/G/3krnaA1P7h+I6YGQZG5JQhgBLpB3QdhrYFK7YCnd4JhLULqRoqgvVVLTfIwGGQGL0N
	8gHTKTkLxQpr8DTQFim10pcuj2zC3zeXG3iPfAs+HXY=
X-Received: by 2002:ac2:4c54:0:b0:5b0:1c19:2cf4 with SMTP id
 2adb3069b0e04-5b2f4cbc49bmr2719269e87.35.1786040803637; Thu, 06 Aug 2026
 11:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806131103.19104-1-sergiomelas@gmail.com> <20260806132452.80AD21F000E9@smtp.kernel.org>
 <f96884d5-7bb2-4646-9175-1b385789690b@roeck-us.net>
In-Reply-To: <f96884d5-7bb2-4646-9175-1b385789690b@roeck-us.net>
From: Sergio Melas <sergiomelas@gmail.com>
Date: Thu, 6 Aug 2026 20:26:31 +0200
X-Gm-Features: AUfX_mx-u_wo333Zy7slPKJ7tpKhzwjBKajkQbrD2yunv4MLMrsk0dweIG6YptA
Message-ID: <CAP8e=sJbD21FyeU+9w_CVGLOXhxdWmsCwcrS5uNB0Z+9qQ4gLQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Confirming that at my knowledge this is a non-issue.
However, using the 4-letter machine type code DMI_PRODUCT_NAME could
theoretically
offer even tighter precision, but up to now, the current matching
method has never failed in our
testing and field deployment users of my github:
https://github.com/sergiomelas/lenovo-linux-drivers/tree/main

Anyway, I am compiling a full database for complete data of Lenovo
machines from PSREF:
https://psref.lenovo.com/
For reference, the complete mapping matrix and DSDT traces can be
found in the Yogafan Master Quirk Database.
My database on based on this source and others is here:
https://github.com/sergiomelas/lenovo-linux-drivers/blob/main/Lenovo_Driver=
s/Prototype/PSREF/yogafan_v3_quirks_database.ods
and
https://github.com/sergiomelas/lenovo-linux-drivers/tree/main/Lenovo_Driver=
s/Prototype/DSDT

I propose to switch to this identification method when we have more
machine references.
What do yo think?

Thanks, Sergio



On Thu, Aug 6, 2026 at 5:44=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> Sergio,
>
> On 8/6/26 06:24, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Specific Lenovo model DMI quirks incorrectly use `DMI_PRODUCT_=
FAMILY` for exact model string matching, causing all specific quirks to fai=
l and fall back to incorrect generic profiles.
> > --
>
> Please confirm that this is a non-issue.
>
> Thanks,
> Guenter
>
