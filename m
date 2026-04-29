Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1A38F65A
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462186; cv=none; b=VbI9HgnH/XRpxybNoYPArBIfIH40xAwHHWGmVVCV6l7RHwGnNJkdu0IutmcH47p0OoaQYhrqJFSw8QXQemwL0a2cp9GU3NEYtOMwTideHkVZnR0a9aNCLmYIDtHbiwbFLJOiX9Mfouip/HfreDnFoK3Pi7IO/z/XgnMbGGFyOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462186; c=relaxed/simple;
	bh=xe+MsCXfl3p1dLsFN+TVjTQqPTbPPjYf3XDLon7gknk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B9hu2YJDKFhrW7DOBQ31Aq+nFi0+Waj3U5RTw8dvx7+NFATOCVGgFJg3tz7wndMH/odpFF/OCHV3rycWXbJt8hiuxZ0XAiFxdy/XnAAtGGG5+3K4frSEoKQlzBnhCOmfi4c1w3HDPwY22LBU+AZGJFmPdudhmOaePSzzF7pQog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=fpnIIHLu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="fpnIIHLu"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso8771692a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777462182; x=1778066982; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeXECNGBJvHPKxS7FXZaQMkrp4TodQ+oswz046Aqoy8=;
        b=fpnIIHLuafih4l5VISLoRgjCGdVAU7SarBKN/F8i6EhxsfSGEIauVEUhvN+aPJtWPE
         5B8zLVu6pGWZGHf1tF1bQerUJRrblITODQ/nffxvQ7/bvhPdpc0URK4hm94xWsOCIlNM
         sckkrouPNqiRqlI/xv39jBTxBeRhstuPKSuTNqTgB9j2wbkRhq5AYXDpweARKF9u2tIR
         HIV9vAgQW5gzVS14y1A5+pAxJQCB9Krj4tkOThIbfMudShj0vys8zrP9IYh+yNvOVZyW
         AY4oAQxEkuU8KwV4TMm0IbzpUWNGNXGXAK1HSrekh3fj9sZGyPFTBPi2TmkKLVBs4Mls
         xzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777462182; x=1778066982;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeXECNGBJvHPKxS7FXZaQMkrp4TodQ+oswz046Aqoy8=;
        b=k96S+O9WxCH3JhZBq5oQn3KcWIDPvYHCDb/2LX5SipDJPf7Nwngq77/2aas/8STPgO
         PT8eWARjLzEM4T8vbOdk9kIfIrmh05fA+a9ZTJ6M+HmWrg4xShi4zQnTCayouYM93IgA
         ycCUTDpOE9CxMPYYj3v8yxbnon8hH3p3Xud8lw0d5ATUIyZyc6jFlfFFDqBbWza9eEjt
         zce/7DNfJ9Cx53mUT3T/dvLlMIxVCxpA5kl+8OFvUtv5zIL5K5I9yGznu6Y8qA5bgRCc
         IXz3BBkBJqLdaRiNTYxFC/VQrFYGKyoOpl/t+u97/pshvjdPhmvaKjZQJ2ep3V8jb3OB
         bAig==
X-Forwarded-Encrypted: i=1; AFNElJ/bR4MIw7TyTl2AAfKAtW2kD/ZiVp2CpuThAGJL7BWunvUfPnqCUV66untdEqDmLTxdXO/qhmntAYRQ2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3IyCky27ESA9FYfne6IpXAZgELFH7c/U9WSJhf/IIfPiNt3P
	uyZVf2RlfX2Qj3y4v8Fr0Y33BtFEMyKqRu7GBcmvZ3b7oK8uupd6by7hoPnQs/C01+c=
X-Gm-Gg: AeBDievqg4JvEodK+ID19K6oIxdLRG5OgCjhsmsYlq8boGGs9DYRywHUPXrFFuVJFmu
	BSzkd7jfrzmJLtZbb21sMnuwrsUPh22JSoWpZSkWenj6dx5VJc6YmyPS0emF67RQy1rJlMX7tpy
	u6SF3RKqeViksc0PgkixvkwytyP1vLaB7YcV1Q4FFSu0zH6YqRl8M1crLeB8TU0wWhETvh1Pzlu
	ZcIzxIHFYTU6gu1X5BOd2A4IjvLarSwKGtjVOs3op0TP2URUNplVI0yF+Yptgq0A6lYw80+Yfcz
	ozC+x3a85LCUeZVG38qy5PL87t+ZlOEPJBoaeFXeBN0OvTDKBNdmg8sD8YNyQZQ4n2J2wl7HGjx
	FkP3OiYlmuBi5bmlagJatnUjiwhjFObF7ffhiSac8ltJGLOc5eOJ6GOWog0lV2C/pnsXEv3++P/
	LseW4QC6hNGIx1blwM/aVHBJqd4k7K8EEoIhhZGwPl
X-Received: by 2002:a17:90b:2f8f:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-3649202dabcmr6868224a91.20.1777462181860;
        Wed, 29 Apr 2026 04:29:41 -0700 (PDT)
Received: from [127.0.1.1] ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a41520dbsm1923048a91.3.2026.04.29.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:29:41 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v7 0/2] Add support for q50sn12072 and q54sn120a1
Date: Wed, 29 Apr 2026 11:29:35 +0000
Message-Id: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/r8WkC/53QTU7EMAwF4KuMsiYocZM4ZcU9EIv8OEwWtJ2kV
 KBR706mEmKEuinLZ1nfs3xllUqmyp5OV1ZoyTWPQwv4cGLh7IY34jm2zECAFigkdzHy+jFNY5l
 5Ggu/aFEHCQKBuyG2qLbo2mYfoO/JRCsja95UKOXPrevlteVzrvNYvrbqRd6m/2lZJBc8dBa9S
 z3Y4J/zsNAwU3gM4zu7FS3wgxvRgTmCQ8MRfUAkigHNDt794krAEbxruEGnpVXUd97u4OoOl+o
 IrhrurSRHTvUxyR1c3+Fw6HK94clbBAPW7F1u7nE8gpuGp+Ta25MzmvAPvq7rNwGOVMi2AgAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777462179; l=3701;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=xe+MsCXfl3p1dLsFN+TVjTQqPTbPPjYf3XDLon7gknk=;
 b=1exsHWiBxZCh7ojc/W16G4fD0TFJ3AV/GN2AdaW2DaUgnTyBHAgvY4Wv8VYF46/u3z51xKx+D
 gcdcjkbTiqrDtfCQEXqYouyOSpiZekzZGBcLhhJxyaklodMsAhZHGed
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q50SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <Cheng.JackHY@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

Changes in v7:
- Restore the PMBUS_WRITE_PROTECT register to its original state
- Fix potential denial of service by storing user input berfore
  acquiring lock
- Fix use-after-free risk by moving pmbus_do_probe() after
  devm_kzalloc() 
- Link to v6: https://lore.kernel.org/r/20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com

Changes in v6:
- Add lock to debugfs read/write handlers
- Remove the incorrect Co-developed-by tag in cover letter patch reported by checkpatch.pl
- Link to v5: https://lore.kernel.org/r/20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com

Changes in v5:
- Rebase from 6.19 to 7.0-rc7 for review
- Link to v4: https://lore.kernel.org/r/20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com

Changes in v4:
- Add null terminator to prevent comparison of uninitialized data which
takes place when ret is shorter than strlen(mid->name)
- Link to v3: https://lore.kernel.org/r/20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8@inventec.com

Changes in v3:
- Fix MFR_MODEL detection by using strncasecmp prefix match, without the strict length equality
- Move blackbox_read_offset debugfs entry inside the q54sj108a2-only guard block
- Sort the debugfs entries by the order of PMBus register addresses 
- Link to v2: https://lore.kernel.org/r/20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com

Changes in v2:
- Drop Q50SN12072_DEBUGFS_VOUT_COMMAND debugfs entry
- Add .format[PSC_VOLTAGE_OUT] = linear explicitly to all three chip
  entries for consistency
- Replace hardcoded MFR_MODEL check (ret != 14 || strncmp("Q54SJ108A2"))
  with a loop over q54sj108a2_id[] using strncasecmp to support all
  three chip variants dynamically
- Remove of_device_get_match_data()/i2c_match_id() early chip_id path;
  derive chip_id exclusively from MFR_MODEL hardware read
- Remove unused .data fields from of_device_id entries
- Guard store_default, blackbox_erase, blackbox_set_offset, blackbox_read,
  and flash_key debugfs entries under psu->chip == q54sj108a2 check
- Add dev_notice() when configured device name differs from detected model
- Update MODULE_DESCRIPTION to "PMBus driver for Delta Q54SJ108A2 and
  compatibles"
- Fix commit message typo: "Q54SN12072" -> "Q50SN12072"
- Link to v1: https://lore.kernel.org/r/20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com

---
Jack Cheng (2):
      dt-bindings: trivial: Add q50sn12072 and q54sn120a1 support
      hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 drivers/hwmon/pmbus/q54sj108a2.c                   | 238 +++++++++++++--------
 2 files changed, 151 insertions(+), 91 deletions(-)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

