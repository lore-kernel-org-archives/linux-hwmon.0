Return-Path: <linux@rasmusvillemoes.dk>
Return-path: <linux@rasmusvillemoes.dk>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: hwmon: remove redundant cast
Date: Sat, 27 Oct 2018 00:30:59 +0200
Message-Id: <20181026223059.17652-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

struct attribute::name which this local variable name is eventually
assigned to is "const char*", and so is the template parameter. We might
as well preserve the constness all the way through.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/hwmon/hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 975c95169884..ea42c5ec40d9 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -267,7 +267,7 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	struct device_attribute *dattr;
 	struct attribute *a;
 	umode_t mode;
-	char *name;
+	const char *name;
 	bool is_string = is_string_attr(type, attr);
 
 	/* The attribute is invisible if there is no template string */
@@ -289,7 +289,7 @@ static struct attribute *hwmon_genattr(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	if (type == hwmon_chip) {
-		name = (char *)template;
+		name = template;
 	} else {
 		scnprintf(hattr->name, sizeof(hattr->name), template,
 			  index + hwmon_attr_base(type));
-- 
2.19.1.6.gbde171bbf5
