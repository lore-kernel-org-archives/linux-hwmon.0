Received: from mail.fintek.com.tw (mail.fintek.com.tw [59.120.186.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83462B2D7;
	Tue, 23 Dec 2025 05:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=59.120.186.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766467978; cv=none; b=NVpZdVcSFO8bIisjQDph7exXmtlW1H/cRHpCesxpLBAXqs8wFhJXS+aFahwMLWqQ11S/p+yNweIBiKdiCSUpKrg+DPql+lntCaPQsIs2M5epsPz30btCCbD7EdUxrw/XDbel/6rf9BVVYyiZ4tobB89LON7GAhttrk+LMdvsq2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766467978; c=relaxed/simple;
	bh=zhTqUY3AJwOxyn6ixk1jozdi8SaBW/ZkGUIKlHrVviU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fk/A5rWJ0ZODynqjdAzWnGhtlviMoRfRyNcVD12SUxKrgGWpjl6nggE0DZTXmmLKuxj0X0QOsFNnmTki94E5E2JdGOvu9lnGZzlgFjrhOzZiUISV/CX0cMw0po6i783N7lgajHIFcN7yxT+wpYwDA9fsJFv8SvD8LuWfBjFGO5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintek.com.tw; spf=pass smtp.mailfrom=fintek.com.tw; arc=none smtp.client-ip=59.120.186.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintek.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintek.com.tw
Received: from mail.fintek.com.tw (localhost [127.0.0.2] (may be forged))
	by mail.fintek.com.tw with ESMTP id 5BN5DCJa016439;
	Tue, 23 Dec 2025 13:13:12 +0800 (+08)
	(envelope-from peter_hong@fintek.com.tw)
Received: from vmMailSRV.fintek.com.tw ([192.168.1.1])
	by mail.fintek.com.tw with ESMTP id 5BN5CgNK016368;
	Tue, 23 Dec 2025 13:12:42 +0800 (+08)
	(envelope-from peter_hong@fintek.com.tw)
Received: from localhost (192.168.1.128) by vmMailSRV.fintek.com.tw
 (192.168.1.1) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 23 Dec
 2025 13:12:42 +0800
From: "Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>
To: <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <hpeter+linux_kernel@gmail.com>,
        "Ji-Ze Hong (Peter Hong)"
	<peter_hong@fintek.com.tw>
Subject: [PATCH V1] hwmon: f71882fg: Add F81968 support
Date: Tue, 23 Dec 2025 13:10:40 +0800
Message-ID: <20251223051040.10227-1-peter_hong@fintek.com.tw>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-12.5.0.2055-9.0.1002-27556.001
X-TM-AS-Result: No-5.320300-8.000000-10
X-TMASE-MatchedRID: I6rpFm0lrcPQ9t8zINQJxJlQbjWLQqObPAxIUC0bmYxXGTbsQqHbkopr
	7ZAmElOTnuC4VmJFPYaxSUdSYpajDy/7QU2czuUNA9lly13c/gG+9Emz7bPXpqoDeu6wu7bqPe8
	xAlmWtaP+d+bwiBCDhOXqKcJVScpRlXlA6F65Sc08xwCU4LSqsPZbeAQELiBUfsZmhE+Kc5OjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq1I/DUJ1JkwdQEZ6zZBh0XnYDd6iy6prUL/m1BhIIDhtTAcS
	hkf1ded99eG0AqcKV/TdkjVbtw7zfTbaNA++MvBII0wJyBcUAt+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-5.320300-8.000000
X-TMASE-Version: SMEX-12.5.0.2055-9.0.1002-27556.001
X-TM-SNTS-SMTP:
 C18A8B62C54F2752A7A2C548824A20D8F3770381F4A6D38511A7816501BC252D2000:8
X-DKIM-Results: [192.168.1.1]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:mail.fintek.com.tw 5BN5DCJa016439

This adds hardware monitor support the Fintek F81968 Super I/O chip.
It has fully compatible with F81866.

Several products share compatibility with the F81866. To better
distinguish between them, this patch ensures the Product ID is
displayed when the device is probed.

Signed-off-by: Ji-Ze Hong (Peter Hong) <peter_hong@fintek.com.tw>
---
 drivers/hwmon/f71882fg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index df83f9866fbc..204059d2de6c 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -51,6 +51,7 @@
 #define SIO_F81866_ID		0x1010	/* Chipset ID */
 #define SIO_F71858AD_ID		0x0903	/* Chipset ID */
 #define SIO_F81966_ID		0x1502	/* Chipset ID */
+#define SIO_F81968_ID		0x1806	/* Chipset ID */
 
 #define REGION_LENGTH		8
 #define ADDR_REG_OFFSET		5
@@ -2570,6 +2571,7 @@ static int __init f71882fg_find(int sioaddr, struct f71882fg_sio_data *sio_data)
 		break;
 	case SIO_F81866_ID:
 	case SIO_F81966_ID:
+	case SIO_F81968_ID:
 		sio_data->type = f81866a;
 		break;
 	default:
@@ -2599,9 +2601,9 @@ static int __init f71882fg_find(int sioaddr, struct f71882fg_sio_data *sio_data)
 	address &= ~(REGION_LENGTH - 1);	/* Ignore 3 LSB */
 
 	err = address;
-	pr_info("Found %s chip at %#x, revision %d\n",
+	pr_info("Found %s chip at %#x, revision %d, devid: %04x\n",
 		f71882fg_names[sio_data->type],	(unsigned int)address,
-		(int)superio_inb(sioaddr, SIO_REG_DEVREV));
+		(int)superio_inb(sioaddr, SIO_REG_DEVREV), devid);
 exit:
 	superio_exit(sioaddr);
 	return err;
-- 
2.34.1

