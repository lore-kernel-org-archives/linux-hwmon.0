Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A4041F7FA;
	Mon,  6 Jul 2026 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330413; cv=none; b=gik/+rLgkDIaqCEah2oT+Ongh+m2nPLzYwXZCYIKL4XMiXRevg2H4ZJctD4nb1mKGkYXJVxYSi6wOeMGxvhNI/5jZvIEFs9TUB8PzeQcD2YX0+Bv8GDtZ9T4fnbEsGxtv+UK0xdBklGSMbZj4MBKPb1uQ33xNe2nEQauLnHBGIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330413; c=relaxed/simple;
	bh=AfjYp01r7+/4xRv5MAA3uBnFXvyCZX5nlG6UeqKQ0u4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OaujVFf5n9OZj8q2NcjBbz2vhiEG0JwtytP2JK+ySHvm0V1FAg7WwqsnI7CTS55vMdvc45jJI+yt6bcjJr3eRUECP4LbDRQb6dZp2/ZK2BIl8UxY/1tXlQNkc42EKJVQw6D4Xm/sAjabikAHFaCZq9RvB+ER2vepi48+DZfUHR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADXb8hedktq+IbxBA--.34865S2;
	Mon, 06 Jul 2026 17:33:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Sanman Pradhan <psanman@juniper.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: occ: validate poll response sensor blocks
Date: Mon,  6 Jul 2026 17:33:17 +0800
Message-ID: <20260706093317.80867-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXb8hedktq+IbxBA--.34865S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF1xtw18Jr1DKr1kCr43trb_yoW5KrW7p3
	WUGay5KF17Gr1fXws7Zrn0vrWYyan5Ga47KFZxW3s5AF98WrykW3WIkry09w1UtF9xGrn7
	Xw1ktFWDCa1DJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUnG
	QDUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The OCC poll response parser walks a counted list of sensor data blocks.
It used the static response buffer size as the parse boundary, but the
transport only guarantees the bytes declared by the current response
length. A malformed or truncated response can therefore make the parser
read a block header or block payload beyond the current response data.

Use the response data_length as the parent boundary for the poll payload.
Reject responses that cannot contain the fixed poll header, prove that
each sensor block header is present before reading its item fields, and
then prove that the complete block fits before advancing to the next
block.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/hwmon/occ/common.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index e18e80e832fd..fa92ae6ec4f0 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1052,9 +1052,10 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 }
 
 /* only need to do this once at startup, as OCC won't change sensors on us */
-static void occ_parse_poll_response(struct occ *occ)
+static int occ_parse_poll_response(struct occ *occ)
 {
 	unsigned int i, old_offset, offset = 0, size = 0;
+	u16 data_length;
 	struct occ_sensor *sensor;
 	struct occ_sensors *sensors = &occ->sensors;
 	struct occ_response *resp = &occ->resp;
@@ -1063,21 +1064,34 @@ static void occ_parse_poll_response(struct occ *occ)
 	struct occ_poll_response_header *header = &poll->header;
 	struct occ_sensor_data_block *block = &poll->block;
 
+	data_length = get_unaligned_be16(&resp->data_length);
+	if (data_length < sizeof(*header) || data_length > OCC_RESP_DATA_BYTES) {
+		dev_warn(occ->bus_dev, "invalid OCC poll response length %u\n",
+			 data_length);
+		return -EMSGSIZE;
+	}
+
 	dev_info(occ->bus_dev, "OCC found, code level: %.16s\n",
 		 header->occ_code_level);
 
 	for (i = 0; i < header->num_sensor_data_blocks; ++i) {
 		block = (struct occ_sensor_data_block *)((u8 *)block + offset);
+		if (size + sizeof(*header) + sizeof(block->header) >
+		    data_length) {
+			dev_warn(occ->bus_dev, "truncated OCC sensor block header\n");
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
+			dev_warn(occ->bus_dev, "exceeded OCC poll response length\n");
+			return -EMSGSIZE;
 		}
+		size += offset;
 
 		dev_dbg(occ->bus_dev, " %04x..%04x: %.4s (%d sensors)\n",
 			old_offset, offset - 1, block->header.eye_catcher,
@@ -1107,6 +1121,8 @@ static void occ_parse_poll_response(struct occ *occ)
 
 	dev_dbg(occ->bus_dev, "Max resp size: %u+%zd=%zd\n", size,
 		sizeof(*header), size + sizeof(*header));
+
+	return 0;
 }
 
 int occ_active(struct occ *occ, bool active)
@@ -1138,10 +1154,12 @@ int occ_active(struct occ *occ, bool active)
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
-- 
2.43.0

