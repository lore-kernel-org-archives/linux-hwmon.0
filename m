Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32551C07545
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Oct 2023 06:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjJXGVT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Oct 2023 02:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbjJXGVN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2023 02:21:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B788210C0;
        Mon, 23 Oct 2023 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698128463; x=1729664463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iUljf5QPUJwxYR0tI8SM3GVeSDgYpl24Lk1AfcVvgFI=;
  b=mqNVFclkGcPzcV4lkF2hf6BzlkrKodmpjy49USEBu6N2S7P02mpveLee
   hNB9bRSIg1gwgKFip6Fq31YpDPCiE4gtQeoMZYZjosBNK4HwQ7ADXiOs5
   m7nBtYHgkzk0vLfd/966Ce0yhcTHYd7f1F2ihET5AhoO/N5LG/awiEWwL
   pSck4m2yBOqLW91oJ4+6XROnjM02vLSX0FtPbPdEwICO3/+88XnJG67YS
   JH0iWvIPvTzqwS9xvN+F7vLzzguj+ONiPjWj1Ea82BSG2H+mdIY1OQjGf
   /6lfvPqyZLp3U7Xb8sZoPwRtkjzGZ4UDP3q4rSpMlkcRYvhfHSERajGhQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="386806606"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="386806606"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 23:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="751891457"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="751891457"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by orsmga007.jf.intel.com with ESMTP; 23 Oct 2023 23:20:57 -0700
From:   Raag Jadav <raag.jadav@intel.com>
To:     rafael@kernel.org, len.brown@intel.com, robert.moore@intel.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mark.rutland@arm.com, will@kernel.org, linux@roeck-us.net,
        Jonathan.Cameron@Huawei.com
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, bala.senthil@intel.com,
        Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 5/6] hwmon: nct6775: use acpi_dev_hid_uid_match() for matching _HID and _UID
Date:   Tue, 24 Oct 2023 11:50:17 +0530
Message-Id: <20231024062018.23839-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231024062018.23839-1-raag.jadav@intel.com>
References: <20231024062018.23839-1-raag.jadav@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert manual _UID references to use the standard ACPI helper.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/hwmon/nct6775-platform.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 81bf03dad6bb..0adeeab7ee03 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1465,10 +1465,8 @@ static const char * const asus_msi_boards[] = {
 static int nct6775_asuswmi_device_match(struct device *dev, void *data)
 {
 	struct acpi_device *adev = to_acpi_device(dev);
-	const char *uid = acpi_device_uid(adev);
-	const char *hid = acpi_device_hid(adev);
 
-	if (hid && !strcmp(hid, ASUSWMI_DEVICE_HID) && uid && !strcmp(uid, data)) {
+	if (acpi_dev_hid_uid_match(adev, ASUSWMI_DEVICE_HID, data)) {
 		asus_acpi_dev = adev;
 		return 1;
 	}
-- 
2.17.1

