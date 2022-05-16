Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0300EC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 May 2022 19:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345911AbiEPTnj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 May 2022 15:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346081AbiEPTmu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 May 2022 15:42:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522FA3F88E;
        Mon, 16 May 2022 12:41:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E30DD61510;
        Mon, 16 May 2022 19:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD60C34100;
        Mon, 16 May 2022 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652730082;
        bh=cAb6iKZxKeujnO0Osi+5GaP0dphhqEkPS32XNa6ZaxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BF3MT4EjxBMJrUN4Lg8+AMOnQseFQRGiIJWQOmrby+9tRNlP0su/LMIRAHaAWT8yR
         D04r5Y9M1pzzDACzckoiDnHsEbndgQB3qw6ZHrJPUhx2Jxhh9XARvJHn0woE38rCj0
         3lxmsde9UT5CGcz2D3TWJkxC/ezYsDLmpVnZLTvw=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Florian Eckert <fe@dev.tdt.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.19 07/32] hwmon: (ltq-cputemp) restrict it to SOC_XWAY
Date:   Mon, 16 May 2022 21:36:21 +0200
Message-Id: <20220516193614.995667923@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516193614.773450018@linuxfoundation.org>
References: <20220516193614.773450018@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 151d6dcbed836270c6c240932da66f147950cbdb ]

Building with SENSORS_LTQ_CPUTEMP=y with SOC_FALCON=y causes build
errors since FALCON does not support the same features as XWAY.

Change this symbol to depend on SOC_XWAY since that provides the
necessary interfaces.

Repairs these build errors:

../drivers/hwmon/ltq-cputemp.c: In function 'ltq_cputemp_enable':
../drivers/hwmon/ltq-cputemp.c:23:9: error: implicit declaration of function 'ltq_cgu_w32'; did you mean 'ltq_ebu_w32'? [-Werror=implicit-function-declaration]
   23 |         ltq_cgu_w32(ltq_cgu_r32(CGU_GPHY1_CR) | CGU_TEMP_PD, CGU_GPHY1_CR);
../drivers/hwmon/ltq-cputemp.c:23:21: error: implicit declaration of function 'ltq_cgu_r32'; did you mean 'ltq_ebu_r32'? [-Werror=implicit-function-declaration]
   23 |         ltq_cgu_w32(ltq_cgu_r32(CGU_GPHY1_CR) | CGU_TEMP_PD, CGU_GPHY1_CR);
../drivers/hwmon/ltq-cputemp.c: In function 'ltq_cputemp_probe':
../drivers/hwmon/ltq-cputemp.c:92:31: error: 'SOC_TYPE_VR9_2' undeclared (first use in this function)
   92 |         if (ltq_soc_type() != SOC_TYPE_VR9_2)

Fixes: 7074d0a92758 ("hwmon: (ltq-cputemp) add cpu temp sensor driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Florian Eckert <fe@dev.tdt.de>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Link: https://lore.kernel.org/r/20220509234740.26841-1-rdunlap@infradead.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index c7adaca2ab01..d150d0cab1b6 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -791,7 +791,7 @@ config SENSORS_LTC4261
 
 config SENSORS_LTQ_CPUTEMP
 	bool "Lantiq cpu temperature sensor driver"
-	depends on LANTIQ
+	depends on SOC_XWAY
 	help
 	  If you say yes here you get support for the temperature
 	  sensor inside your CPU.
-- 
2.35.1



