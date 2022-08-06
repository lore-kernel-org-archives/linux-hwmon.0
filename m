Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30445C19F29
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 Aug 2022 05:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbiHFFqT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 6 Aug 2022 01:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiHFFqS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 Aug 2022 01:46:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841F915A2C
        for <linux-hwmon@vger.kernel.org>; Fri,  5 Aug 2022 22:46:17 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so4669355pjf.5
        for <linux-hwmon@vger.kernel.org>; Fri, 05 Aug 2022 22:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rOL5Ig0qgTI5giQB2ogeWIJHGY7MHn9Tx5e5uC/Gzws=;
        b=eUMBHmL1fMOsWLZGDiRpCY2TWiPOF5LdiUOdcvHeGmlUGhmBf8Nuwk+FYuCmtvG60x
         sTyLOyr1VpCk2oQDP2pxwsIEKY+f8OU5MO18y47i37yN+aX8SndZxIIhTIGtxxf2boIU
         yCGRst6S4zNEmR9fPsajR6NZd8jfmBAsmEb+HW1aRUMvOfkthoSnerNLnLpVoy8tM3NQ
         BJ9zazN11PAmu8jxxKsvqiTTS9LJTXtJ+eOvGk1elDDHj1P753I5nREhIyf31n9QABpF
         YNm831epwyV5UbovC7xj80HuZKp+9/4C3uzXOGKvx2QpjSIr8K4RtsU0JNieQdbtzp/g
         6LrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rOL5Ig0qgTI5giQB2ogeWIJHGY7MHn9Tx5e5uC/Gzws=;
        b=nnJt/ElpujfYF2Wow5cH1P4m+US/j9zdFyhHYcf9WUAWAmIWJY6sDtJAzZUqItO0rk
         fy/rVQ/HLorZtmlBlIR7Hl72STnZXJjfo8sNx/U8ZI2/8nZ0ucLzWvBYbGV32zhmclTK
         m7+db8tyBaRMaVxGUrL99lRUS4VoHHFPN7LJu+3rw5rvKoloTrMp9/l2u6qUSlG0n/Lc
         z+BdG2CM11+ImzhPaUI/62yKRyTboWKCZtdBIBh3VswxCApl0Y8h4NnByv5tf8DLAVBE
         ujCS9cCEA/OGSmxa4Jwtk4iRpJmT6W5rKxNjE+D7QPsaeBjETQ1IQx4dMtpEmJ1PLiUr
         p7Ng==
X-Gm-Message-State: ACgBeo2wsmMoHlaBt0rsecizD0dOCNt2kr9qmglM0OE0Z7STXkbJ9Jna
        OtmnXCsFo0d+SL2U06hzrKN9uhznECs=
X-Google-Smtp-Source: AA6agR4+epHZk7KGf28wGVtp7VNCeSecdv+Vo3WAE/HAUh6C+j4zCUCSoZY8mJK2h/pvTAmgWps8pQ==
X-Received: by 2002:a17:90b:4b8e:b0:1f5:49bd:8b0e with SMTP id lr14-20020a17090b4b8e00b001f549bd8b0emr17045276pjb.86.1659764776645;
        Fri, 05 Aug 2022 22:46:16 -0700 (PDT)
Received: from tokunori-desktop.. ([240b:10:2720:5500:e67a:85d6:519b:1a59])
        by smtp.gmail.com with ESMTPSA id j15-20020a170902da8f00b0016c0eb202a5sm4036270plx.225.2022.08.05.22.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 22:46:15 -0700 (PDT)
From:   Tokunori Ikegami <ikegami.t@gmail.com>
To:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
Cc:     Tokunori Ikegami <ikegami.t@gmail.com>
Subject: [PATCH] nvme: hwmon: Add support for throttling temperature feature
Date:   Sat,  6 Aug 2022 14:46:06 +0900
Message-Id: <20220806054606.7280-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

NVMe drives support host controlled thermal management feature as optional.
The thermal management temperature are different from the temperature threshold.
So add functionality to set the throttling temperature values.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
---
 drivers/hwmon/hwmon.c     |  2 ++
 drivers/nvme/host/core.c  |  1 +
 drivers/nvme/host/hwmon.c | 60 ++++++++++++++++++++++++++++++++++++++-
 drivers/nvme/host/nvme.h  |  1 +
 include/linux/hwmon.h     |  4 +++
 include/linux/nvme.h      |  7 ++++-
 6 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 2e2cd79d89eb..be756ed8b71c 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -486,6 +486,8 @@ static const char * const hwmon_temp_attr_templates[] = {
 	[hwmon_temp_reset_history] = "temp%d_reset_history",
 	[hwmon_temp_rated_min] = "temp%d_rated_min",
 	[hwmon_temp_rated_max] = "temp%d_rated_max",
+	[hwmon_temp_throttle_low] = "temp%d_throttle_low",
+	[hwmon_temp_throttle_high] = "temp%d_throttle_high",
 };
 
 static const char * const hwmon_in_attr_templates[] = {
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 2429b11eb9a8..7925f8d3bedf 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3142,6 +3142,7 @@ static int nvme_init_identify(struct nvme_ctrl *ctrl)
 	nvme_set_queue_limits(ctrl, ctrl->admin_q);
 	ctrl->sgls = le32_to_cpu(id->sgls);
 	ctrl->kas = le16_to_cpu(id->kas);
+	ctrl->hctma = le16_to_cpu(id->hctma);
 	ctrl->max_namespaces = le32_to_cpu(id->mnan);
 	ctrl->ctratt = le32_to_cpu(id->ctratt);
 
diff --git a/drivers/nvme/host/hwmon.c b/drivers/nvme/host/hwmon.c
index 0a586d712920..396d6304fde1 100644
--- a/drivers/nvme/host/hwmon.c
+++ b/drivers/nvme/host/hwmon.c
@@ -57,6 +57,50 @@ static int nvme_set_temp_thresh(struct nvme_ctrl *ctrl, int sensor, bool under,
 	return ret;
 }
 
+static int nvme_get_temp_throttle(struct nvme_ctrl *ctrl, int sensor, bool low,
+				  long *temp)
+{
+	struct nvme_feat_hctm hctm;
+	int ret;
+
+	ret = nvme_get_features(ctrl, NVME_FEAT_HCTM, 0, NULL, 0, (u32 *)&hctm);
+	if (ret > 0)
+		return -EIO;
+	if (ret < 0)
+		return ret;
+
+	*temp = kelvin_to_millicelsius(low ? hctm.tmt1 : hctm.tmt2);
+
+	return 0;
+}
+
+static int nvme_set_temp_throttle(struct nvme_ctrl *ctrl, int sensor, bool low,
+				  long temp)
+{
+	struct nvme_feat_hctm hctm;
+	int ret;
+
+	temp = millicelsius_to_kelvin(temp);
+
+	ret = nvme_get_features(ctrl, NVME_FEAT_HCTM, 0, NULL, 0, (u32 *)&hctm);
+	if (ret > 0)
+		return -EIO;
+	if (ret < 0)
+		return ret;
+
+	if (low)
+		hctm.tmt1 = temp;
+	else
+		hctm.tmt2 = temp;
+
+	ret = nvme_set_features(ctrl, NVME_FEAT_HCTM, *(unsigned int *)&hctm,
+				NULL, 0, NULL);
+	if (ret > 0)
+		return -EIO;
+
+	return ret;
+}
+
 static int nvme_hwmon_get_smart_log(struct nvme_hwmon_data *data)
 {
 	return nvme_get_log(data->ctrl, NVME_NSID_ALL, NVME_LOG_SMART, 0,
@@ -83,6 +127,10 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_temp_crit:
 		*val = kelvin_to_millicelsius(data->ctrl->cctemp);
 		return 0;
+	case hwmon_temp_throttle_high:
+		return nvme_get_temp_throttle(data->ctrl, channel, false, val);
+	case hwmon_temp_throttle_low:
+		return nvme_get_temp_throttle(data->ctrl, channel, true, val);
 	default:
 		break;
 	}
@@ -122,6 +170,10 @@ static int nvme_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 		return nvme_set_temp_thresh(data->ctrl, channel, false, val);
 	case hwmon_temp_min:
 		return nvme_set_temp_thresh(data->ctrl, channel, true, val);
+	case hwmon_temp_throttle_high:
+		return nvme_set_temp_throttle(data->ctrl, channel, false, val);
+	case hwmon_temp_throttle_low:
+		return nvme_set_temp_throttle(data->ctrl, channel, true, val);
 	default:
 		break;
 	}
@@ -179,6 +231,11 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
 		if (!channel || data->log.temp_sensor[channel - 1])
 			return 0444;
 		break;
+	case hwmon_temp_throttle_high:
+	case hwmon_temp_throttle_low:
+		if ((!channel && data->ctrl->hctma))
+			return 0644;
+		break;
 	default:
 		break;
 	}
@@ -189,7 +246,8 @@ static const struct hwmon_channel_info *nvme_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
-				HWMON_T_CRIT | HWMON_T_LABEL | HWMON_T_ALARM,
+				HWMON_T_CRIT | HWMON_T_LABEL | HWMON_T_ALARM |
+				HWMON_T_THROTTLE_HIGH | HWMON_T_THROTTLE_LOW,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
 				HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index bdc0ff7ed9ab..9f53f96c1206 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -293,6 +293,7 @@ struct nvme_ctrl {
 	u32 vs;
 	u32 sgls;
 	u16 kas;
+	u16 hctma;
 	u8 npss;
 	u8 apsta;
 	u16 wctemp;
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 14325f93c6b2..9377682c4b1a 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -87,6 +87,8 @@ enum hwmon_temp_attributes {
 	hwmon_temp_reset_history,
 	hwmon_temp_rated_min,
 	hwmon_temp_rated_max,
+	hwmon_temp_throttle_low,
+	hwmon_temp_throttle_high,
 };
 
 #define HWMON_T_ENABLE		BIT(hwmon_temp_enable)
@@ -116,6 +118,8 @@ enum hwmon_temp_attributes {
 #define HWMON_T_RESET_HISTORY	BIT(hwmon_temp_reset_history)
 #define HWMON_T_RATED_MIN	BIT(hwmon_temp_rated_min)
 #define HWMON_T_RATED_MAX	BIT(hwmon_temp_rated_max)
+#define HWMON_T_THROTTLE_LOW	BIT(hwmon_temp_throttle_low)
+#define HWMON_T_THROTTLE_HIGH	BIT(hwmon_temp_throttle_high)
 
 enum hwmon_in_attributes {
 	hwmon_in_enable,
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index ae53d74f3696..7f072fc2644d 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -184,7 +184,7 @@ enum {
  * Submission and Completion Queue Entry Sizes for the NVM command set.
  * (In bytes and specified as a power of two (2^n)).
  */
-#define NVME_ADM_SQES       6
+#define NVME_ADM_SQES		6
 #define NVME_NVM_IOSQES		6
 #define NVME_NVM_IOCQES		4
 
@@ -1079,6 +1079,11 @@ enum {
 	NVME_HOST_MEM_RETURN	= (1 << 1),
 };
 
+struct nvme_feat_hctm {
+	__u16 tmt2;
+	__u16 tmt1;
+};
+
 struct nvme_feat_host_behavior {
 	__u8 acre;
 	__u8 etdas;
-- 
2.34.1

