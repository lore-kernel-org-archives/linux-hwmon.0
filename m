Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A2FCDB467
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Oct 2023 16:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347013AbjJKQs2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjJKQs0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Oct 2023 12:48:26 -0400
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34ED1AF
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Oct 2023 09:48:25 -0700 (PDT)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
        by cmsmtp with ESMTP
        id qYvAq9z0INWIeqcNkqKbja; Wed, 11 Oct 2023 16:48:25 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id qcNiqvgk6c2SQqcNjqY5cH; Wed, 11 Oct 2023 16:48:24 +0000
X-Authority-Analysis: v=2.4 cv=JIYoDuGb c=1 sm=1 tr=0 ts=6526d1d8
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=J9R/PiKqv2o3jGxbVGXx4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=bhdUkHdE2iEA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8 a=z9z4ehcbrjbCTUJShTAA:9
 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=TAIo/kdxn6phUDZB2owXMXEudIKhpdeNPdldyEZXUdQ=; b=fnUUgScfWTMnbTlMi/AGVQOk8B
        y7LCBUleV38bmd3vFhA9fgoK7ZoAqosYr53RV54DHOJvoGkCs6s0zjqJIAWMRUJ11cJX3kpWB7LTT
        8ao3LyCk8Y1m1nZaW1g25CHc/QDoYgkZRuFz9yo2QzjHIpgrsLwAG69ntKpaYgJ8oEeB9vdqvqEyY
        dGZ3yqKJmyDmjMMKQw/RH87fFDrjfHZ6iKZoHtox2aK/Acy4wHc+/f4AlkQ4gCRBUeV0DKHYEPVHa
        DdsXDx3ZuJezcMGBUOHzCfM+t90+9gH6pvomkJeYzn/CSofEtk/478pWLNFa1ppdH6bhLINZI+3ER
        nvew975g==;
Received: from [103.186.120.251] (port=36530 helo=discovery..)
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96.1)
        (envelope-from <saravanan@linumiz.com>)
        id 1qqcNe-002Xlh-24;
        Wed, 11 Oct 2023 22:18:18 +0530
From:   Saravanan Sekar <saravanan@linumiz.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: [PATCH v4 3/4] hwmon: (pmbus/core) Add helper macro to define single pmbus regulator
Date:   Wed, 11 Oct 2023 22:17:53 +0530
Message-Id: <20231011164754.449399-4-saravanan@linumiz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011164754.449399-1-saravanan@linumiz.com>
References: <20231011164754.449399-1-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 103.186.120.251
X-Source-L: No
X-Exim-ID: 1qqcNe-002Xlh-24
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (discovery..) [103.186.120.251]:36530
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 34
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOP9RNV9QZ9Tjg7EbTh0+2eJjZYJ85jg6sGBzWuH6NSk/8Dd6sTTopW8J0J2dlWkTdrw6urBB8dfQ2heGSWhmMTYSfKfUddYuGzX00OOW4YSUTYviAta
 j5pHrjU8nW9fw5XNFPXnOq/G623eLDWb9UiPCe5yJ5AHkNiLu4hyKKRVIqVkYov+sHI/ZJNQAzrdwaz5Aa29uAR50f3aQlpO5k0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The bindings for single instance regulator should be named with no instance
(e.g., buck not buck0). Introduce a new helper macro to define the single pmbus
regulator.

Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
---
 drivers/hwmon/pmbus/pmbus.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index b0832a4c690d..f4df3d6a41df 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -480,6 +480,21 @@ extern const struct regulator_ops pmbus_regulator_ops;
 
 #define PMBUS_REGULATOR(_name, _id)   PMBUS_REGULATOR_STEP(_name, _id, 0, 0, 0)
 
+#define PMBUS_REGULATOR_STEP_ONE(_name, _voltages, _step, _min_uV)  \
+	{							\
+		.name = (_name),				\
+		.of_match = of_match_ptr(_name),		\
+		.regulators_node = of_match_ptr("regulators"),	\
+		.ops = &pmbus_regulator_ops,			\
+		.type = REGULATOR_VOLTAGE,			\
+		.owner = THIS_MODULE,				\
+		.n_voltages = _voltages,			\
+		.uV_step = _step,				\
+		.min_uV = _min_uV,				\
+	}
+
+#define PMBUS_REGULATOR_ONE(_name)   PMBUS_REGULATOR_STEP_ONE(_name, 0, 0, 0)
+
 /* Function declarations */
 
 void pmbus_clear_cache(struct i2c_client *client);
-- 
2.34.1

