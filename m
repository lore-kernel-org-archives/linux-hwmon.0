Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F130DD22
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876586; cv=none; b=ht2Cn3i+yBYb7SxLNfaBfg6Zo1V0RS4cIUL1GxTEeiNvmAVv5BTKql0FmQt6LWHPR3qhlafhLWbkRiwtery+XCFp2kIsxX3yCAH0/OwoVzLUzNXVE5fY+CxeK2I7wJXKftuNSIFmD3VI5LL48UTkkb4Gg3OQqCg9YULcNIAZa6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876586; c=relaxed/simple;
	bh=yQRFvW1QD9uOPmJSGIbJCGNh8jUYTnodBPaWsfb2UzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d023ZNsHo+BZIZIZ5Legg2IUHbjP6iTJn1kP17//4IMh1gAGEUWX5t3FjuVUS6ZRuwwJwmKUYSxlo5Pmyl9DkpQY0lslz+YcHHZdVkM6IaewWKY6IqkHMYshPLBh0R6TPPWstWf7B6D6RHXfcubpAuUYqv8M4yUZv3x/ijsqS04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egHGRlvG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egHGRlvG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso24953195ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Dec 2025 01:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765876584; x=1766481384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOP7ZLMDHkwDFh5g9/ZZic5yjn/OAHc1xWeOEn50GVw=;
        b=egHGRlvG6YkMtnUPZEC7wmVV+pVKG29+Mykllz2oZvT7BQLUXAL5nedDUd0tl2U+cJ
         zBtHLYXsT+kf6/ggd4sEuWd4nPI6II9yhGRJ5i9NOmbYp0oEFEs8DTj6KYmjuuTnfA0z
         LzawETtsDxg4ec3DS1jZJ+E4ODlhEUbG6HuaeGfUJAZK9Rh47GN08NqOi1Ul4rhsYKWa
         kqhA1hSSZTFOH+XnQLyqR0sZVRkBLIndAlkTe7aK7HYiHJyMKsphNspRee6PvYKEeIFa
         kgnde8wPq8iPVe/Pan9CpRxo2KSv+f/GnpA39hu/y/4PZols7sDDiHTaaeUvTobw8rvx
         KTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876584; x=1766481384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOP7ZLMDHkwDFh5g9/ZZic5yjn/OAHc1xWeOEn50GVw=;
        b=KcbE75Za5FgSV7z6Ykf/J9MM3SKfJMFBzJ9uYb6af7Mpzo/sgMMPg2GsFhWYvoHTsc
         XC+y75donNCu3shspuyhg3M/pMBAkHTtbD+LhBv8n/w1an76x2Rfn5oUrKpbwvCw9Vf7
         QqCbuTJkrSmNgRAmgdYcCyvJAZgiZ5qoGG/kTEUnucMDCp0N2tuMkXsURuWWdygqlqaF
         RYYaV1KfECKCg+MdXShwi+ZcXCLGJlpFJbJYjkyIwau4nD5N0McNZmTMpnqI/9E3UOIU
         gln6X8wTZ+ltwK8d5sOSYkcsahvlIuH+MqmKKW0IQo9rJP+9acnNUkvGhNvs6hMwu9zh
         PhVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4F4kUoWbleWEBLorqSqepj43SxQm4QUwdC6p9cvshcIuO65HGxfTBxoj5Um0l0KUdC+LgzV1X/pk2qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzziN2ulfa6O0ibSfHuuhIdlE2LHHc20VQYxG3uvZVsvGy8MhHb
	uCoLvD3vJ68YNBSgYWvVg/7/tx2Z6akbs0iCl5ZTgb3RtF16wM2WV457
X-Gm-Gg: AY/fxX75rVuF818CDIrNzROyV6LhH5+OfVTOFAWGZmGBaqawmCOPfh3ufQyZrORNM26
	5MN48oj2fo3uWpNr3JjJiekz8hXnAKaHqYnOESHh1YrVhptsBRA8nq1mk5aqYfG5WYZ100WFkHH
	TVJfl528JhmgTjvsYZ+uqKD1oa4yKdfzVKbt3P0m4r/cnLOUYfhkBvBC6+/4FfEilhi/q/kYl3l
	vRL757t5IYwDUKkTUr9RzeysXqrkMaYBJVwTwcJ7kgaXYWfDhFeAhYyp9zTOw0PRmnMArdfwOxD
	voRI99Gj2qEYe3BsdESFWo1EHGLnazsfLvbIP2DmAjz+FN5ujyqRvLzQtitvOuNI6evPVOGXC0Y
	ZpM4eaV6FwSxa9lqgP5tGLg/D/ghzpnQsMyuOx8SGhKBCa5cT8YOKmqQX+tldJM5wmwrWJbO27S
	GBxXrhKlBh/PGD4TF92li242jPgfuk4+Og9iNwpL/DuI55s6baM8toTyCeBEjLxEja1a42ivo=
X-Google-Smtp-Source: AGHT+IFd4mueVsWDS2ObGOuzqV3eiOhS+Br6z6NIAFVwHdsJu5/6SOF96i7zfdznFUM1v0T6mpnn8w==
X-Received: by 2002:a17:902:e841:b0:295:596f:8507 with SMTP id d9443c01a7336-29f237c6c00mr144338785ad.0.1765876584217;
        Tue, 16 Dec 2025 01:16:24 -0800 (PST)
Received: from JF.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d50f9fsm156470525ad.44.2025.12.16.01.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:16:23 -0800 (PST)
From: Jeff Lin <jefflin994697@gmail.com>
To: linux@roeck-us.net
Cc: jefflin994697@gmail.com,
	grantpeltier93@gmail.com,
	karanja99erick@gmail.com,
	chiang.brian@inventec.com,
	krzk@kernel.org,
	william@wkennington.com,
	tzungbi@kernel.org,
	thorsten.blum@linux.dev,
	ninad@linux.ibm.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon/pmbus: (isl68137) Add multiple-function pin for
Date: Tue, 16 Dec 2025 17:16:15 +0800
Message-Id: <20251216091617.2581192-1-jefflin994697@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set add support for multiple-function pin for chip RAA229141A.

The RAA229141A extends the standard PMBus current monitoring with
multiple-function pins that allow sensing the current of adjacent
devices.

The changes include:
1. Add support for multiple-function pin in pmbus
2. Add multiple-function pin for raa229141a

Jeff Lin (2):
  hwmon: (pmbus) Add support for multiple-function pin
  hwmon/pmbus: (isl68137) Add multiple-function pin for raa229141

 drivers/hwmon/pmbus/isl68137.c   | 45 ++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h      | 12 +++++++++
 drivers/hwmon/pmbus/pmbus_core.c | 18 +++++++++++++
 3 files changed, 75 insertions(+)

-- 
2.34.1

