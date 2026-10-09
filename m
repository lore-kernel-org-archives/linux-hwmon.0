Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A2306B3B
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507371; cv=none; b=lwHYtnOEAcadqhJ4DBW6n9G6nuGaM6RBq3HO1TugIyrFpR6zC+kgnC5qCWuYAG2lTOFjgrz57TLYTr9wC58iRev9gscKxybDQ2AuWj9tOuGrH57mo5BAZ7auz+UTixCLwjIXKC2kQ8VEwoqv2i/OJmI3yOtxV00Ycf0DMRBYfkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507371; c=relaxed/simple;
	bh=TCmpqhsXFZvHB2hYI7sHMF1aP5fPfOZ0+46+VuzusmM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MR+PUlzTzwCf8/jMy5ubfqaNvos2JIofLp5E6VRvWXoBkdpFkXEw+iBB/9cDEANqHPca0+6ouw7nFZUswg/2AQEx9DYWM/WWL6CSOmMsCBgzIHWuCH2EUYafEW2QpFGh1JBl8eD7KRatiGqFlpelcI5NaulRWTFLKvph7bsK32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=hdYwHpPr; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="hdYwHpPr"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-353804b591eso122633eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507366; x=1792112166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HtES7fePFnMezxtZEKW2N4T9F4gvLmApUzPD0F+adIk=;
        b=hdYwHpPrRODKcbXfgxO0VfjbViLi/+rEroIl5DNoHuDWcXkwmEwB2Jhy8Gk8Gw/TfU
         Vr5bNJT+FPAmTIDnNWlNU8ps/jvBWlt7Y5/SEp9S0FwpUtv3LhP3OKbPNpWhGyKQHzJE
         bVmNsaQ5z7HvnpYRjOBDwlxgMRAa+ibQt20vSV0rwi9gFya59F9eXL1MZBt2fwvzR/EL
         5qgMYbhQrJqdy/rgWNZYxQkTwoSW6xMQUSpFZBRq0srw8z/a2s+BcwbOx3AhaxTBG+03
         DojB/7vekxsMb7Vh41kmT1dXF+myHMF30P08UASCVkDy6TM5BHYI6IzFzfLpXlRqYyY+
         ihAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507366; x=1792112166;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HtES7fePFnMezxtZEKW2N4T9F4gvLmApUzPD0F+adIk=;
        b=wGUe30xgFXTp6lFrZWmfWCCuMkJApD96o0zWjcQ8Sh/hViuHcB20nfMlx87whZozfx
         XVPKTdGVycBlRjEsSasj6Yvk9XVEkiaWSsN4pNwzuMxBwGzhEl0uNGuBalqPty3lihU0
         mp7uwrUFR04xl5grQHRWHwimKvMS/byChGi14wUbqoO3lVWEGGvN6rtEUi1vDxbE7gk1
         tJt2ZoANzX7avEhp+17QmYGEMsZTIs3yhI0Zylu5BBTpQfCPD8gfBTs9oWf7NtPY0Gek
         3TKn+lGdMUW3YvAllovDZkuMJvEp6o6gJ8uAuzw66g0myDBsS6OWNVPNjsC/4xcAK2vr
         /shw==
X-Forwarded-Encrypted: i=1; AKwUvBzi6N1aW5MjKICoGPWeQ5IDp7zLSkzV2jGHAOcUplrcGwdasanz6BMPykPCRoe4elhusuXnaKTU0PJVmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ4okC8lVARylATlefOUdMeDOV7ISxbqHSyVZlSSHIp8Rg+rvx
	yNBfBSbLhCH+VUSGjPpdaqhAP3WYamLr925TkTKowbIlcDhWwtkkl6FBbxMh/bUGMjw=
X-Gm-Gg: AYBFou0J5Jip2HHIpR0by3GwQfOubBRfaZxtZ3c0BzO0mqPHtqNYG+laWPerOCmA668
	xFs2eXkE7dKujZ5BgJ1LLCWx/2ktpNa50naj+sMzWiFo4q054NTCUXYD1LgKb+406+NxwQcHvnj
	Qqqcd+ycELoZkb8uKS2u5LjHCH3K/MWWhzIRiZfw1kKFTb+hO5rdER2tyJcHX0Y5If2jUH9EeyJ
	8BvB25kkqv2u2B/a6CunijD6drwlJyI+Oyxu5FWjSl2wh7Ff8Ad0c9SK4jqb6llbw+2fvjQIdrL
	1iwlDlye/oLzcIn1Gb3glSVc1Jl4sQ0XXD8W+NfhlZZT3Auz7aomdqJm5imcjJDlg7QnzYMOMdn
	+zIY7J3eDMpTF/uzSE4pLiYtNQgXJ42Segm8K27JLVPEicOSm918Fg0wEvmfuu/g2aUdR1LXslD
	tBbSmUo/3cDIRK8K2ZPsBWKyiSPSiRdgR3kUSLgeT2OyE55JrzNDN1YRvSMHCHFJd9EtK2/gP4p
	Q==
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr881856eec.12.1791507366213;
        Thu, 08 Oct 2026 17:56:06 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:05 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/3] hwmon: (pmbus/fs1412) Add TDK FS1412 support
Date: Thu, 08 Oct 2026 17:56:01 -0700
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTtJpzagXsWwkDKVMaGQDn8J4
 e5WWX6L93ZQTsIKj2KHxIuoDDGDLgX47hXfjNJmgzW2JGNu2K39EHHsm1kxKDmyGFrnrq6iytM
 dcjgmDrL9p8/6tM7Nh/30O8FxfAHOM4/MdgAAAA==
X-Change-ID: 20261008-hwmon-pmbus-fs1412-fd4434717c19
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=1864;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TCmpqhsXFZvHB2hYI7sHMF1aP5fPfOZ0+46+VuzusmM=;
 b=R/58905oO3dCLNvhwPY8tQHf7EUw/OU/AJTnHSg4u/p8RsbmL1yQPDlcoO0ise8CjHl24rRQ+
 P/K/uALm+oFBlRy0MvoJKKelkaLq953P76jBDofuzCk7Qw8Aqny7jft
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 is a 12A uPOL regulator with PMBus telemetry. Its
VOUT_MODE has bit 7 set, which makes the VOUT limits relative to
VOUT_COMMAND, and the PMBus core rejects that mode, so the generic pmbus
driver cannot bind it. This series adds a small client driver that
clears the bit and converts the limits to absolute voltages.

Patch 1 adds the TDK vendor prefix, patch 2 documents the FS1412 as a
trivial device, and patch 3 adds the driver.

The driver only advertises what the datasheet's command table lists.
READ_IOUT and OT_WARN_LIMIT answer on the bus but are not in the table,
and the part reports OT_WARNING at room temperature, so the driver leaves
both alone.

Tested on a 6.12 kernel with an FS1412 behind an AXI IIC controller: the
driver binds, input voltage, output voltage and temperature match the raw
registers, the VOUT limits convert both ways, and a written limit reads
back as described.

---
Abdurrahman Hussain (3):
      dt-bindings: vendor-prefixes: Add TDK Corporation
      dt-bindings: trivial-devices: Add TDK FS1412
      hwmon: (pmbus/fs1412) Add TDK FS1412 driver

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1412.rst                     |  87 ++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/fs1412.c                       | 179 +++++++++++++++++++++
 8 files changed, 288 insertions(+)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-hwmon-pmbus-fs1412-fd4434717c19

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

