Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1C1C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Jan 2021 11:02:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D57B7224B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Jan 2021 11:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbhAMLBa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Jan 2021 06:01:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:38842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727590AbhAMLBH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jan 2021 06:01:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0796423437;
        Wed, 13 Jan 2021 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610535570;
        bh=QfzvMzWg5qOkA/HiaGiWoihWdPsl/amJYX6v3VVMZUg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LllTYk596kMrop0hbx/mFFpAyPbmHJ0istbffTZcVIvmX9nHRcRmIDN5cLGNIk1rn
         sjqTb9XNxoh4JdTtGA+POdkqYkbbBjWY5vwz1CD4JyUIalQbRYA1+B/8G0PapABo7/
         U/Q0XGUu1v1mf0e7o8Za0zqFPRF3XMNHN+HBaZaQHFCv3zyolOvFIbWDTzqnh4XkZS
         nHmS0LzeDpOA6LOsXF9ROrlFxFUrjmsSqubM6mu4boyLwhVd7msyrOLm2kmyR7X4Cr
         RV3O2HO2eoFae7obdmbTJhvT3HzLzbAOq65dMMKxYDd+sT5zUGrwG4boieKUiJ71jg
         he5zkuGm2L2dw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzds7-00DpGZ-L7; Wed, 13 Jan 2021 11:59:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 16/24] Documentation/hwmon/ina2xx.rst: update ti,ina2xx.yaml reference
Date:   Wed, 13 Jan 2021 11:59:17 +0100
Message-Id: <886bd248721b146d844d46e26ddd4cd277f51446.1610535350.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Changeset 94f1ab944565 ("dt-bindings: hwmon: convert TI INA2xx bindings to dt-schema")
renamed: Documentation/devicetree/bindings/hwmon/ina2xx.txt
to: Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/hwmon/ina2xx.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
index f78a5cd44c4c..27d2e39bc8ac 100644
--- a/Documentation/hwmon/ina2xx.rst
+++ b/Documentation/hwmon/ina2xx.rst
@@ -74,7 +74,7 @@ bus supply voltage.
 
 The shunt value in micro-ohms can be set via platform data or device tree at
 compile-time or via the shunt_resistor attribute in sysfs at run-time. Please
-refer to the Documentation/devicetree/bindings/hwmon/ina2xx.txt for bindings
+refer to the Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for bindings
 if the device tree is used.
 
 Additionally ina226 supports update_interval attribute as described in
-- 
2.29.2

