Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174173009C1;
	Tue,  6 Jan 2026 06:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767682659; cv=none; b=HgnYmgCUjOR+CvPiDu6G62Ycdss+9N5RvwM7CqPDxsSI/F5trI700L4sShtTj9uGc7lXwa48aQ1quQdPMLC//FYgeegQ09JwdHV91jaqBl/7xqU0Liq3V513sRLBveYP3d4R3NrLDECwvXz0iM+vcpjYniktOH83P3Z4bFT9hn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767682659; c=relaxed/simple;
	bh=m1jgoh9Mktzms/FgFpVk2Ed6pRC8aSODZ5VVXGVSLtI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u66GHOXk4obMuw12srQbmnrh9fwK92zKSsY7g1TdtEP71QWN0frnui5S2GNtrKfeaba1AQIvWCeBIKkLNgI4gzcf82zRALQwWU7EnqTwkEe4zX3VefG7HrhdxfzsWoSphT1K1q3zibGwsaI87OxJYgx10dM+vGrjCrBDHViybp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WTlScfLI; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WTlScfLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hN
	vNtxyGITWILDL8VLrWbRvqKx0qBsFDuqOKDWm1x74=; b=WTlScfLIcjRsp4owa1
	7K7BTDl+VI0hBvngGs9e5nBC2fBX+QDIL6UKC7JDDS2HedMcV+a1g1+6zy6D6MbY
	HujTuK0QqcrNPa0tBkos+r4tkO7e/qgvywxkFkwgAMNToo3ir6JI8WERwLCKTyW4
	SjdNpHaQEyfTfdvMVfGGiio2w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3JVstqFxp3GFUAQ--.28230S2;
	Tue, 06 Jan 2026 14:14:06 +0800 (CST)
From: wenswang@yeah.net
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH] hwmon: mp2925: add vid offset for vid mode
Date: Tue,  6 Jan 2026 14:13:48 +0800
Message-Id: <20260106061348.170509-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgC3JVstqFxp3GFUAQ--.28230S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1xZryxXF1kCF13ur1Utrb_yoW8tw1Dpa
	4fA39IyryfJF1Sk39I9r4kuF4Fg393WrWjkr9Fkwn8XFy3tFW2qay2kFyvvFy0yFs8Kr42
	vr4Utw1Y9FnFvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRNTmgUUUUU=
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiOA6mS2lcqC4bZwAA3U

From: Wensheng Wang <wenswang@yeah.net>

In vid mode, the mp2925 vout telemetry has 49 vid step offset, add
vid offset for this.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
 drivers/hwmon/pmbus/mp2925.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/mp2925.c b/drivers/hwmon/pmbus/mp2925.c
index 6bebd6023021..ad094842cf2d 100644
--- a/drivers/hwmon/pmbus/mp2925.c
+++ b/drivers/hwmon/pmbus/mp2925.c
@@ -40,6 +40,7 @@
 struct mp2925_data {
 	struct pmbus_driver_info info;
 	int vout_scale[MP2925_PAGE_NUM];
+	int vid_offset[MP2925_PAGE_NUM];
 };
 
 #define to_mp2925_data(x) container_of(x, struct mp2925_data, info)
@@ -94,8 +95,15 @@ static int mp2925_read_word_data(struct i2c_client *client, int page, int phase,
 		if (ret < 0)
 			return ret;
 
-		ret = DIV_ROUND_CLOSEST((ret & GENMASK(11, 0)) * data->vout_scale[page],
-					MP2925_VOUT_DIV);
+		/*
+		 * In vid mode, the MP2925 vout telemetry has 49 vid step offset, but
+		 * PMBUS_VOUT_OV_FAULT_LIMIT and PMBUS_VOUT_UV_FAULT_LIMIT do not take
+		 * this into consideration, its resolution is 1.95mV/LSB, as a result,
+		 * format[PSC_VOLTAGE_OUT] can not be set to vid directly. Adding extra
+		 * vid_offset variable for vout telemetry.
+		 */
+		ret = DIV_ROUND_CLOSEST(((ret & GENMASK(11, 0)) + data->vid_offset[page]) *
+					data->vout_scale[page], MP2925_VOUT_DIV);
 		break;
 	case PMBUS_VOUT_OV_FAULT_LIMIT:
 	case PMBUS_VOUT_UV_FAULT_LIMIT:
@@ -231,10 +239,21 @@ mp2925_identify_vout_scale(struct i2c_client *client, struct pmbus_driver_info *
 			data->vout_scale[page] = 2560;
 		else
 			data->vout_scale[page] = 5120;
+
+		/*
+		 * In vid mode, the MP2925 vout telemetry has 49 vid step offset, but
+		 * PMBUS_VOUT_OV_FAULT_LIMIT and PMBUS_VOUT_UV_FAULT_LIMIT do not take
+		 * this into consideration, its resolution is 1.95mV/LSB, as a result,
+		 * format[PSC_VOLTAGE_OUT] can not be set to vid directly. Adding extra
+		 * vid_offset variable for vout telemetry.
+		 */
+		data->vid_offset[page] = 49;
 	} else if (FIELD_GET(GENMASK(4, 4), ret)) {
 		data->vout_scale[page] = 1;
+		data->vid_offset[page] = 0;
 	} else {
 		data->vout_scale[page] = 512;
+		data->vid_offset[page] = 0;
 	}
 
 	return 0;
-- 
2.25.1

