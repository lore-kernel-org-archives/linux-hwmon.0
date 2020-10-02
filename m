Return-Path: <SRS0=dIDE=DJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50490C4363C
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Oct 2020 16:35:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D197206FA
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Oct 2020 16:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gSOQ3Gfk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbgJBQfo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Oct 2020 12:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733260AbgJBQfo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Oct 2020 12:35:44 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D73C0613D0
        for <linux-hwmon@vger.kernel.org>; Fri,  2 Oct 2020 09:35:43 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id k17so1375033pgb.7
        for <linux-hwmon@vger.kernel.org>; Fri, 02 Oct 2020 09:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=SpMJpThGWoi9RDdOzLt/xu956bhEo2Qi6otGwoosXhQ=;
        b=gSOQ3GfkxtCXSkOIF4AkazIkoUxdQf1iBo+wtcFj4Jo8B2SdFG7jB+XJyc945Vsrhv
         tVZNG3+8qcBuRa/ugH0RBn8zXHXdagSqrkBLbFl9pxoQC9CMs6xXQ0EZ22N9O0NxjqlP
         yu/C+OTbPLRgj92mtIIRTQ5YwjboJFkuFX3aPHCNQtrNrDGH4Nkka4YIzDmJLEYT5zG/
         isfHojJhW9eS0t+DxTu59Vl4aAC8fOFXZxj9fwvtgala+Pxi1bAmCFiPF+pUvbPNWXpn
         tIwFt1oYfJh8FWMyiUSf3e7hAHKDVm4dZmGdvOyR9frSQ3CFtWDwI3XUZ/kns9m+J0Ak
         S0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=SpMJpThGWoi9RDdOzLt/xu956bhEo2Qi6otGwoosXhQ=;
        b=NqFfrwdQzKji4uQjm39D42mQvjoPLlMeDsRCttSFlmWG24dT8LTo1GJ9+Wt4Kkamib
         oOlfCZKJ5Nnv1YQ2GGsN9I4M4mmDUgaS+kBWQ6O3oaoFmXT0b7U9s5yFbZorn/KhbAUJ
         mQZCqy4oyAmesNe5aG0rvvEJk568PWXFknxxjv6b/4O13XhtQoZKDod9heZEzj7YQ38s
         4kSP4jI5gI+T7k2+ju0wPa+2tIQd9qaQVWq4stpE0AWceWrYSfXZQIp7QJjQNM0Qg7Rz
         Vc7KKLDUjHDjrhjdhEeDioc0u4L9CDvmGQG3QjBj5h/Bcnyab/79TSA2Vy0ubDPZtdWV
         /TMg==
X-Gm-Message-State: AOAM531c1HBBE//MDzoi+n14YE1pJGhUH9F9MhbakDq//nQ6gbcGBHWB
        C8zKYywxBkQx6t6tIfYp5W1Xi6pccJ0dYg==
X-Google-Smtp-Source: ABdhPJzqcziq4JuLV6WjwabKlhzyG70NXj8jKeP4lMUjvdItp36L5ZmgHL9MXwcAp+9r67BT0b4st8ioPfzodQ==
Sender: "foremans via sendgmr" <foremans@foremans.c.googlers.com>
X-Received: from foremans.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:7f8e])
 (user=foremans job=sendgmr) by 2002:aa7:87da:0:b029:13c:1611:66bf with SMTP
 id i26-20020aa787da0000b029013c161166bfmr3882258pfo.10.1601656542508; Fri, 02
 Oct 2020 09:35:42 -0700 (PDT)
Date:   Fri,  2 Oct 2020 16:35:38 +0000
Message-Id: <20201002163538.1483578-1-foremans@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
Subject: [PATCH] Fix max34440 OC fault limits
From:   Steve Foreman <foremans@google.com>
To:     linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <groeck@google.com>,
        Steve Foreman <foremans@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The max34* family have the IOUT_OC_WARN_LIMIT and IOUT_OC_CRIT_LIMIT
registers swapped.

Signed-off-by: Steve Foreman <foremans@google.com>
---
 drivers/hwmon/pmbus/max34440.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index f3971ceaef9a..eb6e7bb5327d 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -44,6 +44,11 @@ enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
 #define MAX34440_STATUS_OT_FAULT	BIT(5)
 #define MAX34440_STATUS_OT_WARN		BIT(6)
 
+// The whole max344* family have IOUT_OC_WARN_LIMIT and IOUT_OC_FAULT_LIMIT
+// swapped from the standard pmbus spec addresses.
+#define MAX34440_IOUT_OC_WARN_LIMIT 0x46
+#define MAX34440_IOUT_OC_FAULT_LIMIT 0x4A
+
 #define MAX34451_MFR_CHANNEL_CONFIG	0xe4
 #define MAX34451_MFR_CHANNEL_CONFIG_SEL_MASK	0x3f
 
@@ -62,6 +67,12 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 	const struct max34440_data *data = to_max34440_data(info);
 
 	switch (reg) {
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase,
+					   MAX34440_IOUT_OC_FAULT_LIMIT);
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase,
+					   MAX34440_IOUT_OC_WARN_LIMIT);
 	case PMBUS_VIRT_READ_VOUT_MIN:
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34440_MFR_VOUT_MIN);
@@ -128,6 +139,12 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 	int ret;
 
 	switch (reg) {
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_FAULT_LIMIT,
+					    word);
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_WARN_LIMIT,
+					    word);
 	case PMBUS_VIRT_RESET_POUT_HISTORY:
 		ret = pmbus_write_word_data(client, page,
 					    MAX34446_MFR_POUT_PEAK, 0);
-- 
2.28.0.806.g8561365e88-goog

