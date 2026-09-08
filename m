Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364E525A8A
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861024; cv=none; b=dpAa1XxO7gVII+Okm1x68ln4/bbJUZFGS/H5OAU7MIpY887C+NA3T5jm2MzPERAPrs68//kQ8uJspkZttY5sTNVMqb9makPKRjEzRSjOMvo9Zr3UPcJ+WE5iMfEVkc8C4e3MdKda3Z5NJtmHNqYWvSgKY+kLyt/SOtZORSb1cXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861024; c=relaxed/simple;
	bh=pQZHWbUauYzhKXZgERSKGkVg21iClqA7I2+s1O9zq+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQoqkQ0btEH7/qNqFC274ko1woW8KqR/myZO5iotUFW8IQPAIJM1NLNBbXZ2GotJ6J/giCder503U8/hqVqLg2t1cbW+oUP/ssu6T1CBqSmNQ3di6reqmIH+fBN6KO0rxhzyBlAf5QgDKBTEI/1zvKAKfR5CZqw+lIC7exoM1qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q29CEe6K; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q29CEe6K"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso4121630a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788861022; x=1789465822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBQuh1kx0yz2cTZ9l3fLuYcMsBYVoT0wURqzHnn9FPU=;
        b=Q29CEe6KZp3RwRtE19a9KHr+el/uzGbZ1fwFDGqBdfDORJvxJDNHZV9P9XZ5k5cKEn
         OutrC/qadMyHiPXzWH2CoVQyBAgwa/lmFPU4gEsES1D0NWcSmfiFjxsqDFI2kpP0I6QE
         Dpokh+v/TIRyzjeS4vH3Zj9uMGotg100psS1ff+jrbYc3up4jAPjM7ohyf4CmTVCap8g
         FT+gdi1+tEai44GFqQx8vxZYh9OHXmlxNq6K7xUKeb5ALyE3p8HpPTbnCoMCfyDrRVHo
         WA0Of9ALU43rDXj01KD+ummWzrManSQrNP132VMkaHTRKU0lUaqIUirWvipbVtG83wXo
         kVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861022; x=1789465822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBQuh1kx0yz2cTZ9l3fLuYcMsBYVoT0wURqzHnn9FPU=;
        b=PcIaX2jBiLX11ESYrHKjypg1xuzZI1fOrZ97HzUfM9Lsk8fpiLpdy52pzUTdY+6wCy
         Y3gTHETzz81Q+tnyWP74LfyLQiedkXp9O2/LD3PygiybnAvy5cDWr3KueyevVIGUFAgS
         bdDDuK34rHK2CAdWCFNRumUQyxPrGyj7X7qR8jIsXh2jBxXYOpzc1cdlVpLhnlCtbh9t
         5gMOK/k/ImMH4onansyMoXVieox3B78B1t4zTRLC31dHGFEe2aLTGz56YklFxhGTAbEY
         8JbkGSo8WMejJIQjTumDcemVm7MXci8hZ0zzIiu7dLbYef5BLO+gOPnP3EMVLKoMJVyR
         Cojw==
X-Gm-Message-State: AFuF++k3t+jQycTaVSo45NmFC73cXAYRoYra2mc0zjd12mIuw2CgYlTd
	7USNjXVWikwGb31EPFRr+5iRnZh1Rq6pju3OQdH66JU+wDm2gIrXfSm2
X-Gm-Gg: AYBFou0i5jUsFr4Px6qzcj3C+xt6yjkCN73UtFWyeLbV7WLHqJkDPKNmXmRS68xG+t+
	6COm3gTA5qpqU3HLivu4Au/5AZxk2gM80Phy43Zy/cmloB0i8jAnMr31Scn352Dkvh2AgTMiGKv
	Z7HpdUWqTc8aL+XxQRk/ZgRUot8UMjgwPK3K2+yZ07FYOOTqP8NugM7LAzTqQOLh2CClsIGFFn9
	nM6Np0F+ZOyYmyE5P/rpKfmFHsbZ9ZoZOZu+WGRd4Lej39Jt2xiAtT6s6RXxP3+fi2sIGQXQNy/
	ISFNKsxRcP+hWwHTu+hG4gbCC1Zd40NLRrytGXCdZ1s2K7lfZF4FEaoIRP8waz1zjNIFm1LxQw3
	+NkSMW9SLiN1MzHsI8LPZ+WuIPZhkBa2NtJRCUSn9CZWlhDnXzw1VlTZWfruqUDjqaFLAtaoTYt
	lhIMAZz1vkVsJ3dUcOFRoi+tamx/54sA9SVXqKJqkWT9ZdrJ1X+9QvJcpufeM+t0wdlqSBcHy90
	f9SEk/kD3e/bHqFioIbAIkRSjKconH7HQxSeFGJ+A==
X-Received: by 2002:a05:6a20:7288:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3da39b437bemr40883077637.3.1788861022210;
        Tue, 08 Sep 2026 02:50:22 -0700 (PDT)
Received: from sergio-82n7.fritz.box (static-23-234-74-239.cust.tzulo.com. [23.234.74.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm32256614c88.14.2026.09.08.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:50:21 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v2] hwmon: (yogafan) Update reference database and contributors for new models
Date: Tue,  8 Sep 2026 11:50:09 +0200
Message-ID: <20260908095009.2227661-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation entries for the newly supported laptop models
(Yoga 14cACN 2021, Yoga 740-15IML, and IdeaPad 3 15ALC6 Ub) in the
master reference database table, and include the new contributor.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v2: Split changes and addressed reviewer comments.
---
 Documentation/hwmon/yogafan.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 9ff5db5dc..5c21c50b7 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -87,6 +87,9 @@ immediately to ensure the user knows the fan has stopped.
 
  MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
  ----------------------------------------------------------------------------------------------------
+ 82N7           | Yoga 14cACN 2021   | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81TD           | Yoga 740-15IML     | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6 Ub| 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
  80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
  83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
@@ -159,6 +162,7 @@ Contributors & DSDT Providers:
 - **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
 - **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
 - **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
+- **wizard-28** (IdeaPad 3 15ALC6 Ub - 82KU)
 - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
-- 
2.55.0

