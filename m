Return-Path: <SRS0=OFCL=6I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE8FC55191
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Apr 2020 12:32:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 617F021707
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Apr 2020 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587731579;
	bh=nvnmc9IWtdg9lfERc6tpzSUdwZC6kN8jrbfQLWlzrAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=v1wVkWIinvlsIGfuY5NHf5f/podgObFXlPtzxY6ve/7TYawNZBI/wYEYP5oG78R3c
	 kQJ42i/kIKrPh93ROk+Jcw+l/T/gQV8uIMy3el3RLxaxJsNjVvvMK0RnPh3xMu4hvU
	 GjbMrBSAJt3FtJ3cKpRKMjnF1BtMdB583qpAqkF4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgDXMWp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Apr 2020 08:22:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:51892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbgDXMWp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Apr 2020 08:22:45 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D06582084D;
        Fri, 24 Apr 2020 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587730964;
        bh=nvnmc9IWtdg9lfERc6tpzSUdwZC6kN8jrbfQLWlzrAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k8GQxkspDXN7+axftHJEclU4Bfj82tipL2VaT/3/ErdfYrkp8f57DFCj1yvrXcwJj
         iYf2F7sXt9tS20+m44Dx0CLmn1GgGE7RuIEMJcVIoQTXROvZ4uu21v609ZtssUeAdt
         J8YeKovPRuc6WkE0gGpXoCeN6jTqDXpSPTTKjJe0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Holger=20Hoffst=C3=A4tte?= 
        <holger@applied-asynchrony.com>, Sasha Levin <sashal@kernel.org>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 06/38] hwmon: (drivetemp) Return -ENODATA for invalid temperatures
Date:   Fri, 24 Apr 2020 08:22:04 -0400
Message-Id: <20200424122237.9831-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424122237.9831-1-sashal@kernel.org>
References: <20200424122237.9831-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit ed08ebb7124e90a99420bb913d602907d377d03d ]

Holger Hoffstätte observed that Samsung 850 Pro may return invalid
temperatures for a short period of time after resume. Return -ENODATA
to userspace if this is observed.

Fixes:  5b46903d8bf3 ("hwmon: Driver for disk and solid state drives with temperature sensors")
Reported-by: Holger Hoffstätte <holger@applied-asynchrony.com>
Cc: Holger Hoffstätte <holger@applied-asynchrony.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/drivetemp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 370d0c74eb012..9179460c2d9d5 100644
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
2.20.1

