Received: from mail.extremenerds.net (180-150-21-244.b49615.mel.static.aussiebb.net [180.150.21.244])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5781209F5A
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Dec 2025 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.150.21.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766441775; cv=none; b=biBS9f93q9NfIl8GqDxvi/Dm+wRpGnMcJCXDbvgb+x6uHi77xtaE7zw+T4UkJGljkk6TguREXNl1SYXmI1dbjy0WFND63cItOWLhrjBMfhtDYD0XJuj9q/gOZ9cmREju3DBTm/d/ZX4Uwn4LmmELHw7OTY/LgkyDFhO1AJkzBm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766441775; c=relaxed/simple;
	bh=VSGLvX4+QYC+f9BVQOel6a4vq8Niogf3594JkPcrayI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/6aMjnELRy+bxarbdAw+FidLnTf+R15teXdqlm0dEURxzOCTqA/sbVnw9aN7kDZb6WBCqopsHNvjD6SDMExNKfMUOlnGQHtwQ7E8ebxSkL7EVwrraPm+bX8Pv+Cx5h6G5zCjJd8JGXUTsRKHCPMsS3J+2JH8cwTWzk/i0D7DzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=extremenerds.net; spf=pass smtp.mailfrom=extremenerds.net; arc=none smtp.client-ip=180.150.21.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=extremenerds.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=extremenerds.net
Received: by mail.extremenerds.net (Postfix, from userid 0)
	id 2D8BF7A042C; Tue, 23 Dec 2025 09:10:21 +1100 (AEDT)
From: Anj Duvnjak <avian@extremenerds.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Anj Duvnjak <avian@extremenerds.net>
Subject: [PATCH] hwmon: (nct6683) Add customer ID for ASRock Z590 Taichi
Date: Tue, 23 Dec 2025 09:09:42 +1100
Message-ID: <20251222220942.10762-1-avian@extremenerds.net>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for customer ID 0x1621 found on ASRock Z590 Taichi
boards using the Nuvoton NCT6686D embedded controller.

This allows the driver to instantiate without requiring the
force=1 module parameter.

Tested on two separate ASRock Z590 Taichi boards, both with
EC firmware version 1.0 build 01/25/21.

Signed-off-by: Anj Duvnjak <avian@extremenerds.net>
---
 Documentation/hwmon/nct6683.rst | 1 +
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 3e549ba95a15..45eec9dd349a 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -65,6 +65,7 @@ AMD BC-250			NCT6686D EC firmware version 1.0 build 07/28/21
 ASRock X570			NCT6683D EC firmware version 1.0 build 06/28/19
 ASRock X670E			NCT6686D EC firmware version 1.0 build 05/19/22
 ASRock B650 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 11/09/23
+ASRock Z590 Taichi		NCT6686D EC firmware version 1.0 build 01/25/21
 MSI B550			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI X670-P			NCT6687D EC firmware version 0.0 build 09/27/22
 MSI X870E			NCT6687D EC firmware version 0.0 build 11/13/24
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 6cda35388b24..4a8380414038 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -181,6 +181,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_ASROCK2	0xe1b
 #define NCT6683_CUSTOMER_ID_ASROCK3	0x1631
 #define NCT6683_CUSTOMER_ID_ASROCK4	0x163e
+#define NCT6683_CUSTOMER_ID_ASROCK5	0x1621
 
 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1242,6 +1243,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK4:
 		break;
+	case NCT6683_CUSTOMER_ID_ASROCK5:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;
-- 
2.46.4

