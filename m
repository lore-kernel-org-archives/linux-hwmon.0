Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514902;
	b=UkecYfo0t6AmY68AS2txO6uhYuTR74F1rRO7LQ0f5s1jLsVBMSfaWW4ZheIo4RHCj3ei
	 qVTmVxHyI/B/E6Uu8iMPaLfdEMT2iBbk/aSF9E9r6O4OmhMtJwQ8sFr/zP80J980+4c+c
	 NxkiQlkLpul6bHdxTsH12B5sTy7xbIh6KOYJfVX2u8UBRdXKAQb+w/NonHOxrs/saf2uu
	 mrprT224pdqBU+4k3Ue3zyK5nM9LgghRJzTtuH9peNUUr0Aynt49mgqM0rnpNhG+7892E
	 f07tv41JjhrweVDAvB2OsYDla2NHdCSDUukoyjTj+5Z0ZABxeAuOdOTWMJ+Qg39emGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0clWRcU/2fbc3bYYS/GO6v+Lc9ewzI6rsTzZ7YacNSE=;
	b=wtJ5UNb8kD8O2Wd04EuHFHvrhr/Rs4bPd5IlFtn6n1STtL3niU6iqNvxvcnomdQs9iNx
	 Bkh/tKnr3MESOI6hSUCyZOgS7jFqILzbJ+DwkkZ2kN4LY8iJ268rtw7XlG16Odz398XHc
	 z9EH+z5PxT6kmbD1Hcg95j2UT3CLZor89ZjnPZh0ffNXXKpRsAxsUaHn0l0EU/cC48ZNH
	 omygqMuWYthzGN0P7NJJbjETrLSfis7CmGtvIFnMuXzXc6hrfq+Uicd/6qKMsoqxVw9tV
	 Fpwh8Z8500VhzZXt+S530U+0Q0xFkUy9qyD+QoWIIiup8XvrjZyLJpycU0SAXFArckg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ahtDac9C;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708AE606D559
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 708AE606D559
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ahtDac9C
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so9399373eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514900; x=1793119700; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0clWRcU/2fbc3bYYS/GO6v+Lc9ewzI6rsTzZ7YacNSE=;
        b=ahtDac9CHUSxRL7+z1pjX5mHMQsG3IqJhQNDbywepmFruOBZaHhIty5aKl2TT0jPtR
         xCeXkr1tzId484XnjPCSA/dlO7jDV5zCYNgGFJqlvAOyc3aF5IRa1LXa/uobHiffc4HG
         boMX8p2YzSothEVZHsJTSc4dVZU3E7qbj9jMTqYgEnAvfBEQDxl/mPKSbiiAF7+efaj3
         z9ZTDhfA0x5JBY3XrrY0vrQTcKOk2JwQJ75B5ErZAtI3o358ubA6cTZpY/budEjQSWSY
         AxqSVu/Ntin1PTFypJqHX/C+j38zYFueS3kDnrkzgREATC2UqeJ7BtmC5yt8bVTZ3X3Y
         DRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514900; x=1793119700;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0clWRcU/2fbc3bYYS/GO6v+Lc9ewzI6rsTzZ7YacNSE=;
        b=M4SkvyMjJFmUyst+5/MQWp87SSxXMxV6/6Pg3tn71+YW0sdnakPxz9Ec3Nfcv+7+fs
         DGXo4pI1gwtonKy5mztQla2q/dkAIWAILL6QG94pbjmvIlEgKejz7/T+Mim2D4iQgZGf
         pTIz9z8QNqZXje11qYzWdLCPxoBw4DWBTNXPK0/dYiVV4INvHFV05M/4pbAuFOXl/HOk
         Ip6oA/IB81UZimTUJ97W9Uxqk7en42457Whfamkg35GDiUr+UEsQONZINbfRsMVYJp12
         M2GYG0napUIcxOxcS3BwH808bBaCx3CGYQjuYoLkz5T9xNE5VzskXtaltNF91I8FnTB7
         Khmw==
X-Forwarded-Encrypted: i=1; AKwUvBzwbgI5b+JH0tGE5ySE/OrlJ1w+xoeva7uO4zQO9lN2b1upzOliYrLmwxNS6WSXjVoI8+eMT+FHhHXhSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIt5o1rwH7cqIPap2ymgaQNh7xEs43tfUQBnTMZg0eZ9qvDuDKH
	xbqRtPGGTETZdtO7i+4Nb1N99qpAscEfUGbnlobcAwElD/aTHjERFm1SIyfRAwvEUKg=
X-Gm-Gg: AYBFou3IUJJst73px7eClkQ89L4nrGTqWfmyqNp7mMRsun765zExKUL1GiOSAzmz6f0
	88eEx96/kV0cCyRHSNJjgWKp4WLSIcsUIE+oXpLb5HV2cpgGUoGF/bDY68Y05kJea3lvTjebZvz
	49Sg5KpblXGp8a6HLrBGWtpCjnYOM6w03p1AacQ7Kj7nyzPKRsuqjDYg82FlbuSBAuvXqQGNcQU
	tU7aB3N5jxG9Mvpt/IW43hkvmaMwflXaGH0s2sub80u6OZlhLwsG+8FxB6Z1WIf/vFnsZAwZb7c
	eP+XbDhR4C30oBeGLOK3J9jjmHGA+Way4o76anFHIAe/XYNmH4xRjk2L7mZtasXMr9rl6fVuIqK
	VoQ6ZXnZYw/UHgryCy1wFP1FZITBzJnUcr/hihhfPfrIz255IRDKjITBhamBrMRjvLxN9nRni/g
	dRsoi0ZgyGViX+uw6/YnS24X90gqrkRW2r5TRsI0ok3RwI8memNWqFiF0y6fwsk6yW
X-Received: by 2002:a05:701b:455a:10b0:14f:8d59:edcc with SMTP id a92af1059eb24-185118ee7a8mr14806448c88.12.1792514900124;
        Tue, 20 Oct 2026 09:48:20 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:18 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Subject: [PATCH v2 0/3] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
Date: Tue, 20 Oct 2026 16:48:13 +0000
Message-Id: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIAE2b12oC/zWNyw6CMBBFf4XM2po+pDxW/odhUdtBxgUlLRIM6
 b9LMSxPcu65G0QMhBHaYoOAC0Xy4w7yUoAdzPhCRm5nkFxqwYVmfRSaKybLW61sic6WFezyFLC
 n9Qg9uj/Hz/ONds7rbAwUZx++x9MisndGmzO6CMZZbVzfVFLV2or7iOs8+OlqCLqU0g+3Ivn1r
 wAAAA==
X-Change-ID: 20261016-fs1603-25483c5edc57
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=2267;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=TmexrB/e+yDGFaQYIRq2EcohKA5uumYiY8TxKQsJMD8=;
 b=HyHG4fub9f+7mteV1J6ZcNTUVBd6j1q0kR165BImyYn7mkcgPYy3PXzV0oQgtxeKqUKqCTVyx
 Osg/cC61t1yD8VITmmzHx4rfG3g96duwaI8xsGkZwESC6Y2fI+3QVW7
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
an integrated inductor. They report input and output voltage, output
current and temperature over a proprietary I2C register map. They are not
PMBus devices, and their register numbers collide with PMBus command codes.

Patch 1 adds the TDK vendor prefix, patch 2 documents the parts as trivial
devices, and patch 3 adds a read-only hwmon driver. The model cannot be
detected from the part, so it is declared through the I2C device name or
the devicetree compatible. The FS1606-0600 and FS1606-2500 factory presets
scale telemetry differently from the base FS1606, so they have their own
compatibles.

Tested on FS1006-3300, FS1006-5000 and FS1606-0600 parts with the driver
backported to 6.12.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
Changes in v2:
- hwmon: Scale in1_crit by the feedback divider ratio measured at probe.
  Further testing after v1 found that on boards that raise the rail with a
  feedback divider, as the FS1606-0600 is used, VOUT_SET holds the 0.6 V
  feedback target while VOUT reports the rail, so v1 reported the
  feedback-pin trip point (about 0.72 V) as in1_crit on every such rail.
- hwmon: Use named initializers in fs1603_id[] (Sashiko).
- Link to v1: https://patch.msgid.link/20261019-fs1603-v1-0-8adf972386c1@nexthop.ai

---
Kevin Jia (3):
      dt-bindings: vendor-prefixes: Add TDK
      dt-bindings: trivial-devices: Add TDK FS160x and FS1006
      hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters

 .../devicetree/bindings/trivial-devices.yaml       |  14 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1603.rst                     |  78 +++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/fs1603.c                             | 540 +++++++++++++++++++++
 8 files changed, 654 insertions(+)
---
base-commit: 400be69515c327ced60082b27ede902a8d93cbdb
change-id: 20261016-fs1603-25483c5edc57

Best regards,
--  
Kevin Jia <kjia@nexthop.ai>

