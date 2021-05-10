Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEC8C43461
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 22:16:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E34861585
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 22:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhEJWRQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 18:17:16 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:47897 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231703AbhEJWRP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 18:17:15 -0400
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1620684965;
        bh=tmd75ZOW6XvpkM9I6xisCmps5GGhTVJmqNjaZubGTz0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pST0XYgb5fkH4HawCsCCKbfZ+5ZztakV4Kx5q1H2LHZp8CtJOVl9u8n95K5fO4Yb4
         V3xRQJXdBQqO/8SL0otAIziG7tzOBzDtHlzAqu7pkDPw7yGC/512CrOc5KOluWT8hm
         UrPwoCktEnTNiXaC/mLYDIni88cHZeoG46BjDUnw=
To:     platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: gigabyte-wmi: add support for B550 Aorus Elite
Date:   Tue, 11 May 2021 00:15:45 +0200
Message-Id: <20210510221545.412522-3-linux@weissschuh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510221545.412522-2-linux@weissschuh.net>
References: <20210510221545.412522-1-linux@weissschuh.net>
 <20210510221545.412522-2-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Reported as working here:
https://github.com/t-8ch/linux-gigabyte-wmi-driver/issues/1#issuecomment-837210304

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/gigabyte-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 7af6c24151e2..5529d7b0abea 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -140,6 +140,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
 	}}
 
 static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 GAMING X V2"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
-- 
2.31.1

