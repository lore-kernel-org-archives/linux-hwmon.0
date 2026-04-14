Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6442F6911
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Apr 2026 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149931; cv=none; b=JRXOmTct8e72T84EBKbafSDAXESp7lRjsKRPb8cwVf6NXpASIlg1cbULPFchJJAltBLuEBigLNUU9XQrpP0mJgBPAz1FRjuR0uK1W6ZvNRuKVTfyCHnpdqIPSKu4nHtixquby95Sepv8fn1Fcq2D/xxM1x7iMlm2dE0tsbawt7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149931; c=relaxed/simple;
	bh=JZKPGPIzQ1N7Z04TBth/ejt8iusUUpviQAq/IA+54HI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=neCZLOJDQrR7fq/NcGz0ByHoCjXcOUbLgfMFs6WQs1atqRWVtANwJQl+IPJJgODBBG7EtNznTBC/7WOHzb3f2nlmIeCPLAsdnnKXAvOI9YHD3SAOS/0mskbLhqIgLeRKXrVbnPuRHVDucGPpVQnfE55+kmtoJmdphHmoz18VyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=BZY2dhWr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="BZY2dhWr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so4672762a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Apr 2026 23:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776149928; x=1776754728; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNlxSzzZ1kkLS2ZGUkJtOFNbb8D9S8TiaVdklSubQ0U=;
        b=BZY2dhWrkDtGJXTFrfvPJyXwfjbERKxEZpHt0UKJCIQglpbunGFYq/r9aeRWUhSsJh
         +bBQLtf1IvelerZDVMoDTGjlRiAc6UmPQLkXDdX+XG2C1naPd+MXgSpqDPUseozFEVgi
         SwMg9eZjhCzkWQGCSROKtXvfgSC/oKtqZUsIJrKTPMr5AwCyJxNZBFK7BWZ2p1hk8DSX
         ZcigW1Fj6VZWR4oymNmurnZ/PhVEDexRD0Wh5zmeMK/wKcum3QCsG68TyT6rDo+nlKlu
         DEbo8sSxcxoii1KCfGFFmCnl0YBxK+MLQb7E4zBDRvd6FQXVaIABcf1j74Jk3duRHwjj
         nUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776149928; x=1776754728;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNlxSzzZ1kkLS2ZGUkJtOFNbb8D9S8TiaVdklSubQ0U=;
        b=fW5fXjM66wdk7VkBMjJ5C6NyVkBnZiEy1o5fR93lVIQ5ng7DkbaxOp5c5xhfAARJsT
         phPXFaIXYA2Hsgv1OrcwhiPFbei3CmVy6SNEfI8W4A58K32VBfl11dwKg7etcJoSJP70
         1JxhgA2Iy6wV1GPWePzyvKygZDtH1iaXf2/JjojRDTrmBu7YzQyr56d+LR+/85BLaw+r
         FWjMzexC/+vvc3hSZhuYpyK18Mt3KY4ozo+UQkjpH33mBZdanM3vY2z7iJTCTF44lCg8
         JYTOTMI16HZklZqBgtfGZvyvrymE1e9YOBRMR50pRRw3drGyPf8K9/GrXAOr4Fpvqm2h
         x/3g==
X-Forwarded-Encrypted: i=1; AFNElJ95/tkKway62ekoPPZI6bOVhjW7KGVY0eNdxqYQpHiSMDfOD4bUEHjg55mf5FEGCAS19f7k6HXsLBNGYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbP4ltxVu2yNhTkK8YY0DYNe1skwWzEvYjj2Hx4SB3hjv252dK
	awgMJLP3LaHy4ajR+l8+pV+NT8IYXGJXvLPCpnR6dSxIvDbUO7PneWpQQwUIXHvfJxLsKpbp4j+
	9D5Lb
X-Gm-Gg: AeBDieuhMZGsHu+0Yj/jFL4o3FjHCD3oxVKwITG1s0+/nMd+7EFbS3aTJRnDTVI64ET
	EbfeUoHbzwpbK9XseJrJjdEDBkELis4b3ovA4kJx+z7cndJGg8R5yEpRN99FUizVAcTnhIWGdLB
	MMMbkhiyIvKrrhl/uMo+YOFuDFkBCGnYhu7W1QOxmIzvNPJ+GPNt61o1mJaBfQP5nO1aWMCKD+s
	X4eJ4w4iDlJi9w3qs5hW10/zI25geos4EHEd8LpYBnijJWgdeHQa20Sj7AJU4Uq7FejQTQBp8i2
	VmoFEJQz8pt50ybdOwD+EreAUj/+khYMOEJKWK7qxfhk0h7ORlVjvoTb2VgTaB4dcnRFUWrHtLT
	4ClgStJULZrYvNGK9hJLOEJOpDNjA/d3ViaIPUyGr/DC8CwZpMb5mOL7Sq4ZaUmW04PEA08FxIq
	cpeFKCtPFLDJEMOsHZI1PbQPpgr3dpBQFJMCEC34/DEhqOEAn4V/fcSs9ymBgAlF/44Q==
X-Received: by 2002:a17:90b:38ca:b0:35d:93ff:2855 with SMTP id 98e67ed59e1d1-35e42763a73mr16563622a91.8.1776149928030;
        Mon, 13 Apr 2026 23:58:48 -0700 (PDT)
Received: from [127.0.1.1] (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6eac8ddsm1019714a91.8.2026.04.13.23.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:58:47 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v4 0/2] Add support for q50sn12072 and q54sn120a1
Date: Tue, 14 Apr 2026 06:58:41 +0000
Message-Id: <20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHl3WkC/53NQW7DIBCF4atErEMEg81AV71H1QWGccMi4IKLW
 kW+e4mlKlLVTbr8R6PvXVmlEqmyp8OVFWqxxpx6DMcD82eX3ojH0JuBgFGgkNyFwOvHsuSy8jk
 X/j6KmiQIBO5S6Dns6fqn9WAt6WBkYN1bCs3xc996ee19jnXN5WufbvJ2/c9Kk1xwrwxObrZg/
 PQcU6O0kj/5fGG3oQY/uBYK9CM4dBxx8ohEwaP+A1d3fBDwCK46rtGN0gxk1WR+4du2fQP09+n
 InwEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776149925; l=2931;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=JZKPGPIzQ1N7Z04TBth/ejt8iusUUpviQAq/IA+54HI=;
 b=0pcZ9rrpD2/0wvggqmtcmo7abeKfmWbowD1udZKVAFk4ewqvA3Z5ohwV1iyREC7AFItdogMbI
 XMQeG+1VjqUB6uZRe/5xqsHcxYIwfzDytA2bEQo+soJKAaXSkAWNdLF
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
Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

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
 drivers/hwmon/pmbus/q54sj108a2.c                   | 105 ++++++++++++++-------
 2 files changed, 76 insertions(+), 33 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

