Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B9DC4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4C23206B7
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIwXCogh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbfDDP7B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39763 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP7B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id k3so1454590pga.6
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sr8rY78hLSYNziVnT6WQvXrVXDRVV50PdpMRL67Xg0M=;
        b=tIwXCogh+scibzARaMcZ0+cKxbqx2rZlaTgyaZZl9IGu7MTCLbig0QIrDICLtipvAe
         +lBj6ARV008Vx3Bb8J+6I+odmzpx+0q4o600eL4mxaSXSLyr9RfmtO+ZPuCWfz2Pf0u4
         WT4ffh3cIixrhX59FF9BgFKRNmwAhmp/TRn5nRR71p8t3dtvGvq6xU4CK+hnQTfI/DEA
         7VBfFIMKHbpWo9r3lP6JKQcF7PDBTAQoF8TpVMEtPI+aNbKE1asSbltUGtr4giQZnzbC
         GImLVLRZ4eFZZxG2yA2vv8a6suekBW3BJhdmjjXVGyfb1byjgv3n543hy4feAgYl3TeH
         O3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Sr8rY78hLSYNziVnT6WQvXrVXDRVV50PdpMRL67Xg0M=;
        b=IX6o+cL3GKHTQjtXIjD1X+8mMP5VnHx0V6O0cu/6uED7ySJwgG0UJNRvyIFS3Zmgej
         YrsNFJ6vNaR6C2ZsEc1d1CZhAaJdGcHa3UebgSopl4dukIbswn9vraq9/GXUdyMEahkQ
         7VVLrGTQA5bpJzblTiJHIIpeNLyNQXwK4kUZT4H+UmnRQpJa2aF1rCgC1wCXMl0Rvqly
         lSQ+ivVYYgn4jWNeIJ5RNuAMOz3qEfUNwqrDHeQ6RMZPEGP3laAvFSpl58RQzT6JAwQK
         BXq2oLk8+DgaQxpWaU9w/XFeEKljrXzAAPjx2wLwwhZ+gl8khhevripmSCwgOqfX6zSN
         Dq9g==
X-Gm-Message-State: APjAAAW5JOOJ6aAA0Ig4zuswQwwJ+5CoV180EGIgQWm/mecuC8H9tZL/
        mE5T8V13Ni8zNszvF0m5fXKNmdCs
X-Google-Smtp-Source: APXvYqz6hK2Ga9xk1pNVNnWA+1lvWf03JthMd9bsf/r4cEjHXhNIKykoz05dNgaj+o78dAjKUhWdew==
X-Received: by 2002:a63:ef07:: with SMTP id u7mr6851874pgh.0.1554393540447;
        Thu, 04 Apr 2019 08:59:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 10sm27153696pfh.14.2019.04.04.08.58.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:58:59 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/24] hwmon: (ina209) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:27 -0700
Message-Id: <1554393516-30316-15-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
References: <1554393516-30316-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If CONFIG_OF is not enabled, the following build warning is observed.

drivers/hwmon/ina209.c:590:34: warning:
	‘ina209_of_match’ defined but not used

Mark ina209_of_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina209.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
index e3854463db84..6a4ec2f2ddb2 100644
--- a/drivers/hwmon/ina209.c
+++ b/drivers/hwmon/ina209.c
@@ -587,7 +587,7 @@ static const struct i2c_device_id ina209_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ina209_id);
 
-static const struct of_device_id ina209_of_match[] = {
+static const struct of_device_id __maybe_unused ina209_of_match[] = {
 	{ .compatible = "ti,ina209" },
 	{ },
 };
-- 
2.7.4

