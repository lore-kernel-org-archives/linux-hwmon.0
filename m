Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E950BC433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 22:26:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA6796113C
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 May 2021 22:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235885AbhEQW1b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 May 2021 18:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbhEQW1a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 May 2021 18:27:30 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE16C061573
        for <linux-hwmon@vger.kernel.org>; Mon, 17 May 2021 15:26:13 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id l61-20020a0c84430000b02901a9a7e363edso5833613qva.16
        for <linux-hwmon@vger.kernel.org>; Mon, 17 May 2021 15:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=puap4zYglf6RuvLQbjq0WWUfB5Aff47YdCO+nGa3JIw=;
        b=GF8VhTJw5Qj9m7VAbMjTvlsOc24zyImWxcOQA8L63oxL427Dgz8JigvnwHZrHohxWH
         MjR38Mq6/uYfiDNXDob6u0XCkx8MeMQ/LcbKlIeuWQGOaoBLmPAA89+o36nsHalPpY4n
         O6JCQj3W00JDWEDFdQpJhOkjrDhfffyd7OWA+5GRgx8vCm9MAQeku56Tp26D/XvFFo8a
         bDaEHp+Vc6pC9Hko/BLsQsG1vsqBtv5L8tTjjBWbUi079X5IfpXLZ/nHXKjV9iQrRmov
         OtJmAAyKs0cN882FrpnZMKal8cJge/6lboJtQoBpc/QhvmO8lCLGBviy6QDfREKFOpLg
         +gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=puap4zYglf6RuvLQbjq0WWUfB5Aff47YdCO+nGa3JIw=;
        b=Nl2Jfd9Yw5gpi6pgbrSF73JRXVRA5M6aBbJzuh21+ZJpWMdmIMp6YVPpj6WBMqea53
         04/TyKvX/g8l6coSklhxoyNK0NIEtaLy0iHnFh0v1Qls/LCmVcGCfP/AZqjI4wf2xzY/
         aQj7d/PRoaALkTX6a1PI6zygHzZRMekEsNKONqtJKfF9GxSv6FNDnOn/issYd2ENq6fB
         os9IFi33MHE5NwxXQ9v+ZerSgZ7HlRYSVBdSveAljXL9dTpSc09AbE+zoogY4KLuUR5U
         iEYpYpJYmVbxa8K+xAyod33OXCtdNpqmnbpi/7jc+0TQ0aKCUiKoSIOLHkLM0dC0plyf
         Ig4g==
X-Gm-Message-State: AOAM530YydAhqHZHO93fLWjRnCMmGhs/GcOcbnS/syqnwnCZvIJrZu3T
        6lNGO70JHBhd6wte0npKvqY7/0Bx5XEOyH7Y
X-Google-Smtp-Source: ABdhPJx9xi4RbdgNH+aq3V96cm7uGAwCHl1zUGXVB8O8ob7VsIb4096IRfQQ4zQ8CdSPL4qdhjdJlbkgoqqbie49
X-Received: from chu-dev-docker.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:80f])
 (user=linchuyuan job=sendgmr) by 2002:a05:6214:a91:: with SMTP id
 ev17mr2180876qvb.9.1621290372073; Mon, 17 May 2021 15:26:12 -0700 (PDT)
Date:   Mon, 17 May 2021 22:26:06 +0000
Message-Id: <20210517222606.3457594-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH] hwmon:q54sj108a2: the PMBUS_MFR_ID is actually 6 chars
 instead of 5
From:   Chu Lin <linchuyuan@google.com>
To:     linchuyuan@gmail.com, jasonling@google.com, zhongqil@google.com,
        linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Chu Lin <linchuyuan@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The PMBUS_MFR_ID block is actually 6 chars for q54sj108a2.
/sys/bus/i2c/drivers/q54sj108a2_test# iotools smbus_read8 $BUS $ADDR 0x99
0x06

Tested: Devices are able to bind to the q54sj108a2 driver successfully.

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index aec512766c31..0976268b2670 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -299,7 +299,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 		return ret;
 	}
-	if (ret != 5 || strncmp(buf, "DELTA", 5)) {
+	if (ret != 6 || strncmp(buf, "DELTA", 5)) {
 		buf[ret] = '\0';
 		dev_err(dev, "Unsupported Manufacturer ID '%s'\n", buf);
 		return -ENODEV;
-- 
2.31.1.751.gd2f1c929bd-goog

