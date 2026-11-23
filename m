Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416784;
	b=mP4EjQ+qRIOaK9QPFlGswaI/F9GrhI0jMT7M2xUUyUDRFjuz0byzX2/4eSKaVzOq8viS
	 DBZqBJiajnMUGE759h7bQFvCTDTnCX+2jCkNe6KZlo72USZjiPaH0sJSwMX4LYQ+z0gbQ
	 kTGAkt+LWXlOYQEIMbjyr12NSVmo1EXe87T8XyGQaWd2lQvWTpLOHOXTT5BF0xdJfj11w
	 VINGOl5rBVYROukX8zF5rMC5BOE+NZrGB9BRN3+fIlT0hGmQ8nf1IK9ofildPTqWWV5hp
	 kKCNxto3xp9D/VNpDSKQDeX70cZlByHkIPdGD/5ZJez6N09N9z25XbmgYugmq0gAPRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416784;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D2O3/vSQtwolZ43y2Rl2F9gNu4AbU1CanQmluQvHEfM=;
	b=nUAd5Z8G56R+EcqnQaCsZaJMXyk45W7nVpXcC4NXEosXdiGtwHCmS73OlvBP7HMSaAFP
	 Clyi7q+/+XFGVkOH8lyPxBt2vCnDohDq9r43IMnnhxCtQrK5OktmsT66XhXEt0a4L+0fA
	 4jEGV3/bxq6p9yFVaONwWIJ5cs19DIWVP4dqkvtAl0D5MFRlEiYeIyAhU2TGx6HIyfFx6
	 VDFuNoU1X/eTQw6DRmsKqBNXFfOs2RYdtdyZGfd3ynK2oik2nw8nHdSBoL10WTlDnAQQ8
	 ybOsmkfB2DPwJzfLNEYhubyIPqtb6wDARw+rxPffjl/5UvziT2FXg2fMjqI/K4NnkBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="gSy/xMJ3";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=k7HSgxoE;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6028606A31A;
	Mon, 23 Nov 2026 06:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6028606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=gSy/xMJ3;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=k7HSgxoE
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN4xwQu3717527;
	Mon, 23 Nov 2026 01:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=D2O3/vSQtwolZ43y
	2Rl2F9gNu4AbU1CanQmluQvHEfM=; b=gSy/xMJ3G0sgqRSo+262JA6vCaMd9UAV
	zPtEEwktEPM4BLi5p21YA9c0hoKZhJLbc+6BlJzHSIkTvhDbTlzzG8A4GTDKjYpE
	vYfAP0MOl5m+DcKB9Gk0DXQriK0cBGIRkTfmz+XOm19ppatcGcrYQChRxxVzofk9
	f7EZ9Z7LhtK/jmzHabr3fEDMbT9nCd8HrCDDnu/GRk9t0IDjDM9tGXYiTGkSrqnx
	SqpPFC9B/hq/9WLXBiSFUVpRytFKxK7wcu9VGORJQdl4kYod7WsIfkeNWVXRUj/q
	eka7H3eBFemTL4v8B33JnD/dCKvCq2nW1xhNFUOqAkbxfs2VCKiI6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=D2O3/vSQtwolZ43y2Rl2F9gNu4A
	bU1CanQmluQvHEfM=; b=k7HSgxoEmsAzskCFTM58d/nrhTTB7WRc/uAnSmIAbmL
	3qO302oN2n6QpUy8YSL3xwOfMy8j20e3YQTqrLamc/dJnmMu10Z3tyZDqY0q/H9b
	qiT1gyqI6Gdu/bx++xS+yTNtLclt/bK3a873rLkXMxX/uowYRgmjZr+ZrvUWDLPx
	/GZPlBBW8E45qt8ZAJ75JyAapMUfRWQICsuHFM0kn9IeLZV8DSk1srEC9IBeNh9v
	psKh/4VuxPrWIugiGGxnoJO5PF8yZZiBhfsPuae1EExVoPo4NTB5ZifX/VJRRWJr
	eCvAPuliHA0soydbx3dvOdWyuqHGc5f/X4uGtgKuqZQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j4bfa1mrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 01:52:45 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AN6qiIB022342
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 01:52:44 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:52:44 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:52:44 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 01:52:43 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AN6qWhl028415;
	Mon, 23 Nov 2026 01:52:34 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Mon, 23 Nov 2026 14:52:02 +0800
Subject: [PATCH] hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754
 chips
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261123-ltc2978-ieee754-peak-fix-v1-1-96cbe686ab67@analog.com>
X-B4-Tracking: v=1; b=H4sIAJHiA2sC/yXMUQ6CMBCE4auQfXYTuhFpvYrxobQDrBokLRoSw
 t2t+vhNMv9GGUmR6VxtlPDWrM+pwBwqCqOfBrDGYpJaTsaI8GMJ4lrLCqBtjjzD37nXlZ2NoZH
 ovbOgcp8TyvxLX65/51d3Q1i+Pdr3D/RuQOx8AAAA
X-Change-ID: 20261122-ltc2978-ieee754-peak-fix-98dc52daa98e
To: Guenter Roeck <linux@roeck-us.net>,
        Cherrence Sarip
	<cherrence.sarip@analog.com>,
        Kim Seer Paller <kimseer.paller@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sashiko-reviews@lists.linux.dev>,
        sashiko-bot <sashiko-bot@kernel.org>,
        Christopher de Guzman <christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795416752; l=6738;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=lXYISkruRocwUUh+cc5Ggm2K90sSRxxHyyb6mAI80L0=;
 b=C1Gt1FYYnB9/phhHJy0cQyBYo7WSlE2TuauOfWLLnDeKhlupq71vCwKjNC0uB28pXWzogvxy0
 YHQ3/n8ChM3CDRgzoAj5AudigYu5TkeFZs/wq53W1AmLLg64cB+6lA0
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX8K5gA9UY72HE
 o4gXtVVc4YaYZnoYSqBHTJlOrVGZOPz9NTknR3ElmRUK8Mlp9Cp+b2bUfQix3UoAXJYYulNJxdC
 12Qydmw7Um/IZiOG8+K3x8sP5n2pagQzuXJuAyi0r2pdCTQKE7Px+whcA2PpAJEKWqUI1m6R3Vs
 YhdHLpURlHCmQ4w9mMJ6eKBqi2x+bcpsJ0T3uW1TSQNh0CbRZH/3+hdgId3wktCY6qzJdrtLZcx
 W3na0E1OXecYIgspLg6BQHZeAlAURI09D/AkCtlSxKZmVbU2SY0aIGbp1SMKODkkJTGtJOKHi7f
 T0sfXsR9XOaEEXX4Pj/nlmXkDCtrJHwwikP/+Kjq/XMeCYjKNS1UibLkOjLK+UtHDLwGZk2qa1V
 /nWRQZvEJYniPHPbezcmGXRVRu1OsgHNDn0MjAN2tXax6n3Xu3blZW/6B6sZNLM47JaeMTWUoLw
 r+Aix237yhS/PqTBdiQ==
X-Authority-Analysis: v=2.4 cv=OK+yTiaB c=1 sm=1 tr=0 ts=6b03e2bd cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=gAnH3GRIAAAA:8 a=MF13PRk-71S7MCz40v0A:9 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: iG2g3tVKOhkraLDqgggoZp-tvRu7xHjz
X-Proofpoint-GUID: iG2g3tVKOhkraLDqgggoZp-tvRu7xHjz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX0bu167zCNw4j
 6q1acgb9Mb8UrOBweZ8G1jCiSInLYJ8lRJDjNJjUgx5oDy82JbhITUSCHah56107a0+u3reu5Zs
 bx9L6tHLGg9z8PnuDEgzm9i0tB1k2sjQWPzuJa/SApZFt6p1U+VF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230027

The LT7170, LT7171, LT7175 and LT7176P report their sensor values in
IEEE-754 half-precision format, but ltc_get_max() and ltc_get_min()
compare peak values with lin11_to_val(), which decodes LINEAR11. Bit 10
is the lowest exponent bit in binary16, while LINEAR11 treats it as the
mantissa sign bit. Positive values with an odd biased exponent, such as
temperatures from 16 to 31 C or input voltages from 4 to 8 V, are
therefore decoded as negative, and the reported peak stops following
the real one.

The peak start values have the same problem: 0x7c00 is the lowest
LINEAR11 value, but it is +infinity in binary16.

Add a FEAT_IEEE754 flag for these chips. Compare binary16 values as
sign-magnitude integers, and start peak maximums at -infinity (0xfc00)
and peak minimums at +infinity (0x7c00). The min attributes are not
exposed for these chips, but the min path is fixed as well for
consistency.

Tested on an LT7171-1: after stepping VIN from 3.3 V to 5 V and back,
in1_highest now reports 4992 mV instead of staying at 3294 mV.

Fixes: c1d6afdbb8ed ("hwmon: (pmbus/ltc2978) add support for lt717x")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206843@kernel.org/
Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
This fixes the IEEE-754 peak comparison issue that sashiko reported on
the LT7175/LT7176P v2 series [1]. That series was applied on the
assumption that the issue would be fixed with a separate patch [2].

[1] https://lore.kernel.org/all/sashiko-outbox-206843@kernel.org/
[2] https://lore.kernel.org/all/175a2d96-3716-4fbe-886f-42040c8d54f7@roeck-us.net/
---
 drivers/hwmon/pmbus/ltc2978.c | 66 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index ac702c9bf7a0..ca94a3c17e9a 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -136,9 +136,11 @@ struct ltc2978_data {
 
 #define FEAT_CLEAR_PEAKS	BIT(0)
 #define FEAT_NEEDS_POLLING	BIT(1)
+#define FEAT_IEEE754		BIT(2)
 
 #define has_clear_peaks(d)	((d)->features & FEAT_CLEAR_PEAKS)
 #define needs_polling(d)	((d)->features & FEAT_NEEDS_POLLING)
+#define has_ieee754(d)		((d)->features & FEAT_IEEE754)
 
 static int ltc_wait_ready(struct i2c_client *client)
 {
@@ -236,6 +238,30 @@ static inline int lin11_to_val(int data)
 	return (e < 0 ? m >> -e : m << e);
 }
 
+static inline int ieee754_sort_key(u16 h)
+{
+	int mag = h & 0x7fff;
+
+	return (h & 0x8000) ? -mag : mag;
+}
+
+static bool ltc_peak_gt(struct ltc2978_data *data, u16 a, u16 b)
+{
+	if (has_ieee754(data))
+		return ieee754_sort_key(a) > ieee754_sort_key(b);
+	return lin11_to_val(a) > lin11_to_val(b);
+}
+
+static u16 ltc_peak_max_init(struct ltc2978_data *data)
+{
+	return has_ieee754(data) ? 0xfc00 : 0x7c00;
+}
+
+static u16 ltc_peak_min_init(struct ltc2978_data *data)
+{
+	return has_ieee754(data) ? 0x7c00 : 0x7bff;
+}
+
 static int ltc_get_max(struct ltc2978_data *data, struct i2c_client *client,
 		       int page, int reg, u16 *pmax)
 {
@@ -243,7 +269,7 @@ static int ltc_get_max(struct ltc2978_data *data, struct i2c_client *client,
 
 	ret = ltc_read_word_data(client, page, 0xff, reg);
 	if (ret >= 0) {
-		if (lin11_to_val(ret) > lin11_to_val(*pmax))
+		if (ltc_peak_gt(data, ret, *pmax))
 			*pmax = ret;
 		ret = *pmax;
 	}
@@ -257,7 +283,7 @@ static int ltc_get_min(struct ltc2978_data *data, struct i2c_client *client,
 
 	ret = ltc_read_word_data(client, page, 0xff, reg);
 	if (ret >= 0) {
-		if (lin11_to_val(ret) < lin11_to_val(*pmin))
+		if (ltc_peak_gt(data, *pmin, ret))
 			*pmin = ret;
 		ret = *pmin;
 	}
@@ -494,22 +520,22 @@ static int ltc2978_write_word_data(struct i2c_client *client, int page,
 
 	switch (reg) {
 	case PMBUS_VIRT_RESET_IIN_HISTORY:
-		data->iin_max = 0x7c00;
-		data->iin_min = 0x7bff;
+		data->iin_max = ltc_peak_max_init(data);
+		data->iin_min = ltc_peak_min_init(data);
 		ret = ltc2978_clear_peaks(data, client, 0);
 		break;
 	case PMBUS_VIRT_RESET_PIN_HISTORY:
-		data->pin_max = 0x7c00;
-		data->pin_min = 0x7bff;
+		data->pin_max = ltc_peak_max_init(data);
+		data->pin_min = ltc_peak_min_init(data);
 		ret = ltc2978_clear_peaks(data, client, 0);
 		break;
 	case PMBUS_VIRT_RESET_IOUT_HISTORY:
-		data->iout_max[page] = 0x7c00;
-		data->iout_min[page] = 0xfbff;
+		data->iout_max[page] = ltc_peak_max_init(data);
+		data->iout_min[page] = has_ieee754(data) ? 0x7c00 : 0xfbff;
 		ret = ltc2978_clear_peaks(data, client, page);
 		break;
 	case PMBUS_VIRT_RESET_TEMP2_HISTORY:
-		data->temp2_max = 0x7c00;
+		data->temp2_max = ltc_peak_max_init(data);
 		ret = ltc2978_clear_peaks(data, client, page);
 		break;
 	case PMBUS_VIRT_RESET_VOUT_HISTORY:
@@ -518,13 +544,13 @@ static int ltc2978_write_word_data(struct i2c_client *client, int page,
 		ret = ltc2978_clear_peaks(data, client, page);
 		break;
 	case PMBUS_VIRT_RESET_VIN_HISTORY:
-		data->vin_min = 0x7bff;
-		data->vin_max = 0x7c00;
+		data->vin_min = ltc_peak_min_init(data);
+		data->vin_max = ltc_peak_max_init(data);
 		ret = ltc2978_clear_peaks(data, client, page);
 		break;
 	case PMBUS_VIRT_RESET_TEMP_HISTORY:
-		data->temp_min[page] = 0x7bff;
-		data->temp_max[page] = 0x7c00;
+		data->temp_min[page] = ltc_peak_min_init(data);
+		data->temp_max[page] = ltc_peak_max_init(data);
 		ret = ltc2978_clear_peaks(data, client, page);
 		break;
 	default:
@@ -764,7 +790,19 @@ static int ltc2978_probe(struct i2c_client *client)
 	case lt7171:
 	case lt7175:
 	case lt7176p:
-		data->features |= FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
+		data->features |= FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING |
+				  FEAT_IEEE754;
+		data->vin_max = ltc_peak_max_init(data);
+		for (i = 0; i < ARRAY_SIZE(data->iout_max); i++)
+			data->iout_max[i] = ltc_peak_max_init(data);
+		for (i = 0; i < ARRAY_SIZE(data->temp_max); i++)
+			data->temp_max[i] = ltc_peak_max_init(data);
+		data->temp2_max = ltc_peak_max_init(data);
+		data->vin_min = ltc_peak_min_init(data);
+		for (i = 0; i < ARRAY_SIZE(data->iout_min); i++)
+			data->iout_min[i] = 0x7c00;
+		for (i = 0; i < ARRAY_SIZE(data->temp_min); i++)
+			data->temp_min[i] = ltc_peak_min_init(data);
 		info->read_word_data = ltc3883_read_word_data;
 		info->pages = LTC3883_NUM_PAGES;
 		info->format[PSC_VOLTAGE_IN] = ieee754;

---
base-commit: 7bb82e49e82ccd58c445b150b69335e994582dfd
change-id: 20261122-ltc2978-ieee754-peak-fix-98dc52daa98e

Best regards,
--  
Christopher de Guzman <christopher.deguzman@analog.com>

