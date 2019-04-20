Return-Path: <SRS0=/An6=SW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D57FC282DD
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 16:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06CD320675
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 16:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mj1ldbgd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbfDTQnx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 20 Apr 2019 12:43:53 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34256 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbfDTQnx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 20 Apr 2019 12:43:53 -0400
Received: by mail-ed1-f67.google.com with SMTP id a6so6654190edv.1
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Apr 2019 09:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:openpgp:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=brUF2b+wAOM6SXOaF3N8J1yeIQAMPiB8AzAHPKqzNlg=;
        b=mj1ldbgdARfOfpNDlOdwimp7CrV4TPU1bAKEGt/s3Ta+0CinnpdTSgVUbrWC73FA4b
         GBfgOuyXwEJcUtuVBSrWofi5WLLkD6t5uK1CIS304hKuKnS7l/MgRXT8LXYb6TTC8pAn
         yif62ej47xUV7x4SSe1v5dopxHQlvi3Ww98X7HuKqkQ/dAuOEOFtTHfe2IY6/JQ2UUxL
         opFoJsJeGXctH/QIIeFnTbga1DKheb5yvbvuXxNv8u7jiY/0hxQXwdW/I7uyaQDqquiX
         NS2blmvJYm2K7/1V1YmRqD3a0HBjdCvQXOjwyy8DHbxwae4XxoORZrVfmvq8Id1HURxp
         Q/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:openpgp:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=brUF2b+wAOM6SXOaF3N8J1yeIQAMPiB8AzAHPKqzNlg=;
        b=V60DsX2pDJHPWg9S4mxcFPURF9iqYYrgdqYIc8vbpOnTO5k7kxHej4zmQ+czC7dCla
         Lw9vGNfF268MSNFJx2rDYASneeYWctSFT45jOZHMrSDa4PwAjE+FaOF0bOgm/LdxNRLJ
         Ct9tAN371r67uWkZC7rSaGCXnX+qT1vlEFHjjsG+Mt8hQguF+ni8hcMMo0qtsW9rkzyr
         9dlFERJQzuCavfm2Am/oDtYmoIR2BkUA9UmcNdl93JmOjRQnXkqsP0oc8XKZlRMt6Lek
         Am/zG957XBwztEGRabS3jOBUHFtIAHfbzuiCTH5FoUS/ysiDA449hQREyElXpsUd8997
         sqSA==
X-Gm-Message-State: APjAAAV6saDlhyzlxnUjyfG0mwkH4eSj9hXv7RgAz4MOPx2uB9tFodAq
        YExdJBrgriGyN4DqMvJBpRM=
X-Google-Smtp-Source: APXvYqw4qpmGsw66lYfExFMGs8YUe8zJE9VWNgQPPpCcsETp6NF/65rKDX5wf8fyxlRjAAdps63wOQ==
X-Received: by 2002:a05:6402:781:: with SMTP id d1mr6094521edy.286.1555778630956;
        Sat, 20 Apr 2019 09:43:50 -0700 (PDT)
Received: from [10.230.1.150] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id w6sm1393186ejq.73.2019.04.20.09.43.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 Apr 2019 09:43:50 -0700 (PDT)
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: SCMI sensor reads unit scaling
Openpgp: preference=signencrypt
Message-ID: <9207bc01-e0c6-ef73-6a24-6deda7b789c5@gmail.com>
Date:   Sat, 20 Apr 2019 09:43:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Sudeep, Guenter,

The current SCMI hwmon support does not seem to make use of the sensor
scale/unit as defined in the sensor replies (or the update scale for
that matter).

I came up with the patch below which gets the job done, but I am worried
about possibly breaking people's SCMI deployments and sensors reading
because they may have intentionally or not already decided to return a
value which is scaled the way Linux's hwmon expect it, and may, or may
not have populated a valid unit number in the sensor reply.

Ideally we should probably do two conversions:

- from within scmi_sensor_reading_get(), scale the value as indicated by
the reply
- from within scmi_hwmon_read(), take that scaled value and apply the
necessary conversion expected by Linux's HWMON conventions (e.g.:
reporting voltage as mV values)

What do you think?

---
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: firmware: arm_scmi: Support sensor scaling

The SCMI sensor management protocol includes the following provision:

The power-of-10 multiplier in two’s-complement format that is applied to
the sensor unit specified by the SensorType field.

Add support for scaling the value returned based on what is provided by
the firmware. This requires us to be able to look up a sensor identifier
to its backing scmi_sensor_info structure and apply the necessary scale.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/firmware/arm_scmi/sensors.c | 37
++++++++++++++++++++++++++++++++++++-
 include/linux/scmi_protocol.h       |  1 +
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/sensors.c
b/drivers/firmware/arm_scmi/sensors.c
index bbb469f..2eccc6a 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -33,7 +33,8 @@ struct scmi_msg_resp_sensor_description {
 #define NUM_TRIP_POINTS(x)	(((x) >> 4) & 0xff)
 		__le32 attributes_high;
 #define SENSOR_TYPE(x)		((x) & 0xff)
-#define SENSOR_SCALE(x)		(((x) >> 11) & 0x3f)
+#define SENSOR_SCALE_MASK	0x3f
+#define SENSOR_SCALE(x)		(((x) >> 11) & SENSOR_SCALE_MASK)
 #define SENSOR_UPDATE_SCALE(x)	(((x) >> 22) & 0x1f)
 #define SENSOR_UPDATE_BASE(x)	(((x) >> 27) & 0x1f)
 		    u8 name[SCMI_MAX_STR_SIZE];
@@ -72,6 +73,35 @@ struct sensors_info {
 	struct scmi_sensor_info *sensors;
 };

+static
+struct scmi_sensor_info *scmi_sensor_info_from_id(struct sensors_info *si,
+						  u32 sensor_id)
+{
+	struct scmi_sensor_info *s = NULL;
+	int i;
+
+	for (i = 0; i < si->num_sensors; i++) {
+		s = &si->sensors[i];
+		if (s->id == sensor_id)
+			return s;
+	}
+
+	return s;
+}
+
+static void inline scmi_scale_value(u8 scale, u64 *value)
+{
+	unsigned int i;
+
+	if (scale & ((SENSOR_SCALE_MASK + 1) >> 1)) {
+		for (i = 0; i < (~scale) + 1; i++)
+			*value /= 10;
+	} else {
+		for (i = 0; i < scale; i++)
+			*value *= 10;
+	}
+}
+
 static int scmi_sensor_attributes_get(const struct scmi_handle *handle,
 				      struct sensors_info *si)
 {
@@ -140,6 +170,7 @@ static int scmi_sensor_description_get(const struct
scmi_handle *handle,
 			s = &si->sensors[desc_index + cnt];
 			s->id = le32_to_cpu(buf->desc[cnt].id);
 			s->type = SENSOR_TYPE(attrh);
+			s->scale = SENSOR_SCALE(attrh);
 			memcpy(s->name, buf->desc[cnt].name, SCMI_MAX_STR_SIZE);
 		}

@@ -205,6 +236,8 @@ static int scmi_sensor_trip_point_set(const struct
scmi_handle *handle,
 static int scmi_sensor_reading_get(const struct scmi_handle *handle,
 				   u32 sensor_id, bool async, u64 *value)
 {
+	struct sensors_info *si = handle->sensor_priv;
+	struct scmi_sensor_info *s = scmi_sensor_info_from_id(si, sensor_id);
 	int ret;
 	struct scmi_xfer *t;
 	struct scmi_msg_sensor_reading_get *sensor;
@@ -225,6 +258,8 @@ static int scmi_sensor_reading_get(const struct
scmi_handle *handle,

 		*value = le32_to_cpu(*pval);
 		*value |= (u64)le32_to_cpu(*(pval + 1)) << 32;
+		if (s && s->scale)
+			scmi_scale_value(s->scale, value);
 	}

 	scmi_one_xfer_put(handle, t);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index b458c87..782b53e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -140,6 +140,7 @@ struct scmi_power_ops {
 struct scmi_sensor_info {
 	u32 id;
 	u8 type;
+	u8 scale;
 	char name[SCMI_MAX_STR_SIZE];
 };

-- 
-- 
Florian
