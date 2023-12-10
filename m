X-Greylist: delayed 23613 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 10 Dec 2023 20:38:13 PST
Received: from ms-10.1blu.de (ms-10.1blu.de [178.254.4.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8713B3;
	Sun, 10 Dec 2023 20:38:13 -0800 (PST)
Received: from [2.211.185.227] (helo=marius.fritz.box)
	by ms-10.1blu.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mail@mariuszachmann.de>)
	id 1rCRug-003d73-0b;
	Sun, 10 Dec 2023 23:04:38 +0100
From: Marius Zachmann <mail@mariuszachmann.de>
To: linux@roeck-us.net,
	mail@mariuszachmann.de,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jdelvare@suse.com
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] hwmon: corsair-cpro: use NULL instead of 0
Date: Sun, 10 Dec 2023 23:03:57 +0100
Message-ID: <20231210220357.77036-1-mail@mariuszachmann.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Con-Id: 241080
X-Con-U: 0-mail

Replaces the integer 0 with NULL.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312100455.k6m2eO4N-lkp@intel.com/
Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
---
 drivers/hwmon/corsair-cpro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index 463ab4296ede..a284a02839fb 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -524,7 +524,7 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		goto out_hw_close;
 	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
-							 ccp, &ccp_chip_info, 0);
+							 ccp, &ccp_chip_info, NULL);
 	if (IS_ERR(ccp->hwmon_dev)) {
 		ret = PTR_ERR(ccp->hwmon_dev);
 		goto out_hw_close;
-- 
2.43.0

