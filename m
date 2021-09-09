Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEA5C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 17:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 502FE61131
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 17:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241324AbhIIRbN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 9 Sep 2021 13:31:13 -0400
Received: from mga04.intel.com ([192.55.52.120]:64361 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232940AbhIIRbI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 9 Sep 2021 13:31:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="218998188"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; 
   d="scan'208";a="218998188"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 10:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; 
   d="scan'208";a="694269375"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2021 10:29:56 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mONrt-0003Nn-Le; Thu, 09 Sep 2021 17:29:45 +0000
Date:   Fri, 10 Sep 2021 01:29:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     kbuild-all@lists.01.org, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH] hwmon: tmp421_probe_child_from_dt() can be static
Message-ID: <20210909172909.GA2471@f5e5cebfff48>
References: <22639314543a98b4c24e55b7e5a803325ad9e568.1631021349.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22639314543a98b4c24e55b7e5a803325ad9e568.1631021349.git.krzysztof.adamski@nokia.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

drivers/hwmon/tmp421.c:295:6: warning: symbol 'tmp421_probe_child_from_dt' was not declared. Should it be static?
drivers/hwmon/tmp421.c:319:6: warning: symbol 'tmp421_probe_from_dt' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 tmp421.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index a1dba1d405ee8..5f1f3ec9f51c1 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -292,7 +292,7 @@ static int tmp421_detect(struct i2c_client *client,
 	return 0;
 }
 
-void tmp421_probe_child_from_dt(struct i2c_client *client,
+static void tmp421_probe_child_from_dt(struct i2c_client *client,
 				struct device_node *child,
 				struct tmp421_data *data)
 
@@ -316,7 +316,7 @@ void tmp421_probe_child_from_dt(struct i2c_client *client,
 
 }
 
-void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
+static void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
 {
 	struct device *dev = &client->dev;
 	const struct device_node *np = dev->of_node;
