Return-Path: <SRS0=m4ZR=SG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA292C4360F
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A6AB2082E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Apr 2019 15:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGEubzOp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbfDDP7E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:59:04 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43473 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfDDP7E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Apr 2019 11:59:04 -0400
Received: by mail-pg1-f196.google.com with SMTP id z9so1446341pgu.10
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Apr 2019 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8gVkD+E75JtujPG8rudtsCccC0inrU3ixukIQ8kL5Y=;
        b=cGEubzOpPa6rYIBQevfOKA1C+FCfbKITfEa/8rwTS/zeZwac576a7RdgH2fPgmc7w8
         uCKX0elyA0l3a+npiZXqxXASuV/sWQW3kxt/6S/owDXrygWl2EQC2AaASwgxZxY2PMHg
         X/tdD3NUQSO/59KAHDJKbMj/VehLJXD8TxE/mUdJhxKsamR+t4e1DKQzBRQzeUyFGQ2Q
         oGw9BWPHynduSVbMLHIRhJ0HdVRORKAwSuODXlmlomVgNNWuEtGeoP587VLtG6XUX69d
         2HZ4j+yBQeVbgHH9K/MuPIOEwPGIvEi6VP+gPFjZZ0MXgmNFvz7HMv4IMupOp180UjT8
         GprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=A8gVkD+E75JtujPG8rudtsCccC0inrU3ixukIQ8kL5Y=;
        b=BN1O9CreA5DwG6hTQuaLoDUEjij9+r4IwkX1feZ1j06oVudgY7Kn2QnUlS597USEPH
         ZWcKNZVGl/L3he3XLiONGeA2Ob4fCiKZaa45eTCd9mj41NjYZcV3DKwUotrplsoBfQ2C
         9+JXuZnDDUtX4HhoLf9HYMVohq6GKKtrBJIQiONPIftUCHOK6q+DYn1T9M7PgEl73XQy
         nSYLnpwZrICL99X17mzK94mKPcHvUp3I3UVI1d1GHZ7E0vqgYXs9kT5prMgNIJUbxsRa
         /UohLdfYXdAgPBrpRUygmAP2M4r1JP3Dm8R/hrOQyAwuIqyw8sh+W2bxqcpXvzE6tVxK
         AdFA==
X-Gm-Message-State: APjAAAVlPfpbu0LgUEVChJ8pIB42zV4MlMjbXHM27wS+nSixTleVM85c
        O3In1oCkswhreR+eiI4Apuzdv/Dy
X-Google-Smtp-Source: APXvYqxWWiFg/DimLrUInmfRXryh2ySTAKZWpukdsZS0CqiyW+ddXQtPDK8p0B9At7e72cz4yWl5BQ==
X-Received: by 2002:a62:304:: with SMTP id 4mr6574586pfd.99.1554393543311;
        Thu, 04 Apr 2019 08:59:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y5sm22595467pgv.15.2019.04.04.08.59.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 08:59:02 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/24] hwmon: (max6650) Fix build warning
Date:   Thu,  4 Apr 2019 08:58:29 -0700
Message-Id: <1554393516-30316-17-git-send-email-linux@roeck-us.net>
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

drivers/hwmon/max6650.c:137:34: warning:
	‘max6650_dt_match’ defined but not used

Mark max6650_dt_match as __maybe_unused to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 61135a2d0cff..95b234631e55 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -134,7 +134,7 @@ static const u8 tach_reg[] = {
 	MAX6650_REG_TACH3,
 };
 
-static const struct of_device_id max6650_dt_match[] = {
+static const struct of_device_id __maybe_unused max6650_dt_match[] = {
 	{
 		.compatible = "maxim,max6650",
 		.data = (void *)1
-- 
2.7.4

