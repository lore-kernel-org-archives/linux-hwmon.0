Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD422DFBA
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Jun 2025 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315027; cv=none; b=DXY9DtKwnJ2FC+sE4JEOzX+fBHubQu6Dfv+IFv1afMtpLBOsJn+e2yRmtCUAkC0d0zQOjjObpopl7lSgd+nbZtrz/gmgPxwzhWSw+Veqe9qsFSZvnAlKI9VKsBD+vPgEKdb67GlEzc61rtqsQAuQUpRjtCnGYBuX0fR5fF3Aipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315027; c=relaxed/simple;
	bh=mZlEmvD3KPidDOpFpGZ38nUlEn3Xf9GoWcJQF8TUkSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ihF0gWILwFx1Ihacl2EXoj2v63o5vxUoMgVAXQVBO9uIn4H4E2Ovr47L1L7b7gXG+/o7JZft/5gH1GP5I3z56Hjr8cKdjgEuLhpoaAvzL5NVpoCO+tk07V1ykcBhVhjUxDQcDk8afw3rDBcuHcjM2pbGSrDSFozFfTSIZbuGsVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=hlTt49JO; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="hlTt49JO"
Received: from shaan-pc (unknown [IPv6:2a01:5241:a25:700:aba3:3041:2489:ff88])
	(Authenticated sender: shantanu)
	by letterbox.kde.org (Postfix) with ESMTPSA id 518B732E2D2;
	Mon, 30 Jun 2025 21:15:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1751314505; bh=QTyEJbVVeyDhSsonU5CqxeWxH9g8tmO4ai5vmBUL+oU=;
	h=From:To:Cc:Subject:Date:From;
	b=hlTt49JOkMDB3yA7/FLIeqeUUCKngRoJawVNVxlS40JMSp0HitoA7bYQ59VLOek/r
	 JsGLGu29Sp3vtub0hkQcla99XI7pmuXCGMInl0+Eu9BvFu7tFT9SpXDUz24lJvm1GA
	 U38EPhPRjQISMG/PLX72gWPdet/LCDfq8YqsJBogJbITVKXyzz3jlhG18WVy39q4/a
	 PGF7wUzVdWxW4V3oLLPSnYRHqSOxvh/myGMBdfathfN4ESOqCgFWoPXJ29xb1JDdey
	 SURGVm787dYgrcYGk8YacgwIhkuINUN5mVZPAe7GuXiK2+EuFdW2APMC7U7zCp+6M/
	 SPEVKNe/f+NCw==
From: Shantanu Tushar <shantanu@kde.org>
To: wilken.gottwalt@posteo.net
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	Shantanu Tushar <shantanu@kde.org>
Subject: [PATCH] hwmon: (corsair-psu) add support for HX1200i Series 2025
Date: Mon, 30 Jun 2025 22:14:44 +0200
Message-ID: <20250630201444.210420-1-shantanu@kde.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the USB ID of the Corsair HXi Series 2025 HX1200i PSU (CP-9020307).
Update the documentation to mention this.

Signed-off-by: Shantanu Tushar <shantanu@kde.org>
---
 Documentation/hwmon/corsair-psu.rst | 2 +-
 drivers/hwmon/corsair-psu.c         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
index 7ed794087f84..2e99cfd556a0 100644
--- a/Documentation/hwmon/corsair-psu.rst
+++ b/Documentation/hwmon/corsair-psu.rst
@@ -17,7 +17,7 @@ Supported devices:
 
   Corsair HX1000i (Legacy and Series 2023)
 
-  Corsair HX1200i (Legacy and Series 2023)
+  Corsair HX1200i (Legacy, Series 2023 and Series 2025)
 
   Corsair HX1500i (Legacy and Series 2023)
 
diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index f8f22b8a67cd..6b5c8f200780 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -885,6 +885,7 @@ static const struct hid_device_id corsairpsu_idtable[] = {
 	{ HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsair HX1000i Series 2023 */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy and Series 2023 */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c23) }, /* Corsair HX1200i Series 2023 */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c27) }, /* Corsair HX1200i Series 2025 */
 	{ },
 };
 MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);
-- 
2.50.0

