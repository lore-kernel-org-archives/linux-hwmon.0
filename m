Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6B364052
	for <linux-hwmon@vger.kernel.org>; Wed,  6 May 2026 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100052; cv=none; b=VtA3ga5WR554J1ccPd8+Dv8n9V8aQWTxvx5kKBL6/7nylSpL+nCPS0SJGJ1dcWUtjaVTZiSegkXGag4n0Jc85cK+WpaMMiX8MBQoyPLgXuB5XqGX77TPsJeQxncsnBYpw+Fo/Xg8szesuyq6j2sLqBi09cj+fQ2u5oww5IWyPDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100052; c=relaxed/simple;
	bh=N1utPvEcBUC2CgJY2X87EWrYwsuzry0dWKDcX8h66DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4HEoHdoEy+HHSJw1sNSWSWUHsjpv53Uljj80FqpDfW57gHt5RdDhd+P2PHYDBu7nZaXr7lg+c9k6VENdW1mi708TlXMPG2ZVa2R++e6izrIMZSq1/5tZJxv2aEweFAZoFDODdK/EG0Uh3DM4vhs8k8cAkW5aEfXp/u3wkAiDM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIMjQzpe; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIMjQzpe"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso47262b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 06 May 2026 13:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778100050; x=1778704850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ab/JEpZ7Fi0qyubDO84DlmrRRJltgbTbtMwqDlljXhg=;
        b=BIMjQzpeeyTopXwFqVsgfksLN2mbJuj1WTDU/RFyIVutzwgeTPvFdDxpkZC6COUobT
         Pva7KSrREIRVb5dPNEdZcuR+ZPGfAEj+TuQc+ssBZT4i1jzCxvhF9GKorY5ADvzXLo4H
         QNG4VH6NadZ2M3fbjI7+sqYdYjhfjGapfRKUSSgJ7hMaV54a9foMIggYjV9km/0hr+Hf
         cWpVabCDnYuqdjsXTgNWX6sUzYqz43gXD3mGX53BIxw4LbbEQxXXfbHBI0BKxHmDxeab
         ZWzPPZZH84U7SGlgv8lH6jwiHj237nFbrIo5mIqU5+iAO4c//z63PkM+Jw3prRWKYTKK
         yetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778100050; x=1778704850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ab/JEpZ7Fi0qyubDO84DlmrRRJltgbTbtMwqDlljXhg=;
        b=s2stzAskZkFO8uYRdlrdshFbnGIvu6rk631cbxLz8f0sfuBn+rsN2iKHfF+oA8WfSw
         gIsFNwiuxU6zolT2EuQ3gTL8TYuZznPKHE6cLDYfezzYVlPq5e8M+p1YaZaQaWB/Wmow
         LE0QIzkfw5fFsj0U6I1F170RBqz8V7j17PPspMYD7SBAyNehBpK+EqKWLZ2bZEqUxBzF
         DR2N9GDQK/fJGQIIfpQ5d5bwm5v9Eb1JFiP7WqeIlfwjJ/MKYCKNkSQT7Wsz6zn6Mbns
         o8+NHnYS4K4wBSribwnROoxvru9w7MNqkUhZsNWQkWaeZg9Aghu6kzE9Mwce6CBDVIXS
         SsCw==
X-Forwarded-Encrypted: i=1; AFNElJ88KxDyTEjuj4y5ckRg5kToy56GcwU0kduhlkRY6eZXVJO3nEZV8Tv2uHlrOPntIKktwI2IgJ42llEtbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzueYhiV958SANUebQrkOtihN5ZQhpkdxtnP9zyeMPpYkUorNE4
	pyk2ttbBEJCHocH5VBT634KvZSgJyv311tjhGRMc6DgPMKR/21AyYGg4
X-Gm-Gg: AeBDietMqNtrMUTe0ViyfquzrmvT+/a7oMskrOotDjFrepaL/d4oad2WAZoDZK748tj
	6Qqw7DHEGI7PMFZ8o7q1lt6Vr0d/xqOU/83a1M9GTNx7voC8P3/qW90TVM1b8PzT4w3zPTpHbsn
	GNpMQnhrNhkkR6FeglJx3Y8vD90LU4Vm/0ctLoWmBlj5owl7ymGXN+h0gTGZASo4rB6lZPPru0g
	oawgIeNqIExWa3KQZIQOyecAyavPEYjBQHR1KeG4W0CZnWFmUW5sa4gSIc2ewQaebe5yGKpH8cm
	nct5WLEzViPBqk5pgLCjxRbuZ607VqcBFWw6vIypPhdmsBgP/YE1K8RiSUyHKYKMW6tMVtaGn6q
	EGGnqFdOqpwGNKvOH15mAc1sPkw2YvDJIt8/MbBa2qWC9uX9b4LyvLcwo9WZAje6DX7fEN3Qw4Q
	DyHHvW9pRRHj8BTH1s3u5hZOyE8HT5wg0=
X-Received: by 2002:a05:6a00:3989:b0:837:d331:8700 with SMTP id d2e1a72fcca58-83bb65f40b2mr96595b3a.1.1778100050268;
        Wed, 06 May 2026 13:40:50 -0700 (PDT)
Received: from mincom1 ([14.67.155.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm7952185b3a.3.2026.05.06.13.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 13:40:49 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v2 0/2] AMD PROM21 xHCI temperature hwmon support
Date: Thu,  7 May 2026 05:40:32 +0900
Message-ID: <cover.1778099627.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506032939.92351-1-hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds hwmon support for the temperature sensor exposed by AMD
PROM21 xHCI controllers. The temperature value is read through a
vendor-specific index/data register pair in the xHCI PCI MMIO BAR.

v1 implemented this directly under drivers/usb/host. Based on review
feedback, v2 splits the support into a generic xhci-pci auxiliary-device
interface and a standalone hwmon driver under drivers/hwmon. xhci-pci
creates the auxiliary child only for PCI IDs matched by its internal table,
currently only AMD 1022:43fd, and the hwmon driver binds to that child
through the auxiliary bus.

The PROM21 hwmon driver registers the hwmon device under the parent PCI
function so userspace reports it as a PCI adapter. The auxiliary driver
still owns the lifetime and unregisters the hwmon device before xhci-pci
tears down the HCD.

I tested register access while the parent xHCI PCI function was suspended.
The temperature register did not return a valid value without
runtime-resuming the device. v2 therefore keeps the default behavior of
allowing a temperature read to wake the xHCI PCI device, and adds
allow_pm_switch=N for users who prefer reads not to wake the device. In
that mode a read returns -EAGAIN while the device is suspended.

Changes in v2:
- split the original single patch into a two-patch series
- add a generic xhci-pci auxiliary-device interface
- move PROM21 hwmon support to drivers/hwmon as an auxiliary driver
- avoid linking hwmon-specific code into xhci-hcd
- add Documentation/hwmon/prom21-hwmon.rst
- document register offsets, conversion formula, sysfs attributes, and
  allow_pm_switch behavior

Sincerely,
Jihong Min

Jihong Min (2):
  usb: xhci-pci: add generic auxiliary device interface
  hwmon: add initial support for AMD PROM21 xHCI temperature sensor

 Documentation/hwmon/index.rst        |   1 +
 Documentation/hwmon/prom21-hwmon.rst |  84 ++++++++
 drivers/hwmon/Kconfig                |  11 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/prom21-hwmon.c         | 300 +++++++++++++++++++++++++++
 drivers/usb/host/Kconfig             |  10 +
 drivers/usb/host/xhci-pci.c          | 114 ++++++++++
 7 files changed, 521 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-hwmon.rst
 create mode 100644 drivers/hwmon/prom21-hwmon.c

-- 
2.53.0
