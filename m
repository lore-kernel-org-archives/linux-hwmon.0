Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD733F44D3
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883126; cv=none; b=dh6wd+qOUnUQzl4b1I+1qrcoLXXpDDYzh4cme3CIw1MkTfDQruJdTrWp4s2ia52mscS836Ip9TV29+9nV2osG17lHrwcX9rnjRvF6QWFZEf/TETDgZemM8KaPpEqOZye8+k6bALp0+LTsgxQ4p5uUxYP8Z8RWO+zlD6z9MCLQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883126; c=relaxed/simple;
	bh=RfTbHXTtWWODsb9OziDmC4Vc8FN9qu30mpR5DxlCs9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cg1O+wAPqwkDUrlcqO2zyBCEGcJ0udO2G2+PghIMUApWa+2uD+aJ3dphLtkKA3NqQZiF7GpdhUJMtIL660zLyswn2f4FHTu8wzwPp0zLxpZQlyZNx1Ui9vF4zn6hjkWsXMfx8GqGbFBjoRe12ug+T1ZpxwbwSE1PjDqrwvPLzjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Fi2wnLHI; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Fi2wnLHI"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f7020a928eso451331eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 15:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778883124; x=1779487924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HUkmtxx2eQM6PsxtArDmQW5eFZT58DVomuM33dLeJSM=;
        b=Fi2wnLHI8qfifSxGpibHE/ZkFwI9qtuK/+XgiIpm8/1Kctgp4M4Zu+WKEXsYCKifwI
         wVUT/Ss4v3gm75hFFGTI7jzVSwm1DmNZn6AE7uWjsnaU6eYMHWut2KTnibGnF0RxuSiN
         Tlv5UCPmOJn8cvTt90OjHhQTmLm1YGhFTP99CvjS5jmP5zGVGVQoM3Jrx+jWP5aYB1eT
         RlN4lleQBnu9dMH6aK1QLGnc7MTNTKzwmZBHKqPg8mYMbPzfdT8ANsAke/PhPnpuMLD0
         JpbmDIlBOyIkGJTn38OsDGGOGVCRtgExILGelVcKbzPEDbnn+c3+ooihlCQyfo7Y1Q1z
         g1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883124; x=1779487924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUkmtxx2eQM6PsxtArDmQW5eFZT58DVomuM33dLeJSM=;
        b=OtXUpoqiF9cFXLn/JaSPbO2Y22a6Ij8bftgvnEdU2+8gIpRiaAxd6foXMUJL73p0nk
         YzlkLj3KbZI4NA8oni5j0CV3ymqdpqFM2e6SamyeK/sjO1q66ShX7FNvOXu8xoNzD9NR
         pgHE/rTmkYocspBWM9+7bh0WXnONejuyex84jbtsOBk2Oy0gLD5eyZz3f6H+3y7JUTin
         Gx/i5gtbVF0674K7l8PYD35ZOgL1eyHqtMCzuNv9Ka0pqoZpHKNFw6h6kGvYS2u9twvf
         Btdltcje2nyfDFPhxbrCv89IxjBalCiQLMK6Pi5pv7OIX847WNpYysnqQQknsQsW2RRI
         nXHA==
X-Forwarded-Encrypted: i=1; AFNElJ/hAAEQaykvHJMUOqeLqzMKDdninjXdjRHZ53i0bT/Z6x2Tlln4/PS6pQZjRTrqh+yxopewfm+x0u2SHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/0jGTVk7y43lMdjfW3xqpmrP57zr9k7msOXsfhoB9T6HKaDy
	D+cSsj0f8UAv7nPAd0v/GB87D/B7Gm4P5hMmxbP1AH04LZDQObbIp0tyaiYvtWq7iPs=
X-Gm-Gg: Acq92OFtjNJDfu3Q/5PzHy7NW5BEwS+tbtrFRmmsNHGQCfC35tpMBBfifxbVmYeu2cI
	RZKvAsBYYzzHw8HaKtGR/zcpzr0EGPM7XZwRSkts/sL8ctCLvQp8DG5rMxLorGyG6IrS9lThdCN
	MZIbkc2hFsVQ11RTcfJaSIFyjStLPDX1Y0VsEz56+2UAZJYUwMfmP9CC5RPmecYUIMhihMrcRRr
	uAsGe7ZFL7vLVevu14hLuv/6a7TQlU2FYul+jyhnrZmEVVH8aBxb3hsXRpH6YxOgKVpJWzcMnnN
	wqlRh4YGgfZiBeZ7FhNEWVyQbTrJQ3MBgKPz5GCwZC2O4oOPPUxq9CMLxtKNh7M+kpHYks9l6QD
	HBss8GL2wVLIEpgCfWWZKukrQeA0BDq8IATQtDVaTKNyCOYphg+vaEjcTcT8yzUuKaRQEljYiDz
	olXfpkF4bKMPPgJf6ooL2IkR21ow==
X-Received: by 2002:a05:7300:7255:b0:2d0:239a:23c9 with SMTP id 5a478bee46e88-30398677161mr2992844eec.16.1778883123579;
        Fri, 15 May 2026 15:12:03 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm9626315eec.5.2026.05.15.15.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:12:02 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/5] hwmon: (pmbus/adm1266) buffer-bound and timestamp
 fixes
Date: Fri, 15 May 2026 15:11:46 -0700
Message-Id: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACKaB2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3cSUXEMjMzPdtMyK1GJdC1NjAwPjRIO0xBQTJaCegqJUsARQS3Q
 shF9cmpSVmlwCMkSpthYA7WjsjXEAAAA=
X-Change-ID: 20260514-adm1266-fixes-853003a0fad4
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778883122; l=2272;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=RfTbHXTtWWODsb9OziDmC4Vc8FN9qu30mpR5DxlCs9M=;
 b=rP2wtJ3mDP8/nSTegyS/eUZ1nq6KajPvOzUbZkPWqE0h9Ad/1A/03vvHDf+0pBbmZPJr+BwFv
 I5eXK/G0oaTB1AnWSRSTuSYJVZFkZqarubs+9sor67ivzkDVXuJyOnw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

This series fixes five pre-existing bugs in adm1266.c that were
surfaced by automated review of an in-flight feature series for the
same driver [1].  None of them are introduced by that feature work --
they are all reachable on the existing driver as it sits in mainline.
Sending them standalone first, with Fixes: tags and Cc: stable, so
the feature respin (v5) can rebase on top.

Patch 1 fixes a CLOCK_MONOTONIC vs CLOCK_REALTIME confusion in
adm1266_set_rtc(): the chip's SET_RTC register is documented to hold
wall-clock seconds, but the driver currently seeds it from
ktime_get_seconds(), giving blackbox records timestamps that reset
to small values on every host reboot.

Patches 2 and 3 fix two ways the blackbox-info path can be driven
out of bounds by a misbehaving slave: a 5-byte stack buffer that
i2c_smbus_read_block_data() will memcpy() up to 32 bytes into, and
a record_count loop bound taken directly from the device with no
upper clamp against the 32-record dev_mem allocation.

Patches 4 and 5 fix the two ways adm1266_pmbus_block_xfer() can
write past the end of a buffer: an off-by-one on the helper's own
read_buf (sized for the length+payload but missing the PEC byte the
i2c_msg length already accounts for), and a caller-side bug where
adm1266_nvmem_read_blackbox() advances its destination pointer in
64-byte strides while the helper is willing to write up to 255
bytes per call.

[1] https://lore.kernel.org/r/20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (5):
      hwmon: (pmbus/adm1266) seed timestamp from the real-time clock
      hwmon: (pmbus/adm1266) widen blackbox-info buffer to I2C_SMBUS_BLOCK_MAX
      hwmon: (pmbus/adm1266) reject implausible blackbox record_count
      hwmon: (pmbus/adm1266) include PEC byte in pmbus_block_xfer read buffer
      hwmon: (pmbus/adm1266) bounce blackbox records through a protocol-sized buffer

 drivers/hwmon/pmbus/adm1266.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
---
base-commit: 1f63dd8ca0dc05a8272bb8155f643c691d29bb11
change-id: 20260514-adm1266-fixes-853003a0fad4

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

