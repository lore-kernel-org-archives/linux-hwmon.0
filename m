Return-Path: <SRS0=wGth=DL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665A5C4727D
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 03:14:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 304E1206C9
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 03:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bAzh9QPy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgJDDO4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Oct 2020 23:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgJDDOz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Oct 2020 23:14:55 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A31C0613E7
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Oct 2020 20:14:55 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id b13so638151pgr.4
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Oct 2020 20:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to;
        bh=LhQBM6coR58Co/ZAPA0BFc3M4Mk5vH1MxVZJV9ls2vA=;
        b=bAzh9QPy/8+oA04boCqNdkX9voAP/+Gg756k4vP8HjMlDBZ2nMYJSINilK52c1NBez
         q31UZmbwzvjug2Q0mmo/iOB0pErHbhLKpnX7RpVvOUjq+adQfQHjzgPFvaNwzE8USvMZ
         Guh8IPPr51x8M9+F6QYQjsbzHNOjGopcZaSZaur+vqIN53nJWpTlwkj73EXl9dcvbrTG
         eqquSXE5F0qaVh8hIOxHPuOP7hhHirFxcXaWA7ovnvMdC3D1O8KhQUoLKFZhasL2iKtC
         0WBHitfyKkreWL0ePFIGykj+vZuGJRaN8kvVoh3CneyY8Puw69/q9TcplQdVm9mMAqEa
         InTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to;
        bh=LhQBM6coR58Co/ZAPA0BFc3M4Mk5vH1MxVZJV9ls2vA=;
        b=UmnxxVy68TtkYCJQxKXahBngDvyLNwjMmRW1sBivhGIF+i+fjTZziVpxZApio37Nb2
         Nfim8MPVyn4WwzwMnyFvMaQa4XkOUf1eJJ/7EgjxsapYCxDHuPjrRdr9iYTksnaqQn2v
         5tbxT8otjdOhJlAMEEKhq/N4WhhW7Y/7xWUoz1r1VwEsomKr0Llh3DjZtOMz+oy93b4K
         W3/FyxLvJP2mGoTlp8Us8srPquHWh2AQBeaN0/QQqJ41cirj9Qw1tNFYadihyBpPUZyJ
         WkNWf6f/9QW01UWo8w2DmBLQSOVwU190DXJfY9/GkyTiz0EyZXzskOJZP9Y1kb0gm22D
         cPKg==
X-Gm-Message-State: AOAM531MjDt/MIJgPY1jBIrAC929g2Xgy3osDmEqJ6rcJ8nU2SBQZKqo
        8x/XBoSrPKrWAbf6fGfk1OnrpRWY4dWDQ94T
X-Google-Smtp-Source: ABdhPJwzzMxNDTk6r9V6wNabUs9CJ15rB1Am55ZHxJYf8iqp+g/GkSnAUj9Ajd4XZxCWHO/XflZpBBlIIstATRSz
Sender: "linchuyuan via sendgmr" <linchuyuan@chu-dev.c.googlers.com>
X-Received: from chu-dev.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3cfb])
 (user=linchuyuan job=sendgmr) by 2002:a17:90a:990c:: with SMTP id
 b12mr233850pjp.0.1601781294305; Sat, 03 Oct 2020 20:14:54 -0700 (PDT)
Date:   Sun,  4 Oct 2020 03:14:45 +0000
In-Reply-To: <20201004031445.2321090-1-linchuyuan@google.com>
Message-Id: <20201004031445.2321090-3-linchuyuan@google.com>
Mime-Version: 1.0
References: <20201004031445.2321090-1-linchuyuan@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
Subject: [PATCH v4 2/2] hwmon: pmbus: max20730: adjust the vout reading given
 voltage divider
From:   Chu Lin <linchuyuan@google.com>
To:     linchuyuan@google.com, jdelvare@suse.com, linux@roeck-us.net,
        robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Problem:
We use voltage dividers so that the voltage presented at the voltage
sense pins is confusing. We might need to convert these readings to more
meaningful readings given the voltage divider.

Solution:
Read the voltage divider resistance from dts and convert the voltage
reading to a more meaningful reading.

Testing:
max20730 with voltage divider

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
ChangeLog v1 -> v2
  hwmon: pmbus: max20730:
  - Don't do anything to the ret if an error is returned from pmbus_read_word
  - avoid overflow when doing multiplication

ChangeLog v2 -> v3
  dt-bindings: hwmon: max20730:
  - Provide the binding documentation in yaml format
  hwmon: pmbus: max20730:
  - No change

ChangeLog v3 -> v4
  dt-bindings: hwmon: max20730:
  - Fix highefficiency to high efficiency in description
  - Fix presents to present in vout-voltage-divider
  - Add additionalProperties: false
  hwmon: pmbus: max20730:
  - No change

 drivers/hwmon/pmbus/max20730.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index a151a2b588a5..fbf2f1e6c969 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -31,6 +31,7 @@ struct max20730_data {
 	struct pmbus_driver_info info;
 	struct mutex lock;	/* Used to protect against parallel writes */
 	u16 mfr_devset1;
+	u32 vout_voltage_divider[2];
 };
 
 #define to_max20730_data(x)  container_of(x, struct max20730_data, info)
@@ -114,6 +115,14 @@ static int max20730_read_word_data(struct i2c_client *client, int page,
 		max_c = max_current[data->id][(data->mfr_devset1 >> 5) & 0x3];
 		ret = val_to_direct(max_c, PSC_CURRENT_OUT, info);
 		break;
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret > 0 && data->vout_voltage_divider[0] && data->vout_voltage_divider[1]) {
+			u64 temp = DIV_ROUND_CLOSEST_ULL((u64)ret * data->vout_voltage_divider[1],
+							 data->vout_voltage_divider[0]);
+			ret = clamp_val(temp, 0, 0xffff);
+		}
+		break;
 	default:
 		ret = -ENODATA;
 		break;
@@ -364,6 +373,15 @@ static int max20730_probe(struct i2c_client *client,
 	data->id = chip_id;
 	mutex_init(&data->lock);
 	memcpy(&data->info, &max20730_info[chip_id], sizeof(data->info));
+	if (of_property_read_u32_array(client->dev.of_node, "vout-voltage-divider",
+				       data->vout_voltage_divider,
+				       ARRAY_SIZE(data->vout_voltage_divider)) != 0)
+		memset(data->vout_voltage_divider, 0, sizeof(data->vout_voltage_divider));
+	if (data->vout_voltage_divider[1] < data->vout_voltage_divider[0]) {
+		dev_err(dev,
+			"The total resistance of voltage divider is less than output resistance\n");
+		return -ENODEV;
+	}
 
 	ret = i2c_smbus_read_word_data(client, MAX20730_MFR_DEVSET1);
 	if (ret < 0)
-- 
2.28.0.806.g8561365e88-goog

