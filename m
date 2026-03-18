Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854803EE1E2
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860829; cv=none; b=uRIbcs/jOk4WJYMtVX7dX3Ta46pH8s1IwIMNFKtumMtabzR6AUNoTIceuC4VXKIiGtJrhHotPGQjbfPTPrkXlbg304ospo2HiPqHtLDS47EYUmJFXy2Gpn4cVITj5SKXiuK4gfkmJs334CzgNhp1wveEIqhThURTC8WUdDWKgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860829; c=relaxed/simple;
	bh=cEBNUhVnAV8gfEL2dCMTVQguFRfu/y2mlXF6Ox8Y7zs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y75Hs+Jemh6kSO53rSCP6b1s6hw3VkZXaNt0vd1Qu4IvL5S7tXdXwFPzEFPD3p0DUgUNDo8gyNr/xDdqRuw5/5sQrYGtSYpXixXIEEASCYvmkZ1vfxJq5sPk8UW0tQB4/MlxtUOIYC8aOnFwZTi0n6rjNecOsPI87ITGJgtt4O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkPHgFiQ; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkPHgFiQ"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1271257ae53so313794c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860827; x=1774465627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7mL0MlsTpYSb8HA+6f0RuA3s0tVHH42SNWNUr/L9h2s=;
        b=AkPHgFiQ6kPlPXfCeFbGCyPGPxTbqMClvNoDldfctQRNPbI1vAneksRtN3lnquz9fo
         hlnodMqwr8gdrpGhzgYe7PrNQpseB6mRRERtAAupl8epCkRuqe+2AECJFwnjlTmzr+g8
         8HytHjXltsmKYVSg1vk8JgjTb4LQQzN1nPxTe2WAp9If5jGYc1LeMO+MmKDPowCB5VnQ
         qSYYNemAXobNS4L26QNRided9vxjHzr65O4Ln0svaafPnHFPyMlBCO1Wy57RH92Dneaz
         bJ8TentJ84X3TkRhv8q/+0XmC0fh3Ftr1RifsvSP7EQPkgzZRFdSLEQ7Zq3m3WiVm0t0
         VU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860827; x=1774465627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mL0MlsTpYSb8HA+6f0RuA3s0tVHH42SNWNUr/L9h2s=;
        b=UlCJ7lv56cD+uvjtf6pfl0VwzJC9IFh7uCt0KZAj3pTxTzBPCh6dfEHUkuPxZpX2OI
         0lycG48Tr3ny4qiqWl/GrUBHc2nQaAFY62R+WIaOf+KTRMVuhP9VW85tvhbC+gXa5RjX
         WJVBxb0ipdsRtJ29g9tqv9rF69JmhjeQxw4MMRfzEvO8Kx71v1/Leij71Z+iv6+EzVAD
         qvEV7P7PZVog5cgoQd4uXXXV1ztcWB+2iJ0FtEwBzT/JOyAoGbG7do1PYccMfrvjs20I
         kmN7kDdt3eDNxq6ed+RKS9TMLPzi9cwmeC6Oolyzhz1T3HXq4Tk9ukjWXAZ0lfgdC4+j
         FpHg==
X-Gm-Message-State: AOJu0YzU9gs3WZ0C6TGSqakMe2uGg0aS9CcQNLDEGppBGLS2aF563u1y
	G0SePXpXjdaBjm62K6GoMExqdXdzp3wzEe8DsvnBr1BCptTQvVhHO0cg
X-Gm-Gg: ATEYQzy4GxoOe+NZwq3TGKe+im47C+u8SnNIA/pSCCYLR9rOSRsM7e0YHS9VsKDdphm
	9S4/7qUDQCdF1BzzQa95FT2+1huMQvW/olLYsBsS/3PsKoISvK78+c1vKBQKdWBeDa9ieOYeaw3
	aRWiBPJwV6Hj+R/+wEzR/JRFxw8cReVlRHMJUxzycP/vbLkwDqvF+jhI0rea5sutKDrF8IchrqF
	Q1h93Z72yQA/m10828z2EAJy0Cq06Wxe0cMhbZUTBJ4i0Q8Qqc85nNA6XfXt16TMf+mQmYRJh7B
	od1jyAhWbm39vg6strZ0uQyI9AFf9Nzwf2KgdB60Lw6LeBkJXtIYFZgGG2I8yxqPsG5jEmMicmv
	eK0FY0MpveDgAnvI8KV0l9bdM6geqNt7vaTMWfOUw31xLv4l80gHL3C/oR9PXLHHKnDvhRLCOFZ
	NWro83gES7sOIvNwPW/qppMQ5PqBZn9fgtF4bVX+twOkUPbiEtrYzOzg+uNcwjboQ36SChNxMx
X-Received: by 2002:a05:7022:e1c:b0:128:c1be:1560 with SMTP id a92af1059eb24-1299be72886mr2358705c88.12.1773860827422;
        Wed, 18 Mar 2026 12:07:07 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582dd5sm4894424eec.15.2026.03.18.12.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:07:07 -0700 (PDT)
From: Sanman Pradhan <sanman.p211993@gmail.com>
X-Google-Original-From: Sanman Pradhan <psanman@juniper.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v3 0/2] hwmon: (pmbus/max31785) refactor inter-access delay handling
Date: Wed, 18 Mar 2026 12:06:41 -0700
Message-Id: <20260318190643.54372-1-psanman@juniper.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v3 series addresses the feedback regarding the timing handover
between driver-local pre-probe accesses and the PMBus core's timing
management.

By exporting the PMBus core timing helpers and integrating them into
the MAX31785 driver, we can eliminate over 100 lines of local wrapper 
boilerplate while ensuring that both standard and raw I2C transfers 
respect the device's 250us inter-access delay requirement.

Changes in v3:
- Dropped the u16 -> u8 wrapper type fix in max31785.c as it was 
  already applied upstream.
- Fixed a comment style nit in max31785_read_long_data().
- Added an explicit max31785_wait() before pmbus_do_probe() to ensure
  the 250us delay is respected during the handover from driver-local
  timing to PMBus core timing.

Changes in v2:
- Dropped the i2c_smbus_write_byte_data() wrapper cleanup (applied upstream).
- Patch 1 (New): Export pmbus_wait() and pmbus_update_ts() from the PMBus 
  core, and move PMBUS_OP_* macros to drivers/hwmon/pmbus/pmbus.h.
- Patch 2: Replaced the usleep_range() sandwich around the raw long-read 
  path with the newly exported core timing functions. Placed 
  pmbus_update_ts() before the error check to ensure the core accurately 
  tracks the bus transaction even on failure.

Sanman Pradhan (2):
  hwmon: (pmbus) export pmbus_wait and pmbus_update_ts
  hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses

 drivers/hwmon/pmbus/max31785.c   | 182 ++++++++++---------------------
 drivers/hwmon/pmbus/pmbus.h      |   9 ++
 drivers/hwmon/pmbus/pmbus_core.c |  13 +--
 3 files changed, 68 insertions(+), 136 deletions(-)

-- 
2.34.1

