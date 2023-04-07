Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1585EC77B61
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Apr 2023 15:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbjDGPCY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Apr 2023 11:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237519AbjDGPCE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Apr 2023 11:02:04 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792D0BBA3
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Apr 2023 08:01:19 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-93071f06a9dso178378666b.2
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Apr 2023 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680879676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39vQ5gfFEdag3ZfqeTZIAWiuaWeqb2c0HNkG3ClYWpw=;
        b=ksERjhycDKQAuwDwtPkgWSU1R8hcqdRLBNMuhaNyJK3lh46gjTFEzTdI9saV1G2hXA
         5+qi4lVcXCGhpFSQ6hcoJYxD2BBY2EvTZiqC2pl7BCzs2NgmAoqX/fJmmdKA8Nsv4gYq
         t9CLoUy0npQNXrMpH0eetfOT9il3aqxnUaGdn/IxKalOlQCt1FOXXCv4CAJKe3xFbbfM
         wz5u6qbqVH6uLPOBsbKztHpE7Os8WhXpLLaAzoPxKIKw8QfXpSJMZ9aaslLr1kOaKX3C
         TwY0ZS5zAdVDT/JUbMhMLQdPjQvYnC/19m/SrLrwAaqsK9iBHsx6tGeIlgpfRx9D2Wah
         RuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680879676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39vQ5gfFEdag3ZfqeTZIAWiuaWeqb2c0HNkG3ClYWpw=;
        b=2uYZpwvns4XD3eXVlvQVeDUs1+goLB5hyYuTrCC1CArkmUtSmQvHK+Jg7GS25Hy6aP
         loT7kBLvESq+fihzhrIhWtAT2L5olhWcNNpYcKXFbttIfCv/QiXer9FA7i22lAqyXq2Q
         2SFKCh0ATJMyqnkvhc6P9Zuabc8aztJVWTqvvf8+21Zit0DZhzqahyAnBUJr45WNckJX
         SuHKKZVbxMB3+GIt/UDBDroFxyWHhxX5u24sO2JEngHLiIbJciRX5Dgb8HdtmAVsaPxi
         H1jiSBx2IKKSZUA6ZV7tbLPMz6lsjbrApir3HqL5lF/6+cdMOP1+im0XBV+ZXsWZz93F
         e+Yg==
X-Gm-Message-State: AAQBX9cib2i73NVpjFLmszpFbh8LSGebk7UHMyHdtTkdWmiRt1Dbh6TH
        04riP6BU0c9QdXTREAA2FOr3rw==
X-Google-Smtp-Source: AKy350YHYCzgcXu8cuDPFMJXa/kNUhvsl8ezu/D0XT6Lt2JFP2aho/r6qFHfjSrwzgfBYlsv2FGDhA==
X-Received: by 2002:aa7:c74e:0:b0:4bf:c590:3c57 with SMTP id c14-20020aa7c74e000000b004bfc5903c57mr2884380eds.2.1680879676457;
        Fri, 07 Apr 2023 08:01:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id f6-20020a50d546000000b00501d39f1d2dsm2000231edj.41.2023.04.07.08.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 08:01:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
        Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] fpga: dfl-fme: constify pointers to hwmon_channel_info
Date:   Fri,  7 Apr 2023 17:01:12 +0200
Message-Id: <20230407150112.79854-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This depends on hwmon core patch:
https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/

Therefore I propose this should also go via hwmon tree.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/fpga/dfl-fme-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/dfl-fme-main.c b/drivers/fpga/dfl-fme-main.c
index 77ea04d4edbe..bcb5d34b3b82 100644
--- a/drivers/fpga/dfl-fme-main.c
+++ b/drivers/fpga/dfl-fme-main.c
@@ -265,7 +265,7 @@ static const struct hwmon_ops thermal_hwmon_ops = {
 	.read = thermal_hwmon_read,
 };
 
-static const struct hwmon_channel_info *thermal_hwmon_info[] = {
+static const struct hwmon_channel_info * const thermal_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_EMERGENCY |
 				 HWMON_T_MAX   | HWMON_T_MAX_ALARM |
 				 HWMON_T_CRIT  | HWMON_T_CRIT_ALARM),
@@ -465,7 +465,7 @@ static const struct hwmon_ops power_hwmon_ops = {
 	.write = power_hwmon_write,
 };
 
-static const struct hwmon_channel_info *power_hwmon_info[] = {
+static const struct hwmon_channel_info * const power_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT |
 				  HWMON_P_MAX   | HWMON_P_MAX_ALARM |
 				  HWMON_P_CRIT  | HWMON_P_CRIT_ALARM),
-- 
2.34.1

