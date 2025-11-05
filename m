Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2523C311C17
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Nov 2025 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373657; cv=none; b=A+DUcZFd39CGFmU+JLyDoIK/Iw/gs5LZ3dsUl/bll1GP/91Az8m7I1QAfpmZ7jNAvHujqkyOPBaBTD5r0mqUt4rYP3kMDy8Rf+DzM9JJhtQdxMhCZyLaJda9LbRc3Ved6Ysvb3+OROjT7BqatnzV8D96QsTvRnm1lC56tsa07/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373657; c=relaxed/simple;
	bh=eQJ0NUzQ4ouuCS/Q0tnfZ0GPptT7scZ1wPDzcolXdoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJzTS3Lc19cGK+yJPbPQNUpmg/sAIEeqFkWShgX+oHu+8bx9rA9zS6LvmWZOWEyrJPi+HLmq3iMSuWB8BS56M/1/1TTpVwAiYupohyR+sw776mMFdGA1LanwP/nN7losf/cyhtpBDmPyTnaSIjjMf3vOu8oGBVJvoOISTWO6sa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=moVWB3Mu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="moVWB3Mu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29524c38f4fso3198235ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Nov 2025 12:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1762373654; x=1762978454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yUOzNM4gKoG/nRwrmhCZsy6hSW9BT7KDwKYG6RCeAao=;
        b=moVWB3MuAbvIjFgmcK6v7CDE7VVVEnu4lfltQcA6iCLapx376Tccr80VOZQUHEwB2m
         C6w4TsgGxB4i9zdtnEEHq0WD7Xa+8+jePxG+WBg29a/fOZVKoiOAFKPneESrCBOrWKl0
         mNckgFBi1Wn73PTiQ7RWQGts2SVAgwWegkV08+IaOhvizkNfPoOnPvQWWkEHWJsp07Xn
         //MBjKTnNePN+cnDTR4XZA7JirtUtk7ujXrv6nPTYZ+frvQTuSPVRY7gjHe39HGRCiS9
         s5mGGbquwIkBSEsm5BWf1GyH/IaqCg6CPIXkyp9Qs4YACryFghstbcAspPMaq7Q/NKL+
         dolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762373654; x=1762978454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUOzNM4gKoG/nRwrmhCZsy6hSW9BT7KDwKYG6RCeAao=;
        b=Y7uh79B62+0Djwd7qtqmVgK8n1nJCw13cyC0u+fuAR5F0Bb2dobdK2txUDqKkl+u+i
         +lv7XWk/Q9O9EEkiw4AEV/HZ0awJzu9Sj22Urkxs6dsw0GxSOgFNdlSjoP1z9lsgfbVY
         n9TxQfHs2TckIcosx0esLpn1Ij6h7tc28BbitvlVB5RO4FbGwoaYgoYxR9sEjeQRZoQ8
         4LbNbzgyss46FOdnBDKU2tG+WJclP5JZQnWNvODqtXSNtxlg3RoLvHyDzD2XqdtoA6ut
         9oYNRfYVjlCyHJopDFZBb/+ix5gOtWczmyaU+uik+uTmCvOJRpIbQ9uOlxEGwmZHSL0X
         UPKg==
X-Forwarded-Encrypted: i=1; AJvYcCVO07pPbeuZZA8t9bSm58IZbPBDLGg8NMDoZF5nSUVM+PSOppD8rdt1CO1Vaxa3ZFWTI5B6bI/CRBPn6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdSHN/Ppb5zMdZkHQWc4qxDW+8M5zPH3Sa8xQ5WMVwJSH7i9v
	vmHJuEhz9Qh9KOZVVPZE4AIPEcMFn1s7c4Sg9tPZbnUgemeJVfKRyNXdxVGAyiDJN7U=
X-Gm-Gg: ASbGncvdwc/Z5VOUipkl9q0mxk7A2+NEigTqjHw9A6mTw3bViUUwhr1P8nLoBUnpuuM
	VbHXy0W/lFASkQaHB4oDzCJ/Pb/hpkTXVUjjO5jt95P0R61mib8ZVhbAmN4s0f4capftXB+llwS
	6eaC8ejyag/bIjTTheEUPtKn6w6ZVurHOGi5RlZdYu1Ps5FO2BXHG7DIHQIQ45bhlWBe+1Arx50
	25gYCuR7e3DfTrBAWFfRBsGluNm5Vk85OpWm/86wAi8bpHCjJvEvb24gXjXk+p0hl6pBTIZwBbn
	XbJiG3GrvFk8gCcyZWzS9zNXEpZEXcsZgVt2JWINBqIXMecQoLgyrRfSSasm6649Y8gNmFj3z2X
	xiQ91x81Z7DT8ZnckAB7mAWK/d/0spVoy+FoPXBef3Ue0MqPGhSVEtorXLTOA3cer+w+7lQUuBC
	5HpAN1NYM=
X-Google-Smtp-Source: AGHT+IF4VrvhJWTj6Cx0+TOg4nCOWZFwV6Zvxic2/HHaRzt0NXXm/XIrkK1LrIxEIQcrBWb29lht3Q==
X-Received: by 2002:a17:903:1a07:b0:295:395c:ebf9 with SMTP id d9443c01a7336-2962add6154mr64000535ad.55.1762373653983;
        Wed, 05 Nov 2025 12:14:13 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:3099:85d6:dec7:dbe0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b8ddsm4039435ad.5.2025.11.05.12.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 12:14:13 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v4 0/2] hwmon: Add TSC1641 I2C power monitor driver
Date: Wed,  5 Nov 2025 12:14:04 -0800
Message-ID: <20251105201406.1210856-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
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

v3: https://lore.kernel.org/linux-hwmon/20251104003320.1120514-1-igor@reznichenko.net/

Changes in v4:
- Updated devicetree binding example
- Removed unnecessary check for !current_lsb
- Added clamping to current val
- No extra calls to validate_shunt()

Igor Reznichenko (2):
  dt-bindings: hwmon: ST TSC1641 power monitor
  hwmon: Add TSC1641 I2C power monitor driver

 .../devicetree/bindings/hwmon/st,tsc1641.yaml |  63 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tsc1641.rst               |  87 ++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tsc1641.c                       | 748 ++++++++++++++++++
 6 files changed, 912 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 create mode 100644 Documentation/hwmon/tsc1641.rst
 create mode 100644 drivers/hwmon/tsc1641.c

-- 
2.43.0

