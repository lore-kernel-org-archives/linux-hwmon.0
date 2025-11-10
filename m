Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68E921019C
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Nov 2025 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762737001; cv=none; b=tshjjYmd3pQwt4KR1E+tShyf4qyV86HRcP0hSkxcevDuF8x86OKhXJJMmjAxtRcryhwhJJwGKufX2yNGVrrjdxQeVblh5LAgcNwE2Z5aGfxlq8fcpOdZOC7OcriRz3tdVbH/V9nFjnt5WHf1lUHWbbe9wOw+pFf9XTUUvcvibcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762737001; c=relaxed/simple;
	bh=7eX9gGzJac1YnRyU1DoWZcGMaFtLcH1z+haFd/emMM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnbjoCBXclf7r8kD5wAjxp4lyAo/KOrNgwfpVNciaEFOVWD1Hn7N1NQyr7w14VBBsv2FIwy3tUJ7B7DeiSBBrZkVJ5QlW3HvCaO+r5+ZTDoe4pa5O2AhQdgdFBVs1ykuGCY9cemiW4nmdVmxcbm0kQt8shQ5lCzKhlgx3690DmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nU6CpfGx; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nU6CpfGx"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-787eb2d8663so6092077b3.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Nov 2025 17:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762736998; x=1763341798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eX9gGzJac1YnRyU1DoWZcGMaFtLcH1z+haFd/emMM8=;
        b=nU6CpfGxK4RtSYk49yZMW3990JkMcS+XMUZJlO18sQKn7K/6sPy3+NGt8j08/vDxWY
         1ZMr8CCcTb0k2CyyLnJ+SptcK9oxeXS7Akvp59sA9Ig6Cqg+FE7HY7H4r57Agqw8geMk
         P1tjf4wHm/7ABUkAIlUc9+HJaIgfqtlZ6otyFs68MdgVC0SOCid8YHwoFQA5VqWdLg5Y
         BYjUeyjYTRWoo+WB3rrsA6Eg/r02LY0zNL8w8vrmxuKVjer+gmWhRM+wcMxy9WAoOvxI
         WcCUarRLf4Wwtl9aD028Gfm4wgfYc6cs4MIJXRzSR9ZsQtFzgkFZVhs8K9EeoxddmXNm
         homg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762736998; x=1763341798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7eX9gGzJac1YnRyU1DoWZcGMaFtLcH1z+haFd/emMM8=;
        b=Ynbv1vdo25GU6c9AUQH26R92ZjEIy/jLpl2yBYLGfIGTKqk7WUtyO7gEm6c6VkWZKO
         2vPM8eXTL0XIrwYxKPPMYR0JuJ8c6jXqiIFSgW/TfMs7WUaW8F+Oy38nj3D3hNTrpLnm
         qMZaXVELBGYJNdflZx84GN+Vpa9r0I8JBooK/yh8K0L7Ok/1zhIt5R5GBgS5TEncVp4H
         VwOWu3RvW1HgCqgLKU6Pz0/e1ZpU7tFc5mMCFm3NIM3O+tYxVyVeQ4Scwuc690Wh3qky
         3AlF69c9FETqouP85Uxcmfkx2hongAR/7ENu2o5wSwRfwgxEi4Ki92kMW2ibEr/cu6gL
         3Qcg==
X-Forwarded-Encrypted: i=1; AJvYcCVRjVLkHlIgNGN5cOe8Y6Vq604xn3+aSJCKdS9KA8QwVSt8wTogM5aAvJC9kDdJG9jpZnrXwGcc/DgnxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ7YZdfxoS91pnb7dtCpHcuMIZz05mqIp4qSRY5IcTEt6M2gqT
	NWsiIdhqi0Fi9A3UHaA0OvjyO34ll9N3/gBG7GEx3s3aff2czhFhTJhqjc3LAkV9gZ/QqUhgmqM
	OjIUPTnqOzhvxLWIjs7NzorUfaB9eHNc=
X-Gm-Gg: ASbGnct6tKRXPW1b+KPTM8dLRruqQpFU/BthRyfHBaWVIpIEvrcR74JHhMia1P1gKfS
	1ffU538J16uBrtuWkLWWVXwjFLaF0kGs8GR+YDZwhRWQ6aubmea7GiZYXyhfVH3GD2znLdVZEHX
	oINpFY4H9j9Rfj6GwEZ7wSysjGZo8AUD16c/azTaCV9zIuVp6XXSscS+EkJYSjJPEWGh2qhMKHu
	4RMgsDMLdi8sddb1W0Z/byp5KQ0+t+wttDi9gW1S0lOpfJILUTlJr6X5mOf4w==
X-Google-Smtp-Source: AGHT+IE7viCJpPysTxjSYtoxvz6QMOaabnGiwqTrZ7JZS/uYgctgriankWFtobObgNaQUadLOO6MvQuYngmmgmrwvx4=
X-Received: by 2002:a05:690c:f0d:b0:786:6c3b:be0e with SMTP id
 00721157ae682-787caab1d62mr79881967b3.7.1762736998559; Sun, 09 Nov 2025
 17:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926014552.1625950-1-jefflin994697@gmail.com>
 <20251106093131.2009841-1-jefflin994697@gmail.com> <aQxtjo-wl-FkUbOx@smile.fi.intel.com>
In-Reply-To: <aQxtjo-wl-FkUbOx@smile.fi.intel.com>
From: Jeff Lin <jefflin994697@gmail.com>
Date: Mon, 10 Nov 2025 09:09:47 +0800
X-Gm-Features: AWmQ_bmtnCyr53f4Zza1_7T9TDauePdOQvjG42BFkl-rnwyoUGpyddnT3ubcrew
Message-ID: <CAMdV+4ftKzSiPHWZNFqxythY_zmxNpCPA2WU6n5O8_WW1TVaOw@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/hwmon/pmbus: Add support for raa229141 in isl68137
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mariel.Tinaco@analog.com, cedricjustine.encarnacion@analog.com, 
	chiang.brian@inventec.com, grantpeltier93@gmail.com, 
	gregkh@linuxfoundation.org, jbrunet@baylibre.com, jdelvare@suse.com, 
	johnerasmusmari.geronimo@analog.com, kimseer.paller@analog.com, 
	krzysztof.kozlowski@linaro.org, leo.yang.sy0@gmail.com, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, 
	ninad@linux.ibm.com, nuno.sa@analog.com, peterz@infradead.org, 
	thorsten.blum@linux.dev, tzungbi@kernel.org, william@wkennington.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it. I resent a new email for v2.

Thank you

On Thu, Nov 6, 2025 at 5:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 06, 2025 at 05:31:31PM +0800, Jeff Lin wrote:
> > The RAA229141A is a digital dual output multiphase (X+Y =E2=89=A4 12) P=
WM
> > controller designed to be compliant with Intel VR13, VR13.HC, VR14 and
> > VR14.Cloud specifications, targeting VCORE and auxiliary rails.
> >
> > The RAA229141A supports the Intel SVID interface along with PMBus V1.3
> > specifications, making it ideal for controlling the microprocessor core=
 and
> > system rails in Intel VR13, VR13.HC, VR14 and VR14.Cloud platforms.
>
> Avoid In-Reply-to: email headers. I.o.w. start a new email thread when is=
sue a
> new version of the patch or series.
>
> (No need to resend in _this_ case, unless maintainer requests to do so.)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
