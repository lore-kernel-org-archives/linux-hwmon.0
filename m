Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DBE4854F9
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076849; cv=none; b=oBh7HtDEOAi918D+p/peymsSoP4hUYWHkqPgClv2czDMasCewbMdt/NwbtHYhn4e65ibxztHoxrKrNAZduRTcwcQKqnx7rhnwCgSTezZsn8eLbnvIRGyTE3x+0ABv8DI4U1EnLJBzMcZv2dD36bUWN9ZEjIDD3mKtVK6SN/ct8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076849; c=relaxed/simple;
	bh=+zdtyruVipHBzua3Z+iP7K8R48j4pg2v8WT6MJyggmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VA5VuakwDERC0N7vlVvJ2SzNlKwvi43lf8TT9syIC4h24VWwz8r81NXbu36um/mKevtL3xUU3GT7Oyx7VZvyptxeLUr4sF+AVMjPplOZODY9K3eoJ2nT8SAAZxeEXpTJNPA4JnlQgwUqxQfFTVWxB+rUawooOKcQUAYPPacgTUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCRQ4afQ; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCRQ4afQ"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97bf91c815bso44287241.3
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787076845; x=1787681645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dI0skn1hMaNhZ7ScecWggo3zzn2ZDLJPo30AHcpisVQ=;
        b=kCRQ4afQY/O7bXt37iD5KZKUrIAhO+Oc9zWEKPXxk2dBVNcOFUML8aio6cpMy3nDA/
         gPRhpu1id2bD5zoZ9Gb0SNk3/a8Hj56wjfCgYwcieE1RcyukCAbiMR/Bm9rnZuWeVc6e
         rpgZo5WQDpUDQTu+E9IouTHEm5c2sbqwbcKstA1BQRWAdoIkgAdro3x8HNJ23O85Rrr2
         KGv3yHrD5O+iz/AFnRA4WLWbOM5nlf1+J5aZp7+BLYt+DupI9PhLLynuj72KZ8fh6IA2
         ZjsDXQ09l2653JWbJqV1qCyIyxjbPEGg5gbqTPce0l/3vHLfvle+aByXqogNjbhZZEmW
         TfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787076845; x=1787681645;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dI0skn1hMaNhZ7ScecWggo3zzn2ZDLJPo30AHcpisVQ=;
        b=FNcziCcnY9AIGa/k60BQyu2VO4hxPqBA2qzmAukrfg6MSUfqwknNs/VgXPCpJ6MmMr
         GbWDVMbaKzttQOzxHcD4Rx+G33lPMLR7CfklsGNl6t3/49eemAOMroaQJL+BXs627UZr
         nUxVzUQwc92/PBOy3K8zRhTVQjHomY+L02BbtlZuoo/mNoc9YhKCWl5YuIzuOWP6JMUf
         SwfhpoTLcY5Pwe7ou83Iym1ziKOdJf7wp80sbKCkawjERWmmA/4669G7K1Deg9kLsqMd
         2VU2B7TDDpkUxTx61rS20PlxoK35qMYwNHTfzOXvxUtwxIA9Taf0otqUM3LAteqWT0Sr
         Vj9g==
X-Gm-Message-State: AOJu0YxIsSxCkIvLiqU4bXj+pugPXDEP9LtnBSWwvB8K1HiMuHFgz+2F
	n8xpckTPYi6L2HBKmU0thuYQVkpgFXncyEhQcD/DwrYXMkL7AgpDmAF7YBFyqbmEMu8=
X-Gm-Gg: AR+sD10RAt0zpnujust0t7wFcm+i9jRYXHpsabhTq3pJZooHYmJpnsQ+Wk1zg82nN7s
	eYoDjKwK2X8fe1X7qlNfrr+ST7TgnGcInwGRIONThb/S/tTVNZ7Bcfl7pncA94rePzj/4Iak4lw
	ct2ic9ipmhoUqgDLoZX8tGIQafkeWXajQOFjY0WEHdvNlDo6lsLCazmcWv6NFf5fxb29WLRNZEf
	fRsUZAF2LwvDLNRyr1ajzAQ4NhfAFxQ2T2yH506VYGOeoX4nmFQ7GvL8ww8BmXPiSktHv+k48vs
	jE6Z9XNa/OdHhkiyGts9UJPNrtyZDiRQtRN7pa9i2bk+fHPhzKpJHSgSl7Vvpwgyqun5aWg8eMq
	/Se4cJLARnYwcFfXXpqn4qR+2KpkjnDMIyIcAgNNsxxEDCKOg8p1XkguYupUnh8b1h+sgYZBc0N
	mUIia2gvH7Rvx1osAFuMMMiEhZ0hxy0KNbFPTzLczwOiy+JhZy7W/ueH7p1Fwf7uGX
X-Received: by 2002:a05:6122:6c15:b0:5c5:a01f:aeff with SMTP id 71dfb90a1353d-5c5a01fdb13mr8760102e0c.9.1787076844361;
        Tue, 18 Aug 2026 11:14:04 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:6f62:ea1f:22cc:4407])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4533ef8dsm1496530241.1.2026.08.18.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:14:03 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Tue, 18 Aug 2026 15:13:44 -0300
Message-ID: <20260818181345.203295-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DMI-gated hwmon driver for both fans on the Minisforum UM780 XTX. The
EC is an ITE IT5571E, but its register layout and OEM commands are defined
by machine-specific firmware, so the driver only binds to the exact board
revision and BIOS version on which it was tested.

The driver exposes both fan-control temperatures and tachometers, two OEM
automatic CPU fan profiles, and two writable system-fan transition
temperatures. It preserves the selected settings across s2idle.

Tested on the target system with concurrent RPM reads, OEM profile changes,
system-fan threshold changes, unload/reload stress, and s2idle resume. The
settings were correct from the first userspace sample after resume and
remained stable for 15 seconds.

OpenAI Codex assisted with reverse-engineering review, code editing, test
orchestration, and patch and email preparation across a long interactive
session. I reviewed every change, ran the live tests on the target
hardware, and take responsibility for the submission.

Link: https://lore.kernel.org/r/20260807003842.249957-1-speyrott@gmail.com

Sebastián Peyrott (1):
  hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

---
Changes in v2:
- use standard hwmon callbacks for pwm1_enable and the hwmon lock for extra
  attributes and PM operations;
- remove constant pwm2 attributes;
- align CPU/SYS temperature and fan channels and simplify their labels;
- round and clamp system-fan threshold writes, and cache the fixed limit;
- replace delayed work with suspend/save and synchronous resume/restore;
- simplify callback dispatch and error handling.

 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/minisforum-um780xtx.rst |  68 +++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  16 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/minisforum-um780xtx.c         | 509 ++++++++++++++++++++
 6 files changed, 602 insertions(+)
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c


base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.54.0
