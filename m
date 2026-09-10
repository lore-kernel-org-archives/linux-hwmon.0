Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7440A38E11A
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065814; cv=none; b=DkE2w4sqnLl/350WW1jhhJJZqATRLPtBoD3Brkp65+ZEnen0ZUHgz1ne5+n7kGd4Swg2A9MKY1XlvgQi6sfTSvaS9DtxhLLzgDHde3z1cUvbQ0aXZMpOVW0PAY2MysWH58541z4itBDcUce8B5XahA1T2rYHFn4Mn41NbR3QEX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065814; c=relaxed/simple;
	bh=zxAoEHThtrRI1+PP+mczGKc+hlwe0/Q82vX2QBWledg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=saNY+1EfPhvzTFmqfrq5AZJ5eklVvzV/rf3uOlk98hB4r1p5Ev8Xv7LCL9LfA+jv5Iy91YDEOb/cO4P6eVivLZdTuSULLar3JGzCip+ovq+0O4tmjcvbblpPXOn86oy1/piDH8lgjh2rZVhukFQ0e7fj1nYXS/P2bUXK7PA3osw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9M+v8Td; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9M+v8Td"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so21137f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065809; x=1789670609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwA3kPn5zA0nZJtDyWePWVLP0eWqJWLwH/csx6HCgdo=;
        b=f9M+v8TdXl3hO7JkxNaLzbvjakCcbtfs4EQPu+9wWejz/x67JZCVEWptt3BEDZ+DKd
         ZMebfBRnqX+OBpX/V7mGi91IqJK23iU7b+YU4SaLCTgnkZv7l1RE2VFuppRjjg0YGbme
         Wr0tdhZuFRaY5qEAR/awqZLBe7Q6O3IbJ9/Cs+1EIHVGnL1y+OAWy/8z7p5PYyIbLaX2
         FY1p83UjJaVxcswpTqNG0Q9MJD5c835DD488P/CQX9l0gb1PaNKm1E2ThQ85rgNRibt3
         IFhFIe4wJXU6duETMrQH+bsAQGZHnWfhLhEGLkPxHv6B82ZxwVi0lqiUPF/GFJQhsReb
         rEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065809; x=1789670609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwA3kPn5zA0nZJtDyWePWVLP0eWqJWLwH/csx6HCgdo=;
        b=UeoHTlHKXhIWr6XhYYU5TOEYUD5T9UwTbj8uaA2MPOEIK0syQzVWywDDQP5MeAVTgj
         IeVw7SLC5E9e7XN9LU6trWbJDawrLwIW0KR/R4QpAz4nEWlr6hRS1J4IB5c5Zc9XSQUL
         MQrh6H/yDnhagRvKz/E2d20Lo5O7PEOxOhdC6041l7eoyvoIzNsmfth3A32XYG9AtiF3
         1a/RelfyEx3Kf3fDAFCpX58NPs413nRha/dklwWwF1YXgOLA3kwRp21fAdtQl5CKfaly
         lHSlptZBvCjyRcm0OMlM5Uh7/iWvxKoq3aa5Vml6FErR0St2KBtS4JMUBH9Z1CX/RMF6
         XIFA==
X-Gm-Message-State: AFuF++lAe1lUxW/pcD3sGPxMBCY6/6CKHEhpZYBkjsWwg8v8S9u+Oj8W
	zyYCKIcPndkcUPeLCFBolsYVSmokQyUV9oXJJ34xYSeo19qbLcTxXD2v
X-Gm-Gg: AYBFou36x+sDPnJp+9w0KUSElG3BGwHfXz8zmNUFb5gFtWwWoWfnqtpzSXU4T3mm/ST
	07MuHgkw01XoGGGgsh1WD65q6g+vO44+raKSlNJEQ3l8gCMrb8uKWy0Wmmg0QIvWFcXLzgV+ZIi
	V1YsxpYhigTHbKaAuRK/t5VIObtzCEkHbdoy7KcVAAUtz9LG6mPhuwpDpNs5J6Ci3wlLhWQX/VK
	izjAsCP8+z+aqZCHe3V7XA2WuujVtXPJyYOEesChwVu+Dbd7vFQu3iRk17PZF8l2xBsFiBDq0xK
	CBi6gY7aflExPIg8vcD2soguE3xE3WZ6HokgLAFPz1xtgQ2TDU5IIacee9QlW1zhQTBVY0KATwU
	Knl8+T4xrSY4bpBGCqh/l5QfiABqGGjmUjkPOnjeJOx3vUN39KCaivzXlRLQ/6PmAKKtxwbf2o6
	Zs64M/RITiH54Comb/L1zIVd7Of1eWeKD1k5loReAkCNlxeeI/mQOtznFSO++5ZPd1RnfefgJBM
	uXiaAf6asmv3crZZeEDdcKV1xT2WHXY/xyRzvVJsB/Z/rHcyYIdTYH+NlXwF3wfsHXG7Q==
X-Received: by 2002:a05:600c:620a:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49e60f5af42mr10561325e9.2.1789065809300;
        Thu, 10 Sep 2026 11:43:29 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a3314esm3542185e9.2.2026.09.10.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:43:28 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v4] Documentation: hwmon: (yogafan) Update model reference table and contributors
Date: Thu, 10 Sep 2026 20:43:22 +0200
Message-ID: <20260910184322.1816996-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the new IdeaPad 3 15ALC6 Ub model and Yoga 740-15IML, update existing
model entries, include corresponding contributors, and adjust the
reStructuredText table layout and column separators to accommodate the
longer strings and prevent Sphinx build warnings.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v4: Update commit message to explicitly document model additions and table updates.
v3: Adjust rst table alignment and column separators for the new IdeaPad model.
v2: Split changes and addressed reviewer comments.
---
 Documentation/hwmon/yogafan.rst | 47 ++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 9ff5db5dc..239c7b576 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -85,28 +85,30 @@ immediately to ensure the user knows the fan has stopped.
 
 ::
 
- MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
- ----------------------------------------------------------------------------------------------------
- 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 83DN           | Yoga Pro 9 16IMH9 | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S  |  8-bit | 100
- 82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
- 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
- 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
- 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
- 82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
- 83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- 82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
- 83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
- ----------------------------------------------------------------------------------------------------
+ MODEL (DMI PN) | FAMILY / SERIES     | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
+ -------------------------------------------------------------------------------------------------------
+ 82N7           | Yoga 14cACN 2021    | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81TD           | Yoga 740-15IML      | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6 Ub | 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 80V2 / 81C3    | Yoga 710/720        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83E2           | Yoga Pro 7          | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 83DN           | Yoga Pro 9 16IMH9   | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S   |  8-bit | 100
+ 82A2 / 82A3    | Yoga Slim 7         | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81YM / 82FG    | IdeaPad 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 82JW / 82JU    | Legion 5 (AMD)      | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
+ 82JW / 82JU    | Legion 5 (AMD)      | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
+ 82WQ           | Legion 7i (Int)     | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
+ 82WQ           | Legion 7i (Int)     | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
+ 82XV / 83DV    | LOQ 15/16           | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
+ 83AK           | ThinkBook G6        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 81X1           | Flex 5              | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83KF           | XiaoXinPro 13ARE    | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6    | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83RU           | Legion Pro 7 16     | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 83KF           | Yoga Pro 7 14IAH    | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
+ 83BS           | Yoga 7 16ARP8       | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ *Legacy*       | Pre-2020 Models     | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
+ -------------------------------------------------------------------------------------------------------
 
 METHODOLOGY & IDENTIFICATION:
 
@@ -159,6 +161,7 @@ Contributors & DSDT Providers:
 - **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
 - **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
 - **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
+- **wizard-28** (IdeaPad 3 15ALC6 Ub - 82KU)
 - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
-- 
2.55.0

