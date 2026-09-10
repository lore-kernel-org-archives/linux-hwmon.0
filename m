Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CBF324B32
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026323; cv=none; b=f05lQrqOUhVb283b/8PPMMyx2MYfiuvlZiAKQRPC5e7w9NScJ8p0DLvy0ZSQght8anaMOfkmzns7lfHLuPa7EXe0qGuAcTf6szCJrwP/ruKh+ftjtiN3IOwcTI/Oqph1yqHPtmSU4ih8M1pGOEH4El8vgFbYxFintCPBQOKQqzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026323; c=relaxed/simple;
	bh=n/d7HWNTYU5Q3kG1iBDkGKT8mLK9Pf+E32vLhkgrMVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZ7sWX9wnEHtUAlP2ihZFl+MwohnDU0ISzb0OZFf3h9XUHJrtga7v8mmnOuAvJIZp42YR9Yn38lbnOLbi3AoG3LxefFMP3TM8dAITrg5YABSondVpRd0NF52Bxl9+LA4QO7Skit42PYxaDt43mvQ2N5UdIIgFhiWSj3qvhOPWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DElOq/oS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DElOq/oS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so42310545e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026320; x=1789631120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmGY48YFLUyzzSWarNmLSyWYwm/BjrcQMX/n4tj7yYE=;
        b=DElOq/oSUNoUJsemEaUWrFfTvUhdh7KWEzSQmBL2KMvQetozMqpGWvM+Cor3TI/eB+
         wiOvjWpeBDQet+aQ/dTlB9Cv4RukZ4HASMid5EWKg8UTxAouRU/YvfXRGHErXRPZPL90
         6VeuYpyZJEzjWWJfh9a7uP4yNtoxFTUvnJi/ow0OEn0vPZIcHkg1dVgeBt7oc/CjS7O0
         Cxat4gHZ0LdnS5AiJoI+e1hfsgxCTAS/5SewG4n/xJCir4Dkv1WRqQ5Jy5RplfenGP59
         PFygb70Sf8vyobQ0UMHY70SVu7m4jziuetOwd8hYeDkHUudSxsTPZNegokKDkkbcA5Xm
         RZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026320; x=1789631120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmGY48YFLUyzzSWarNmLSyWYwm/BjrcQMX/n4tj7yYE=;
        b=r1qFjTgbqSRCgeCcRG3v5z9QVcnZNriEKJAaga1VggnFZt1gTQqlgho387FPDwqSP5
         aStwLhXTy4ZVgfxsCQ87SgFWmqKHqTTYKI/02GzYZhbT+Jgg0bWG7paA6u/U5tFN+keA
         3jSpp81Du+aix+g7H9cYqfmPGAbYs1woP0zXdulZXJpbufJzuBCO8dYFxD07pf38kRTX
         Ee/y3BevfiDeNLieBcFk60EmdKr4z/vu72M1YJEOuTv9QM9vRHNuifl4tTlXCRKj2crJ
         ogxtGJDHzKJqeJhzogB/QXINWHUX8y0Ti90CKcDrwJDXLCq3aOd1nSRPf3NjoXVYP0PF
         tZBg==
X-Gm-Message-State: AFuF++nkmqKBJMCwIr4mIV4iYY/vc+XkELYenRcVRa+0gdxI6Btc54PW
	wRQf5aiHSZaGyzgvxSiRFAyMfm5Ux1QzcDlE2uqWWiQmARgI9dTVFK2j
X-Gm-Gg: AYBFou1WpWmzAyKFfk9H3VphxkaW4nuPSfFG3kS5rQ8YBTJLH4gffa9G9hOjyGkwNXE
	b6DbDyiX777nZMj8YeTBxUnjs21qWR491uDyj+ip5dQyXeP8MTN7VUXqC4rXrjRaJlsl61dLzY6
	z32Nh9Tq9NIfDNfuyvPNTATa73dniEh4y0ynmUxnu2X2EvDZ2mklTQb1Cj4xItcJUsOHBRW6eOW
	9EBMtnivcOLcrZTVABoJZjDJUyPenEZ9Dk1z/FXYD3qculannvb5NFmf3MxosKWBW54CC3x61gG
	W6KqRASnuI2CMPHNS1jqGoaOKJMBZnSekw0tJfp+e5asKs0MswW9h8PeGySdM/z4vWgdZLoRtrf
	2qX92XEIiwQCi5NXZrvGEFl4pXV6C8BwF2yAdtVd/CqpY2EiqpccAPR6U+Wx34cTFy+VLx0UyCg
	m5KBL9kU8LxWkIex0x+S3dl46ByYF35kR6MqWl7uM86yo7vRUKWbjwOkKV1ugonUQztWy/eOq6C
	xilfAyJFuDp4VVKPcl3k3aotfGRTRIZqjiIwlveMOrooEpO9OXnAvcjm1Y=
X-Received: by 2002:a05:600c:630a:b0:49d:2625:1b0f with SMTP id 5b1f17b1804b1-49d26251b4cmr36609165e9.31.1789026319826;
        Thu, 10 Sep 2026 00:45:19 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm54366260f8f.25.2026.09.10.00.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:45:19 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v3] Documentation: hwmon: (yogafan) adjust table alignment for long model name
Date: Thu, 10 Sep 2026 09:45:05 +0200
Message-ID: <20260910074505.1077544-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the reStructuredText table layout and column separators to
accommodate the longer product family string for the newly added IdeaPad
model (IdeaPad 3 15ALC6 Ub). This prevents Sphinx build warnings and
maintains proper visual alignment.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
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

