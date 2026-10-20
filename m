Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533937;
	b=Za74sqzH5Az+l8azdDYAQximZ3l8GpXce3mpjJG88Xoa97/VG4h6kScd4rrtW3JrSHre
	 Xy2bRwn0k7rD/KEv5o3P6NHLYGrsHrCwpZwDa8qvfRI1tomrKD6suY8cXZF96mEcqwVMI
	 bxfaWDUqoF9uCDMuSSpNz+rNC3kDTP2nKvLuUlouDGK0yi3KGKaNlXgMdepJL0omoNiaK
	 HUMYkKNA//bCPWuybT9uaeL8qpS2HXFIRbL5vsK0NFitkjnyHUEv/Cz5wm0ZIv615Hcsa
	 mXfj1qiL0YbjEMBwmd3y0Aw662e6z+9z+SEmPBNE4S58gaPeCWYxIeSHO78NQdHIc0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
	b=OPnju1jlSo8wUY8ROrI0ZhFznxnH5NrsVh+2Sel40lIgt2mhckB5bfMMo6vvtCSN2qH3
	 SnV0OGL67XHxl/UM6dQvcD0BPo0pM/wkPqyBLtez/7Mk/jYy0DKDC+wCwAeMuVfuMmciQ
	 1EhZe9jcSYdsUbq5TPD7uirrrm0wDd70MiMnQijAcQJGVb+AP6HbQU0FF74mz/dYVe3w1
	 XYaOYxXt0/20tLyiCVmJ+Zoe95m5DaOa7zpBg1XzlgvHfscfQJMoFMCFBqeu44Du08sxG
	 4DeBmvtRXfha6XL4RPxJCgB04CDYYaX2B53sGaevccoEWiyMEvVawh/N1zdz1C0L6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=P+hfWPaj;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8734B606A31B
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8734B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=P+hfWPaj
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36681e85e87so51847eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533936; x=1793138736; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
        b=P+hfWPaj0ZPxfve8iCN8u9BUJLrC8WLn6r4NUIbKt8Gx5HF2A5CwU5Gur33AAqzDw/
         9CZFYtoBrBsFRmerRBGkGhqyyFkMFkZy6A9A1mbCzf5SmJyoUlqg8hmeux7tOhTjbIE1
         5UZ6LPQpMxtbCjlW9fg2F5unmOt6ornkZLav9dqi6pBtnr9FsC70ur6tZu+eA/sy5BVk
         BO7xukX3rHv5oYnjCx2mqaFTvPcbVWBTnbl8iD4uUUQ+0Ka/ghVnkyYazuHkdOv4exFg
         R3BAcq7GS4vGMfnCQEiOuAdz/7aZwG5jpiWVhCvGjpNwgVeqoLRNyQZrKHcckn9ityMi
         MgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533936; x=1793138736;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5c110i0kAISlo8u0iuKObA7D9yNQ5DqzFPntecO//E=;
        b=kDN9gJVwzvHi/vH3CxWG9OmohHgxl4+FL/rIpSbgn922YwBSxIkNrWU0s9jCyzDV/F
         QZcKuqKrdH42yyKI0mRCdaimc1/QpB2DnJOdC1nWTSk8wvFK3le9lBk+adRhBriC5tFn
         0ZVdJtGZVgVUK9+wTxEX5vJIRXs8mdY/MJmaEayAQ8iydog2zQjcS8azPC1bqMXMWmXd
         JTrQ5wKqztJwtGQFh+cxuzFrJpPQY7agQW4lH8SAjRE7jeggs6K+iqybJugi1BZXK4NF
         dwM2IrA7CrFjWdv5ipdaG8YiB0g8H6JVd05Nnf+723x262CNyv4x1oj8Ho/slH10Qtm5
         BZJA==
X-Forwarded-Encrypted: i=1; AKwUvBwwuXelRq/WLLhNFlqEIP8GHrkdQeuzNK+DrCG35afkpwzV1oavfolgkxPbdjPeuVcik/XrpfcG8qxiaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkO3NmOQAXi8F0FyNw5VedVKvTYmrNlQ55De1I/728EiWZNwUg
	w/c1Mc542d/xq3ci/ndMAkHfl1MEdijcrrCIJK+Qk52oJb5bDolBwmEEcccF4F1mrYA=
X-Gm-Gg: AYBFou2uhh54H5vU7cS365zGEjNf9TuPiOYg+Edywh4/PO5SJeXXugJ9Lkq/7V3nTmM
	GePmCrN7YBvyOgYOEj63kdqOzT7HCIb2sIlYrmHENrTPA/KdDYzWzoS8pF8x12LwM2HqSG6p7j8
	YPneb3XyMgs2i3ll1I1MJstXhFHS2r1yA9bz9TwokQVtHvFUJdJPtp6k6I1i6Q1wkvGfOohL3a/
	OuzmMDJ/A+eL8GtC1t0u11LI7swvKXUOmk/olF2DIJELYLArnFLxe1wLrtxZUjGQRDG1RvxB+6P
	CQlUBAy28+N/m7exhB4Oe9J0JEsRvWA1VXV6Vj7H5KwznPesvE7FxlV2lm052TP09PB3UZPF8md
	w51jMhuE4rSMWbF+b0zM7jVE9Vf1BeidipkxHXb2vsl6Cng9OI7tLPeWpepj33CktYbpSkGxzWT
	9nff4yIiilhj4SFE99f7f9RDp5MEgec1FhepRzwdjYL9+3Li+fAB+WHwANhLNl+CpasPZS9scqR
	Q==
X-Received: by 2002:a05:693c:829b:20b0:35c:4800:4da with SMTP id 5a478bee46e88-3674f71013bmr798597eec.41.1792533935562;
        Tue, 20 Oct 2026 15:05:35 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:35 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v3 0/4] hwmon: (pmbus) Support relative VOUT mode, add TDK
 FS1412 and FS1525
Date: Tue, 20 Oct 2026 15:05:28 -0700
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBQFf4V0bU1fvFz5H8ZFKRdbEwppoWII/
 26LG02My0nOmVmRB2fAo1O2IgfBeDPYCPyQIaWlvQE2bWTECCsoIRXWj36weOyb2ePOU0EZ7lo
 huChpqWiN4nF00Jlll16ub/Zzcwc1JVNaaOOnwT33aqBp9zcQKCaYSCghBxAg6NnCMulhPEqDU
 iGwDwcjPx0sOjivC8UlqVj+7di27QXnDTnzCwEAAA==
X-Change-ID: 20261008-hwmon-pmbus-fs1412-fd4434717c19
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=5458;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Cgjr4yL6yoxtDFniz9+AjdbJjyXyIutBZSiFTyIWcYk=;
 b=xGl9KxFh//d+o4NO62M4Y4oDaLxQZUCGhPiRJwVguTHEFX3erMYQLxOQl/6+KcN2vE+iH4tZF
 uE3g7uXMvf8AlMBVOEchrh0/T610N3bc32oAyIOPM+AmLqe77N+M1eb
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
telemetry. Their VOUT_MODE is read-only with bit 7 set, the PMBus 1.3
relative mode: the VOUT margin, warning and fault limits and
POWER_GOOD_ON are stored as fractions of VOUT_COMMAND. The PMBus core
takes bits [7:5] as the mode and rejects both parts.

v1 worked around this in the driver. As Guenter asked, v2 instead
carries Lars Petter Mostad's 2024 patch adding relative mode to the
PMBus core, rebased and fixed up, and the driver only adds what is
specific to these parts.

Patch 1 adds the TDK vendor prefix, patch 2 documents both parts as
trivial devices, patch 3 is the PMBus core change and patch 4 adds the
driver.

Tested on 7.2.10 on a board with four FS1412 and one FS1525:

- VOUT_MODE reads 0x98 (FS1412) and 0x96 (FS1525). Writing it is
  NACKed with STATUS_CML invalid data, and it keeps its value.
- Neither part implements PAGE; reading it sets STATUS_CML INVALID_CMD.
- The output voltage limits read as the raw fraction times VOUT_COMMAND,
  and writing them through hwmon stores the expected raw values.
- With VOUT_OV_WARN_LIMIT at 1.5 the FS1525 sets VOUT_OV_WARNING
  against its 1.094V READ_VOUT with a 0.600V VOUT_COMMAND, so it
  compares READ_VOUT against the same limit the core reports.

The PMBus core change was also run against the board's other PMBus
devices (ISL68225, ADM1266, XDPE1A2G5B), which bind as before and whose
regulators still register.

The driver registers no regulator, so the relative-mode regulator path
was tested in a VM instead, with i2c-stub emulating an FS1412 and a
test-only regulator: set_voltage clamps to MFR_VOUT_MIN/MAX when the
chip has them and is unbounded otherwise, list_voltage agrees, a
voltage that encodes to 0 is rejected with -EINVAL and leaves
VOUT_COMMAND and the limits intact, the limits follow a new
VOUT_COMMAND, a non-relative chip still clamps to its margins, a
VOUT_MODE of 0xff is not treated as relative, and a VOUT_COMMAND of 0
fails probe.

The FS1525 over-voltage fault is an analog comparison at the feedback
pin, so with an external divider it would read in feedback-pin volts,
below in2_input. The part cannot report the divider, so the driver does
not expose it as in2_crit on the FS1525, as discussed in the v1 thread.

---
Changes in v3:
- PMBus core: reject a regulator voltage whose VOUT_COMMAND decodes to
  0 or less, which would later be divided by (Sashiko)
- PMBus core: decode the regulator margins with the register they were
  read from, and in relative mode bound the output voltage only by
  MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with VOUT_COMMAND
  (Sashiko)
- FS1525: hide VOUT_OV_FAULT_LIMIT, so there is no in2_crit (Guenter)
- Link to v2: https://patch.msgid.link/20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai

Changes in v2:
- Add relative VOUT mode to the PMBus core (Lars Petter Mostad's patch,
  rebased) instead of handling it in the driver (Guenter)
- PMBus core patch, on top of Lars' version: check VOUT_MODE for 0xff
  before testing the relative bit, use signed division and clamp the
  written value before scaling, reject a VOUT_COMMAND of 0 at probe,
  update the cached VOUT_COMMAND only after a successful write
- Driver: drop the VOUT_MODE and limit conversion code, keep the MFR_ID
  check and hiding OT_WARN_LIMIT on the FS1412
- Add the FS1525 (driver, trivial-devices, documentation); the parts
  are told apart by IC_DEVICE_ID
- trivial-devices: dropped Krzysztof's Reviewed-by, since the patch now
  also adds tdk,fs1525
- Picked up Krzysztof's Acked-by on the vendor prefix
- Link to v1: https://patch.msgid.link/20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Abdurrahman Hussain (3):
      dt-bindings: vendor-prefixes: Add TDK Corporation
      dt-bindings: trivial-devices: Add TDK FS1412 and FS1525
      hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525 driver

Lars Petter Mostad (1):
      hwmon: (pmbus_core) Support relative encoding of vout related commands

 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1412.rst                     | 124 +++++++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/fs1412.c                       | 171 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.c                        |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c                   | 121 ++++++++++++++-
 10 files changed, 433 insertions(+), 9 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-hwmon-pmbus-fs1412-fd4434717c19

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

