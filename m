Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA235F18F
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543022; cv=pass; b=R52fN085kZGRjXCnriaJd63Tm/wOuoExG/YuZSq9opX9KM3kbBIL2sg+/n9T43yfAmU91JabyN7mxDYD3m047sTzvz7p5wcU9tJL3c6ypdA48smTGSecb+B+cntAw3KKbVAAdEEl65eKeL7eNunSroBA5v/mjt6lL1d/xTjapWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543022; c=relaxed/simple;
	bh=bdXuAHR+W7DcDsgTssbNNylZwjKna61a4d2JwD1CRZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FySihXVLRy7et5AV0+lHG6R1BRjzdfgfmW/hmsuv2aZ6CF8scGOjqVs3Py6cD3J0ZGPs7sPTVKUudrvfgOnClmj19s1lXG19hwpSqdH7oOP2R4o9iKgrJV8T+OaemogacYVsLZOgJSxbTnV6bq2f76Vh/PSzrDhuAkh503E7f0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDMK0bJ4; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDMK0bJ4"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-415c8a4d2e6so279645fac.0
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 05:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772543020; cv=none;
        d=google.com; s=arc-20240605;
        b=X+VRF0RSKQjN0sBZY0wuFhpEUG3BNTGV39qzWGZ9RyE/ku8vq4c+B53fP6PphPuQ8Y
         rmXsASuweTpzaSiwM7tc5RqF6RsgbPzXdp2EbmNp+uEYEYfxAyhIy/kx8LkoVYTrsDhr
         C1a9e1a9GGBNMaBWRKThF8hbpmnsENpQf88Qw6CMBGFuy5sqwmxkkHb2mkZr+hNVG3WF
         xt7Au7SXWpz5kQ/jdjRr25ELV28pSpPSfAVse668DRW0JcNavygCCnU0mTNw6IHMHWvR
         KNNFSEBdudZoIISt8RKan6GhfyQVCYV/HOipFDbuYoQzsNS/9XbxUOteOB1Fo6Se1t5a
         z5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        fh=Zj2eziUE2IvvhH0VLixiIn0VfIcrdYmsMpLN6t0ov5g=;
        b=eS1IvLcmcfJgEQqcRY7AvQfsWi+Ng7QfdGRmU725whR9fve1yxeSlbTbIy5Sq9o+pF
         i3ZiQe11faot13UEwdLDynHDxy6JI52Tt0EXt4VIfkCeWAQz+YLCVqZofT3BkZpNaRSR
         d+KZBkMWrfUk2tIXtkMeDrAkCjq4/acuBYvE+AseGmRf+3Gj5GJA1pBKlQBNK5GQAbLI
         n4ZLXoczvJB4BG/ZZY8aJQvLYnSv1rbqe2STgDiT3M864QHc7cITuH6U19m/UIkrS14n
         8RxJ3RvJ2MT38oMpqvgQ6U7ym3w1DxzX2myVmdGrariyO2ZAQoH+q/9Bu/aUgFohLeKr
         FAfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772543020; x=1773147820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        b=DDMK0bJ4IhW4O3tUQ4nA/+xOWBNE1ioav5S5FzY/jWWS5ycjtIgAgkIi4kPzz11Ok+
         DtzkXfRNkhHvWk17RCat+vgv2bB5mJcYVCpFjRBI/PZ26+Tux4DDBil+6Zf5d3lpANFi
         imdIaCvG2cyPDsA66GhBqSFV2N7j1WUiofwtKgHRgQ0ixk4UNrXTXNKDHAVFzL69YXNF
         nVDDuukaz/P9yXu5fDmLv4WqpbwUIYuu372t+XDv/mLcNfXyDNeLOf+FhBSkZcNek7OM
         xptcjevbZjCZULwZoxhX6vVUgssJ66px6HcK6LgdBwiZfG8r8hzg00gwrvSJMGKgRzdb
         vKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543020; x=1773147820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        b=q0MYw7wneXn2VDn1gF7jzWVqaLxIw2adlbN7bRIjNZRjYcu/XxNNibHV/L8+dQn2fD
         JWlQKJmKXpb/ztPsGvLFB5TfUKd6ZgGLMXftp9Pz7+71rQp7n7mX114EkIflG8jYHSW4
         aWGNveDtGsa+4s0HQbwSE3YV8aCyAoZGs97b/qbQoCaLIMDzNRFXDmbadB8d5wzbDLaB
         vY3Q9mLvsHvhu279r+wLBvLNLvxvt6waMK3p64FXiLFQm5+Xi8nsemdTSxHp8m1aicJ6
         oeNV4SWOI9dDvIlow8kZvsVyfS1Vn1Vx8LwhRb9IbRt9tIJ9i6ClhrzBBseozPieYCKV
         vV+A==
X-Forwarded-Encrypted: i=1; AJvYcCVYlhoiMU2de1GKcqCJTCfLJRoHrU5FyLvpvzNwN9W5gYdFC0lgL6NJeCO8DEqAZuiIfNGi8WTATalSTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd18I4V5VHiZt3dywbY6dUGoTlhqP05slTttTOsp8M+GPCy13R
	T9ngBcOPh2K6gGauhKux4DWXlhASKVw1nPhF2b5Ult15haccZQMDrv+4a+Kerop1dtyaeqWG8Lu
	Swyvq+y3zP0wgOHyZKXgDmAuD0EFL7L4=
X-Gm-Gg: ATEYQzzAqGZGkowOfGMiUXl89E5UY7EYVcTojgXh4HrUeZpSDzP4UZib2HBOdRvkJRy
	hJDNl2zpr8mg+TZrSRgUt5I7dZIO7R9/RSm7zwmwMOw2Wp2xNTaF8HfTIbaypig2kjUNKAxeqag
	Tin3tIH3FC/N2HoGNnhJbVS5IkYjgWZJ8sQCbBV0zafJ5xbiHOOvZgWHxJLKLPfMMfPa0HUoEI4
	u3frIFffnX4hhhB9xiqmfVdvDZEm8ohRS7CT6Y9QBN9aBr2k6UgGcFgcCR4vq66JhVvHzYaoLqi
	awT+XTlbkbvOWdvQQCpoos5gwpBOOICGn0vuXpT6cZcQhX0k0vhvpNoJT4iItztFYf4qMcdYVA=
	=
X-Received: by 2002:a05:6871:7383:b0:3e8:9e7b:4ea4 with SMTP id
 586e51a60fabf-41626e21440mr7566575fac.6.1772543019367; Tue, 03 Mar 2026
 05:03:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 3 Mar 2026 21:03:28 +0800
X-Gm-Features: AaiRm51hHETXLy5xgoyPjMD6CQcJQj3Ex8YjBm7PX7a5CmSkvNYD_5jZKUYKtjs
Message-ID: <CALbr=LaQoV0L2dxiHKvoP2weZNWEXXG434ir8k-Ej=ouBiEWHg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 7:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that duplicat=
e the
> driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate lo=
ck,
> solving this in the driver-core generically results in less (and cleaner)
> changes overall.
>
> Thus, move driver_override to struct device, provide corresponding access=
ors for
> busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(), device_has_driver_overri=
de(),
> device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(=
), to
> declare the corresponding sysfs store() and show() callbacks.

Hi Danilo,

Thanks for the v2. The code looks good and the bus_type approach is
much cleaner.

Just a minor note on the commit messages for the cover letter and
patch 1: they still mention adding the DEVICE_ATTR_DRIVER_OVERRIDE()
helper, even though it was correctly dropped in this version.

Thanks.

>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> This patch series includes the migration of the platform bus; patches for=
 all
> other affected busses still need to be extracted as a follow-up of the WI=
P
> treewide patch in [3].
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> [2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel=
.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override
>
> Changes in v2:
>   - Drop DEVICE_ATTR_DRIVER_OVERRIDE() and make driver_override a
>     struct bus_type feature instead.
>   - Add driver_override documentation in .../driver-model/binding.rst.
>   - Move kfree(dev->driver_override.name) before release().
>   - hwmon: axi-fan: Use NULL instead of dev_name() in
>     devm_request_threaded_irq().
>
> Danilo Krummrich (4):
>   driver core: generalize driver_override in struct device
>   docs: driver-model: document driver_override
>   hwmon: axi-fan: don't use driver_override as IRQ name
>   driver core: platform: use generic driver_override infrastructure
>
>  .../driver-api/driver-model/binding.rst       | 48 +++++++++++++++
>  arch/sh/drivers/platform_early.c              |  6 +-
>  drivers/base/bus.c                            | 43 ++++++++++++-
>  drivers/base/core.c                           |  2 +
>  drivers/base/dd.c                             | 60 +++++++++++++++++++
>  drivers/base/platform.c                       | 37 ++----------
>  drivers/bus/simple-pm-bus.c                   |  4 +-
>  drivers/clk/imx/clk-scu.c                     |  3 +-
>  drivers/hwmon/axi-fan-control.c               |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c               |  6 +-
>  include/linux/device.h                        | 54 +++++++++++++++++
>  include/linux/device/bus.h                    |  4 ++
>  include/linux/platform_device.h               |  5 --
>  sound/soc/samsung/i2s.c                       |  6 +-
>  14 files changed, 228 insertions(+), 52 deletions(-)
>
>
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> --
> 2.53.0
>
