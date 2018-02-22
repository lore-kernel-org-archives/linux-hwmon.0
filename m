Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:31082 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751217AbeBVHCI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Feb 2018 02:02:08 -0500
Date: Thu, 22 Feb 2018 15:01:11 +0800
From: kbuild test robot <lkp@intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: kbuild-all@01.org, joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
        gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
        benh@kernel.crashing.org, andrew@lunn.ch,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [RFC PATCH] drivers/peci: peci_match_id() can be static
Message-ID: <20180222070111.GA22310@lkp-ne02>
References: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


Fixes: 99f5d2b99ecd ("drivers/peci: Add support for PECI bus driver core")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 peci-core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/peci/peci-core.c b/drivers/peci/peci-core.c
index d976c73..4709b8c 100644
--- a/drivers/peci/peci-core.c
+++ b/drivers/peci/peci-core.c
@@ -770,8 +770,8 @@ peci_of_match_device(const struct of_device_id *matches,
 }
 #endif
 
-const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
-					   struct peci_client *client)
+static const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
+						  struct peci_client *client)
 {
 	if (!(id && client))
 		return NULL;
