Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08B4C25B08
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Aug 2022 05:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238673AbiHQFoD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 17 Aug 2022 01:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238640AbiHQFnx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Aug 2022 01:43:53 -0400
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com [207.171.190.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659047C193;
        Tue, 16 Aug 2022 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1660715023; x=1692251023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hL47Mt4NCN4uw7YbFIII+nlUX4qr86MJ2L/tI0qq6tE=;
  b=TP3TzdOkzw1CGhrp92nvqv74WwNtrlgxKW+AXMGfazZFjZKb4FhMxfOy
   abF7gNexm2gbbdB9zufu+dqEQAxSDp0xr0ECzS5mkL8AZRUw+XiAu/Sme
   ERic/RE5+x/zDUxak/3uUBhX/q0lMjo0wIUAAha8yAzSlFr+qWBJCQVrb
   M=;
X-IronPort-AV: E=Sophos;i="5.93,242,1654560000"; 
   d="scan'208";a="218561708"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-41c1ef8b.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 05:43:26 +0000
Received: from EX13MTAUEE001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1e-41c1ef8b.us-east-1.amazon.com (Postfix) with ESMTPS id 418A4162673;
        Wed, 17 Aug 2022 05:43:22 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE001.ant.amazon.com (10.43.62.226) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Wed, 17 Aug 2022 05:43:22 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Wed, 17 Aug 2022 05:43:22 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Wed, 17 Aug 2022 05:43:22
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id 86CA54C67; Wed, 17 Aug 2022 05:43:21 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <talel@amazon.com>, <hhhawa@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <ronenk@amazon.com>,
        <itamark@amazon.com>, <shellykz@amazon.com>, <shorer@amazon.com>,
        <amitlavi@amazon.com>, <almogbs@amazon.com>, <dwmw@amazon.co.uk>,
        <rtanwar@maxlinear.com>
Subject: [PATCH v2 09/16] hwmon: (mr75203) add VM pre-scalar property for Moortec PVT controller
Date:   Wed, 17 Aug 2022 05:43:14 +0000
Message-ID: <20220817054321.6519-10-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817054321.6519-1-farbere@amazon.com>
References: <20220817054321.6519-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

vm-pre-scalar-ch# is a per channel optional parameter that can be
used to normalzie the voltage output results.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 .../devicetree/bindings/hwmon/moortec,mr75203.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
index 6111b5069b3c..e2a55001eefc 100644
--- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
+++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
@@ -56,6 +56,12 @@ properties:
       A value of 0 means that the entire VM sensor is nou used.
     $ref: /schemas/types.yaml#definitions/uint8-array
 
+  vm-pre-scalar-ch#:
+    description:
+      vm-active-channels defines the pre-scalar per channel value
+      used to normalzie the voltage output results.
+    $ref: /schemas/types.yaml#definitions/uint32
+
 required:
   - compatible
   - reg
@@ -68,6 +74,7 @@ additionalProperties:
   - intel,vm-map
   - reset-control-skip
   - vm-active-channels
+  - vm-pre-scalar-ch#
 
 examples:
   - |
@@ -82,5 +89,6 @@ examples:
         clocks = <&osc0>;
         resets = <&rcu0 0x40 7>;
         vm-active-channels = [08 10 02];
+        vm-pre-scalar-ch5 = <2>;
         #thermal-sensor-cells = <1>;
     };
-- 
2.37.1

