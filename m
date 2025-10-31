Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9D3226D16
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 02:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761876120; cv=none; b=YHfmI+UKrsObPd2M3jFP3cFEGo84YnK+yeA3FTpHZ8ffKYnnL/AAw7T/7znjgwhPGF8pBvJRj3dA3ETqiaiYVpfhddLufaoLdSXkx6rW5trBP2zsiyAGknJPkNsHFQlbxJTBjzlpDKRU8XZjM8TsivHB8Jh+qWvZMLcPhQqAG/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761876120; c=relaxed/simple;
	bh=QxME3CqoU5WVypaxjbRMFvY4qYl0FMCkvisldLZvurc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEONvhOkn6FWA32J7lQATNWDsqH302C9h2rRbF8zbjipHZqvZ4obzDvx4ZrLab8SzsEsxAWF3rc2V4OAcYswQ8fbHm+sgT+rK/aFT36uoIECAq94Trt8xcB2VMk4+rXimyS66nLUEfsRMZk6a3TruIpiu17Va0aGj+wwQr0g17c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXuLjibj; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXuLjibj"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-87fbc6d98a9so14341596d6.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Oct 2025 19:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761876118; x=1762480918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrwdlpMXd2MUVO5Sx6kwMpVdymgf6ZjyIPGHeQY6juA=;
        b=KXuLjibjv7vh+KtJDlSyr6wSmrXFpA77lpvuQ56z2ocaML4Y0/YSBURtWvBI5PVEs4
         f1GfHu6ul0rfKODN25s97vIoU/x3qI0wlNNGyBFQf0GfnLKHYIA9G5xiW9k4q8jWG8Ke
         CsvxrM0Z/j1ALCltavdlYRmT+AjQKQhzSnD2CtbXK2aP08LbXDFt2cWhgZN9T+NLFgoB
         In0JqAyuHGSECRcEgh3GeWDsXF6pTuzHNoQE7iCwltt77GhuBlSK0P9Q1O5NUGtXfumF
         22gukVHey7DCGA+X9kXu2yQDuVkxWz9wzf5KIt3NFA726gg52bu30cLOFNzFqCtd11MR
         +tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761876118; x=1762480918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrwdlpMXd2MUVO5Sx6kwMpVdymgf6ZjyIPGHeQY6juA=;
        b=LphuowUTBsZiqCjz4HBJUFylym0j53XHRvUwLSRfkqArTcaaM8P2JZc5AB7ilGROUD
         +KmMSYZ8UIRF5O/EbFDOKe2pZkrsYIAcKbC8CQ1T/++sMJ9X+E/+0qm/z6oOs3HuLlKv
         vYyfJUhnBSUwigMyABgivlQJAr1QnAQPA0hCHWpEn4GFfGij8Fc6uTpNitJHj7f/xYvH
         vTLtWJUYgz9onrZ0rnY91fjd0j/2LjjzTob+gpyLKw5F3n5rJ3UjFvxXwb1c+11Zhcjo
         G5937hI8JZia7M/SGZ5rZRolkV7zLxWVn1jnW6YLpRjtqm1RBJMQIBqOdA66C0LuX4op
         mrxg==
X-Forwarded-Encrypted: i=1; AJvYcCUzDh304jn1HUbzJh04Ior3l3Uom0yQMkqae33if0vPL7uuAWuTPHlE7/MuRgOQU+3f3R8qV15MuxHwLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6Yf6NPQnYuqJzB/hZLR9Oiyjjl/9jETuO6F5nKLvB8jObUmg
	D7rSnL+RZqj/F9ibGlSXjVmaOV7Qqvvcw901Zm7Vt9895EG3afAxb8Y+Oe3Qc7jenqb3OGiD1tw
	NzQEkaQKBSBsemPr6NAaWDdi4gk3LFSBHfHPtM7Y=
X-Gm-Gg: ASbGncs84WeEQVzO77tyRGYdPsWWUnWlTFtWaU4GJBv3GXBeOIYTXPAmZ/NN6aW9onw
	oyrTgYvWkAb1aRMtV+aY/F5AkFxKiF0HQWw3ZqnCQCa0h8OP6adAIjZWSzuoiuJD7zZCcfsdJ2e
	n8MeniAlOu2fd38TJ6Zmaw2aHkBL10XpWKdG2DGXm9BlKDINtmI0Gnu/0G7Q1PumlZwU9AzC8VT
	Ed8YjfjtBHHPHnV8kWR0zxhDnZmul6bXLjvUo6KCMdJ6i6qupTjpT5fa17oO3SzFswxn42z
X-Google-Smtp-Source: AGHT+IFJXhBSLQEH3y/DpMWVvZaDN5VWPuxyaonyI4/RyEd4qmQGvExMvoVpZMKSHMrsXISgP0ElpwpVoL3Zh9xbpfs=
X-Received: by 2002:a05:6214:cc1:b0:87c:21ce:3868 with SMTP id
 6a1803df08f44-8802f45155emr25798186d6.34.1761876117654; Thu, 30 Oct 2025
 19:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030193955.107148-1-i@rong.moe>
In-Reply-To: <20251030193955.107148-1-i@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 30 Oct 2025 19:01:46 -0700
X-Gm-Features: AWmQ_bmH4-J_1lzYI7OXn4HTKFQqpbq6h2nRa8vejurreeSBQ5FnhakNMwJ9y74
Message-ID: <CAFqHKTk7n+aiEgRtGHNZn9gb00rviH7GhVPdh2Cwb4vTQK8Zwg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] platform/x86: lenovo-wmi-{capdata,other}: Add
 HWMON for fan speed
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 12:40=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Lenovo WMI Other Mode interface also supports querying or setting fan
> speed RPM. This capability is decribed by LENOVO_CAPABILITY_DATA_00.
> Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
> cooling fans, including minimum and maximum fan speed RPM.
>
> This patchset turns lenovo-wmi-capdata01 into a unified driver (now
> named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
> LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
>
>  - fanX_enable: enable/disable the fan (tunable)
>  - fanX_input: current RPM
>  - fanX_max: maximum RPM
>  - fanX_min: minimum RPM
>  - fanX_target: target RPM (tunable)
>
> This implementation doesn't require all capability data to be available,
> and is capable to expose interfaces accordingly:
>
>  - Having LENOVO_CAPABILITY_DATA_00: exposes fanX_{enable,input,target}
>  - Having LENOVO_CAPABILITY_DATA_01: exposes firmware_attributes
>  - Having LENOVO_FAN_TEST_DATA: exposes fanX_{max,min}
>
> Changes in v2:
> - Add a workaround for ACPI methods that return a 4B buffer for u32
>   (thanks Armin Wolf)
> - Fix function documentation (thanks kernel test bot)
> - Reword documentation (thanks Derek J. Clark)
> - Squash min/max reporting patch into the initial HWMON one (ditto)
> - Query 0x04050000 for interface availability (ditto)
>   - New parameter "expose_all_fans" to skip this check
> - Enforce min/max RPM constraint on set (ditto)
>   - New parameter "relax_fan_constraint" to disable this behavior
>   - Drop parameter "ignore_fan_cap", superseded by the next one
>   - New parameter "expose_all_fans" to expose fans w/o such data
> - Assume auto mode on probe (ditto)
> - Do not register HWMON device if no fan can be exposed
> - fanX_target: Return -EBUSY instead of raw target value when fan stops
> - Link to v1: https://lore.kernel.org/r/20251019210450.88830-1-i@rong.moe=
/
>
> Rong Zhang (6):
>   platform/x86: lenovo-wmi-helpers: convert returned 4B buffer into u32
>   platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
>   platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
>     Data
>   platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
>   platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
>   platform/x86: lenovo-wmi-other: Add HWMON for fan speed RPM
>
>  .../wmi/devices/lenovo-wmi-other.rst          |  43 +-
>  drivers/platform/x86/lenovo/Kconfig           |   5 +-
>  drivers/platform/x86/lenovo/Makefile          |   2 +-
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 545 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  46 ++
>  drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 ----------
>  drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
>  drivers/platform/x86/lenovo/wmi-helpers.c     |  21 +-
>  drivers/platform/x86/lenovo/wmi-other.c       | 501 +++++++++++++++-
>  9 files changed, 1134 insertions(+), 356 deletions(-)
>  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
>  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
>
>
> base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
> --
> 2.51.0
>

Rong,

Excellent addition. Thank you for your work. I have no regressions on
my devices and no longer have erroneous fans reported on my system
with v2.

For the series,
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>

Thanks,
Derek
