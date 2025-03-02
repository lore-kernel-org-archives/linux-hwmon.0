Received: from mail.mixaill.net (mail.mixaill.net [144.76.234.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF91D799D
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Mar 2025 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.234.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740931158; cv=none; b=GTktixhfrLT/pOaPN4W3Z6/PKpmcCq+s9mOHvuLu0qPdgQFJRVOw7BkRPAYAl9QrkGJP9+T28Opl7ibqO/RESKp4tAc8h0lToL1vIQi8KdU3Uzz4vrXk8UuVjiUFXwxl2T3Cu0U839jmOzcB2WthrjrO7getYqTtfkVeAMmGFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740931158; c=relaxed/simple;
	bh=xCoi9Lfc+NQTsbPNvw6ylApLpqhUn3U6iON7oKxnV2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b9d/DvyRP24yKOCNhkkNGn3UedXsQoX/OHOQSVqG2Wgm1gbh6B6InLVWStNzX5xFoR2e5XdOL4JFF59M4PEL5Vud/4H0BR0q4u2CkuBi3wLub9Jba9sn3Bn8eCCTL+bwrIGoWllYbQXtsdrQWnFHmN4YLQTph+T7vP6qI+IZOWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net; spf=pass smtp.mailfrom=mixaill.net; dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b=sI0x9eEj; arc=none smtp.client-ip=144.76.234.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mixaill.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b="sI0x9eEj"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B76536E6E6;
	Sun,  2 Mar 2025 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mixaill.net; s=dkim;
	t=1740930642; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9PpgwLxV42ib2xn9HpYjq+0AUZOusAuQecCftaeNUCg=;
	b=sI0x9eEj88AdIujBH4rrHZdwqimClZSPNpULEthIZfbTVffTZ5Uee/HkwIkJx0eHNM5zCL
	6BA7zuf9BlG8ScrADjoZj/LOsJ7falTwXz7sT5GfN9Ks3DZ370vWZkQlsSoHKOO4JYSQPT
	4slXwwMs8eQkUSeGkNI1gFHaiULpeRgMwyq/fqFAdqyxCTogeJjDKO5T3vqYX53TOe4e4c
	gBIeq08zmsXgfDJ3WNmQ9BCRVEADvpwlxpp6n7lW5aCEms5pTEDO6Bmxk8G2LQ7OwgKM7i
	CY08ymfP1+tAXZytfhsm/r/FNeX7/BZeohRzNkENjnCk542+uHc2HCirMvemlQ==
From: Mikhail Paulyshka <me@mixaill.net>
To: Clemens Ladisch <clemens@ladisch.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Mikhail Paulyshka <me@mixaill.net>
Subject: [PATCH] hwmon: (k10temp) add support for cyan skillfish
Date: Sun,  2 Mar 2025 18:50:09 +0300
Message-ID: <20250302155009.49951-1-me@mixaill.net>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add support for Cyan Skillfish (AMD Family 17h Model 47h),
which appear to be Zen 2 based APU.

The patch was tested with an AMD BC-250 board.

Signed-off-by: Mikhail Paulyshka <me@mixaill.net>
---
 drivers/hwmon/k10temp.c | 2 ++
 include/linux/pci_ids.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index d0b4cc9a5011..3685906cc57c 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -467,6 +467,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			k10temp_get_ccd_support(data, 4);
 			break;
 		case 0x31:	/* Zen2 Threadripper */
+		case 0x47:	/* Cyan Skillfish */
 		case 0x60:	/* Renoir */
 		case 0x68:	/* Lucienne */
 		case 0x71:	/* Zen2 */
@@ -535,6 +536,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M40H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_MA0H_DF_F3) },
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 1a2594a38199..41dfb3b0d9b9 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -569,6 +569,7 @@
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
 #define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
+#define PCI_DEVICE_ID_AMD_17H_M40H_DF_F3 0x13f3
 #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3 0x144b
 #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
 #define PCI_DEVICE_ID_AMD_17H_MA0H_DF_F3 0x1727
-- 
2.48.1

