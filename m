Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B1C3DB62A
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517106; cv=none; b=muU99MZJdlit/wTpUHLUPiNqe5gIkLSQnbM/Zoedu80Q9sLCt5GZkks0RmxqT5TF65z6WuF8DaRU5Iz1TgHJim3GNVw1mN+VvDzIVi/WwCqUf8cWkj0aZBWY8jz+Bi6DxHHotj66zW2sqmfcKvKkySZtBOQG5Gzi2UDCEdQuHOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517106; c=relaxed/simple;
	bh=SZ/wHLIOELYXj1BkfDO54LOub+1NpNKFcJ9ebiUXs9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N+bZNFOwO9ZPpUlWPZt4Ts89aOGoe4YeNpGAXxbDEinEqgWP1wuUkriBPBAb2NZlLaaQ2wKFBDU2Cjf+SRJ/EAi6vGszDqvJXMJSOqIfWHYgE8YYBvvFoKWYzioUTpZfwVddqK+eNMWZou1z3Kh9v3Ggiha+3QbbzayrJeqSyJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slCXWFC8; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slCXWFC8"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84231305a80so1831046b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517104; x=1782121904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kEjlUSEiDp8boCv0TcDQDfb4ZA9nJAiPrgVG8p7VH5E=;
        b=slCXWFC80gu/KW7G1dYaMWD5xOxgXCZqcbBOERhIGVq3RwUZ8fVQFd6h/VJAXiKjPE
         y+wQXo7xlCqca9Ctp5yp6WGfLfJI+SEZ1bCoPz5BrgUrwn8WahWGSEZZ9QaiR6+BEdmz
         pVIiwF44ns4n6872EajV32Umro5tWfv9/ryLZ1vnJkVTjRCPJd7kqMRoDDe1bOPun2R8
         9yC1Hl8pygrxyWE122VVgkhgItmdK4yZzvQL4xpV3fL7xHJ7oAX/dofqThlNfwg62vyg
         +CKtzCUGbvsvYBWgm9I4HrRAWI4ZcgQ6kQYnjOPIkznHpHr8btq5TYxMgsYKQiizl+db
         r7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517104; x=1782121904;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEjlUSEiDp8boCv0TcDQDfb4ZA9nJAiPrgVG8p7VH5E=;
        b=d3c9YL8r0rQjfCigemZmx4Dz+hKSgZdNHL2DVBmvOaPxfrZS5WfOD6+0i7yBeeS91i
         y028h8QMpnjN6sgcF4gzBt9ISJwHANr8hhR2sKbwL5L/7cj5Cb55UBJfnjjWcJqJ/RJi
         9Ql7Pj4ASYoYk+rEWIX/Lt7hPSV/wwnP+Kn4g8w/F1xXPKxwx7+VpF3FIEjUd5qhVUxu
         1PI83ac2IOGD7qUHmyM6WCuhdSjcJaIF6964vsj0r60shQZVlUxV1uIoRD0CnrgSN2a6
         FOXNH9AF1A3kx/V87khgEGPUzoTQY4D6p9CAofMbnPA0UNOWglYa4E/tUtfGbka3liFN
         g/8A==
X-Gm-Message-State: AOJu0YwVnxJZOqfka/MjMD8+0asv54+pO+HcElGyhCXt+gCsYy5adtmV
	E7OOz/7pjl6R7Hn6oYwiEzijRqN52mHcyqOqS5VEfzqjV8sH0NBbhBRx
X-Gm-Gg: Acq92OHg8gCc6RGrfXPuLogUxxd/f35lZrimMZbziN6TVrEGI9M1WICwaayaIO4N05f
	IU9wMH3ewn8+d9/8SqIK0ph4s/3hpd+LLL447R51JVTTXe/3iddftf48L2nu5SxsnxG3dfPdRDs
	El+Gw66z1rPHlU9qZ1fzHHOnsJsRp3oMBpynwqoCVKYYRYuW+Vkefjc7nNd7Ez5SUj3GAZKwvuE
	SrXP6XiM5DHHBZCTIZyYsT0DS6aGyfnhTU3ONqZiwHj/2TFCvyHD6URtzwLTg4xplHP1ouKC98B
	OY4aGcazK4g7f8c7cpOzu14IWx0+aXW31r+sdhcfe6NSyFv6yCdm+KMpsY0h+D2pQVBG42YsmbU
	eolxNkdibQYwTVLebB6ywHF7f8cMueXMOSFRtUQdDqwXPYQZ1rEN6H5DnbOQZ2AF54h9k2Kt68O
	OiAMI8q31hLcehWnsdMlAWG+FHmhQvepO4syMb0otLoVbnN/AZ9mEU9RfflurWrgB5YA==
X-Received: by 2002:a05:6a00:760d:b0:842:5712:c29e with SMTP id d2e1a72fcca58-844e19663cfmr8661591b3a.14.1781517104519;
        Mon, 15 Jun 2026 02:51:44 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm9922207b3a.33.2026.06.15.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:51:44 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v3 0/2] hwmon: (pmbus/lm25066) Support SMBus Current Limit
 configuration
Date: Mon, 15 Jun 2026 17:49:15 +0800
Message-Id: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvKL2oC/33NTQ6CMBCG4auYrq3pjy3iynsYF1CmMAaoabHRE
 O5uixsWxuWbfPPMTAJ4hEDOu5l4iBjQjSnkfkdMV40tUGxSE8GEZppz2g9CMa2p6alxo8WW2hM
 vhbKFlAWQdPfwYPG1mtfbt8OzvoOZMpQXHYbJ+ff6NPK8++dHThllApQuaiubkl/aocL+YNxAs
 h/FVlC/BJEEVdZw1KCLRlVbYVmWD77TW0oGAQAA
X-Change-ID: 20260611-lm25066-cl-config-f81925f7337e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781517101; l=2392;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=SZ/wHLIOELYXj1BkfDO54LOub+1NpNKFcJ9ebiUXs9M=;
 b=zl8/mxU2Bzi73qtSMZe0V2qWwzxLrDJ7lL14T9uQF7vCk7qUxK9E+8T7QawNp+Tg3duzBqwf8
 5MS2xpx/vxnB244YKkK8mfc4KAMgQ4qE68vPTzKqBANACZttQjDnMNH
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

This series adds support for configuring the current limit behavior via
software override on LM25066-compatible devices (excluding LM25056) using
the DEVICE_SETUP (0xD9) register.

When the 'ti,current-range' property is specified in the device tree,
the driver configures the DEVICE_SETUP register's Current Limit Configuration
bit (bit 2) to activate SMBus/software override and sets the Current Limit

Setting bit (bit 4) to "low" or "high" threshold accordingly.
Since LM25056 does not support software override (bit 2 of DEVICE_SETUP is
reserved), it is explicitly excluded from this support in both the device
tree binding schema and the driver.

---
Changes in v3:
- Renamed property from 'ti,current-limit' to 'ti,current-range' to
  resolve the global schema type conflict.
- Updated commit messages and bindings description to document supported
  devices and their physical voltage mappings for the low/high settings.
- Link to v2: https://patch.msgid.link/20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com

Changes in v2:
- Replaced the boolean properties ('ti,cl-smbus-high' and 'ti,cl-smbus-low')
  with a single string property 'ti,current-limit' ('low' or 'high')
- Excluded lm25056 in the driver from parsing/setting the current limit property.
- Link to v1: https://patch.msgid.link/20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Cosmo Chou <cosmo.chou@quantatw.com>
Cc: Mike Hsieh <Mike_Hsieh@quantatw.com>
Cc: Potin Lai <potin.lai@quantatw.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

---
Potin Lai (2):
      dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties
      hwmon: (pmbus/lm25066) add current limit configuration support

 .../bindings/hwmon/pmbus/ti,lm25066.yaml           | 20 ++++++++++++
 drivers/hwmon/pmbus/lm25066.c                      | 37 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260611-lm25066-cl-config-f81925f7337e

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

