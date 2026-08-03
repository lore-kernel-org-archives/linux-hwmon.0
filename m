Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E13672B0;
	Mon,  3 Aug 2026 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752655; cv=pass; b=emnspxwXK8Spf2LsShVOkPZdE3bi+04WzLHYbxafEp/MaRB0plvXNAZgrZ8RbjetySt07MBB/TW4CkaDMUfVwHmvB/YKyCM+Mspnh9pCLbE6VwB757Xq5kF+AnFWi6Y2vcSWBxFaCfNzlsz/rnuT6qEbpEaGShHk2C9SWae65Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752655; c=relaxed/simple;
	bh=UMnaZv+WO3qvtwAeZCrSjZW536BZg8WWntYxX4KZ/W4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GabFK88s7NG+ojZiwNiLCRq12/Z3CfUxdNdqawfaZ6dfShrTuHlFeAfIY0PmOg4+MkqlByLoagkZbrg3YIucNsH8YJ8dyoqgXel8XCM9dUXW2r/yRImnOQmEmzuoPrULvqQ8Ac+4bBwZlJg9Q8JlfUauHZRRqPjgHYgGyGcz3Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=PAGAP7Wc; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="PAGAP7Wc"
ARC-Seal: i=1; a=rsa-sha256; t=1785752617; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=LMZCfdn6wc6zXfP6VY3fmL58t28ShEVXAbL4p6LlUgFC5EF9mjKY2a/ggu8sSW0+wcEIXWf9QO/8OJCtT6fBQ266k8c0dw+Txoepgoq6I+2EM9ikljGcWpWxPWCAojrrYkxC6ZHKXeDvnoBXHJK35ETJ1fV//h90St4RxvYINCg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785752617; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JxkvLSM6ORC7eskZRPHXOHzxPVRYR0kDpCDAJEkGQQU=; 
	b=U4REM6H6UeW812HBJkeV8CPbCZ2va9sRF2+65VLUEeMald9TjhMXd6wyfMfvQoT8NT/Y5sfgt2jOlBR+Wuz1CyeEnzKUHSyuIpDmUTV3iDAhDPgibLex1aJ4R2EWm8nw4xVIfy6OKxHfi1x8F7J3OhjkXG9/jt68BYAmAWY39/Y=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785752617;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JxkvLSM6ORC7eskZRPHXOHzxPVRYR0kDpCDAJEkGQQU=;
	b=PAGAP7Wc5zQhYpHTtwiA/all3gajwhROCy4PbbrO4xS6rCuwIWsiNWxYPcs8D6Dz
	bYZMt6aCaOL0KO/WZ4CR4QakL7ZnczsjK7Mu6KzAZGfp1r3VmBWkxMj8BKRxkbmxgyQ
	Lc8Ko7j5qHfbUpoymfn7QL1/+WilQdxOPZjsmNaM=
Received: by mx.zoho.eu with SMTPS id 178575261464082.41912412860916;
	Mon, 3 Aug 2026 12:23:34 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Ming Yu <tmyu0@nuvoton.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Ming Yu <a0282524688@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Lee Jones <lee@kernel.org>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6694) do not expose enable on DTIN temperature channels
Date: Mon,  3 Aug 2026 10:21:48 +0000
Message-ID: <20260803102148.14196-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The driver registers 26 temperature channels, all advertising
HWMON_T_ENABLE, and indexes the enable bitmap with the raw channel:

	data->hwmon_en.tin_en[channel / 8] |= BIT(channel % 8);

tin_en is two bytes and only covers the 5 THR and 5 TDP channels
(index 0-9). The 16 DTIN channels (index 10-25) are enabled by the
firmware and were never meant to carry an enable bit. Because the
control structure is packed, writing temp17_enable and above indexes
past tin_en into the fin_en bytes that follow it, so it toggles fan
enable state instead; nct6694_hwmon_init() then sends the whole
structure back to the device, and reads report fan state as temperature
state. It stays within the structure, so this is not a memory safety
problem, but on a board that uses the fan channels it is not harmless.

Give the DTIN channels a temperature config without HWMON_T_ENABLE so
the core never creates their enable attribute. The enable path is then
reachable only for the first 10 channels, which stay within tin_en, and
fin_en is left alone. The DTIN input and limit attributes are unchanged.

Fixes: 197e779d29d8 ("hwmon: Add Nuvoton NCT6694 HWMON support")
Suggested-by: Ming Yu <tmyu0@nuvoton.com>
Link: https://lore.kernel.org/all/20260802124730.20387-1-ali@iusegentoo.com/
Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
---
 drivers/hwmon/nct6694-hwmon.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
index 6dcf22ca5018..9a9a4db434c4 100644
--- a/drivers/hwmon/nct6694-hwmon.c
+++ b/drivers/hwmon/nct6694-hwmon.c
@@ -159,6 +159,9 @@ static inline s8 temp_to_reg(long val)
 #define NCT6694_HWMON_TEMP_CONFIG (HWMON_T_INPUT | HWMON_T_ENABLE |	\
 				   HWMON_T_MAX | HWMON_T_MAX_HYST |	\
 				   HWMON_T_MAX_ALARM)
+#define NCT6694_HWMON_DTIN_CONFIG (HWMON_T_INPUT |			\
+				   HWMON_T_MAX | HWMON_T_MAX_HYST |	\
+				   HWMON_T_MAX_ALARM)
 #define NCT6694_HWMON_FAN_CONFIG (HWMON_F_INPUT | HWMON_F_ENABLE |	\
 				  HWMON_F_MIN | HWMON_F_MIN_ALARM)
 #define NCT6694_HWMON_PWM_CONFIG (HWMON_PWM_INPUT | HWMON_PWM_ENABLE |	\
@@ -193,22 +196,22 @@ static const struct hwmon_channel_info *nct6694_info[] = {
 			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP2 */
 			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP3 */
 			   NCT6694_HWMON_TEMP_CONFIG,	/* TDP4 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN0 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN1 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN2 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN3 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN4 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN5 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN6 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN7 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN8 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN9 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN10 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN11 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN12 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN13 */
-			   NCT6694_HWMON_TEMP_CONFIG,	/* DTIN14 */
-			   NCT6694_HWMON_TEMP_CONFIG),	/* DTIN15 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN0 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN1 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN2 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN3 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN4 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN5 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN6 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN7 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN8 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN9 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN10 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN11 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN12 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN13 */
+			   NCT6694_HWMON_DTIN_CONFIG,	/* DTIN14 */
+			   NCT6694_HWMON_DTIN_CONFIG),	/* DTIN15 */
 
 	HWMON_CHANNEL_INFO(fan,
 			   NCT6694_HWMON_FAN_CONFIG,	/* FIN0 */
-- 
2.55.0

