Return-Path: <linux@rasmusvillemoes.dk>
Return-path: <linux@rasmusvillemoes.dk>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH 7/7] drivers: hwmon: add runtime format string checking
Date: Sat, 27 Oct 2018 01:24:09 +0200
Message-Id: <20181026232409.16100-8-linux@rasmusvillemoes.dk>
In-Reply-To: <20181026232409.16100-1-linux@rasmusvillemoes.dk>
References: <20171108223020.24487-1-linux@rasmusvillemoes.dk>
 <20181026232409.16100-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

With -Wformat-nonliteral, gcc complains

drivers/hwmon/hwmon.c: In function ‘hwmon_genattr’:
drivers/hwmon/hwmon.c:282:6: warning: format not a string literal, argument types not checked [-Wformat-nonliteral]
      index + hwmon_attr_base(type));

Add a runtime check to ensure that the template indeed has a single %d
printf specifier. Using fmtcheck() also makes gcc verify that the
expression 'index + hwmon_attr_base(type)' is suitable for %d.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/hwmon/hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 33d51281272b..ec6f5f36b5fc 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -278,7 +278,8 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	if (type == hwmon_chip) {
 		name = (char *)template;
 	} else {
-		scnprintf(hattr->name, sizeof(hattr->name), template,
+		scnprintf(hattr->name, sizeof(hattr->name),
+			  fmtcheck(template, "type%dwhat", 0),
 			  index + hwmon_attr_base(type));
 		name = hattr->name;
 	}
-- 
2.19.1.6.gbde171bbf5
