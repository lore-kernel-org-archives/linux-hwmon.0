Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645E9C77B6F
	for <linux-hwmon@archiver.kernel.org>; Thu,  6 Apr 2023 20:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239959AbjDFUdi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239471AbjDFUdE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Apr 2023 16:33:04 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9898FB472
        for <linux-hwmon@vger.kernel.org>; Thu,  6 Apr 2023 13:32:12 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id cw23so4218020ejb.12
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Apr 2023 13:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VbBbLUbmYsB9ePpFHrMBDx88zoFjkZCXjdqcN0U5ek=;
        b=ZE1rxTOK1djFdNdrAhKpMrSEtLAvEiqF1wfNoSQfGz2WRdCnsAec1pqTEs7Aeh4Daz
         5hMt5SrvsdLX1fAyDf3lUt/+DfA9sjmR1d6QUjOBHKTVqNJPqrMp57Py4g66QZVmqeot
         KjrJ7q6eSgPe5k3qHOEXUOTE/1iZa3ULlbig9d57u2pyy7daZ5VYQdBbFWxWpOUnbRJ7
         VDlhFQInYWSZkQVNdTVB0VEtF7bx8Smb/GBymNgr+1QwqAW1u2jioBmcY7dQwFG9DQWS
         KjxVxjzNpMK/Eiwab5e+aRjsnXlglhvGPIdfnZzRxi8UA0fKEFgmHR1Gx/fsJATlPfMN
         QwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VbBbLUbmYsB9ePpFHrMBDx88zoFjkZCXjdqcN0U5ek=;
        b=1lxjCm3gTLQJvHBriU+6ylEqFmmu8/cUeB9oAqZWLXusDJsX5/y6BmNrSnza7kvDmD
         CAcyy1hKKv9uBmqBIn1dP2OOBMwDEU/wfPZc2AClIobvuasG0wCh9mW3xsEQ4XUy+6gx
         x7RvzJ+NBFhVWAmeG8Rll/YlZHk6XnnWaHaAqs40l6Yw5DGPnA8eWXIfJ5wKImAg8bro
         BYtxTBPacmPGeJz71eOKgLkxUVHx4g7wwJL2QDxs6i9ZZnEW/oRESm1zQKVwg8wH3Xpi
         0cyWShw7W3NPktktwgG4nf3NLB6V3ZiJ8qMYSmT8DsTwUY4gt+gxKC4js/4L7+7l8f5K
         4BVg==
X-Gm-Message-State: AAQBX9d+unHGACS+WntNYz9pGuf77xifcGf1HulrhNdbtbmAqmnHMILK
        9taxa+rlAerfqsqHCCJOaviEwQ==
X-Google-Smtp-Source: AKy350bFQoFbQgZJrlPh/DTc3IetAgrPSG6bX2Fm1fMb/g+BV9MwE0u2UuNjXkxdQKCAQMcL/H/nCQ==
X-Received: by 2002:a17:907:5ce:b0:931:20fd:3d09 with SMTP id wg14-20020a17090705ce00b0093120fd3d09mr7427601ejb.17.1680813130437;
        Thu, 06 Apr 2023 13:32:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oded Gabbay <ogabbay@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonas Malaco <jonas@protocubo.io>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        Derek John Clark <derekjohn.clark@gmail.com>,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Walle <michael@walle.cc>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Agathe Porte <agathe.porte@nokia.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 24/68] hwmon: k8temp: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:19 +0200
Message-Id: <20230406203103.3011503-25-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/k8temp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/k8temp.c b/drivers/hwmon/k8temp.c
index f73bd4eceb28..2b80ac410cd1 100644
--- a/drivers/hwmon/k8temp.c
+++ b/drivers/hwmon/k8temp.c
@@ -118,7 +118,7 @@ static const struct hwmon_ops k8temp_ops = {
 	.read = k8temp_read,
 };
 
-static const struct hwmon_channel_info *k8temp_info[] = {
+static const struct hwmon_channel_info * const k8temp_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 		HWMON_T_INPUT, HWMON_T_INPUT, HWMON_T_INPUT, HWMON_T_INPUT),
 	NULL
-- 
2.34.1

