Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B662CC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Feb 2022 09:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiBRJHE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Feb 2022 04:07:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbiBRJHD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Feb 2022 04:07:03 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217945C678;
        Fri, 18 Feb 2022 01:06:46 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w3so14294989edu.8;
        Fri, 18 Feb 2022 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6TCCegS6DBXINxSypqdh55uTuN1cU4u7+gYHLdDW5rs=;
        b=IsX18i6RNGKHsRzhSZ8kBQYz2FZbkJ9J7+ECdRJcHUiWeNF3uPSt9/0fAGWiePoRAD
         O0XSLkUuRVizODHz3JTKc4EionY6tKvTLRtRtk2PwJBIlOj8W7k0ZstK2o1S3tFXkTML
         RvPkvUk9tj/hPAhOVeUf4WgXvzzimxDIjOYsQ/5e9D3X4lqaoCvfX8VIBIEybRAZqt6o
         0kSVHgLJKpbKnpheuB1ntxKcecnFmMrg1yuaMZh635uelpGeZqkDfKn2JGhOSEMCE2Lb
         9rRcT+ebKLdDKIJXsUbETp3iIfSiGH/mwmkQfKoMwuc7ZGfSO3B9fK17vkFMpPG26pes
         YFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6TCCegS6DBXINxSypqdh55uTuN1cU4u7+gYHLdDW5rs=;
        b=BtfLOLH8o1jEyYKMZi2O1AHEALdqXdL1qDbnN4B7nuwR28M7wgeY2UVq3k4lvgTRRm
         +zvcC4rfB4pMTCMk7V1o9WJdzQdX3jNjlOgoC/Vo1vupkpOtLY7bDfNDO+DJcwGB94fu
         76RlkAzpfWSMnpLY9j3tjwB80n4lOaBJVvsBy8/1V/rMhCturI1higPEROyD7Qx/S8Ln
         sa0ueyQhq8GRdmHzyKovzQEMSsPhkaXzMZmz8ktM/RV4qIGi6HwFyMTmm+mZuXJ95QeO
         IILuUfN0NgX4zOokTISuzXjTJOk/+kAM9TmjtzA2mPt7HL1gPh7/goJktFaCyGOA2BLG
         P7hw==
X-Gm-Message-State: AOAM530BP0Wbd9GAoFqnocAugYJX4TT81RCqLyBijcjDZf8jOkjucCKx
        znmGkaf0kI+vQR7ObEGScQdwBTOGl0Y=
X-Google-Smtp-Source: ABdhPJzIseeTxo4p0eVp+Ij7DuKT9J6uMeQ968V8B8E1KXw79zMWuaoEagi8NpRI5ahRq5Xs3Nz2Ow==
X-Received: by 2002:a05:6402:90b:b0:412:a7cc:f5f9 with SMTP id g11-20020a056402090b00b00412a7ccf5f9mr6131536edz.136.1645175204669;
        Fri, 18 Feb 2022 01:06:44 -0800 (PST)
Received: from debian64.daheim (p5b0d7a77.dip0.t-ipconnect.de. [91.13.122.119])
        by smtp.gmail.com with ESMTPSA id p12sm1508841edc.49.2022.02.18.01.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 01:06:43 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nKzDv-0004LL-Aw;
        Fri, 18 Feb 2022 10:06:43 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: Add ti,tmp125 temperature sensor binding
Date:   Fri, 18 Feb 2022 10:06:42 +0100
Message-Id: <d3538ba9beededfe3a9ad5dab4903a6a01834822.1645175187.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From the freely available Texas Instruments' TMP125 datasheet:

"The TMP125 is an SPI-compatible temperature sensor available in the
tiny SOT23-6 package. Requiring no external components, the TMP125
is capable of measuring temperatures within 2 degree C of accuracy
over a temperature range of −25 degree C to +85 degree C and
2.5 degree C of accuracy over −40 degree C to +125 degree C."

The TMP125 is very similar to the TMP121/TMP122 series of familiar
chips.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 091792ba993e..09b98bf97c8d 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -337,6 +337,7 @@ properties:
             # Thermometer with SPI interface
           - ti,tmp121
           - ti,tmp122
+          - ti,tmp125
             # Digital Temperature Sensor
           - ti,tmp275
             # TI DC-DC converter on PMBus
-- 
2.35.1

