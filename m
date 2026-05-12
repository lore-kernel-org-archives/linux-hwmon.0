Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F00386C18
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622025; cv=none; b=jjlvXk7e7s460eBWq+9X+hSkia526GoQvUtV1Hvv1fgDVG1KXL+5/z5pjD/KIAj+HthoxvbNXFgdJZMKXhgrDm5clOzdLR9dstY9ZAvQkVWoEk+1vlM4RxT2EMEGwnG7bntN2iEs+z3lzvVXzhfDa9jRK69tekAF5xtUOXdY93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622025; c=relaxed/simple;
	bh=sTJxJ/xasIqDRCeYM0JtmkGU7hXrTwpbCDass0bVHps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Js/PE7V0+XFSSMenvFRqYpW5iLF1P4jN8s1N2pg16578FjVTE9BuhKplKtFaQkpTHY//pm4lbtkwGfYj/V6LhhD+5WVCxJdzc0y3K3tn7L924w55R0oqCC57ERrYPvfwXNjGxH/MdeSbkW0ifT7quGYH0OYOhqfFYcrn+cMKQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQWdnaij; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQWdnaij"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b9ec9443c2so37714955ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622022; x=1779226822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuJpPqhDcONg49vri+mgJGghvc2o/ilLGU2ZfssziEI=;
        b=OQWdnaijZ1h7L8r1EP1KKJUSbtDYxqsiw2/0vKLvMvQLdrb9ZVGnOOp2Gbe+jUMvYP
         PVCkgYSFZtaLFcaLWJxW4EL95IZznbDnPWDEsv845ZFoxjpn+JZSxi2ASVX/asrez5N3
         C++ah2Bt+sYUOE4mVfIa3Hiovmzn8uVee1VKr8VwD2DQFKyJ9B/UAWk4wH7g121HrhSb
         9EnoRB2tI4jdGbHrVW1IT0Q6ChG15TTtxdvMgF+15GAdv/tyoXrKB+reAvow7lj5cgx0
         e9IzOSlonqDlYRfOaIVga0qdurXUtBxkpjQKvhUPhCp7xT82X3TCCo/X0gP7wMsORNae
         mZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622022; x=1779226822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuJpPqhDcONg49vri+mgJGghvc2o/ilLGU2ZfssziEI=;
        b=Dc5Jukg1B8xRVsfXyVIc0ctijp6ZMJ8A1DED+yPI6VeOLDVMLQTEkhCNB+E+KtubSt
         Bzldkwu5yAeCto18KLvJinpTwNCfdbMDr0ux83ZpTWGNYub8iozHw33zVQiGH6REnL0h
         vYCGrmRcMwYpR35jnB0otygLfL4VVtyzzsckb/3ttNhoJKrTpwNmAH74D8Ol587yNusk
         2uYIuQ7ZiB3Kxyul1mlAeIs2JwH+cpFfBHVZGf6aRX/YO7g7CiHsJMDFxU0F7RY5r3Iw
         JLBO8xLeuFmPNQG7SF38wx9fBhTYwzy3t8H+68/O8jpdZ7FAg2dW7RZNu2AXaZ6usG0P
         aclg==
X-Forwarded-Encrypted: i=1; AFNElJ/hrJR/1AJo9B/lcwrFRWLb14XwtZNEV2jBqnRoNN0cA9Y9A6RHCpkIWFlW53GNincze/rH993w2F6pog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxUDcmyxrAFV0LnH5tvZOWEaDZ7TbIz2L8vQzGF9GBnKdX8D/g
	4UvFmV9MC5/9338br3XKp0zrfTwJD+L0BLTedM3CUW3GXPE2awo/0M4m
X-Gm-Gg: Acq92OHJeSh+Zv2NSDEhahPuiy1TY+gOzbk/X+esNpEpmXTx8SQxT+JqBWM5xcolvVo
	W1Z/yuFH2cARza1SgbgddlLR/6F0NppRmYh4eu1Hyd/qu0zptOx1SytPlZ/4KC/nsOZVOCBo31U
	iC5LY+4uL0r4uxzGZnpATb1xyvVYgaRvgPgWkY6fRnTkpfHprCBkNVr/29soNLl2HSEuAhr4i8E
	FEXE0of4RtBlaqO7PvIqLMKQHnI+OYsxAFlfzHlaFjKr8vdhN6M3N37XGine6hV4RJ2sY6bPhnb
	pBYn1k/wNh22cCVel5itGhAZqM1vSnf0nSQpwGbCeSscDXbCWmJn29FTqyWw4V7/7LHmqT3era9
	Mqzt9iwDqxVZbqv50hLzXfo7Zc2FKPLofrECgT7FAL2cKO+JRH3gRPLujyVsGeGSJlgPg52cjJv
	imgfbigLvE31jRoC8efbHHVvDVdUSXgnA=
X-Received: by 2002:a17:903:3b8e:b0:2ba:7617:a755 with SMTP id d9443c01a7336-2bcfd48ace8mr55972255ad.25.1778622022203;
        Tue, 12 May 2026 14:40:22 -0700 (PDT)
Received: from mincom1 ([27.232.220.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d409eesm143949895ad.32.2026.05.12.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:40:21 -0700 (PDT)
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
Subject: [PATCH v5 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Wed, 13 May 2026 06:39:08 +0900
Message-ID: <20260512213910.871859-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds temperature monitoring for AMD Promontory 21 (PROM21)
xHCI PCI functions.

Patch 1 adds a small PROM21-specific xHCI PCI glue driver. USB host
operation is delegated to the common xhci-pci code, while the PROM21 glue
publishes an auxiliary device for optional sensor support.

Patch 2 adds an auxiliary-bus hwmon driver that binds to that auxiliary
device and exposes the PROM21 xHCI temperature value as temp1_input.

The hwmon driver reads the sensor through a vendor index/data register pair
in the xHCI PCI MMIO BAR. It does not wake the parent PCI device for hwmon
reads; if the parent is suspended, the read returns -ENODATA.

Changes in v5:
- Add support for AMD 1022:43fc PROM21 xHCI controllers and document the
  new PCI ID.
- Make USB_XHCI_PCI_PROM21 depend on X86 and default to USB_XHCI_PCI.
- Keep the PROM21 PCI glue built-in-only when enabled, while allowing the
  hwmon sensor driver to be built as a separate module.
- Move PROM21 xHCI PCI device IDs to xhci-pci.h so xhci-pci.c and
  xhci-pci-prom21.c use shared definitions.
- Pass the parent PCI device, MMIO base, and resource length to the hwmon
  driver through platform data defined in a common header, instead of
  inspecting the parent driver's drvdata from the hwmon driver.
- Remove the private hwmon mutex and rely on hwmon core serialization for
  this driver's callbacks.
- Clarify that the driver only serializes its own hwmon callbacks and does
  not synchronize with firmware, SMM, ACPI AML, or other possible users of
  the PROM21 vendor index/data register pair.
- Use readb() for the temperature data register, validate the value before
  writing the output pointer, and drop the 0xff invalid-value check.
- Use pm_runtime_put() after successful reads with the parent device active
  so the PM core can re-evaluate the parent device's idle state.
- Simplify the documentation and use more precise terminology for the
  supported device.

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/prom21-xhci.rst           | 101 ++++++++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/prom21-xhci.c                   | 238 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |  20 ++
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 123 +++++++++
 drivers/usb/host/xhci-pci.c                   |  11 +
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++
 11 files changed, 531 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h

-- 
2.53.0
