Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nobkJI9v"
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FF4C1;
	Thu, 23 Nov 2023 07:23:20 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ce656b9780so6967615ad.2;
        Thu, 23 Nov 2023 07:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700752999; x=1701357799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8k0J5g8fTvye961SlGaFZHeC7PjYj+KQtQkSEfcfOY=;
        b=nobkJI9vC6LppbRZ/fh0nlVFNUwxgXOoOovhLY9pYdH/EYHbyVL9IlFKp8mtbdEJH3
         xT4eV0eKImmvqd9lWsQIeijJ5tKBndxNKcrDqpo9xmTsXTiOvchPITocvlm5jI7VH7f9
         3rmw3zH0TW9HDgPUXwH7rNxOtaYoJWjGLsEXmYz1AzcGuMK5k7pnluAWTn8A4tKP0+S6
         25fAwwpKPF6bZ5EIfq1de6Te1MA+wK/uqiddwwseFUSbpeaLpIXyPf1mNztJ6Yorte8l
         ECemZvpQfnd6WkmF9f6CaPc5kvUknrU8DNrCbxblkRmomAEuIiyxxC6W04+GH1BKdyM1
         IYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700752999; x=1701357799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8k0J5g8fTvye961SlGaFZHeC7PjYj+KQtQkSEfcfOY=;
        b=dpt1tW5YiV9MmEkL3tq7yCRqA84hN13JYq1Dc5wlYQ89IDDC32UaYz59sY76qbVItX
         Vn2fmCBOndQ3gOYQ2sUOXRGUyXSSaS/RkrVS/VipR12KNA/FAiUcnt+aHvUgeGlDzbl4
         Z1DN9KeRi6L1Zm5000xmVXX47z11TgFZX0/QrB5Gm4jpJ/kLC8LiQ66WPMiPqboDYDAa
         G8vPFrsiaUr4FAythkiYNrqPHO/ni33ar8DrtnC61osAM+Q4IC+gtvcMqEQk19hZgdnI
         QbGC3y2e5PEzRlx+BEnc3qnqCRzoPQRjqkRqIY1T951Sh3z3yCQ6BAVP7K8keDCm0oMo
         EaeQ==
X-Gm-Message-State: AOJu0YzvYdhaxgd3t/PCMfZBwN0jGdUYIpcMcvEVCb7uSxZbCXPavigk
	CrKhTr3fCYH4FPPc0YlMENw=
X-Google-Smtp-Source: AGHT+IE600Ab4cUQicMoMEPXhDZXqX+n8l2zmdX8bzr6PkqlfIQjhSoXlYepYPH0IrVCo/nbyqwBFQ==
X-Received: by 2002:a17:903:4289:b0:1cf:64c9:b116 with SMTP id ju9-20020a170903428900b001cf64c9b116mr5559508plb.4.1700752999465;
        Thu, 23 Nov 2023 07:23:19 -0800 (PST)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id e12-20020a17090301cc00b001c737950e4dsm418565plh.2.2023.11.23.07.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 07:23:19 -0800 (PST)
From: SungHwan Jung <onenowy@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: SungHwan Jung <onenowy@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for Acer Predator PHN16-71
Date: Fri, 24 Nov 2023 00:22:25 +0900
Message-ID: <20231123152229.4920-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series of patches adds support for Acer Predator PHN16-71 in acer-wmi
including platform profile, (thermal) mode key and fan speed monitoring.

The acer-wmi driver already includes fan control and turbo mode support
for gaming laptops that use predator sense app (version 3), but PHN16-71
operates in different way with new predator sense (version 4).
To distinguish from implementation for previous model, new implementation
for this device is marked with "v4".

Changes in v3:
- change dependencies in kconfig

Changes in v2:
- fix typo
- remove redundant "if" statement

SungHwan Jung (2):
  platform/x86: acer-wmi: Add platform profile and mode key support for
    Predator PHN16-71
  platform/x86: acer-wmi: add fan speed monitoring for Predator PHN16-71

 drivers/platform/x86/Kconfig    |   3 +-
 drivers/platform/x86/acer-wmi.c | 364 +++++++++++++++++++++++++++++++-
 2 files changed, 365 insertions(+), 2 deletions(-)

-- 
2.43.0

