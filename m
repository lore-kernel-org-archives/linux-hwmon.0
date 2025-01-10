Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB1C1F12FD;
	Fri, 10 Jan 2025 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496962; cv=none; b=sj8dN/Gh9s5lxoO2H6GA5LOcUwwft6lZ3wkAYGKzIK5Zx0aegUb/IOJPO4uznpXrKNPOJj9NdZgp6bhKckW5bNeROtEm5RhU2TOA6b0ccoGu6xXLruv3aZlF6Jtodgcuy8rKAlQGOgVJnvpkXNgpGpVpc+p4RLOy5rhARzS6bEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496962; c=relaxed/simple;
	bh=LiGgblo3umRJF8TlDZD0wLYlW/FE/mYXjvtrFKkWIZI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Mk24cAbhtM5bKBFSoM6JP99fGQfykqg49gW2FhBdu9YItaeC9QsfQWQV7KlLToLKOC7bjBV7fWDUeFayegnZ3awkHQRnW9oSpyXvz4NKxBTTl68wuqw3I1MvM7CStOcJLMTqeVhns8r9RKG/HrQZ4tLNWf6vBkDM8NPbG6sjAdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDt+urWA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDt+urWA"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166360285dso29812545ad.1;
        Fri, 10 Jan 2025 00:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736496961; x=1737101761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GE7toJHqZ/lOJiKN1P4097tohp+GcRxpdh5cgt9S0R8=;
        b=EDt+urWAxgcNrLIBa4V//4qVdqozNsgKRRC7tSeds+p/eqykfpYyghji2XOsV3bMUJ
         K++5vxTXLGefK+vyY3/zau0r71BW1QnDD9PPdt0ZPNy8aJaCNHKhzyrx840ZZrX8hQ8I
         JINBGy1SamHK5Q6tYNeCKfVzeOhcF0b0ZYbSh3Eivuu7zpw2TllrHd4fzCDi4hNOYtUj
         gbHAtqMiXJzpCPZuR/pESgldwaD9oE4jvUW1IpVEw1wPT3fAwVa4Rl70lmtF/jus7E63
         tHhN4Nrh7hxPgi5IN+RACyF23iteAQ7O7hZvVvoWCOA9GqVyEi4sgRBRZRcEJvsZSGsU
         X8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496961; x=1737101761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GE7toJHqZ/lOJiKN1P4097tohp+GcRxpdh5cgt9S0R8=;
        b=GThmlflV1F53JZP1j5usNapKgwD07ImOuWXiKJ2CCwvCSHDbt9iGs75uBSyMMNRbfa
         rNDpoptuTid57D0bO2vBusXDM1+LFcwteloJU70g/bybn99Y+Kjnz92wX9uSh5vG8s0W
         tDGkgI+iPPUJBPZuWIFOBISG8vvL02mbQffojUybsuTF13dHuEn4rzmKyZLumUUUi2fy
         CVcm98zf7it4c+kzX5DXxW6W7J5pYewq1NLxDsuqFyRSuka3ETDFetAPpNkX+u1tnMJT
         cMTF/nj7FQ4HNi6DAF9maF3JOIjYErfaNoNVXcCtCGXTMYXQ0M+sT/P7Jo2HLamK3wjc
         xJTg==
X-Forwarded-Encrypted: i=1; AJvYcCUVKDVsQKagv/+rgiFAexiWD7/216ZcPziSbswiKB46m4tjR9FkUZWijkxVLaRvftXx8uA5X57Roeq68qc=@vger.kernel.org, AJvYcCX/nAlB02QUDXkmgXFNusDnjOtzDx+ctVm7+BAWiXMwovi5TGEDa2mJPyehu123ISZqwuHydj+eEi6Z@vger.kernel.org, AJvYcCX9jnPAllqPl/5uZoOeJyx4MmSpEyW+VSSgN5ubJWAMUjFJWTZGZbWNQXlQ9UEpcrJ2FDbQ+PvBzHIN@vger.kernel.org, AJvYcCXPS8ufOme9a0lrxXWw2jiLxqeyLoAOKiAf/+a7EoaDQQBzNArd2R/NCbwhJFbiOOMsFtSsWgjobw3ut0YV@vger.kernel.org
X-Gm-Message-State: AOJu0YylY1YN7TTp5IXakjmhoEXjv1mGfs/wk0Ol4FinAPiUjOrOq4h6
	KBZxNhQZu/ht1m0Phg2k/LDayl4KqYpIVkN71dnIow2M0CIgm6Hp
X-Gm-Gg: ASbGncs9HbtB07xxtjyEjZIot8wfHqS27xRRPoabvDk9k2pfSO9jJYCY3ml0W+heSVg
	J6LWzBiIicO6MnJgSv2lwVbG7xbl6BtmhkpNXALkxtf5c4dUMqJ3LFUazIZCKUx/qdLddwcypVp
	TkIAw3ZZNt8MEueqZ1jp8t4x6d2MDWyeprb9E7bGk1f07Jea5KCJ22t6X0/gkIgEBWXKwbBtYsJ
	vODqyeEKyj2c6d7tAEVmLcieQJUe6XO/AICF9vJM4zuyvLDkXOROmo3gHrkw+wlvLWohY0Xbf4o
	0ozDTCyHJJ1XWoSEYtIcz0XZkLK79gEZOaKb
X-Google-Smtp-Source: AGHT+IHHpkpMA3xc9bN3IOIVKgSEjBL7aumxbhH6ZR4yf9yi6y05xsBLqGWoNi9xt/b4j7U7uM+Lcg==
X-Received: by 2002:a17:902:f706:b0:216:6c88:efd9 with SMTP id d9443c01a7336-21a83f4bbf8mr159668545ad.15.1736496960764;
        Fri, 10 Jan 2025 00:16:00 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31de806694sm2431837a12.69.2025.01.10.00.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:16:00 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
X-Google-Original-From: Leo Yang <Leo-Yang@quantatw.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	davem@davemloft.net,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: Add support for INA233
Date: Fri, 10 Jan 2025 16:15:44 +0800
Message-Id: <20250110081546.61667-1-Leo-Yang@quantatw.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support ina233 driver with binding documents.

---
Change in v2:    
  1. Merge the binding files into ti,ina2xx.yaml.  
  2. Fix typo and non-sense dev_err.
  3. Improve program logic.
  4. pmbus_driver_info changed to be allocated in probe.
  - Link to v1: https://lore.kernel.org/linux-hwmon/20250106071337.3017926-1-Leo-Yang@quantatw.com/
---
Change in v1:     
  1. Change to pmbus standard practice of getting MFR_READ_VSHUNT
     through vmon.
  2. Change the way MFR_CALIBRATION is hard-coded to be obtained by
     calculation.
  - Link to origin: https://lore.kernel.org/linux-hwmon/20230920054739.1561080-1-Delphine_CC_Chiu@wiwynn.com/
---

Leo Yang (2):
  dt-bindings: hwmon: ti,ina2xx: Add INA233 device
  hwmon: Add driver for TI INA232 Current and Power Monitor

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |  17 ++
 Documentation/hwmon/ina233.rst                |  77 ++++++++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ina233.c                  | 184 ++++++++++++++++++
 6 files changed, 296 insertions(+)
 create mode 100644 Documentation/hwmon/ina233.rst
 create mode 100644 drivers/hwmon/pmbus/ina233.c

-- 
2.39.2

