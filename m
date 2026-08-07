Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C9199FAB
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063144; cv=none; b=fIgZ90VqRIQdm3dPqW35sgoVB2RG/TtahAjU0R3GfGWJCaxN0deBvusB37J4FRxaRvYaTu0QE9ONrTE7PQy1l6fwQy6glLrRfl65MkwAMh8nW5tOf93Vy8A8L9EeGDcNFBHoEEAnegNj41iN4ygz6uTww9mxdoPh2O0fOR/C6aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063144; c=relaxed/simple;
	bh=MU2abmOKDdlqQTDZ0KTwFE0JehlezfHRedBF7Gs8QG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jhWFkCKG3qKN20kibeWhtkytjY5MnN9o8ivoM4X3U9iLD9WCFcOTfv5B0OzORCZnzGTTs7K57GMsHXoK1Xg1lEvE/FbDl9Z/n9rA1fQU8X3YfCqTF1crBwER61Miu0H/ee90dB0nh1o/CZUMrfR/djSHc8OhDZXmWmYHxznU40w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrDnonTF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrDnonTF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caea3f742bso39013115ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 17:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063143; x=1786667943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNNzbkSM7zlulwZfqDEG8YhrkRb79v1YMNRuwUW0gUk=;
        b=TrDnonTF4VqtD+wlzxQAbD93J2hOCoS37OuetmcwQBMcokD6loIeiaOl+wQaFat+7F
         8YWvkqexeumsj1wRYGnKpi1WBub0ymROm3OG5xyn7rrEQqCsmwlx8wxpAGSJoMrknde7
         Yt9DnLR67CrugP8OuQx3orBPOTqfAUnUt5mkyzEGICPD/+NPQE9a18WIIFCm5yjgnmvp
         Dn80mmbrAQdkFKOh2AmG8CqgKY4r4FGWJCWXBcOnLZ6HN27JBDMWmn7ufwvrvuH/SUmj
         u1xy0TYEkwfCfX9Q8ZwW0r7rgxTfm/xEz3GeaDfJU8jEehH6KQftLLHBNCBX1hrU9vWD
         X7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063143; x=1786667943;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gNNzbkSM7zlulwZfqDEG8YhrkRb79v1YMNRuwUW0gUk=;
        b=XRna4fWKoutfx2d3C6OYMJppTUmCThlXr1iAIUkSvdEGWa5moEhsNRpHAccT4AbXZQ
         oInl02CjNfRRGiA7F/CxKe1cCxepKFJ7GJyNXYJ97PQwJTzPvLcshuEvxW/RcEI7m8fH
         4e0GxZ/mGJoLfpKB/DPkSVWRyBo90i/6DVEf09I95/S5m86TdkokkIR9dnK5EGx6q1V0
         X/a28oAtUQS5UeHmHReycAf1RpROeJTaPrT9RFwaUoducoAxO5LNfX7xdnznHxnG4BdM
         X1WBqx2SIDHBBwotGsswlDHhAcpwFJrUMtcehV4bQ/iTIdJUZr5NiMJs1u9agT2Q+1Cf
         dM/w==
X-Gm-Message-State: AOJu0Yz8S6my0GFe8TAq210P9dmoPci8ccAE7wFTwV27ONEwjxGPvUjN
	zWIU3iEZaOpJskp33URVuyvFWfM2BIzl6KwQv+XwKTpCO9HiOwdm4js+
X-Gm-Gg: AR+sD11ApxlgEekQZ5EbEv+eXNQazLt0lhvfZPkYCZU/oLkXWESMib1zmGxLd0QSNzs
	yv/2wD0Y80RoIEvOELJmgTGLOaniapp5asByl3yCylpN4pM2UO/eHKBMMQQBDl3JU1Qh0PPtKLv
	WS7fnMo07bZzJRTXl4vMzR3EZcooHyQQ4kOp6C3RBpbZMAo55BYrI2ogfjZvuIqukaqZRrokUMi
	OE6dLAB3Cvj3eg6kZRF0fa4fKfY/TvH5v2/oFMT/0HD3pkQDhPf2mb2AbHqFUMMzeE6sQsJKrIk
	VCOo0WF/9N2ow1ktNmGgwVy7AxxpSbN0g3limTngxAxSvDVewAOZsfunJbCbOfQXusvS5rzlE++
	8Qa6J+L/Ln2NjoT74fbAxBxo3CmhnFRTAb8OJkjRMYWoWTqI1ZaWjX5Y+KrC5BmknJPgRF8ZxdZ
	GZgtyIPCqUX/mrXR2lll+bATOgiOhOPYWySR5f9Ll9NpW0BdUGSwukxapnnOXL
X-Received: by 2002:a17:903:384d:b0:2d0:3412:a3f0 with SMTP id d9443c01a7336-2d0ca962498mr227917665ad.19.1786063142739;
        Thu, 06 Aug 2026 17:39:02 -0700 (PDT)
Received: from nixos-minipc ([153.67.181.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebee8d0sm526189eec.24.2026.08.06.17.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:39:02 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Thu,  6 Aug 2026 21:38:41 -0300
Message-ID: <20260807003842.249957-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This RFC adds a board-specific hwmon driver for the embedded controller in
the Minisforum UM780 XTX. It exposes two fan-control temperatures, both fan
tachometers, the two OEM CPU fan profiles, and the configurable system-fan
transition temperatures.

The controller is an ITE IT5571E, but its observable register layout, OEM
commands, and fan-control behavior are defined by machine-specific
firmware. The driver therefore does not attempt to support arbitrary
IT5571E systems and is limited to the exact board revision and BIOS version
on which the interface was reverse engineered and tested.

The firmware reloads its default fan settings several seconds after s2idle
resume. The driver performs one delayed check and restores the last
coherent settings if they changed. It does not poll during normal
operation.

The EC does not expose the currently applied duty cycle, so pwm1 and pwm2
values are not synthesized. Only automatic modes and known curve settings
are exposed.

A research prototype can also report the seven CPU curve boundaries and
modify six while retaining the firmware slopes and fixed 93 C safety
boundary. This is omitted because adjacent bands require paired EC writes
and the visible values do not fully describe firmware interpolation.

I would appreciate feedback on:

  1. Whether direct use of the ACPI EC helpers and placement in hwmon are
     appropriate for this DMI-gated driver.
  2. Whether pwm1_enable values 2 and 3 appropriately represent the two
     firmware-controlled CPU profiles.
  3. Whether the two stepped system-fan transitions are appropriately
     represented as pwm2 automatic curve points.
  4. Whether read-only CPU curve boundaries would be useful in a follow-up,
     and where experimental writes should live.

The driver was tested on the target hardware with concurrent RPM reads,
profile and curve changes, unload/reload stress, and s2idle resume. The
patch passes checkpatch.pl --strict and builds against hwmon-next.

OpenAI Codex assisted with review, editing, test orchestration, and patch
preparation. I reviewed the result and take responsibility for the
submission.

Sebastián Peyrott (1):
  hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/minisforum-um780xtx.rst |  79 +++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  16 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/minisforum-um780xtx.c         | 648 ++++++++++++++++++++
 6 files changed, 752 insertions(+)
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c


base-commit: f18a46518561205cd6ff775a488a0c9d9d5edbfb
-- 
2.54.0
