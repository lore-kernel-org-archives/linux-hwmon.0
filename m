Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5B2D5412
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Mar 2026 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772923560; cv=none; b=d/RotQTsGeu7sYtuwmmNXKmcQ2HoGCnQZm2x6NiTkxqr1EzbE7F8ZbY8+C9XPcrZOeutfoAeiTK4Hf1M9sDmq3IqaJ9qd7TaDjNlrDV7cUHVli4FE/ObL8UyEHbHTin+qIx6KfFRp/Tfz1pSEp/513FuBnHs9ZBp+1MtuWwX2GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772923560; c=relaxed/simple;
	bh=seHr/idfqa7kenI88MQCzyvhqvHcKtOXEXYCK/QtBjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uVLbRp/c9J5RQJfQ2KUtjKWcxG7zbccbJUIlYz29V1QpydD1kX7GlBvoz5v+1cLRlt/FvIdduP5rKuA4hKBBKOaF8KYNGKJWxSlSzk4f3yZ5FbAE62M5lSjwzcN7Wm9jpibKKC0OhUEIqmrgo47KYO7Sl3TYoiXGrqLzlQ68L34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTLFpz1c; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTLFpz1c"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2be26842fd5so2405208eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 14:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772923558; x=1773528358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WtbgCN2m08riFhgd+ZytabdWng3Ta1VeIXhSwqcmSNc=;
        b=BTLFpz1c67MRv7QMjG+LoXM9misb9/TvBvUfMGDDu/Dxg8EwgErbBw+n3z3ca3Yl5k
         PPNPfeoZmw2hhdAPm4Bkkhh3NuHAIr/uIYrNTZW8GxN/dqS+k9eOUloXFVMuodWsl2Jq
         DsXPTTIu4MuctsZ5yQ6cNqXMTBUhroS2RQS86MVVin38Kdde12c22oUZq4BcLWP+KeUp
         hUWv9kCDy0wAVO9PAP/6UNFEAbwfVlt8232mk0UVGwaaBnz/OFv6BwVAUaNgCGqzi9gU
         ETDOoUSue1O9FdOcOTabHEgVAStITYdHNOtME6JadbOO6seGsrSBuMgFAMTFQTfRHYDS
         4loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923558; x=1773528358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtbgCN2m08riFhgd+ZytabdWng3Ta1VeIXhSwqcmSNc=;
        b=mTtfLprHZxlRB1ohplttaLDtvcoThi46Bmvxemj2Muc9zFOCQEzcleBpnap3MdtBNz
         HhySqSuNsCnySzrrFqohE0e3MzNGqhZPVTgXRpNwMkmJ7ZwPpf1A1XguCjeXwavWoLBH
         8Zb0YKX/9JvMJ75rXBYOHx8Br4fuieTxcCsjx5edswU0Qt/6+0xVXWS6uyqPfJ+A3Iir
         hyGH/h7YXj5vJ9ZQAET0Rx4G+344/5Qz/r5dffL9EH6nGRhXWaKParHlUsBPurIPQTwx
         +1KSblf8RbRJ4Gf9GM5R8Jt49eaAWB+ltFNwdKTv2YpHnqdMcFBDaugdyWjUoW/LJmiu
         8r3Q==
X-Gm-Message-State: AOJu0YxRokjqs1hPUlVCU8H+TaRN/FTVbnQlkb533bf/SGHKPi3fHciU
	7enpAPCNHOTEdcP7/OeeISTgi7badtk5tyG4u3lnI3r2xFUrOVniKf9x
X-Gm-Gg: ATEYQzys1b01NE//BKt1BHYIWNptyn73OOqA+KLcKV8vn96UJdapf5eeFWF7D1jcTXH
	6I6GcEs0bbrsFOUkIe/UUNV0oq+l/ZRgXeHHGYMoYSh1W6riJVOzqvzSNDmWWJ5BHQOr3QYXZ4z
	DW6V3yUVQOMFTU+fiAW+AgQSB2/TYqj1qskY65OrYpz9UeVfjDJWMO+YGDcZ31t5qYnGt6e2ODa
	8VRQbsSVsZMa+0b2Rqa6o9+ntPIIw8A6LS7X280J3f93oPDjJHq6DPsHWp7bJjl5KcaiWcsV1Q7
	61NbDyq36oEHTlnaxAnGnS93vHuXkyDHnP8tnK7ZazkuqxXEZY3OgsWCMzV+XbS2t50zgBiFisI
	RqXCgAddh5BxiKRGf9QAtLWhxCTDH00a0znY/Yf0XsoZgopwsfWqayF12K1bD3ibcJgKuh0ddf6
	M6qj6rjBp0jkzOETXQkglgN2ONa9v8GFOa/HBx/pq14HGCaYKmHJjyQ3wZFe5KqU269Pv2A/oQQ
	LzyTaQ=
X-Received: by 2002:a05:693c:3101:b0:2ba:a1a6:c73 with SMTP id 5a478bee46e88-2be4e5a1b32mr2378526eec.6.1772923558254;
        Sat, 07 Mar 2026 14:45:58 -0800 (PST)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aec4sm4857344eec.25.2026.03.07.14.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:45:57 -0800 (PST)
From: Sanman Pradhan <sanman.p211993@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 0/2] hwmon: (pmbus/max31785) refactor inter-access delay
Date: Sat,  7 Mar 2026 14:45:17 -0800
Message-Id: <20260307224517.38316-1-sanman.p211993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanman Pradhan <psanman@juniper.net>

This series refactors the MAX31785 PMBus driver to utilize the core PMBus
access_delay mechanism, removing a significant amount of custom delay
boilerplate.

The MAX31785 fan controller is prone to NACKing master transactions if they
are issued too closely together. Historically, the driver handled this
by wrapping all SMBus and PMBus reads/writes with a custom timestamp and
delay checking function. By offloading this to pmbus_driver_info.access_delay,
we can clean up the driver considerably.

Patch 1:
Fixes a minor argument type mismatch (u16 to u8) in a local wrapper
function as a preparatory cleanup.

Patch 2:
- Replaces the local delay wrappers with info.access_delay = 250.
- Explicitly sandwiches the raw i2c_transfer() long-read path with 
  usleep_range() delays since it bypasses the PMBus core timing.
- Fixes a bug in max31785_read_byte_data() where physical pages were 
  incorrectly remapped. This allows physical page accesses to fall back 
  to the PMBus core, and lets us safely transition to the core 
  pmbus_update_fan() helper.
- Fixes probe-time delay enforcement by using the wrapped read for MFR_REVISION.
- Minor cleanups (renaming 'virtual' to 'vpage', dropping unused macros).

Sanman Pradhan (2):
  hwmon: (pmbus/max31785) fix argument type for
    i2c_smbus_write_byte_data wrapper
  hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses

 drivers/hwmon/pmbus/max31785.c | 186 +++++++++++----------------------
 1 file changed, 59 insertions(+), 127 deletions(-)

-- 
2.34.1

