Return-Path: <SRS0=sjJb=5Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DA2C2BA19
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 03:43:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 092C220747
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 03:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcqZwVmK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgDIDn3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Apr 2020 23:43:29 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33888 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgDIDn2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Apr 2020 23:43:28 -0400
Received: by mail-pl1-f193.google.com with SMTP id a23so3360374plm.1
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Apr 2020 20:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pQWbN/U2rSLcT3x5Hocc6wbn2ueVDsRYT5cvVEMioqs=;
        b=QcqZwVmKEQ2EYyo2kjCq/h2lsFh0V+Z78HRJhsxjYOXmPQpLnqYDuqGs8ihTjU+0vM
         oJwtqJm66BmSq1HblFbLFZmBd1BSTHZP1MsZObfdzbQbz1TzuFuI/Be7gI347aY9ApWP
         85shZgQl7A1W9HQGahc8HDE6HfL/EpCqSwJ0Hi3mCLjudiEjashmYYaJDUWct2JSUUEP
         3YNLUtddKtVydAfXw94PVPO3NXCmaxWTUKZtmGIm+ZoK5u61BJ3TqdTL7avm1+/P/m9A
         ZJ95srqTYE1WTgaSMzqrcfpvdwxa9llcqzrKrrUkpBgzdZtX9lDRZmJvLIFPzotDTyjF
         VsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=pQWbN/U2rSLcT3x5Hocc6wbn2ueVDsRYT5cvVEMioqs=;
        b=q7Vnxh0sstia4VRX8o2jXFGiKfO87aYd1zjc9No/VT4/jZIBQwIbFV+Vf3E51w9j+G
         JsrL1Qu8zkVqPhafgPW3oDkrxIcDeXjHRCLVbKvvcKLWh3xNyDd1jhPABAMe2j4rs6X6
         9ZIBXfDfLd1OQkufFEaA9dSCw1iLOObKiCQYW4yVZv0ZMkORYYJ5aySptV7zfsronInc
         ix+8gt3sDBRqeQGJEfTdWFJgQ/pTmygEgW/P+Hqk0eO7HewX1SQTw4LPxpCorZ5XpRr/
         78yqI2wNq9nXUXvWeoX11cF0LqaUVTd2pEBoS0k3Piwn7ficqHvfpVRFFYcTDxPDOZoA
         fdUA==
X-Gm-Message-State: AGi0PuYtVwk+qJCUbj1Z5w6Jy8VPtlnIWazIW6Vxb+w9sc9yuE90vneH
        dSxKCvyda8wImwvFxADFZtyv0jWb
X-Google-Smtp-Source: APiQypKu+tdSQV+QRhuOpBGP+p5rDY4wSW6+LBjHAD210qwvZx/Qt3GE4nOqORvnQAa9Anlz42deug==
X-Received: by 2002:a17:902:c1cb:: with SMTP id c11mr10121511plc.174.1586403807784;
        Wed, 08 Apr 2020 20:43:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q19sm2481600pgt.29.2020.04.08.20.43.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 20:43:26 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Holger=20Hoffst=C3=A4tte?= 
        <holger@applied-asynchrony.com>
Subject: [PATCH] hwmon: (drivetemp) Return -ENODATA for invalid temperatures
Date:   Wed,  8 Apr 2020 20:43:24 -0700
Message-Id: <20200409034324.85415-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Holger Hoffstätte observed that Samsung 850 Pro may return invalid
temperatures for a short period of time after resume. Return -ENODATA
to userspace if this is observed.

Fixes:  5b46903d8bf3 ("hwmon: Driver for disk and solid state drives with temperature sensors")
Reported-by: Holger Hoffstätte <holger@applied-asynchrony.com>
Cc: Holger Hoffstätte <holger@applied-asynchrony.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/drivetemp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 370d0c74eb01..9179460c2d9d 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -264,12 +264,18 @@ static int drivetemp_get_scttemp(struct drivetemp_data *st, u32 attr, long *val)
 		return err;
 	switch (attr) {
 	case hwmon_temp_input:
+		if (!temp_is_valid(buf[SCT_STATUS_TEMP]))
+			return -ENODATA;
 		*val = temp_from_sct(buf[SCT_STATUS_TEMP]);
 		break;
 	case hwmon_temp_lowest:
+		if (!temp_is_valid(buf[SCT_STATUS_TEMP_LOWEST]))
+			return -ENODATA;
 		*val = temp_from_sct(buf[SCT_STATUS_TEMP_LOWEST]);
 		break;
 	case hwmon_temp_highest:
+		if (!temp_is_valid(buf[SCT_STATUS_TEMP_HIGHEST]))
+			return -ENODATA;
 		*val = temp_from_sct(buf[SCT_STATUS_TEMP_HIGHEST]);
 		break;
 	default:
-- 
2.17.1

