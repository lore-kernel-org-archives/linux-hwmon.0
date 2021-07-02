Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1BEC11F6B
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 07:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96994613F4
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 07:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhGBHeh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Jul 2021 03:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhGBHef (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Jul 2021 03:34:35 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97492C061762;
        Fri,  2 Jul 2021 00:32:02 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id c5so8231728pfv.8;
        Fri, 02 Jul 2021 00:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9H8vNUg/dNdG9cHt7hnXLkjTa3kumfNQzjr7TwedOp4=;
        b=sXnkrWtmS7i0PobP8UyVUu4bcdOuTbDt8OLu4j72OBJ17IkhVGxWOGI9odkeciH8tD
         +5nf7TQ6jetu7ilb8EGXfRTcNfmgMFs4xj+zY18HYnK2hcK6nN5EAh/u2FaTn89q8Q3U
         n0oUaXcoGoM0cMOWUcCznUPN1jVjS/lxYsSLLIZIZ8guOcfZKjHmbE/U3u7P20jfs9ij
         0n1erkq+Ux7HL14bhA7WyCedMyE1yHC6Wom7u79JgGPLYvDjB4dQv15rE2jyBdgk7TDW
         GqAx6kWWnSjRqAZ3YtccLrDMVh49ELcRdSElh43oBZEk9JzbNC+GsSWofg4DLPNXF1f8
         Xs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9H8vNUg/dNdG9cHt7hnXLkjTa3kumfNQzjr7TwedOp4=;
        b=QbrUd4HkWELLnt74ldUdyJww5CP2fYRyv/5WRBsRgcASg/vzd4DLCS+SGVrHsIQMFG
         S2VwdCuQgbfqXeg+QCAvhbn+471b1AiJZDXSGmwjIHFCAO1TxDdIfdldg+DmQHlSbXAW
         ZwJkZfzkNJD8LfKeF0a7M4Zyyn/EZfv/gH/eC0EK0HrfFygWJ/N5VM3ldecDqCymy+ok
         K1bizA6WbHh9ewlqpkYiMi+0qsx71UGAc4KkjwADHNoEQ5MhxzrXFQx5zZB3IXCijxZ2
         JJ/Y2gTnlszBsKr19GXbSs96aeUlhpb5foSdJL2hMkKl9wVV9FperJ/jpNjPjl6FgdFe
         /g3w==
X-Gm-Message-State: AOAM533Blu/nDcbam4ttP1Blw5Z/abz5KvOQfgXLupFQVSUIU/F17WmQ
        78nqPAdYyeC/a9PxuF2qz1I=
X-Google-Smtp-Source: ABdhPJzPsEhSh3xl71+0LMYVvz+WGMxe06cLZQ6ePfc9R6w/0vTnvPaOWvF9bGtq30PzLTz/Vrp7SQ==
X-Received: by 2002:a63:f009:: with SMTP id k9mr674409pgh.356.1625211122197;
        Fri, 02 Jul 2021 00:32:02 -0700 (PDT)
Received: from localhost.localdomain ([40.83.88.183])
        by smtp.gmail.com with ESMTPSA id bx12sm1775080pjb.22.2021.07.02.00.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 00:32:01 -0700 (PDT)
From:   ainux.wang@gmail.com
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        ainux.wang@gmail.com
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        sterlingteng@gmail.com, chenhuacai@kernel.org,
        chenhuacai@loongson.cn
Subject: [PATCH v6 2/2] hwmon: (pmbus) Try use read_status() to read status register
Date:   Fri,  2 Jul 2021 15:31:42 +0800
Message-Id: <20210702073142.15166-3-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20210702073142.15166-1-ainux.wang@gmail.com>
References: <20210702073142.15166-1-ainux.wang@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: "Ainux.Wang" <ainux.wang@gmail.com>

There is a case(like MP2949A) that the chip do not support STATUS_WORD
and STATUS_BYTE command, but return some random data when reading.

So we should call read_status() instead of i2c_smbus_read_word_data()
and i2c_smbus_read_byte_data(), and the chip driver should implement a
read_word_data() function and a read_byte_data() function to return
-ENXIO.

Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 776ee2237be2..d3273a20e76e 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -503,6 +503,9 @@ static int pmbus_check_status_cml(struct i2c_client *client)
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int status, status2;
 
+	if (!data->read_status)
+		return -EINVAL;
+
 	status = data->read_status(client, -1);
 	if (status < 0 || (status & PB_STATUS_CML)) {
 		status2 = _pmbus_read_byte_data(client, -1, PMBUS_STATUS_CML);
@@ -534,6 +537,9 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
 	int status;
 	struct pmbus_data *data = i2c_get_clientdata(client);
 
+	if (!data->read_status)
+		return false;
+
 	status = data->read_status(client, page);
 	if (status >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK) &&
 	    (status & PB_STATUS_CML)) {
@@ -573,6 +579,8 @@ static int pmbus_get_status(struct i2c_client *client, int page, int reg)
 
 	switch (reg) {
 	case PMBUS_STATUS_WORD:
+		if (!data->read_status)
+			return -EINVAL;
 		status = data->read_status(client, page);
 		break;
 	default:
@@ -2306,16 +2314,15 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	/*
 	 * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
 	 * to use PMBUS_STATUS_BYTE instead if that is the case.
-	 * Bail out if both registers are not supported.
 	 */
 	data->read_status = pmbus_read_status_word;
-	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
+	ret = data->read_status(client, -1);
 	if (ret < 0 || ret == 0xffff) {
 		data->read_status = pmbus_read_status_byte;
-		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
+		ret = data->read_status(client, -1);
 		if (ret < 0 || ret == 0xff) {
-			dev_err(dev, "PMBus status register not found\n");
-			return -ENODEV;
+			/* Both registers are not supported. */
+			data->read_status = NULL;
 		}
 	} else {
 		data->has_status_word = true;
@@ -2484,6 +2491,9 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
 	struct pmbus_debugfs_entry *entry = data;
 	struct pmbus_data *pdata = i2c_get_clientdata(entry->client);
 
+	if (!pdata->read_status)
+		return -EINVAL;
+
 	rc = pdata->read_status(entry->client, entry->page);
 	if (rc < 0)
 		return rc;
-- 
2.18.1

