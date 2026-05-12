Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407EE2727E2
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550302; cv=none; b=fcOd5USCZOXHc/fy1gTqRGjEFDoc+d4tnqt0d8TU10l2z+odDCmdcYld2tw/9+am+lhEe4L0fMX/cQnPuwgXRL/Bw0AgWUmkKPikyzCYSwrl0qW1Mg3CL2b2VTeSHLe00pkJTQZ2jLVgGkQHXeY8H++/UXSm/bNy8jKiHDdcEBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550302; c=relaxed/simple;
	bh=YFqRwDZh6NjIUlVojwMTqSW7In7Pd16pnHVzmRsjrMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GKIMcVadfm3Rp8K0DdYDqGDSMPlmqzV83RRJtEhECFdij5X/Ml8X9OTbtPeMKRrGE/eye+oWwY3fWaHsyVfSyU2JaAYafpJ3fXp6RmhKFLs+KTdvXb3mi7qLmKpXp9lRaK6M61B/Dfmm3wX7u9kuFB6jVufGFtvn0DKFOnlGQ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=cVf9Gkmw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="cVf9Gkmw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso5542936eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 18:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778550300; x=1779155100; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bquv7t3kUsD7keFlHzjXTIEb+QxEuCA3H6GN7PZtrYw=;
        b=cVf9GkmwGA69/6haFNwnJU4HtbcVYVdKNXeh4lt052YvQWgxizFSmfoNZKkVvpiDZe
         dwI6Mto2sEVB3i8VxOjA9HVh9lQ8pj0L9NsvrzcGCeBokOwP4qnXTHQffFcLhg6aJZBU
         Jum801k8WHX5OPDm1uE1eMIx2091zbRPdzXNEgKG6PrM0JbwT0e0UYzh2poAp5vKjgKn
         C3f2WyaMzNiZuIMZ4YIGRlRh6KYSU9qOWOKTj9yCOQQnanJpeA6ek5+8BLA/YR9IDU8O
         IKRAgq7wpM9D4k21bmQLSkcxNMtrvKBS+/vAy/K8kFYUdlV2Iqnmipxu7V+b/QT6GQTE
         yVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550300; x=1779155100;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bquv7t3kUsD7keFlHzjXTIEb+QxEuCA3H6GN7PZtrYw=;
        b=XT+5buKifOIQGds1myTPHpz8IaajFi1zASsxThz+3QLeOIp2cGy9nYkmyxzP4LSLzl
         /vJHMMaMIm6wMuNzDFXwgeGm/xD7I//7yh6h6W2TdSVe+BvIuz5HcyZuNE/VHk6iGV8c
         Tg1TO3bxW+VZkxnhgGu1Ygx6kJ/RzcBerTv0k6VEHzy4atK/+91PnT601XSObNMmIQKk
         Av9OmY4PV/YGXtkj1E+ztMbaFuewdDw2R7bUsJAeFWVOtz/KtG8K1IPCsTRilqZD0F43
         aM//i7fIuwfcsMpmbtMl/u7Jx+NjWv5wG4wH/SqaqOX+4/ZJSFCQaUCWcrcYOUA3Nvxh
         u2Dg==
X-Gm-Message-State: AOJu0YzSHD8vvKI+qOZbhFIH1Un6Px5V8IBd86yaIBeXoolZbCxxTWgX
	mv2d87BbscBxOo95P0tjaIfFTYEpF/MuLACtboXDEodVZb0gDyFH+rVeZ8cc57YOk0s=
X-Gm-Gg: Acq92OGqtWJIzjDG1e557XODrXDXatkXHKWScuazW8OqghAcX+r+TgjanCEo7HCtvDP
	bTxTbStE+EJE1g6CfV0kmJRMrjlXwvU7Q2q9kN+17ZsZCbpbzyb8/nb2vS7yLT0yBYDn2somPHi
	+mjK5lBxbrwpbqN1ky/8yJMpYYF1g3+Le4vyATGkAMgPgYP1KMQVnPr1NNUcwubr/wXfWqTUG4j
	OF0DSnkWyHzvTZtIK1XrO5u6Ypyt6SL7iaqifM8+4PqDO+xNKw9jCC0kkZlmm4HAXh+iSWMMesg
	DwtAlDjtjTWjym7gqe6D1EBP7YX8sWZ9/xb7QF7h7jbF3aB7R8gZ/BLcQFNFJy0VB4mvG88vYOi
	x4+PCDF6LAsuj7G7lF5nG1ON4NwMUbnVtLhlZJabkt+uhZX6Z+TWMc5FQKXCZLbNt1x8UmOgh3R
	R1y8paZdjvmkBP1ea/3MUksm6i4w==
X-Received: by 2002:a05:7300:dc0f:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-2ffd77e63d5mr554526eec.20.1778550300315;
        Mon, 11 May 2026 18:45:00 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15815467eec.28.2026.05.11.18.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:44:59 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/2] hwmon: Add Murata D1U74T-W PSU driver
Date: Mon, 11 May 2026 18:44:26 -0700
Message-Id: <20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqFAmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0ND3RTDUnOTEt1kg+SkRIs0w2RjExMloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AjGVykmoAAAA=
X-Change-ID: 20260511-d1u74t-c0cba8f1c344
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778550299; l=1549;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=YFqRwDZh6NjIUlVojwMTqSW7In7Pd16pnHVzmRsjrMc=;
 b=xhnCb6pxOKl4xmYeOy1aIfKyZ1R3lAL/337Xfldg38FvMCJRHU+T/GSj0zr8lBl3araHcCDAm
 7g3DtwA0O0RB04qcDjCLsg0NA6+vuYKKXY9ITBgXqh0+Xi2JvJQcC4r
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

This series adds a PMBus driver for the Murata D1U74T-W AC/DC power
supply unit, used in some Open Compute Project platforms.

The PSU is PMBus-compliant and uses the linear data format. The driver
exposes:

  - input/output voltage, current and power telemetry,
  - three temperature sensors,
  - dual fan tachometer monitoring,

through the standard hwmon/pmbus sysfs interface. Probe verifies the
PMBUS_MFR_ID and PMBUS_MFR_MODEL fields before binding so the driver
only attaches to actual D1U74T-W hardware.

Patch 1 adds the devicetree binding.
Patch 2 adds the driver, hwmon documentation, Kconfig/Makefile entries
and MAINTAINERS section.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (2):
      dt-bindings: hwmon: pmbus: Add Murata D1U74T PSU
      hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver

 .../bindings/hwmon/pmbus/murata,d1u74t.yaml        | 41 +++++++++
 Documentation/hwmon/d1u74t.rst                     | 97 ++++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 MAINTAINERS                                        |  8 ++
 drivers/hwmon/pmbus/Kconfig                        |  9 ++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/d1u74t.c                       | 85 +++++++++++++++++++
 7 files changed, 242 insertions(+)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260511-d1u74t-c0cba8f1c344

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

