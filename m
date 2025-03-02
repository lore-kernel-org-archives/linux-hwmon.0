Received: from mail.mixaill.net (mail.mixaill.net [144.76.234.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D4258A
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Mar 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.234.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740930666; cv=none; b=dwlcotbwmViga/8zEF0OTAXDojkgOJ1fiw6B7gggBKkl1aVSW02XOBx6aq7nfVwRRtyOBkEIP9hbL29EbBLJE08BDBd6gFXj6vG2G2CFXUKim/k6Y90ELFgjDO1LKT5WHLeq4Ei8LoTHCeb6/l6ijxeNbbTvz/FCm0RBf0kc62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740930666; c=relaxed/simple;
	bh=Ir8ZI4R2IM4pyCCWWX2IRNe6GehZJvXY6fdXKVLdkQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEyHpHsez9bbGCEKcP1F7rLHUjsbxIoMnJ4Iv4lIyerhc0dQVF5OXPSqQnYuidzDu9mRBmjeXen3u4l1Sb2o69wWTtf6a17sNp8pkg6k7TytNENOFY15+Di9da6Ch7xBC+lYSn73Sb5xxdHikhygIEDgYMijsIbiO8P12++VzCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net; spf=pass smtp.mailfrom=mixaill.net; dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b=HW2kZ4M6; arc=none smtp.client-ip=144.76.234.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mixaill.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b="HW2kZ4M6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9A696E6F4;
	Sun,  2 Mar 2025 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mixaill.net; s=dkim;
	t=1740930662; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=YG9lBUpLJfhhzYEZH6l6Enzmsv4WhFsOvD/G0fAlccE=;
	b=HW2kZ4M6L0bB/JAQ+PEtD28rOXMM3P/sukE8/mbc3QG6kpCFbGrllHuh5NDMZivojqoAmq
	sQn/QapIdCkpNlBOdyXCHkdmeOwaaXNBXPXry3hqU9JIFrEq9o3wlJIr0hoAaShil1vyOH
	aVXzCgTOrwuB5cNT+b/sROX+prngkpY5c5/THgPlYwMw1faLPLwrepl8jXOwrh7E3AEZXK
	iyV4GFmRSVOVKobcVzavqh4xkFSnjMBi2Q5pIzYuuxjhErtJNYNjs3PMPZNHHSkrQFv9UO
	enbOratNZF2yvKbxT11W1EBJ+PyNBKL8ZKhAjwqONr1iKG6utHD+F80YF+izyg==
From: Mikhail Paulyshka <me@mixaill.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Mikhail Paulyshka <me@mixaill.net>
Subject: [PATCH] hwmon: (nct6683) Add customer ID for AMD BC-250
Date: Sun,  2 Mar 2025 18:50:53 +0300
Message-ID: <20250302155053.50096-1-me@mixaill.net>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This value was found on an AMD BC-250 board with an
NCT6686D chip.

Signed-off-by: Mikhail Paulyshka <me@mixaill.net>
---
 Documentation/hwmon/nct6683.rst | 3 ++-
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 8d4a20d99e59..3e549ba95a15 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -3,7 +3,7 @@ Kernel driver nct6683
 
 Supported chips:
 
-  * Nuvoton NCT6683D/NCT6687D
+  * Nuvoton NCT6683D/NCT6686D/NCT6687D
 
     Prefix: 'nct6683'
 
@@ -61,6 +61,7 @@ Board				Firmware version
 Intel DH87RL			NCT6683D EC firmware version 1.0 build 04/03/13
 Intel DH87MC			NCT6683D EC firmware version 1.0 build 04/03/13
 Intel DB85FL			NCT6683D EC firmware version 1.0 build 04/03/13
+AMD BC-250			NCT6686D EC firmware version 1.0 build 07/28/21
 ASRock X570			NCT6683D EC firmware version 1.0 build 06/28/19
 ASRock X670E			NCT6686D EC firmware version 1.0 build 05/19/22
 ASRock B650 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 11/09/23
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 416ac02e9f74..6cda35388b24 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -176,6 +176,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_MSI2	0x200
 #define NCT6683_CUSTOMER_ID_MSI3	0x207
 #define NCT6683_CUSTOMER_ID_MSI4	0x20d
+#define NCT6683_CUSTOMER_ID_AMD		0x162b
 #define NCT6683_CUSTOMER_ID_ASROCK		0xe2c
 #define NCT6683_CUSTOMER_ID_ASROCK2	0xe1b
 #define NCT6683_CUSTOMER_ID_ASROCK3	0x1631
@@ -1231,6 +1232,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_MSI4:
 		break;
+	case NCT6683_CUSTOMER_ID_AMD:
+		break;
 	case NCT6683_CUSTOMER_ID_ASROCK:
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK2:
-- 
2.48.1

