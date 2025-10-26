Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DAD1CAA7B
	for <linux-hwmon@vger.kernel.org>; Sun, 26 Oct 2025 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761461465; cv=none; b=erfplgrG3f2aCDKv8X4U7/G7Aq7Kvd7Qe2BuPazYrBOzzWXBrXzXzw9J4fz5lud8ARLrPjBk/hZn6q6nBO5MJ4IgcKE3C4SnYbETGZf0LToWv7ZhPfT7EAqzj9lNvV3DckgXDCDDn2wOLtoBv82X4o2x1YqtLRedbRn6wEp7RRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761461465; c=relaxed/simple;
	bh=e85NXa0sI3f3w+CETu20WN8BTa5YzlfYtevVbUSsSsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYbSVBswzFt+lmjehvAiWmSvqrt3fjsL3GGabDG1y8MuOAh8MWSrTPYF8u+GbtwRGV7v9MHK+SxEoND0EUjS4n5Tt4gk5IXLf4Oj5yaSvM17BpMdqsiKY4UOtfYDpElzUXio0vhkQajceHP9SYtsr9C/MHvOszLg2O8pYSQbZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=Vj2KtX/u; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="Vj2KtX/u"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b6cf1a95274so2451430a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Oct 2025 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761461460; x=1762066260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwm3y2MubzEk+9BE7WJDp/oVxvmkQrQjbNwGQzPi+1s=;
        b=Vj2KtX/u4thXrq5QECAa6wwlWAFxoOJL4e+8dQANybSDZyxF8tqut2Ll68/tq05ada
         R25Zz0uZ1+FA7DUHnbtH7iDCanDndbAuOxlJeTl/hXXUSLGDBmeMexJLoJO4Z72zVd1f
         HlLylcmKUHnESEurYB0enXyXFOZ38SVd+X0VjF8FihCAFbO44BYsUH8XKXOpOiM2pN+m
         Ej+PrIQrdn/JPnq2NXp8Bk5kYVUqx2S3mQo4YqRK5/GUw+LqZHIX24xk96caMLQPVRMF
         Ip4ie9D9bK3fz7sxQVEwhATVrwQx8WQgiZH86/1+SoOC2NW1NqX3Nyo4j6LdFJiKG5pU
         57sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761461460; x=1762066260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwm3y2MubzEk+9BE7WJDp/oVxvmkQrQjbNwGQzPi+1s=;
        b=tJvkfd67EDzEnTDQvJSm0eBsT0NdPZV8a0yPRgqVCEP4XzijmQcrvUxXC5Kegia4N5
         LuV/0q7TNOhiIzqFX0YLkTa30/W7Nf6SOYJeCe88mSmLIK6TCJ00yu1o8Z9kM5H+Tt+d
         0PZZoBxUIEhtmzrWuwI3R4BLpm1kc5Zyo+qrDqc7YZcuhp7t58y0q3cyjZTTn90RB546
         ubXxKMbBa51j2myMqAYDeFpKKMma5DQ9U26IEn2rAoBvflNu+gDDjHrY5VG39Onx5Vmv
         OwPbXQXLCTxWLP1zD3t+APEQPn2YhkC1m+zckr5wjS1hbRWaUhSRjFf1C8lofnUROzSH
         LNeg==
X-Gm-Message-State: AOJu0YyYIbLoQZxpbOpG3QYcsbAKUnMbPHj/hXSwSIdMHaQED0sRHG4x
	dyT6trcTp53gi4zjjxezAqDpOhBCtX1FcJkJAPs3lOBXh4FOHO/xsq4OhUTLzL3jzK4HEeDKjKU
	9KiHWups=
X-Gm-Gg: ASbGncsWfohUQI8SRz0ngueG6ARV4uingQaBXHKzis+wG81wAvLNAMjW9y7w/CuALMS
	WgJz6rZADeyen6offtqBwwqiirBUtn0GxGFpP92xlkLWJYCoNWOytLOVHvxVwSPmGFdmBqG8Kmn
	8rCvZTkGaNkOOIa6SHwN06mCSSJK+aLb2gsi0FRNxUE5PwedEroXD7T9fFhD8hGPI1HEW1kBYiN
	GhlgJZNUAoc5hSdt0I4hE0nYXH94X+yaKkvnongXaYa/myJtZXCbVl6nb0qyXQBTXr55D8VC9du
	UGmWGVeiJrMWoeni/y3qGbStCR5X52nXXO/MF/yMu45rXnfl5mJ+rEIFRcC/3oyoQCnhVsDQGqn
	pcHn9km/MFtvrqEcYiS7G5Jzr5S2qWDntgwV1XI3pnJ7PDHridvuXrk+oU4RPZxoyLn9gAGDlQR
	hZdcmTJw==
X-Google-Smtp-Source: AGHT+IFk7R96YXUE2AFHweAhNJTfel5qnttPqZd813Q6RU73D4Bpa+BM9FjFwisJbKplCLyC3elWYg==
X-Received: by 2002:a17:902:db0b:b0:290:b53b:7459 with SMTP id d9443c01a7336-290cb65dc2amr403459295ad.56.1761461460154;
        Sat, 25 Oct 2025 23:51:00 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:640c:95e5:94c3:cc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d4288asm43184905ad.84.2025.10.25.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 23:50:59 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux-hwmon@vger.kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 0/2] hwmon: Add TSC1641 I2C power monitor driver
Date: Sat, 25 Oct 2025 23:50:55 -0700
Message-ID: <20251026065057.627276-1-igor@reznichenko.net>
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

This patch series adds support for the ST Microelectronics TSC1641
I2C power monitor. The TSC1641 provides bus voltage, current, power,
and temperature measurements via the hwmon subsystem. The driver 
supports optional ALERT pin polarity configuration and exposes the
shunt resistor value and update interval via sysfs.

Tested on Raspberry Pi 3B+ with a TSC1641 evaluation board.

Changes in v2:
- Fixed devicetree binding name and formatting issues
- Alert limits are handled in a standard way
- Clamped alert limit values, constrained valid shunt values
- Cleaned up includes, fixed various style issues
- Expanded documentation

Igor Reznichenko (2):
  dt-bindings: hwmon: Add support for ST TSC1641 power monitor
  hwmon: Add TSC1641 I2C power monitor driver

 .../devicetree/bindings/hwmon/st,tsc1641.yaml |  59 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tsc1641.rst               |  84 +++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tsc1641.c                       | 703 ++++++++++++++++++
 6 files changed, 860 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 create mode 100644 Documentation/hwmon/tsc1641.rst
 create mode 100644 drivers/hwmon/tsc1641.c

-- 
2.43.0

