Return-path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (core) fix resource leak on devm_kcalloc failure
Date: Sun, 23 Oct 2016 21:56:08 +0100
Message-Id: <20161023205608.11867-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

If dev_kcalloc fails to allocate hw_dev->groups then the current
exit path is a direct return, causing a leak of resources such
as hwdev and ida is not removed.  Fix this by exiting via the
free_hwmon exit path that performs the necessary resource cleanup.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/hwmon.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index adae684..a74c075 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -536,8 +536,10 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 
 		hwdev->groups = devm_kcalloc(dev, ngroups, sizeof(*groups),
 					     GFP_KERNEL);
-		if (!hwdev->groups)
-			return ERR_PTR(-ENOMEM);
+		if (!hwdev->groups) {
+			err = -ENOMEM;
+			goto free_hwmon;
+		}
 
 		attrs = __hwmon_create_attrs(dev, drvdata, chip);
 		if (IS_ERR(attrs)) {
-- 
2.9.3
