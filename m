Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32C3368BD;
	Tue,  7 Apr 2026 05:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775539402; cv=none; b=Lfi54BAxDiekjqqer5iMUy+jRcYtTPaDYyqOZyegjSOGSXHH/Kw658M5PNpoEygHhZ+2nJiAPg1dBCjZZ45xf6BjvEq+cbk9OVA+WZQ0KDwbRdubiufe73ChTAj+rysUaM6DN9AKrd8lYRHpcyBayTvYNCfiGD3a97yJXF9Hwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775539402; c=relaxed/simple;
	bh=bMfKWVgfohz0xJh1spoyz7nf9+IvSHS78ka45Zjjf3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VWcfXiDcetDyORzxK2t9WpEuNIthixh1v3uEHc1wueruPHVGNsprj5YnS/oiClnmrHRj6GEUJw2IjOONoaOk5WANhBEByeCn9/+3+0xy0g3voLfc64kuztjQJDBQhGJYaX7/gvbV5kOA2PdWxmrgZvHf4maoYou0UvJ2/Cvto6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bZhyWBJH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bZhyWBJH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=nMZ5rC/bRYScvN59mBDkKBl8K5cG89Y/D/rnj2TllSk=; b=bZhyWBJH/jz4XqDstk9a2y5G5P
	oDCh4gUIKFMITEiOyaAUXIec76g3z7ribseyRfiv6cRUjuouqhyVkMuEAam36i3fDDi4RDMkNechy
	3uOIA5A6sORUw/SsXwyGZ7b2IlnwTku///wwsUro+GcCWn5EIKILYPklsNIFwBnq4rgkt8l9uaShg
	a0J8Cs2fuC+wb5/aS6ahpHg3cFogHMRhSwB5Mw6WEHlhzixwAsgONNouU0CJFkRQcPJvcGJGheh8Q
	yAFVXqiJYdi0vL4ev+MAej35FGtMEvK7uWWD+xYYl0sXXosjKGCuGg9UswMWy57Tx6DE5vmTb5jQr
	qJuxWy3A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yuE-00000005uRA-26dq;
	Tue, 07 Apr 2026 05:23:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Sergio Melas <sergiomelas@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] hwmon: (yogafan) various markup improvements
Date: Mon,  6 Apr 2026 22:23:17 -0700
Message-ID: <20260407052317.2097791-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are several places in yogafan.rst where it appears that lines
are meant to be presented on their own but instead they are strung
together due to the lack of markups. Fix these issues by:

- using bullets where needed
- indenting continuation lines of bulleted items
- using a table where appropriate
- using a literal block where appropriate

Fixes: c67c248ca406 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Sergio Melas <sergiomelas@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/hwmon/yogafan.rst |   55 ++++++++++++++++--------------
 1 file changed, 31 insertions(+), 24 deletions(-)

--- linux-next-20260406.orig/Documentation/hwmon/yogafan.rst
+++ linux-next-20260406/Documentation/hwmon/yogafan.rst
@@ -7,8 +7,8 @@ Kernel driver yogafan
 Supported chips:
 
   * Lenovo Yoga, Legion, IdeaPad, Slim, Flex, and LOQ Embedded Controllers
-    Prefix: 'yogafan'
-    Addresses: ACPI handle (See Database Below)
+  * Prefix: 'yogafan'
+  * Addresses: ACPI handle (See Database Below)
 
 Author: Sergio Melas <sergiomelas@gmail.com>
 
@@ -31,19 +31,21 @@ deterministically via a DMI Product Fami
 eliminating the need for runtime heuristics.
 
 1. 8-bit EC Architecture (Multiplier: 100)
+
    - **Families:** Yoga, IdeaPad, Slim, Flex.
    - **Technical Detail:** These models allocate a single 8-bit register for
-   tachometer data. Since 8-bit fields are limited to a value of 255, the
-   BIOS stores fan speed in units of 100 RPM (e.g., 42 = 4200 RPM).
+     tachometer data. Since 8-bit fields are limited to a value of 255, the
+     BIOS stores fan speed in units of 100 RPM (e.g., 42 = 4200 RPM).
 
 2. 16-bit EC Architecture (Multiplier: 1)
+
    - **Families:** Legion, LOQ.
    - **Technical Detail:** High-performance gaming models require greater
-   precision for fans exceeding 6000 RPM. These use a 16-bit word (2 bytes)
-   storing the raw RPM value directly.
+     precision for fans exceeding 6000 RPM. These use a 16-bit word (2 bytes)
+     storing the raw RPM value directly.
 
-Filter Details:
----------------
+Filter Details
+--------------
 
 The RLLag filter is a passive discrete-time first-order lag model that ensures:
   - **Smoothing:** Low-resolution step increments are smoothed into 1-RPM increments.
@@ -66,8 +68,11 @@ Usage
 -----
 
 The driver exposes standard hwmon sysfs attributes:
+
+===============   ============================
 Attribute         Description
 fanX_input        Filtered fan speed in RPM.
+===============   ============================
 
 
 Note: If the hardware reports 0 RPM, the filter is bypassed and 0 is reported
@@ -78,22 +83,24 @@ immediately to ensure the user knows the
                  LENOVO FAN CONTROLLER: MASTER REFERENCE DATABASE (2026)
 ====================================================================================================
 
-MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
-----------------------------------------------------------------------------------------------------
-82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
-80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
-83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
-82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
-81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
-82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
-82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
-82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
-82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
-82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
-83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
-81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
-*Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
-----------------------------------------------------------------------------------------------------
+::
+
+ MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
+ ----------------------------------------------------------------------------------------------------
+ 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
+ 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
+ 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
+ 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
+ 82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
+ 83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
+ ----------------------------------------------------------------------------------------------------
 
 METHODOLOGY & IDENTIFICATION:
 
