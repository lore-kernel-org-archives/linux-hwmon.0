Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E22363C4C;
	Mon, 20 Jul 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548718; cv=none; b=aqitApda8U8JPvZJ8P1dObtXFuf6UVAGYBEJrFISRhEhdXeWmoWvfKkZMCxg1OUap7DKmhy/4VVr093ZQEQ04d50qHhrUR9wQqnGrPFOsSA9aMXhoZuGL+2BGQvBtkxAsvx9Uh8lKmcXTWVtoYjg/OvG8zFxkbw5vMTiYXMrTzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548718; c=relaxed/simple;
	bh=Fz6gJA/fJLP1BolalfBoo5XxqV4PmDL+6TU/W1C5fTo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jFNDJS2mAWScHCk5nRutRQSIkZ7eeWgTG+M2EyWIbMahmCOY6hqmxxPLdvGpCSbdv5qyy+l+aAPfAoendRiyOtRQLJCbTo41vo2aqGYbgoLhj1fFBLwNAV+KKaxZhPgW9q9OldshDAw85dQm/Lzr9uSOtL8uyeiuQ/R6geUXo2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACXBUBiDV5qJ+OIAA--.63499S2;
	Mon, 20 Jul 2026 19:58:26 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sanman Pradhan <psanman@juniper.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] hwmon: occ: validate poll response sensor blocks
Date: Mon, 20 Jul 2026 19:58:26 +0800
Message-ID: <20260720115826.14813-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACXBUBiDV5qJ+OIAA--.63499S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWry8CFykZFyDuw15GryrCrg_yoWrWw4Up3
	WUGayrGr47Gr13Xrs3Ar4DZr15Kan5Ga47GFZxWwnYyF95WrykW3W0kry09w1UtFZxJrn7
	Xw1vqayDC3WDJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjd-PU
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The OCC poll response parser walks a counted list of sensor data blocks.
It used the static backing-array capacity as the parse boundary, but a
transport response makes only data_length bytes current and valid. A
truncated response can therefore make the parser consume a block header or
block extent outside the current response.

Use data_length as the parent boundary, prove the fixed poll header and
each current block header before reading them, and prove the complete block
before advancing. Keep parsed sensor metadata local until the complete
response has passed validation, then publish it. Propagate
malformed-response errors before publishing the OCC as active.

Fixes: aa195fe49b03 ("hwmon (occ): Parse OCC poll response")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260706093317.80867-1-pengpeng@iscas.ac.cn/
- use dev_err() for every malformed response that aborts registration
- publish parsed sensor metadata only after every block passes validation
- limit this revision to the current-response and block-extent contract
- rebase onto v7.2-rc4

 drivers/hwmon/occ/common.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index e18e80e832fd..175208d712b0 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1052,32 +1052,49 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 }
 
 /* only need to do this once at startup, as OCC won't change sensors on us */
-static void occ_parse_poll_response(struct occ *occ)
+static int occ_parse_poll_response(struct occ *occ)
 {
 	unsigned int i, old_offset, offset = 0, size = 0;
+	u16 data_length;
 	struct occ_sensor *sensor;
-	struct occ_sensors *sensors = &occ->sensors;
+	struct occ_sensors parsed = {};
+	struct occ_sensors *sensors = &parsed;
 	struct occ_response *resp = &occ->resp;
 	struct occ_poll_response *poll =
 		(struct occ_poll_response *)&resp->data[0];
 	struct occ_poll_response_header *header = &poll->header;
 	struct occ_sensor_data_block *block = &poll->block;
 
+	data_length = get_unaligned_be16(&resp->data_length);
+	if (data_length < sizeof(*header) || data_length > OCC_RESP_DATA_BYTES) {
+		dev_err(occ->bus_dev, "invalid OCC poll response length %u\n",
+			data_length);
+		return -EMSGSIZE;
+	}
+
 	dev_info(occ->bus_dev, "OCC found, code level: %.16s\n",
 		 header->occ_code_level);
 
 	for (i = 0; i < header->num_sensor_data_blocks; ++i) {
 		block = (struct occ_sensor_data_block *)((u8 *)block + offset);
+		if (size + sizeof(*header) + sizeof(block->header) >
+		    data_length) {
+			dev_err(occ->bus_dev,
+				"truncated OCC sensor block header\n");
+			return -EMSGSIZE;
+		}
+
 		old_offset = offset;
 		offset = (block->header.num_sensors *
 			  block->header.sensor_length) + sizeof(block->header);
-		size += offset;
 
 		/* validate all the length/size fields */
-		if ((size + sizeof(*header)) >= OCC_RESP_DATA_BYTES) {
-			dev_warn(occ->bus_dev, "exceeded response buffer\n");
-			return;
+		if (size + sizeof(*header) + offset > data_length) {
+			dev_err(occ->bus_dev,
+				"exceeded OCC poll response length\n");
+			return -EMSGSIZE;
 		}
+		size += offset;
 
 		dev_dbg(occ->bus_dev, " %04x..%04x: %.4s (%d sensors)\n",
 			old_offset, offset - 1, block->header.eye_catcher,
@@ -1107,6 +1124,9 @@ static void occ_parse_poll_response(struct occ *occ)
 
 	dev_dbg(occ->bus_dev, "Max resp size: %u+%zd=%zd\n", size,
 		sizeof(*header), size + sizeof(*header));
+	occ->sensors = parsed;
+
+	return 0;
 }
 
 int occ_active(struct occ *occ, bool active)
@@ -1138,10 +1158,12 @@ int occ_active(struct occ *occ, bool active)
 			goto unlock;
 		}
 
-		occ->active = true;
 		occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
-		occ_parse_poll_response(occ);
+		rc = occ_parse_poll_response(occ);
+		if (rc)
+			goto unlock;
 
+		occ->active = true;
 		rc = occ_setup_sensor_attrs(occ);
 		if (rc) {
 			dev_err(occ->bus_dev,

