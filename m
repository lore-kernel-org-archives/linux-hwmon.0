Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6B1CCA473
	for <linux-hwmon@archiver.kernel.org>; Wed,  6 Jul 2022 10:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbiGFKkd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbiGFKkc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 Jul 2022 06:40:32 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F674275D7;
        Wed,  6 Jul 2022 03:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657104031; x=1688640031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ScH0HeU7dDorXbWy0xDO8TdJE8XEpdrmy8mtvvhWr+w=;
  b=MYzXh/A0VZrqXjvV6G07vCKrHyCLbn5KEZdDUCyVNwSBmTl2LKWi+E/U
   2t7yHmhE7tb632wuPGxxcdti7WcUzOW0hTAGksAfGdr50oO2oHDHmOnKE
   lhTztqkd6xv66GHUsec9cTaC7neeKidgDB1qdeYLxpajjOfWbaIl3oPl+
   OmeH4lPFoP8WnjM90AdTrqnMhqfAEhps/kn9+OigtJxUAhGWzS0s8qBqR
   26gM1fC3BUgqHTT95yXXuQ6FVh/QPBqtO2L/W5JjdtK5ju2OheLMILe9t
   xLikHwrkPwu0z3jmP3WBa1rrY6Wx6NIxUmI8YdyUtc+d4OlMNChD6vPQi
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="263495378"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="263495378"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 03:40:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="597621092"
Received: from gklab-106a-125.igk.intel.com (HELO localhost) ([10.211.106.125])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 03:40:22 -0700
From:   "Kallas, Pawel" <pawel.kallas@intel.com>
To:     linux@roeck-us.net, jdelvare@suse.com, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     iwona.winiarska@intel.com, pawel.kallas@intel.com
Subject: [PATCH 0/3] hwmon: (pmbus) add power from energy readings
Date:   Wed,  6 Jul 2022 12:40:21 +0200
Message-Id: <20220706104024.3118590-1-pawel.kallas@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for reading EIN or EOUT registers and expose power calculated
from energy. This is more accurate than PIN and POUT power readings.
Readings are exposed in new hwmon files power1_average and power2_average.
Also add support for QUERY command that is needed to check availability
of EIN and EOUT reads and its data format. Only direct data format is
supported due to lack of test devices supporting other formats.

Kallas, Pawel (3):
  hwmon: (pmbus) add support for QUERY command
  hwmon: (pmbus) refactor sensor initialization
  hwmon: (pmbus) add EIN and EOUT readings

 Documentation/hwmon/pmbus-core.rst |   7 +
 drivers/hwmon/pmbus/pmbus.c        |  20 +++
 drivers/hwmon/pmbus/pmbus.h        |  19 +++
 drivers/hwmon/pmbus/pmbus_core.c   | 261 +++++++++++++++++++++++++++--
 4 files changed, 291 insertions(+), 16 deletions(-)


base-commit: 7c1de25c06f31b04744beae891baf147af9ba0cb
