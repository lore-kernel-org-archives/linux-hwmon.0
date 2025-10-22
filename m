Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B322D838B
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 04:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108437; cv=none; b=fjfP5CBzNb40aPwAjH4OHdF9s3CSLPunplTFdStDsltrKmz8zIG/AQz/pPbVdNqntyweSET91AOFcI6y0wo2fMMe6sRqRC25D+tgDiAIsftKyDJnCHsXAfVNDFcZCQNTdcglKTn4Z5KWrbt5cSIili44xWTKtetPErOHtqqRbZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108437; c=relaxed/simple;
	bh=UeMi8wOq8P2oR2c8IuVTIvVV1TkHI2TplJ7c1V27Jf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riV8ovD4Weps+obnL4IDBsxNCSvytmny6Hir1V0eB8xDIxaodFSkhhr8sfAix/hz+AXuEyuquaO6H45Xq/Ruhttl+y7DI/laDjT4vbG6Y/6JCo1YnE2GF1l6b/caF4YrIQlgt977Kdp2XaE5sWN6Nxng/08cVDYXDMn0sVOqlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=EccNWSt6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="EccNWSt6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27ee41e074dso75717975ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Oct 2025 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761108434; x=1761713234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmWpCjFNbINea3PWCqs9KAgYy8c0pAQxFWiD4F9OBQY=;
        b=EccNWSt6rR/AkhLRrRuYlWV4EgNbfzXGQiIvknZzTIxcZmDSuZcZRmsMPlpysFoZBk
         41ST4640h514xJP+IPqcrCwZyhhrkqd8W7pTlMjjj4sMU2Yr0Yrjf4g8+Xs4rPD660cy
         P2cuNmQl5fYNrHuHtXiGjbx1iduZPJgh4Z8ZTJgk+jyyuFaQUf5l+Az6xhhGBqNdIqzk
         ttGO51NfXXAozuqnpDkm7OUUknh2u8EZ8TcaRjUg/XixQ/BPX5gX9tpNYAOU6Si97T2u
         IiAvsyQYSrZ3rT4maOoHVJMzrXwqsgI3lEq4su6kIYyb2BnvyHyjWGKicSd7d85I/6/7
         rxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108434; x=1761713234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmWpCjFNbINea3PWCqs9KAgYy8c0pAQxFWiD4F9OBQY=;
        b=UYD/0iB5cYxVZbQcl6EN8/BQCTG8gTOsBV51URQncCKbSmbC7AfyECGQ9TEG6NTlh1
         Rg4E+9M6MvrH1kiDOzKR4JmquPWoq7K8cgYc7EHL2ay0EB5g/n623lkCIIGZ2YpkYXQH
         FdmtbgV88SbQjWL8T7UsfzMRsO6X09ory4z78NJgjEKhsC1EJtvqhKxa1IQUWD25eott
         5vejniWfD8JkuTegtMep0lQViWM8LQE0jrccCr0h9weqcECWr2fQy5Ro9KnBj0M67d75
         5NwyzZ6zxoseSktkaIPB8gkj6EfxT6yZ+raW3/gFLbhQVLjPPlZCCOcwVI4t5F/VT7Kr
         mFJw==
X-Gm-Message-State: AOJu0YzewoYYxwGy4QX9OEHszqrrMbl6+UJlamMxAuV6aGwaoD5HIFq0
	uF6eCaClBVxyah4YamzfcbEJb1F7/EPyfkF/XCT//ohLMohVWP5RDxDIVSv922b6ObM=
X-Gm-Gg: ASbGncuuK2FxPsCczAeBXZqUn1cqiPpC9oF58JYvzebJbSheXfxpJZYnNGUZb/cwY00
	cBJd0/+4NuuLU1s+MIFm8YN4lWekrsITo5lUNyFPyggGcKfKbGYJhImvpwIc1B4Oh7KhLzwMrx1
	d99Gqd5/8kMku0aFM2i8NCklGm/38LE7w0TiXeX4nlOYAxrJ9SIvBGX5GeQm2+nQLXkuvwi6vPR
	TQInoXQ/rwNFoSIXAdeXhRiHoAr22sRvjtFtsME4gEr5iglrnZfjAVkyS4naQN2RgwCLlaYYhkl
	ZDJKwLGR1FlohSCzT4A/MhBBW1AHIyQYctstJwjG3WlPuX/iXB/eqiGHgpwMWOnI0bSIicOu0/X
	pim3WA18jf1hRUteOUcp465fOy63I/Chw5DiumdmkDxlFwfdrrPy97N3hmU8+697Orhqo4HctYp
	IOAT3FdChiLZFtooY=
X-Google-Smtp-Source: AGHT+IGQMINIDphenVyGBthc7D66TfZYg33GMQZDeFMiv4qZwcZZxv+fFMJb6PBNUzYeckgkRMS22A==
X-Received: by 2002:a17:902:dad0:b0:24c:d0b3:3b20 with SMTP id d9443c01a7336-290ca12180emr248707485ad.37.1761108434628;
        Tue, 21 Oct 2025 21:47:14 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:8004:e310:f3d:dd0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dd9d6sm1257413a91.7.2025.10.21.21.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:47:14 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 4/5] Documentation/hwmon: Add TSC1641 driver documentation
Date: Tue, 21 Oct 2025 21:47:07 -0700
Message-ID: <20251022044708.314287-5-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022044708.314287-1-igor@reznichenko.net>
References: <20251022044708.314287-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hwmon documentation for the TSC1641 driver. This includes
description and the sysfs attributes.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 Documentation/hwmon/index.rst   |  1 +
 Documentation/hwmon/tsc1641.rst | 73 +++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/hwmon/tsc1641.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 51a5bdf75b08..4fb9f91f83b3 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -253,6 +253,7 @@ Hardware Monitoring Kernel Drivers
    tps40422
    tps53679
    tps546d24
+   tsc1641
    twl4030-madc-hwmon
    ucd9000
    ucd9200
diff --git a/Documentation/hwmon/tsc1641.rst b/Documentation/hwmon/tsc1641.rst
new file mode 100644
index 000000000000..a93d1e72c70e
--- /dev/null
+++ b/Documentation/hwmon/tsc1641.rst
@@ -0,0 +1,73 @@
+Kernel driver tsc1641
+=====================
+
+Supported chips:
+
+  * ST TSC1641
+
+    Prefix: 'tsc1641'
+
+    Addresses scanned: -
+
+    Datasheet:
+	https://www.st.com/resource/en/datasheet/tsc1641.pdf
+
+Author:
+	- Igor Reznichenko <igor@reznichenko.net>
+
+
+Description
+-----------
+
+The TSC1641 is a high-precision current, voltage, power, and temperature
+monitoring analog front-end (AFE). It monitors current into a shunt resistor and load
+voltage up to 60 V in a synchronized way. Digital bus interface is I2C/SMbus.
+The TSC1641 allows the assertion of several alerts regarding the voltage, current,
+power and temperature.
+
+Sysfs entries
+-------------
+
+==================== =======================================================
+in0_input            bus voltage (mV)
+in0_crit             bus voltage crit alarm limit (mV)
+in0_crit_alarm       bus voltage crit alarm limit exceeded
+in0_lcrit            bus voltage low-crit alarm limit (mV)
+in0_lcrit_alarm      bus voltage low-crit alarm limit exceeded
+
+curr1_input          current measurement (mA)
+curr1_crit           current crit alarm limit (mA)
+curr1_crit_alarm     current crit alarm limit exceeded
+curr1_lcrit          current low-crit alarm limit (mA)
+curr1_lcrit_alarm    current low-crit alarm limit exceeded
+
+power1_input         power measurement (uW)
+power1_crit          power crit alarm limit (uW)
+power1_crit_alarm    power crit alarm limit exceeded
+
+shunt_resistor       shunt resistor value (uOhms)
+shunt_voltage_uvolts shunt voltage raw measurement (uV)
+
+temp1_input          temperature measurement (mdegC)
+temp1_crit           temperature crit alarm limit (mdegC)
+temp1_crit_alarm     temperature crit alarm limit exceeded
+
+update_interval      data conversion time (1 - 33ms), longer conversion time corresponds
+                     to higher effective resolution in bits
+==================== =======================================================
+
+General Remarks
+---------------
+
+The TSC1641 driver requires the value of the external shunt resistor to
+correctly compute current and power measurements. The resistor value, in
+micro-ohms, should be provided either through the device tree property
+"shunt-resistor" or via the writable sysfs attribute "shunt_resistor".
+Please refer to the Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
+for bindings if the device tree is used.
+
+If the shunt resistor value is not specified in the device tree, the driver
+initializes it to 0 uOhm by default. In this state, current and power
+measurements will read as zero and are considered invalid. To enable these
+measurements, users must configure the correct shunt resistor value at
+runtime by writing to the "shunt_resistor" sysfs attribute.
-- 
2.43.0

