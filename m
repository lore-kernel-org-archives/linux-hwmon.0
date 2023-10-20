Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3DBC25B41
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 Oct 2023 08:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376546AbjJTIsY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 Oct 2023 04:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376541AbjJTIsS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 Oct 2023 04:48:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C313D46;
        Fri, 20 Oct 2023 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697791696; x=1729327696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rSipyHhM4gYIUQSn5eaLq9kVKKAAb0HFtJJ9r0gwffo=;
  b=Dipm04idYkMzuxfKEQvNTRUbQWb2ofdTihZCQQj2sc6TfyIXHrgtj07j
   niId35sdlDZojEhH7IIj6anL8A5+17T1e0sEgCUF5qNhnhKi3zMwIteTz
   Iajuxz2WXrCqx/xLvXl8lEYikhG6R5eBb2YvjTMz8pXtqukDo6HwwTseJ
   CZRmJr58cLmyW9tLGosDD25+YhqSZVyIozYeO8G6VJJ/sIkxzHM3QcFUu
   KLLGXVO9v2laRFdNkTAIHec9rFcj/7bRCnVRKtI+2Iyc6MmB81pQ93vOD
   onaDFmBgBtlNSQOUdMU14QfYM+mezRiTjSL5disOSBKjztHHRTk9NlVBE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="450683586"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="450683586"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 01:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="873832186"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="873832186"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2023 01:48:11 -0700
From:   Raag Jadav <raag.jadav@intel.com>
To:     rafael@kernel.org, len.brown@intel.com, robert.moore@intel.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mark.rutland@arm.com, will@kernel.org, linux@roeck-us.net
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, bala.senthil@intel.com,
        Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 6/8] perf: qcom: use acpi_device_uid() for fetching _UID
Date:   Fri, 20 Oct 2023 14:17:30 +0530
Message-Id: <20231020084732.17130-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231020084732.17130-1-raag.jadav@intel.com>
References: <20231020084732.17130-1-raag.jadav@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert manual _UID references to use standard ACPI helpers.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/perf/qcom_l3_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 2887edb4eb0b..f16783d03db7 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -742,8 +742,8 @@ static int qcom_l3_cache_pmu_probe(struct platform_device *pdev)
 
 	l3pmu = devm_kzalloc(&pdev->dev, sizeof(*l3pmu), GFP_KERNEL);
 	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "l3cache_%s_%s",
-		      acpi_dev_parent(acpi_dev)->pnp.unique_id,
-		      acpi_dev->pnp.unique_id);
+		      acpi_device_uid(acpi_dev_parent(acpi_dev)),
+		      acpi_device_uid(acpi_dev));
 	if (!l3pmu || !name)
 		return -ENOMEM;
 
-- 
2.17.1

