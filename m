Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0BEC001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 22:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjGSWnH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 18:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjGSWnF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 18:43:05 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD981FE1
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 15:42:45 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56] (helo=orangina.lan)
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qMFsY-003Dvz-52; Wed, 19 Jul 2023 22:42:42 +0000
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [PATCH v3] hwmon: (nct6775) Add support for 18 IN readings for nct6799
Date:   Wed, 19 Jul 2023 23:41:42 +0100
Message-Id: <20230719224142.411237-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

* Add additional VIN/IN_MIN/IN_MAX register values
* Separate ALARM/BEEP bits for nct6799
* Update scaling factors for nct6799

Registers/alarms match for NCT6796D-S and NCT6799D-R
Tested on NCT6799D-R for new IN/MIN/MAX and ALARMS

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---

Notes:
    v3 changes:
    * Rebase after scaling-fix-for-6798 on hwmon-next
    * Update scale_in_6798 instead of separate array
    
    v2 changes:
    * Rebase after increased BITS with same registers
    * Assign missing ALARM_BITS and add BEEP_BITS
    * Add separate scaling_in and pass it through data as they were
        missing in v1 and the factors differ with other chips
    
    Additional IN/MIN/MAX results (sensors.conf labels, but no compute)
     0 CPUVC:          664.00 mV (min =  +0.00 V, max =  +1.74 V)
     1 VIN1:           992.00 mV (min =  +0.00 V, max =  +1.20 V)
     2 AVSB:             3.39 V  (min =  +3.01 V, max =  +3.50 V)
     3 3VCC:             3.30 V  (min =  +3.01 V, max =  +3.60 V)
     4 VIN0:             1.01 V  (min =  +0.95 V, max =  +1.20 V)
     5 VIN8:             1.02 V  (min =  +2.04 V, max =  +0.00 V)
     6 VIN4:           632.00 mV (min =  +0.00 V, max =  +1.00 V)
     7 3VSB:             3.41 V  (min =  +3.10 V, max =  +3.60 V)
     8 VBAT:             3.31 V  (min =  +3.10 V, max =  +3.60 V)
     9 VTT:              3.30 V  (min =  +3.01 V, max =  +3.60 V)
    10 VIN5:             1.10 V  (min =  +0.96 V, max =  +1.20 V)
    11 VIN6:             1.10 V  (min =  +0.96 V, max =  +1.20 V)
    12 VIN2:             1.02 V  (min =  +0.80 V, max =  +1.20 V)
    13 VIN3:           224.00 mV (min =  +0.20 V, max =  +0.60 V)
    14 VIN7:           888.00 mV (min =  +0.00 V, max =  +1.00 V)
    15 VIN9:           848.00 mV (min =  +0.00 V, max =  +1.00 V)
    16 VHIF:             3.41 V  (min =  +0.00 V, max =  +3.60 V)
    17 VIN10:            1.03 V  (min =  +0.96 V, max =  +0.00 V)

 drivers/hwmon/nct6775-core.c | 51 +++++++++++++++++++++++++++++-------
 drivers/hwmon/nct6775.h      |  5 ++--
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index fa0b7551ebf5..33533d95cf48 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -80,14 +80,17 @@ static const char * const nct6775_device_names[] = {
 
 /* Common and NCT6775 specific data */
 
-/* Voltage min/max registers for nr=7..14 are in bank 5 */
+/*
+ * Voltage min/max registers for nr=7..14 are in bank 5
+ * min/max: 15-17 for NCT6799 only
+ */
 
 static const u16 NCT6775_REG_IN_MAX[] = {
 	0x2b, 0x2d, 0x2f, 0x31, 0x33, 0x35, 0x37, 0x554, 0x556, 0x558, 0x55a,
-	0x55c, 0x55e, 0x560, 0x562 };
+	0x55c, 0x55e, 0x560, 0x562, 0x564, 0x570, 0x572 };
 static const u16 NCT6775_REG_IN_MIN[] = {
 	0x2c, 0x2e, 0x30, 0x32, 0x34, 0x36, 0x38, 0x555, 0x557, 0x559, 0x55b,
-	0x55d, 0x55f, 0x561, 0x563 };
+	0x55d, 0x55f, 0x561, 0x563, 0x565, 0x571, 0x573 };
 static const u16 NCT6775_REG_IN[] = {
 	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x550, 0x551, 0x552
 };
@@ -256,7 +259,8 @@ static const s8 NCT6776_ALARM_BITS[NUM_ALARM_BITS] = {
 	12,  9,						  /* intr0-intr1  */
 };
 
-static const u16 NCT6776_REG_BEEP[NUM_REG_BEEP] = { 0xb2, 0xb3, 0xb4, 0xb5 };
+/* 0xbf: nct6799 only */
+static const u16 NCT6776_REG_BEEP[NUM_REG_BEEP] = { 0xb2, 0xb3, 0xb4, 0xb5, 0xbf };
 
 static const s8 NCT6776_BEEP_BITS[NUM_BEEP_BITS] = {
 	 0,  1,  2,  3,  4,  5,  6,  7,  8, -1, -1, -1,	  /* in0-in11     */
@@ -328,9 +332,16 @@ static const u16 NCT6776_REG_TSI_TEMP[] = {
 
 /* NCT6779 specific data */
 
+/*
+ * 15-17 for NCT6799 only, register labels are:
+ *      CPUVC,  VIN1,  AVSB,  3VCC,  VIN0,  VIN8,  VIN4, 3VSB
+ *       VBAT,   VTT,  VIN5,  VIN6,  VIN2,  VIN3,  VIN7, VIN9
+ *       VHIF, VIN10
+ */
 static const u16 NCT6779_REG_IN[] = {
 	0x480, 0x481, 0x482, 0x483, 0x484, 0x485, 0x486, 0x487,
-	0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e };
+	0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e, 0x48f,
+	0x470, 0x471};
 
 static const u16 NCT6779_REG_ALARM[NUM_REG_ALARM] = {
 	0x459, 0x45A, 0x45B, 0x568 };
@@ -644,6 +655,22 @@ static const char *const nct6798_temp_label[] = {
 #define NCT6798_TEMP_MASK	0xbfff0ffe
 #define NCT6798_VIRT_TEMP_MASK	0x80000c00
 
+static const s8 NCT6799_ALARM_BITS[NUM_ALARM_BITS] = {
+	 0,  1,  2,  3,  8, -1, 20, 16, 17, 24, 25, 26,	  /* in0-in11     */
+	27, 28, 29, 30, 31, -1, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
+	 6,  7, 11, 10, 23, 33, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
+	 4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	12,  9,						  /* intr0-intr1  */
+};
+
+static const s8 NCT6799_BEEP_BITS[NUM_BEEP_BITS] = {
+	 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11,	  /* in0-in11     */
+	12, 13, 14, 15, 34, 35, -1, -1, -1, -1, -1, -1,	  /* in12-in23    */
+	25, 26, 27, 28, 29, -1, -1, -1, -1, -1, -1, -1,	  /* fan1-fan12   */
+	16, 17, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,	  /* temp1-temp12 */
+	30, 31, 24					  /* intr0-intr1, beep_en */
+};
+
 static const char *const nct6799_temp_label[] = {
 	"",
 	"SYSTIN",
@@ -938,12 +965,12 @@ static const u16 scale_in[15] = {
 /*
  * NCT6798 scaling:
  *    CPUVC, IN1, AVSB, 3VCC, IN0, IN8, IN4, 3VSB, VBAT,  VTT,  IN5,  IN6, IN2,
- *      IN3, IN7
- * Additional scales to be added later: IN9 (800), VHIF (1600)
+ *      IN3, IN7,  IN9, VHIF, IN10
+ * 15-17 for NCT6799 only
  */
-static const u16 scale_in_6798[15] = {
+static const u16 scale_in_6798[NUM_IN] = {
 	800, 800, 1600, 1600, 800, 800, 800, 1600, 1600, 1600, 1600, 1600, 800,
-	800, 800
+	800, 800,  800, 1600, 800
 };
 
 static inline long in_from_reg(u8 reg, u8 nr, const u16 *scales)
@@ -3961,7 +3988,13 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		case nct6796:
 		case nct6797:
 		case nct6798:
+			data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
+			num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
+			break;
 		case nct6799:
+			data->in_num = 18;
+			data->ALARM_BITS = NCT6799_ALARM_BITS;
+			data->BEEP_BITS = NCT6799_BEEP_BITS;
 			data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
 			num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
 			break;
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index c752bc7bbe72..edcde39c4791 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -16,6 +16,7 @@ enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 #define NUM_REG_BEEP	5	/* Max number of beep registers */
 
 #define NUM_FAN		7
+#define NUM_IN		18
 
 struct nct6775_data {
 	int addr;	/* IO base of hw monitor block */
@@ -97,7 +98,7 @@ struct nct6775_data {
 	/* Register values */
 	u8 bank;		/* current register bank */
 	u8 in_num;		/* number of in inputs we have */
-	u8 in[15][3];		/* [0]=in, [1]=in_max, [2]=in_min */
+	u8 in[NUM_IN][3];	/* [0]=in, [1]=in_max, [2]=in_min */
 	const u16 *scale_in;	/* internal scaling factors */
 	unsigned int rpm[NUM_FAN];
 	u16 fan_min[NUM_FAN];
@@ -166,7 +167,7 @@ struct nct6775_data {
 	u16 have_temp;
 	u16 have_temp_fixed;
 	u16 have_tsi_temp;
-	u16 have_in;
+	u32 have_in;
 
 	/* Remember extra register values over suspend/resume */
 	u8 vbat;
-- 
2.39.2

