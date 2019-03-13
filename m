Return-Path: <SRS0=yUAk=RQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA215C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 14:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98021214AE
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 14:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfCMOWX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Mar 2019 10:22:23 -0400
Received: from carlosaurelio.net ([54.232.250.16]:38956 "EHLO
        carlosaurelio.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfCMOWW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Mar 2019 10:22:22 -0400
X-Greylist: delayed 653 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Mar 2019 10:22:21 EDT
Date:   Wed, 13 Mar 2019 11:11:26 -0300
From:   Carlos Menin <menin@carlosaurelio.net>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: hwmon: (adc128d818) Specify ti,mode property
 size
Message-ID: <20190313141125.GA26062@carlosaurelio.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

By default, cells in DT are 32-bit in size. The driver reads "ti,mode"
using the function of_property_read_u8() which causes the value to be
read incorrectly in little-endian architectures if the size is not
specified.

Make it explicit in the binding documentation that this prorperty must
be set as a 8-bit value.

Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
---
 Documentation/devicetree/bindings/hwmon/adc128d818.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adc128d818.txt b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
index 08bab0e..d0ae46d 100644
--- a/Documentation/devicetree/bindings/hwmon/adc128d818.txt
+++ b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
@@ -26,7 +26,7 @@ Required node properties:
 
 Optional node properties:
 
- - ti,mode:     Operation mode (see above).
+ - ti,mode:     Operation mode (u8) (see above).
 
 
 Example (operation mode 2):
@@ -34,5 +34,5 @@ Example (operation mode 2):
 	adc128d818@1d {
 		compatible = "ti,adc128d818";
 		reg = <0x1d>;
-		ti,mode = <2>;
+		ti,mode = /bits/ 8 <2>;
 	};
-- 
2.7.4

