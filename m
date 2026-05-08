Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42C0370D55
	for <linux-hwmon@vger.kernel.org>; Fri,  8 May 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251179; cv=none; b=ogK4CZxRMltwDoNK5h1XvCQF73I2q62tap0aL39o0So6CH84lz6rVb7Cyr6L2gSIbolmmjI3XPsxVAB1dTXJAZhNKClYS/jL/mvIKnFfGGwnimVB/9/wKUw8uTsj/VfImYxW6ee7D07GyW57hZ5uZGJmjO1qa5Hoi+aGOBZzVJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251179; c=relaxed/simple;
	bh=CRo+41M0qXiyDrMxBRd9ybpoOu9d/b6QhFbdrm5JsyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHghi3kGgnRvb+0O/NvxS2HTjI4LwQas5W8tX+s+7++El2ed9yYbMEMWLV3wavbDLXS5k02Svfx3qm+622V7voD/JXiOjxk6/jMyse+9Qg3muONl/1O4DVvNSwmNu7TJrcuwSurTrJRCHNxHwail9STSCzPsEPjKOdgL5YUAjfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISGHnfyp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISGHnfyp"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c801d732058so955075a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 08 May 2026 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251178; x=1778855978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXdrkYkgPTA26PL0ikladf23kOngeqlDqPwT8C8tFUc=;
        b=ISGHnfypC8TkYLFtcBPjBgtTf/t1/VHlTkBaNu9CxUeh8/3DjOGCSNd0CxfBjBTWla
         FYVR62/Z8jthfzurSzCaxFjKex4hdTGk0U4jskO3EPnZUEleJHuYd55wJ42Rab/aeMgg
         AYZ1P9Wo41umOlANk0PV2BsGljOhHcvfNKf08HOMS7LB5ZrmRy4U+QKnVH7u6YNXNJoW
         1QPLizm83TJiIjhweZzrhEcmqsv7wjHK55U6xSokNskri5tyIKlKUKekUqFgRVYCZeiW
         uqRuly1BQciK35kurXe65+6o9VpIrckq2YUwK15rN0u/FrMw1UcKW2MGHAJcvMYldufO
         C/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251178; x=1778855978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXdrkYkgPTA26PL0ikladf23kOngeqlDqPwT8C8tFUc=;
        b=POvxrzHfT1wfDC+Ealoluryu/en47HNq1U5WlHjchsoIc93HqiSdoAet2oqYTazPNT
         9XFpToeoQYGivh7QfUtCchcXBRhgurLf4y+O/qH2KeJWxSJMNY/xhTzlrXc8bo7XgtaJ
         qdQV+mw21ROwSPcEZhdgw1GZK71LEFIybFPlc6a/2ZcqNiecLUgGShytupLt1To4nJz5
         pgqMXrbRckncPjiWB7PnjdhqyS717IciJ8r2eZ9hBLnBXHUCI5Lky6YrkMS+U8Ja/apm
         sVU5SgZ/gjqBDLMeKv01oJMDttQHFhei5GB0xJilASzoZqrwUpHpsqVNrenu8fXok3Fr
         vT5w==
X-Forwarded-Encrypted: i=1; AFNElJ/3DATfmOl4f0F3389Q/KRfGm/nvX61x0YzvfET4tDIaPOv55qccA9BrhODwYzz8Y3c/vaSjx0iy+225w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ZaTEgUTskbqrjJWU6CbuX2SlsK+gFGuypZbiW825snORvhEZ
	UlzodMggzL+S7u8/cIq15WzdKbYSoZLzvf2o4B3oo4QuZdg/kMOII1jfh9CFyxZu
X-Gm-Gg: AeBDies5k591Tm82S4hoTrh9dcjgJWzAOMMZk4m133LKnqw90f3H9Jfu/FXXgM6EMoR
	/rh+G7l7OOKm8KnZwOSJQV5GBHeMa6kgzwMJVObZULm53gc8vf9c6DgfnBTZjYOsz95adYi2Lgk
	Nds35aJTNhP7O3cqUprdRZCEazN1o8lvG3LspapI1DQq9dk3BEg0RC333/ZPv0oAkVrJA5LA/4c
	1q6NYwR3Iq99xPnzuAiwlzMgadCXPYyY+dyHu3xGrmXW2I9mngCZhae1yfKx/sJWShWP/WHWXwN
	RraT/Eiwm4JkUkggjRYL5YuSaj5dQwjEpfHhBvjpi/3PHdP2Dko1LyjZVZD/6ZfPE9DY5a5uMoX
	hL/fc8TRdzSQFWlODKMD/CuL+DzxIBAS+NdWMamUsDMlXefHlmFVJlSudcH0aOsnhdNAb6aDDi3
	JH+YmYrwFl934HlOKTRzw=
X-Received: by 2002:a05:6a21:3393:b0:3a0:babd:b959 with SMTP id adf61e73a8af0-3aa8beb360amr7436988637.9.1778251177970;
        Fri, 08 May 2026 07:39:37 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm12395499b3a.38.2026.05.08.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:39:37 -0700 (PDT)
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
Subject: [PATCH v4 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Fri,  8 May 2026 23:39:08 +0900
Message-ID: <20260508143910.14673-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds temperature monitoring for AMD Promontory 21 (PROM21)
xHCI PCI functions.

Patch 1 adds a small PROM21-specific xHCI PCI glue driver. USB host
operation is delegated to common xhci-pci code; the PROM21 glue only owns
the PCI binding and publishes an auxiliary "hwmon" child device for
optional sensor support. The glue is built-in only when enabled, matching
built-in xhci-pci, so PROM21 controllers are not left unbound during early
boot if an optional module is absent.

Patch 2 adds the auxiliary hwmon driver. It exposes temp1_input as
prom21_xhci, does not wake the parent PCI device for sensor reads, and
documents the register access and empirical observation method used to
identify the register pair and conversion formula.

Changes in v4:
- Move PROM21 PCI handling into a PROM21-specific xHCI PCI glue driver.
- Make USB_XHCI_PCI_PROM21 built-in only when enabled.
- Rename the hwmon driver/config/name to prom21-xhci,
  SENSORS_PROM21_XHCI, and prom21_xhci.
- Return -ENODATA for suspended parent devices and invalid raw values.
- Remove temp1_label and the runtime PM module parameter.
- Simplify hwmon remove/read lifetime handling.
- Expand hwmon documentation with register access, runtime PM behavior,
  sysfs lookup, and observation details.

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/prom21-xhci.rst |  99 +++++++++++
 drivers/hwmon/Kconfig               |  10 ++
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/prom21-xhci.c         | 250 ++++++++++++++++++++++++++++
 drivers/usb/host/Kconfig            |  18 ++
 drivers/usb/host/Makefile           |   1 +
 drivers/usb/host/xhci-pci-prom21.c  | 111 ++++++++++++
 drivers/usb/host/xhci-pci.c         |  11 ++
 9 files changed, 502 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c

-- 
2.53.0
