Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF12DF68
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149271; cv=none; b=BJzke8pzBQT7+zcJHU+DVW8Xg7NXMeEyl3LJNJqAqkFWDgjHkZqE+LhG8Bi4C/C1oifJpPgR98yfU63bCHihFRJNr00P9p2JVzKBc/9bnWDjOqftSof4rvFaUOgaGCVUNX6WAlXngvHGu2WA6eIvnh0E2+/UaTl5XWB4ESpmv4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149271; c=relaxed/simple;
	bh=Kiklfbf/mOtWhM3nzZ61qTH+SlUMKusCDgEcCZ/kXsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dw77NVU51dBpukOqyErPiDaZGHwgiSB2ImlAsrULjJidPVt050Lu8x2g7f4AO7mAEkF78J/ngfY3VU9NcIHEaSqfuWYndPakysgWZnQG3nvQT8qXD3FO2ZyVx8iRIbF9vFb2VZg4kCsWaJZnjlV/rgcBx76piO64aujflwSina8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTKgYWsy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTKgYWsy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba856db1c0so21355065ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779149269; x=1779754069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMisq1x8LSsDQmwweu++ThsrVVeqT8H4PNPNw49rVmw=;
        b=VTKgYWsyEcNjJnNzMND/nDwD74GG3fjp/gGHyxHxBsRW2PnA4wZ++eGb3NqLGWUQl5
         GfsUrpgHNwmnweki8ASoZkxqwc3lwEf7NkWiyykNE7vN7Bj2gMXkrOEcwZrZr5lMBtEE
         JkR/ubwSd0J++7Nn4gi5ZSfUloNn8/oG3pBquQblwGI5bGEnOIbX7uC/5pgbQmq9tyjr
         CttxRLUpnDS5JLG9FTSf1dGZXGANEhOWssU7WJXDzvtY/p3gjuWwDBuZsBJ1SwWKRdVT
         FPGALtkzI4l9x3xV6o1HYIq1OXr7+ScVh53poiWDQghrNlE8vGa2zn4kFAvLQx1aEWQe
         5rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779149269; x=1779754069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMisq1x8LSsDQmwweu++ThsrVVeqT8H4PNPNw49rVmw=;
        b=lBfhkNFweIm1xE7lFkDOJ5RZ7s/yKPGLb1XiXzX5824Bz7aIGjmoBT/TepkaN2dZdu
         HbncFC9jKsCOTelXSrts1/P4zKM+M7NPjuxRyFUd6Fgc5bVS4FtJ9NyoKbnuYooGQVei
         rnbA2NbC5+o1BTVJD3Rr3vDL4KVtsYMASmEd0ZiPvMEFE+Stnraugvz9bgGEaN8HGxaY
         0I4s5ShuVMZgLRVJDn45Rlu4lh2TrfgUkkmOIR9lZrBG2Qxi90wiIpRnXMWO0NC6OHht
         CuQ7OK9MAWeTCa9XGBr3AvREBCDBtEzO3y/iZNW3f0rsPpL9AS9+Zqa8GQuxy4bVSOmH
         yZnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+B7kNLImaSy1gLI2jHSs1PqF/BgFQz3pTezGGJ2mGh2csDDEwLX631ssPsu6RN6uDey0LKnGScCO90Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHIE2YFA0ZfXsNke6aj/63de6kH5+4eMUq2LplW9HBig9lIz/8
	1zIywfw/Tmoohvfw1yzqmAhfyFgS4T66QCxmqwaorCl+aJFPfszErgPp
X-Gm-Gg: Acq92OG7JnqY4IZ9PdPqk/slbDybVbPjdDn9/FbCK1T5h2ubbwXY6wB5Ms4aGIjsC5F
	vDGGcaT10utZLmjq+ouyQmr08fGD2YOgK7OUK7XzfCPrNNuWfg4tQqDSnfP8ctoAKU6U3q99rgi
	uq1vzRm6bQ7k7x2r16UGA7/BIA/u42dm4YND1uRUg0q18X7i8PFvZ8cp7QYpVRtVyyFzicFMXAt
	PyG8cCv56uDnJoBNHkvodgkdVy/zcPrRNFHr7G5SNghxzffsGNT2A7CkTcqjcU2GnKW3MhRpU1S
	/8ENnbXBxj/p4lqi2TA2FkQ3i4/O3H2JIlvVbTMUWft5mYWUCDYYCfbkYMyLU+srHBwunqgdQ38
	q5elYPpGJd+yyuhGi2iouDxI9QnS5QZC0L4u8gcDhuzCdy0YFBW3SbyRNnbVpp0rJsIyskRrHov
	pdbPs2CVb11jeYpLuA2nEN/Q==
X-Received: by 2002:a17:902:db06:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2bd7e7bdd1cmr181280395ad.11.1779149268954;
        Mon, 18 May 2026 17:07:48 -0700 (PDT)
Received: from mincom1 ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm79021755ad.20.2026.05.18.17.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:07:48 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Yaroslav Isakov <yaroslav.isakov@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v7 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Tue, 19 May 2026 09:07:30 +0900
Message-ID: <20260519000732.2334711-1-hurryman2212@gmail.com>
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

Changes in v7:
- Tie the hidden PROM21 PCI glue option to the user-visible
  SENSORS_PROM21_XHCI option instead of enabling it for all x86 builds.
- Drop an unnecessary NULL check after successful xhci_pci_common_probe().
- Use a goto-based cleanup path in prom21_xhci_create_auxdev().

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/prom21-xhci.rst           | 101 ++++++++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/prom21-xhci.c                   | 239 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   6 +
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 137 ++++++++++
 drivers/usb/host/xhci-pci.c                   |  11 +
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++
 11 files changed, 532 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h


base-commit: 4d3a2a466b8d68d852a1f3bbf11204b718428dc4
-- 
2.53.0
