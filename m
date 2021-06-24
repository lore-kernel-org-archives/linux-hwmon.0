Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE04DC48BC2
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Jun 2021 02:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAB02613A9
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Jun 2021 02:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhFXC0B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Jun 2021 22:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhFXC0A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Jun 2021 22:26:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971A2C061574;
        Wed, 23 Jun 2021 19:23:41 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id e22so3419539pgv.10;
        Wed, 23 Jun 2021 19:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Zjd6ucGsgNsjEnxATRmXPTX0CeUipetTlkbJOSv260g=;
        b=YcdkNpHwINCYDlNVgRkVEJ1E3t8SdP1T947KRILoW1ZRZ344+K0NaDtKaPP/FMIMJM
         BlsDffjExhFk7D+FCUNpFobpVukcq0UeukGe1Yy7AHpt+Q63Gwuo3wnFsX4bTIKO1tQa
         a2Oou8108gkZg0bFv3CEXRT+WG+J22JnWPcTi5DVT6IkB3Zdt9OvnXKVS+ca+bA6YNK9
         10puhcjh7GEJua6Y/o+PdfkgL0k1vgrsS8Iid1bK5c32GlIP9B6yLxUdf9TPqsrUx8t/
         gS8tgkQVEpc/gTcJG5cK+F3eHrkMpRNhXagbxlouNmFZAv1fZVOJiNq8BHcQJfnFcyQB
         Z4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Zjd6ucGsgNsjEnxATRmXPTX0CeUipetTlkbJOSv260g=;
        b=Alt2KYZsxFqpu6j0tCLR/wT/RvphJdk4tstVSWQOLPcA1afH9tWs+hLQtyUgGBl1NA
         X0HfiZkjisJAI875lKKj1xrzlD6XRCsTTuK2eVr+jBCdW3FkvFw/bnzb+S7nYc0XGKko
         Iv2oHc58ddLkql/rSh2GxRavsLfSpuRX6IcwW4PiBx0/rT/C6OgzzA4eW//t9bONWBSj
         Kr2mG2TjsfodIDdsVTnM4GoTmql4Ql9VDKavuk6/+fmb4Wrr6H+4Ck3LErVC1dlluYze
         D2leHbgseN6qjA63pfkGbzqNw+9gIPvtafL51hwevw/UN9e7puKUCpDzaujwKgQx8P3U
         wyiA==
X-Gm-Message-State: AOAM533bbS+5Whpwm50dsG+OwzZg2ePr1QzDmlqfaM5roO1WilNsqGxP
        28MgKrgEyjYmcPqJmdWYdC4=
X-Google-Smtp-Source: ABdhPJyf/WMGeWr22D0NlHfsSohYsI2b2muN91qqo21HuNGQR4BEYT760H8+43g+4/M2LhL6tg3hVg==
X-Received: by 2002:a05:6a00:2ad:b029:303:41fb:41d7 with SMTP id q13-20020a056a0002adb029030341fb41d7mr2650252pfs.7.1624501421189;
        Wed, 23 Jun 2021 19:23:41 -0700 (PDT)
Received: from localhost.localdomain ([13.75.122.76])
        by smtp.gmail.com with ESMTPSA id b6sm982443pfo.64.2021.06.23.19.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 19:23:40 -0700 (PDT)
From:   ainux.wang@gmail.com
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        ainux.wang@gmail.com
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        sterlingteng@gmail.com, chenhuacai@kernel.org,
        chenhuacai@loongson.cn
Subject: [RFC] hwmon: (pmbus) Some questions about PMBUS_STATUS
Date:   Thu, 24 Jun 2021 10:23:27 +0800
Message-Id: <20210624022327.6192-1-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: "Ainux.Wang" <ainux.wang@gmail.com>

There are some questions about PMBUS_STATUS in core.

Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index bbd745178147..e16c85997148 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2200,6 +2200,19 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
 	 * to use PMBUS_STATUS_BYTE instead if that is the case.
 	 * Bail out if both registers are not supported.
+	 *
+	 * Question 1:
+	 *  Why bail out if both registers are not supported?
+	 *  MP2949A both registers are not supported.
+	 *
+	 * Question 2:
+	 *  Use i2c_smbus_read_word_data() or i2c_smbus_read_byte_data
+	 *  to read, the MP2949A will return undetermined value, although
+	 *  we already known this chip do not support both registers.
+	 *  What should we do?
+	 *  Can we use pmbus_read_status_byte() or pmbus_read_status_word()?
+	 *  and in MP2949A driver's .read_byte_data and .read_word_data to
+	 *  filter out both registers?
 	 */
 	data->read_status = pmbus_read_status_word;
 	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
-- 
2.18.1

