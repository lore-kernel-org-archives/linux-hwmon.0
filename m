Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@aj.id.au,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [prefix=PATCH] drivers: pmbus: core: Prevent calling pmbus_set_page with negative page
Date: Wed, 25 Oct 2017 14:52:53 -0500
Message-Id: <1508961173-22686-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

For devices with word data registers, the pmbus core may call read/write
word data functions with a page value of -1, in order to perform the
operation without setting the page. However, the read/write word data
functions accept only unsigned 8-bit page numbers, resulting in setting
a page of 0xFF in this situation. This may result in errors or undefined
behavior of some devices (specifically the ir35221, which allows the
page to be set to 0xFF, but some subsequent operations to read registers
may fail).

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  4 ++--
 drivers/hwmon/pmbus/pmbus_core.c | 29 ++++++++++++++++++-----------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 4efa2bd..4a16da6 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -405,8 +405,8 @@ struct pmbus_driver_info {
 
 void pmbus_clear_cache(struct i2c_client *client);
 int pmbus_set_page(struct i2c_client *client, u8 page);
-int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg);
-int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word);
+int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg);
+int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg, u16 word);
 int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg);
 int pmbus_write_byte(struct i2c_client *client, int page, u8 value);
 int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 302f0ae..6d6e030 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -186,13 +186,16 @@ static int _pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 	return pmbus_write_byte(client, page, value);
 }
 
-int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word)
+int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
+			  u16 word)
 {
 	int rv;
 
-	rv = pmbus_set_page(client, page);
-	if (rv < 0)
-		return rv;
+	if (page >= 0) {
+		rv = pmbus_set_page(client, page);
+		if (rv < 0)
+			return rv;
+	}
 
 	return i2c_smbus_write_word_data(client, reg, word);
 }
@@ -219,13 +222,15 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
 	return pmbus_write_word_data(client, page, reg, word);
 }
 
-int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg)
+int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg)
 {
 	int rv;
 
-	rv = pmbus_set_page(client, page);
-	if (rv < 0)
-		return rv;
+	if (page >= 0) {
+		rv = pmbus_set_page(client, page);
+		if (rv < 0)
+			return rv;
+	}
 
 	return i2c_smbus_read_word_data(client, reg);
 }
@@ -269,9 +274,11 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 {
 	int rv;
 
-	rv = pmbus_set_page(client, page);
-	if (rv < 0)
-		return rv;
+	if (page >= 0) {
+		rv = pmbus_set_page(client, page);
+		if (rv < 0)
+			return rv;
+	}
 
 	return i2c_smbus_write_byte_data(client, reg, value);
 }
-- 
1.8.3.1
