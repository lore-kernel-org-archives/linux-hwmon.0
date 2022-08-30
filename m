Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C20C0502C
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Aug 2022 19:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiH3TWl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Aug 2022 15:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbiH3TWf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Aug 2022 15:22:35 -0400
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D141279EC6;
        Tue, 30 Aug 2022 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661887354; x=1693423354;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4emJdCv2xuSuLRmEmSsy8bbTKz8TFWCnyVKKSowhnVE=;
  b=Bt9/240H16IvUss0OibHMDbjLLmfN/UXk6gQrK8jMrt6NNWmGshitXsi
   RwpZqL2ZNZeYl3rT/fB65XoH3TVPRbtahq9ZJqtpMPQrK0aHPt3+co/BL
   UceTKESmvXJ8XuKZk2AY16cN4rzawyW4GQ0lCESFFbO3fo0BYYod7kM3A
   U=;
X-IronPort-AV: E=Sophos;i="5.93,275,1654560000"; 
   d="scan'208";a="125055804"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-87b71607.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 19:22:18 +0000
Received: from EX13MTAUWA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1a-87b71607.us-east-1.amazon.com (Postfix) with ESMTPS id 7160314109C;
        Tue, 30 Aug 2022 19:22:15 +0000 (UTC)
Received: from EX19D013UWA004.ant.amazon.com (10.13.138.207) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 30 Aug 2022 19:22:14 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX19D013UWA004.ant.amazon.com (10.13.138.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Tue, 30 Aug 2022 19:22:13 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Tue, 30 Aug 2022 19:22:13
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id 5BA6A4D50; Tue, 30 Aug 2022 19:22:12 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <rtanwar@maxlinear.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <talel@amazon.com>, <hhhawa@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <ronenk@amazon.com>,
        <itamark@amazon.com>, <shellykz@amazon.com>, <shorer@amazon.com>,
        <amitlavi@amazon.com>, <almogbs@amazon.com>, <dkl@amazon.com>,
        <rahul.tanwar@linux.intel.com>, <andriy.shevchenko@intel.com>
Subject: [PATCH v3 00/19] Variety of fixes and new features for mr75203 driver
Date:   Tue, 30 Aug 2022 19:21:53 +0000
Message-ID: <20220830192212.28570-1-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

List of fixes:
 - Fix "intel,vm-map" property to be optional.
 - Fix VM sensor allocation when "intel,vm-map" not defined.
 - Fix multi-channel voltage reading.
 - Fix voltage equation for negative source input.
 - Modify the temperature equation according to series 5 datasheet.
 - Fix coding style issue.

List of new features:
- Modify "reset" property to be optional.
- Add optional "moortec,vm-active-channels" property to define the number
  of active channels per VM.
- Add support for mr76006 pre-scaler to multiply the voltage result by 2.
- Add support for series 6 temperature equation.
- Add coefficient properties to fine tune the temperature equation.
- Add debugfs to read and write temperature coefficients

---------

Changes between v2 and v3:
*) Add "moortec" prefix to all new device-tree properties.
*) Change order of patches.
*) Add explanations to better understand the changes.
*) Change "reset" property to be optional and remove the
  "reset-control-skip" property.
*) Split the patch for "fix multi-channel voltage reading" to two
   patches.
*) Change pre-scaler property format and fix typo (scalar --> scaler).
*) Fix voltage equation to support negative values instead of limiting
   value to zero.
*) Temperature equation - protect from overflow and add clamping.
*) Add new "moortec,ts-series" property to select between temperature
   equation of series 5 or series 6.

Changes between v1 and v2:
 *) Fix compilation error for patch 08/16:
    "warning: ISO C90 forbids variable length array"

---------

Eliav Farber (19):
  dt-bindings: hwmon: (mr75203) update "intel,vm-map" property to be
    optional
  hwmon: (mr75203) fix VM sensor allocation when "intel,vm-map" not
    defined
  hwmon: (mr75203) update pvt->v_num to the actual number of used
    sensors
  dt-bindings: hwmon: (mr75203) change "reset" property to be optional
  hwmon: (mr75203) skip reset-control deassert for SOCs that don't
    support it
  hwmon: (mr75203) fix multi-channel voltage reading
  hwmon: (mr75203) enable polling for all VM channels
  dt-bindings: hwmon: (mr75203) add "moortec,vm-active-channels"
    property
  hwmon: (mr75203) add VM active channel support
  dt-bindings: hwmon: (mr75203) add "moortec,vm-pre-scaler" property
  hwmon: (mr75203) add VM pre-scaler support
  hwmon: (mr75203) fix voltage equation for negative source input
  hwmon: (mr75203) modify the temperature equation according to series 5
    datasheet
  dt-bindings: hwmon: (mr75203) add "moortec,ts-series" property
  hwmon: (mr75203) add support for series 6 temperature equation
  dt-bindings: hwmon: (mr75203) add coefficient properties for the
    thermal equation
  hwmon: (mr75203) parse temperature coefficients from device-tree
  hwmon: (mr75203) add debugfs to read and write temperature
    coefficients
  hwmon: (mr75203) fix coding style space errors

 .../bindings/hwmon/moortec,mr75203.yaml       |  67 ++-
 drivers/hwmon/mr75203.c                       | 568 ++++++++++++++++--
 2 files changed, 569 insertions(+), 66 deletions(-)

-- 
2.37.1

