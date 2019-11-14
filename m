Return-Path: <SRS0=o4ty=ZG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C441EC432C3
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 15:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98B80206D5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 15:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+xBAAGL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfKNPka (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Nov 2019 10:40:30 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38562 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfKNPka (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Nov 2019 10:40:30 -0500
Received: by mail-pg1-f196.google.com with SMTP id 15so4016353pgh.5
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Nov 2019 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=A4NRqu6zws6KkURROJRW0VATYcbC+KyB15HofBr/wys=;
        b=Y+xBAAGLX4WygKle40zc9ZmYpP48uqkXfFsE3p3vX/ywPsUla/8sB1BaYNo1ZxTbGt
         nIvGuyfhyGo/w1cATKx8o41Yaar6VTqC7RcIXH2WG8v7u9tOy/1bSO3mn7hYgMmPa0ID
         IMU3EqNn2j9UFzhKOgaUAlTOXQb2dvHtcw9Jox6r7Oeqel+EfaBvPgJFWhYHzoadzm9q
         WrHuDpO6xq59fMI36z6p+OeUuwsXE9FPsybeoS4jEguFuoFBNe/I1+mBVpkge6CD+P5b
         TMZi4DjXXL1DGnrQgM2lXldbLabujcXPVqemoWBA06UfsIZiasGMb3f1cvXSs+IfLLtT
         flGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=A4NRqu6zws6KkURROJRW0VATYcbC+KyB15HofBr/wys=;
        b=P3tHckkQ1UgqW8qlsomRvlC4m/SSbHLxJkjMI+kTECWBOQiOPqKXRksZe2iqlrUhDo
         M39FBVUBBpAtwcnSJjiNg5v0LC231IlmHpIGprwoyluRPIKWSqwCadaptEW2GH1MoUvy
         cx+ETGd/ofb/CsJzsN9pmnqA2thg1wsMxYHreN5NHJvuFudz6Ti5DmghEk0J+BxX9fDm
         43I3ou1LznEmkC/WRZFLkLuIZW2VEMXd1tD3gRRChAH3gvssr4n0E8cYrBW408pPY0Ke
         e/hlWt1XSazPX+qBMJ4To03QPEdwfzDDaKClqThIPNfX/Te1VAAjM2iz/X8UFdHg1mld
         1OFQ==
X-Gm-Message-State: APjAAAWXHFc0SXrsvBMfAPfq1erd1F2IO8D4DTIwq3+pC3dlWVXMv6OD
        QOeaC+AUJlM6KWWVWluODms=
X-Google-Smtp-Source: APXvYqyjMMrRI9rys1iq0eE3cRa4eB7Uqinv0HfWx/0amoG24FlMaaEFRRuyl2cas81/MlDXOoAx0g==
X-Received: by 2002:a63:e412:: with SMTP id a18mr10693717pgi.241.1573746029551;
        Thu, 14 Nov 2019 07:40:29 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id 206sm11490858pfu.45.2019.11.14.07.40.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 14 Nov 2019 07:40:28 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/2] nvme: hwmon: add quirk to avoid changing temperature threshold
Date:   Fri, 15 Nov 2019 00:40:01 +0900
Message-Id: <1573746001-20979-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds a new quirk NVME_QUIRK_NO_TEMP_THRESH_CHANGE to avoid changing
the value of the temperature threshold feature for specific devices that
show undesirable behavior.

Guenter reported:

"On my Intel NVME drive (SSDPEKKW512G7), writing any minimum limit on the
Composite temperature sensor results in a temperature warning, and that
warning is sticky until I reset the controller.

It doesn't seem to matter which temperature I write; writing -273000 has
the same result."

The Intel NVMe has the latest firmware version installed, so this isn't
a problem that was ever fixed.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Cc: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/nvme/host/nvme-hwmon.c | 6 +++++-
 drivers/nvme/host/nvme.h       | 5 +++++
 drivers/nvme/host/pci.c        | 3 ++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/nvme-hwmon.c b/drivers/nvme/host/nvme-hwmon.c
index 97a84b4..a5af21f 100644
--- a/drivers/nvme/host/nvme-hwmon.c
+++ b/drivers/nvme/host/nvme-hwmon.c
@@ -170,8 +170,12 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
 	case hwmon_temp_max:
 	case hwmon_temp_min:
 		if ((!channel && data->ctrl->wctemp) ||
-		    (channel && data->log.temp_sensor[channel - 1]))
+		    (channel && data->log.temp_sensor[channel - 1])) {
+			if (data->ctrl->quirks &
+			    NVME_QUIRK_NO_TEMP_THRESH_CHANGE)
+				return 0444;
 			return 0644;
+		}
 		break;
 	case hwmon_temp_alarm:
 		if (!channel)
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 000a3d9..19e5e87 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -115,6 +115,11 @@ enum nvme_quirks {
 	 * Prevent tag overlap between queues
 	 */
 	NVME_QUIRK_SHARED_TAGS                  = (1 << 13),
+
+	/*
+	 * Don't change the value of the temperature threshold feature
+	 */
+	NVME_QUIRK_NO_TEMP_THRESH_CHANGE	= (1 << 14),
 };
 
 /*
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 931d4a9..2c0206b 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3529,7 +3529,8 @@ static const struct pci_device_id nvme_id_table[] = {
 				NVME_QUIRK_DEALLOCATE_ZEROES, },
 	{ PCI_VDEVICE(INTEL, 0xf1a5),	/* Intel 600P/P3100 */
 		.driver_data = NVME_QUIRK_NO_DEEPEST_PS |
-				NVME_QUIRK_MEDIUM_PRIO_SQ },
+				NVME_QUIRK_MEDIUM_PRIO_SQ |
+				NVME_QUIRK_NO_TEMP_THRESH_CHANGE },
 	{ PCI_VDEVICE(INTEL, 0xf1a6),	/* Intel 760p/Pro 7600p */
 		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN, },
 	{ PCI_VDEVICE(INTEL, 0x5845),	/* Qemu emulated controller */
-- 
2.7.4

