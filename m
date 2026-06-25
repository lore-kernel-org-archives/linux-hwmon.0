Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F53E717F
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403484; cv=pass; b=TKZhv3CGhWkyBF+eAqkLdzD4pYZSZnlTGevsdNnn5/78Y1NUfP6Uauqeqs3dSc4wSaAwLZQFTwOeIm8MwVe/o1EbGZM7rLh2F2bTIniNpLHnZDdyUwJ3SLBR5OCmAgzGYuciC4wVXYgGlEwISdy8RVEXjDLGcZOWWvdjunYloJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403484; c=relaxed/simple;
	bh=OfvEi/GLRJa9YhH5tmTVYk7/tOLSNMemoAfg8QOWVrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOZXfXizIFBCpOAme3PkLBbxfK6jgEnjMcXYll9m9TIURHf7myoofyD10lAYmfzQDqgm0RyacIb61DAfHUIz/4QWd7Ehy57gtKqFSjT2WWeK1TMUTVhbQzAkNViu457Hzhy5ftd/7grPpTQsvxBNBdwarldAIBlMusLamj0NQPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBaaJfRC; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBaaJfRC"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8e066990ff9so13594556d6.0
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 09:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782403474; cv=none;
        d=google.com; s=arc-20260327;
        b=qa8vl91sO3YGtGVD8gIlfJeJl55IeWs/zasIUSvpxMugOv4BgSGxzFN2g0Jtfy5v6C
         t19LNp/mJuzzi+3KDbSzwb4/G3SGoG20wwcefuOzEefgWuCMU64HznRAt9Uk7zffDiL1
         3CEn0UgO+cJeR+J/hG9KyBo45WutGHlj3pPMmeTUZxqXDaQOPWmwudOMy+AhHMN11TAC
         I5ucmu8Li+0HUNIc17jolTBIqwvwl4gR44nlRp4/jFkVPqF56pFSmKw9Gm1N6it2TTDB
         uJG9bZqtKmhaFOuAgS0pvdnyg2ferGnBS5XV54t4P6RZ+cCh7EhaLnOHuiWmSMgpcqWT
         v/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x/16BHJYDgl6JP15s3G73M0aD/c7KtSLlOfC5o62QAo=;
        fh=MEtEky7vHTNiLIUvixIsUtBtjTxXKtzL3l5wS5rUu7c=;
        b=B8PAXgIDqGr+H4DbWf3xeBRdgN0nIVzZ+eLSPktJA/t19xbk0/BbLxtY5ZlrEo0I/G
         sm1FkgUvVNtXhJBmIFVtulUKEnI1VzpJtZsNad7BNWQDBqzuxDDWByaiN4hxvrXuAo3+
         XJ9PpQbzdVQ91PSlMH2of20EzneXTc8hSyGegiQ5pjUv4Iuhtyw0CyrtNYOpay0bnNGq
         qQ+PCvXcpSOzgiaE1M3v+Be1wI2PA8sggT0FL/LYInJwE8oj9omS6akKqB66XTf42Tdf
         Fw5CCyAbRBTsfgvnDzt94KXN673Sy21CyQg7GAJKcA90JF4ghsYthIkwcfw8MOcDlKqs
         OyTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403474; x=1783008274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/16BHJYDgl6JP15s3G73M0aD/c7KtSLlOfC5o62QAo=;
        b=JBaaJfRCKuows+Oz8pxm/TdJiAHYypncbW8V9N5+Po6PO3LYBKDkkPOqXEjYVpDIPJ
         wScWxUOPELgshbdCLAr6E2Q6Opuqqj3hUIpo6RRUWjAl5T2RuQ0Mvx60tlpWyG5Dwqdn
         HbOhISMwgaT2lIPKUBBkA/G5/ZSyyLJSQXs4REdrYp+JIWEmz28WShb+VOt+JXKiPBD8
         QsmL8tRugmTlyxQG/fkZ2P5tNd9HUntGVxzzSPBOXTp7lV/WKzbdJRhRE86a5pDmgmxO
         GTZFtJ+7Ap+B4HzjKa760asBKE4M/lvLKN0SkN6hhH5hThyQtPdEXFxNxykyWmWmr4Aq
         TCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403474; x=1783008274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x/16BHJYDgl6JP15s3G73M0aD/c7KtSLlOfC5o62QAo=;
        b=e9AgqvRLNlsL4s78tYNLO8ZxALhHFGbDkIuR8niwboEhBL/isVXbMA8CG1rlqukXxL
         bR7BBD43eNodF05/ntGDciYBUWHMMa6ZfBTeW/274u8g2L+dfd9eN2omPHX1gf2f9AeD
         rXDDfyY9vvoWq0sos7+1ZwzYFDMGGgNqwb9QT9BkEyCTohlX2zIpYiNuRNy0l8xM7RMN
         Ct8ZvrW/RTSIFnTM/AULlqmFLLGs4yzKqTZMZUAYuXIb7HkmzoqC/HNQKYZ7dmL1vJg7
         7zoqBl72yMNw8jWcpZF2jUOE6gHVGqmiLFgn7LmehOSus1cJA4r7K73CEDusruQzClsV
         U9mw==
X-Forwarded-Encrypted: i=1; AHgh+RpQtizqb41UgzWAJJG7qF2SBPKmN49kzCQg0C60CsGOUsTd8JFewuAfJeNgVysO9KWGtSIv5riPVUSiSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwflZf4Nh1nSX/YHNM6KcmhSvREVQmI+MerBbV82J8AraPLXaZb
	gcJ2RPI36jC802PtFK+WUmhZ8BgbiqeEJieP7eN4FxH6+SgYfS2DpSa2sx6LVVI0wXmf47u8Fkv
	Wzu3QdNLmOj14CgPBlcDtE+o6PwoyxgI=
X-Gm-Gg: AfdE7ckNdrh+sdwun1z1uQMU+JnIfPUezKQrmUoiv/WSC2mAByErJhy9uMQYzhHRUIE
	wneSt///TXwCYTwvJHuZXTRIntdZUQ6K0V++9JiIT7Md5CnOlyYqJRwSEoJx/4vRmY7qA2ZDXmK
	tVWiZ0o/FNA1GaaowhnNa+lIEXjyGkpqb2GFXChBiBLkyCPr7uTstthf5ifIRdL0qsGflRifEss
	ls+CKY/dKEMi/F1PHTvF+NRJalKdro7pvWd/OOz/Q+CZiLI7QBnSZ3Mj+JdBjJQdBP7asci4v4S
	So9zapEfurHzUBAC+47UhiV1NajN5PYjQIcQcGd+udKVFWMlKRB732d68jwaQRvX3es=
X-Received: by 2002:a05:6214:130d:b0:8cc:d6a6:f54d with SMTP id
 6a1803df08f44-8e6dc53bb25mr43850836d6.8.1782403473815; Thu, 25 Jun 2026
 09:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530221353.159461-1-manishbaing2789@gmail.com> <9d78023d-9a00-4bd5-839f-2a79aef4b7a8@roeck-us.net>
In-Reply-To: <9d78023d-9a00-4bd5-839f-2a79aef4b7a8@roeck-us.net>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Thu, 25 Jun 2026 21:34:21 +0530
X-Gm-Features: AVVi8CdO2ocbpBxnquW0hlKDHHMVtwatwgAo7J6Cu29lxCzRQSdkhbkVT-OesVo
Message-ID: <CAJvdc_fpMR1T-p0YWOcmFEZ+YB+LHAQtxRSgMCaDti3E0cLqGg@mail.gmail.com>
Subject: Re: [PATCH 0/7] hwmon: zero-initialization instead of memset
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, nuno.sa@analog.com, abdurrahman@nexthop.ai, 
	bartosz.golaszewski@oss.qualcomm.com, linusw@kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for catching the struct padding risk. You are completely
right=E2=80=94Patch 7 (it87.c) would trigger a KMSAN uninit-value warning d=
ue
to the kmemdup() copy in platform_device_add_data(). I will drop that
patch entirely.

I have audited the other six drivers in this series and verified that
their variables are never passed to memcmp(), kmemdup(), or hashed, so
the =3D {} initialization is perfectly safe there.

While this does not fix an active bug, the goal is to follow a cleanup
pattern  recently discussed for the IIO subsystem [1],[2]
1.Better performance: It removes the need for an extra function call.
Instead, the compiler clears the memory directly and more efficiently.
2.Safer code: It prevents accidental memory leaks that happen when
developers make a typo in the sizeof() calculation.

Would you be open to a v2 that includes just the six safe patches to
modernize these initializations?

[1] https://lore.kernel.org/all/20250611-iio-zero-init-stack-with-instead-o=
f-memset-v1-0-ebb2d0a24302@baylibre.com/
[2] https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/

Thanks for your time and guidance,

Thanks & Regards,
Manish

On Sun, Jun 7, 2026 at 9:42=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 5/30/26 15:13, Manish Baing wrote:
> > Hi all,
> >
> > This patch series cleans up memory initialization across several
> > hardware monitoring (hwmon) drivers by replacing explicit memset() call=
s
> > with empty brace initialization (=3D {}).
> >
> > Following similar cleanups in the IIO subsystem [1], this series update=
s
> > these drivers to stop using memset() for stack memory initialization.
> > As noted in those discussions [2], using empty brace initialization (=
=3D {})
> > is the preferred approach.
> >
> > Beyond simple replacements, a few drivers (nct6683, nct6775-platform, i=
t87)
> > were using memset() inside a for-loop. To fix this, the variable
> > declarationwas moved directly inside the loop and zero-initialized ther=
e.
> > This safely resets the data on every iteration and makes the code much
> > cleaner.
> >
> > Testing:
> > - Compiled all modified files using `make W=3D1` with no warnings or er=
rors.
> >
> > [1]: https://lore.kernel.org/all/20250611-iio-zero-init-stack-with-inst=
ead-of-memset-v1-0-ebb2d0a24302@baylibre.com/
> > [2]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
>
> That discussion does not fully address a problem I had seen previously,
> where {} did _not_ zero-fill all holes, causing subsequent memcmp()
> failures on affected data structures. It took a lot a lot of debugging
> to find and fix that problem. Given that, I am not inclined to accept
> this series unless someone convinces me that it fixes an actual problem
> _and_ that each and every instance of the changes is not used in a
> subsequent memcmp().
>
> Guenter
>
