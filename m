Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884352;
	b=iztemF8he62CcITz/H9EDtVBpgcZmrXMvLOboxRHifwFWjhyZX9vEQXbi/Kyma4PrraU
	 k8IfTkJ6u1XBv4rGwTHqf+/M2AN3Pj1fHBLKg9kA1IbnabEiEiRVW76Y5oTVD5gvOZ5nN
	 alzVDtQq7HErmlLMgZRP5yftGYXxpNoP5Od+3dPrAz16+up6Kvwx+wBE21sPw5sY1j1P2
	 rdpQdRUvMg5BQTHOSZbLlmMJQ6L/dKRY7OlbGhQLq/ZEULKnB6hAKWoW4Db9+oR567lls
	 hNhbq3R/fCp37znRoqK04uhaxMtXRufAtRaw3oBLER1k2hLkrHguFJ7AQ50vAebb82A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
	b=aD0Y08P9aGGP61K6UZfqfpjEiWWWcRL5srimnSqDowOwHB9iDgIrT0LXuVZHLklWxSbz
	 C19XOBwhrTAEflA9xgvykiSoqDS/ArpuMWYL81RI0xI6N7+puFRr7hMFy2PqjOjsgkpS1
	 dmVv5T8IslDm0Ph+hv99uhnoUa6J+6vhQmVkKtu2584Tj15xTKSt/FgvZYuQirXGBvVf/
	 YF+8HhnW+KGXsQjE2kzxZdYmDRQl3ab74Ux30iEWSLGHUXn8k+cMbe0Q148huHnMT8KCO
	 +791DnhD8L/w6HNpStwiXqT16zG6QCId2VGe2E7mdUtSnYLBa925HJjfqGEfYXtrZvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQoZW17j;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6C5606A32A
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6C5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQoZW17j
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso41281577b3.2
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 18:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884351; x=1795489151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
        b=dQoZW17jiNebFuE6azQ83jmKtjqcxcl5zox5/c9ay6PslDfs/OuTxMsQK+M93ZKxLu
         CyJYN8ep/zcVgJmJyDSjHdmSyO8In/0hZGEXZXgl188jmnl8t7EW4jrx2miND6RHUCGB
         CgJW+Q/Bf4JgPuTefi0kDMTb7iEg+i8irfbYxbN64//aJaiyIUsEG+siLRDJs0dpCndY
         CdzY5+RJF9PvDX9DgMSx0PK0f9olnMNJc8gppLDlmu23HGwYc2L7nHo2Y5I6ywE0mHNy
         31yP+aUy91KVf6nZ32brydM00jb9uxJAKYSP0ghepC3RbnV2VUvM1l7wM1KjfUWbyzDO
         u3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884351; x=1795489151;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
        b=Pn8iUAGZroiN8fJnW1SR6dcL9yYwUqMAsBhqlxpQKov4/ypLeg4mkQiIsH9KrqWu9v
         kw/Gfubv24yGokOJSTf3U7QdoCrtPpG2aw+eL1VHW8N0jE3BBMTe8w8pTIr7xQtTarRc
         mnE5qDqUd0SS8B2GZcSRafiS92v8rPnsQltQgiuuQrFmF/VUHhTRFr+5uMtRhP8EyHRS
         EJZeazouyFymvug+F4WaoUSztPdFDIQlreM8JV9JOSN+GWqcXk4ycd3ixc5YxWIaN6y5
         XAovFqLm7LDn4ZKZeEmdLr/TdClCOLr1RshDWNFr3xMo47dFP+PSuEn+ng9BYIcXwbsZ
         Jklw==
X-Forwarded-Encrypted: i=1; AL+hErGxbhKp1KLisvWAtzQz3ao2NOtYlM9bSfrq8rfd5dq/Vv+lK8zWtu6fN9l8ap+KC5yr7bhKdTu6O3AcCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KMLcKq7mLz+xBksJMsCeW0YY/2Y7CI/QzPtsPpDxm2QOLit9V
	lJTk7+pCrCtVfSQTN/DHxE7m2XfR/nWib5OA3Iw8Lxz+6t1kEEDyaBaX
X-Gm-Gg: AZFdTZdfg85WjnkAG3mlVk2n8+rnaNQ3mXypY4/ywbLciICbaoUkDh4XkAE6QSVORHr
	+nByNN1XGVPN0BtDWmcB4YNBuaCSD2z6pFI6Q0n2KKU59Y+HFw/fGUdp7gMVsVQC1riGXZCRNye
	ENJOaZpL0MBjt1zL0S9ADC2WVWFuSaPzqoNWQ76qo7xFNi6+GrrDs+e2WPClrMxbgkbOONqIMGf
	jH0f0fxXRLZo++SFzRh/j9j1GsMmp8s/9wI50R9Mzze7izUI56fijuMrVn1R3F+PPciY3/Hpkwd
	ECBxpbT7od+Vumof1qGohqPKQCsvitgeJnaoGtIJrZnmgZ/IcDaZW9USa75XmNsPw9WUU5p7eaN
	UHzT0MLtbFe1a/GxC2h6KhvCaRa9kf/eZPaC5ST3nM0jlwXoGfYUq7G8RWC4PTt5juqWT/mZhUI
	lTOJ5uAEU9AngQsrtYN32RBTO8EcUXOYSE9aQ1BFYjgx8iuyAg4dbTkZqpMwKjbFpHffHUP9He5
	BfJLIum46c1uRaB5uS2xjXooZma63+TiMhVbPFH88Y4+f2TUm81Dwc3kdtp6ADd5kg36b7C6X9c
	PdnCQMHTsi+LzadwPZAdHPMEibvj6q53G9pdawGMUT92DVWZt5CLe0H72vlNA4FJyDhI6Jhx+0p
	MV5efg6Or88eE/QZHM0wuOWfrWwE8vo7BcEfJw/qQ1FlPVBlDOLsXUkTJqdGGzj+bP7XyaGTtuE
	V5oLineueX0OyzjxHKPw==
X-Received: by 2002:a05:690c:ec5:b0:8ab:4c8f:2844 with SMTP id 00721157ae682-8b4aa2a0f51mr73400777b3.39.1794884351354;
        Mon, 16 Nov 2026 18:59:11 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec065f84sm14469217b3.29.2026.11.16.18.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:10 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/7] alpha: marvel: environmental sensors
Date: Mon, 16 Nov 2026 21:59:07 -0500
Message-Id: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NyQ6CMBRFf4W8tTUdkGnlfxgWpTzhGQbTYqMh/
 Xdb3Lo8ybnn7uDQEjposh0senK0LhHkKQMz6mVARn1kkFwWQoiczdp6nBgunvVcVrUpVdFpBXH
 wtHin9xG7tT92r+6BZkuFZIzkttV+jjcvkvc37AXjrKq5khXmXYmX6zBrms5mnaENIXwBKOuc4
 7YAAAA=
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=2N/yDN2Wcz2QGAy54x4oEamhIu757IC6EK7THi85BJc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/qzetuVvIoC36zY7Wp/JHPDE9069+2S91qsMs2uz
 mTrw/PbOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa5EKG/xmWhp8D69
 iDJVPk5pfFlyZecviS9/LQ9jZLC6aXNpYOBYwMH21/XNZ/Ha52r7HnW2zxNcuUpg9XXkQIMD1QW
 HUm8OpyFgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, patch 4 passes the
firmware's events to a notifier chain, and patch 5 registers a platform
device. Patch 6 is the hwmon driver, which polls, and patch 7 makes it
reread the sensors and notify userspace when the firmware reports an
event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply status. Disconnecting AC from one of its two
power supplies raised a system event that set the supply's in_fault and
woke poll() and udev, and reconnecting it cleared the fault the same
way. No voltage is out of range, so the voltage alarms were checked by
forcing the warning and failure states in the console's packets.

I used Claude Code to help write this series: working out the packet
layout, drafting the code and changelogs, and checking the firmware
documentation. I reviewed and tested the result.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v2:
- hwmon: report the firmware's states by their documented meaning: a
  sensor's warning and failure states are its reading reaching the
  warning and failure limits, not a broken sensor (Guenter)
- hwmon: report power supplies as in channels with only a fault
  attribute instead of power alarms (Guenter)
- hwmon: depend on !ALPHA_LEGACY_START_ADDRESS for generic kernels,
  which leave out core_marvel.o (Sashiko)
- hwmon: drop the private mutex, rely on the hwmon core lock and take
  hwmon_lock() in the event work (Sashiko)
- hwmon: notify each alarm attribute whose value changed, and only those
  (Sashiko, Magnus)
- hwmon: report a voltage outside its limits as in_min_alarm and
  in_lcrit_alarm or in_max_alarm and in_crit_alarm, by comparing it with
  the nominal voltage in the console's packet (Guenter, Magnus)
- alpha: define CCB_CFGTREE in asm/console.h instead of the uapi header,
  since it is a Marvel console extension, and say it comes from Tru64
  (Magnus)
- hwmon: return -ENODATA from every alarm of a sensor that became unknown
- alpha: drop the unreachable SRM check from
  marvel_cfgtree_partial_update(), and move the GCT node type and
  subtype the driver uses to asm/gct.h
- Reorder: fix the event layout before printing it unconditionally, and
  put the alpha patches first
- Drop the Assisted-by trailers, describe tool use here instead (Guenter)
- Link to v1: https://patch.msgid.link/20261114-marvel-env-v1-0-890328e4b7e5@gmail.com

---
Matt Turner (7):
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: notify environmental events
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/marvel-env.rst  |  76 ++++
 MAINTAINERS                         |   8 +
 arch/alpha/include/asm/console.h    |   5 +
 arch/alpha/include/asm/err_ev7.h    |  16 +-
 arch/alpha/include/asm/gct.h        |   2 +
 arch/alpha/include/asm/marvel_env.h |  17 +
 arch/alpha/kernel/core_marvel.c     |  56 +++
 arch/alpha/kernel/err_marvel.c      |  39 +-
 arch/alpha/kernel/proto.h           |   1 +
 arch/alpha/kernel/srmcons.c         |   3 +-
 arch/alpha/lib/callback_srm.S       |   1 +
 drivers/hwmon/Kconfig               |  12 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/marvel-env.c          | 690 ++++++++++++++++++++++++++++++++++++
 15 files changed, 909 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

