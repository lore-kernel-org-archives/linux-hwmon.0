Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8009B36F419
	for <linux-hwmon@vger.kernel.org>; Fri,  8 May 2026 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265669; cv=none; b=JBSfk0SeH28VVzVYMZN6DaE8d5GYKc58y8ZzKmPdsQ1ZJ6hWeVBMrLm/HPsLZUHWAsEWDcGiDw0puYKlyOFwL6SGrbQgrKzYWDzjnnWu0UJREEANZwgD6gOZL8i7GCkvdXMGaXKZOPaLaAJuluJl5iOLy7VZiTdacFCO/wtmj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265669; c=relaxed/simple;
	bh=EZaiKQ2Igewejr/mBgC2O2msXgfzgRjupf+kA1bz7Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqIJBSJhUBiOZtfqSOlbUavtmkt30rMmcrS0tiTuhvEwO+tcrvn0iRS7ja+xIdb9G5e6wxaKrHJXieRUL/vZProWo63jW0kgCemeRieA0UDm8x9jHhCtK+bauoKDtfkwrpizaEezxA4SqLwbLVgVaa1z4CZNKbWAdnkMZhRXQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAj8T0m8; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAj8T0m8"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so6130242eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 08 May 2026 11:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778265667; x=1778870467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNHFxOPKssTiIkdcxNpnCuXp2DqdPiAAb46D1S13Dew=;
        b=QAj8T0m8errkfGu54SnXxEgn403EgURbX3giHC7Da77qJHu2N1u0wYWJh1ZIMCkG70
         JC7mn7z+dx0qp3a1FYnDCPPEitp08BLyakogoAuHh90i7FA+pkKaeFPTndmXA8EwNyB4
         QZx3nL7yZKXfydcfV//ILY2maQlTMmcHxOXKtwFd+2Btln9y4vZnQITMuAXO4iRsOHiE
         Qt1Q0Ftk6l+fDXGX2jKQmj+oqCVppw40OeU6oL91e5d6oU4AlebjMrudqq5n1MoJIUlz
         gBv2mLxnTOzaSfVWaYfa5KyDuD8WZzwcaRELhgutnX9p51O/pafLgmLeYAM1zBMQS3aq
         Vifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778265667; x=1778870467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNHFxOPKssTiIkdcxNpnCuXp2DqdPiAAb46D1S13Dew=;
        b=r/oayjzN/YIWzJ21qOMA0kNmpVpYK18hg/6q0YSq4Hy+rSQTq/XPwLvOETSWQkfynS
         aT+EfzpUFBnh/a4cruIVNwUYVsvd2GBKo4ClFh8C3kb1fzbd/d+LRObSjo5WDd5acP9T
         GANzPtS/RoNBbzpjUuIgMTpyyT7j+S2JP+lqI2x9GL0zLoMu1GmJVhFDvCFQJoOUjWCu
         X6yxZwoeUME54kAHVtCbd8JWJY3fyqqDN5lyGQiZvcWFex59C7HIwNubMxRfVLx7SFGV
         zZIUk+V0iJz+dzfdoYyfw5XwP0VrR8UTcMGIpSqUYFWID5Rh/4/whVQiwYyEasNYhPZt
         R4QQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+AFZvzTlV1uJrYLyLn4sn53b9uKDvPTwGugsTqDfigBpjYuLvhSyfT2VsfWVx9ofx7q+HhDpHaf84Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy72g7MCwGEZwyRfEf5Ci+yA734tIIoSbslR1c5JF7W1I7k+wr
	Jot71IAT999/mYQo0yFT1YeBw8YsGausLwZv5ddQ+OBZM4Z+bGR2YnSV
X-Gm-Gg: Acq92OFtYed70viYU1HNfiXV13YinBoir3A4PHO1H4d6bsM0ZEVAtKDSTwghOg5A9mD
	25OcOn3BWQDgQZ9Kg6hLo43/0VIYBDK1GOT4KRAUHMNVe47G65uASjeQZ16T3P5iqOCWaxlIO4s
	FwKQuR/Z1v2H0/bAsg7Op9Y8O6urjXC/lgyfO6DmojcrhwuLEdsjj8ta0Nllg7lb9jlGLQPvbO+
	Nk6D5zV9doIta3bzFUNoyMa5Mf5eVueLt4ckoPsDhSK9JuZvAbhiqrCETCsy2TnNe4YmdAJUJ3h
	qx5+Jqi6myZQR6+6lCAKcNLF4oeHBmao2CbMqkuIoSyf6j/4Jv46jdLO6z3cmUUWxqTBieJLCMp
	YQGbDY36t4FOkhsNsgeCzqAnNIlTEb1jdP+lwPiJzwfijEgs1WDrUczErU+MERwRTkT5QMWiodU
	CpmP/pLhMI2oJx+3XJUjIifGzxTgmsUNMEI2aasdCDTSWgIW2jp31AI4ymIC0M1gRYgIu7S1dxu
	AXH
X-Received: by 2002:a05:7300:e60c:b0:2dd:6937:79bc with SMTP id 5a478bee46e88-2f54ad72f58mr7379780eec.6.1778265666442;
        Fri, 08 May 2026 11:41:06 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm3365279eec.22.2026.05.08.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:41:06 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan curves/platform profile/tdp/battery limiting
Date: Fri,  8 May 2026 11:41:04 -0700
Message-ID: <20260508184104.623016-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>This draft patch series brings into parity the msi-wmi-platform driver with
>the MSI Center M Windows application for the MSI Claw (all models).
>Unfortunately, MSI Center M and this interface do not have a discovery API,
>necessitating the introduction of a quirk system.
>
>While this patch series is fully functional and tested, there are still
>some issues that need to be addressed:
>  - Armin notes we need to disable fan curve support by default and quirk
>    it as well, as it is not supported on all models. However, the way
>    PWM enable ops work, this makes it a bit difficult, so I would like
>    some suggestions on how to rework this.
>  - It turns out that to fully disable the fan curve, we have to restore
>    the default fan values. This is also what is done on the OEM software.
>    For this, the last patch in the series is used, which is a bit dirty.
>
>Sleep was tested with all values being preserved during S0iX (platform
>profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
>least for the Claw devices.
>
>For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
>his new high level interface is merged beforehand, we can use that instead.
>

Hi Antheas,

It seems this series is stalled for 3 days shy of a year now. I have an
interest in getting this across the finish line. Will you be continuing
development? If not, I will take what you've started here and finish out
the remaining nits, keeping your original attribution of course.

Cheers,
Derek

>Antheas Kapenekakis (8):
>  platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
>  platform/x86: msi-wmi-platform: Add quirk system
>  platform/x86: msi-wmi-platform: Add platform profile through shift
>    mode
>  platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
>    attributes
>  platform/x86: msi-wmi-platform: Add charge_threshold support
>  platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
>  platform/x86: msi-wmi-platform: Update header text
>  platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
>    unload
>
>Armin Wolf (2):
>  platform/x86: msi-wmi-platform: Use input buffer for returning result
>  platform/x86: msi-wmi-platform: Add support for fan control
>
> .../wmi/devices/msi-wmi-platform.rst          |   26 +
> drivers/platform/x86/Kconfig                  |    3 +
> drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> 3 files changed, 1156 insertions(+), 54 deletions(-)
>
>
>base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
