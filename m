Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09929EB64DA
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 13:51:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbjGNNvn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235699AbjGNNvj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 09:51:39 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD98435AA
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:32 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-991da766865so261171166b.0
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689342691; x=1691934691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urifUudkEPyq2FzlaT1w1iDQxgnQEtIqwDDZrLy2t8E=;
        b=HoaYNMUc+3aRJuYOwNmUedlSGEpUBUGY6lxQ/zMGvOj9K2wQntSgnZkBPOSKVBU3n9
         JOvML0jRSQx9AFX+U5PqI7PKiQSTaXK1lU7Dy/gIxiq58+VImnTu2PfOsBg5IpZI7VsK
         q3ulnWZAbSdgguL2WOpDHUaXFDAJj0wjLYErKrHkU/vRdKd/ZCqrP0XfIsws61YnV9Vx
         xGpfr7pSgCyoguvUWuGLjnubcw/zm1ifpg/0MFj7sMwdRoA/yO5g2essZAU7CA/VYFIl
         8RzBub+t/S83+3GlRVYB1TLsoYZhmkHzYSA2vZs3sz4JGC2q3tg1JgEoPyaV+cs//2g1
         pYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342691; x=1691934691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urifUudkEPyq2FzlaT1w1iDQxgnQEtIqwDDZrLy2t8E=;
        b=ernhfE5LVxFEdhmf/10++5pguqpyFzhODsW2yq/A7/HI9qUQ2FzStGNqzN0BMnyzWs
         rohjabn0Wpo4zHf/zIpnlQl4koJUh0tsuG1cMdPWkFgD9osU4VHU9SOr0DGQhYsR36GU
         +o9OlTPN+G5IIskJnuEYQkzP6U2vJoizU+I4dI63lOYs+FWGd1X00PJ1QtDznQIkDI0L
         AQDUsP+ytIXCVG+TQ20yptSBazOPYp65+2hAALorRdPw/MuALlGXIndxoQsHqPgGXxHE
         ogSMBZWI1kBm9eEogCXyADmRVx97PQpQGsZivI9kPo0tclmofClfoq6B05EbgFWp2i48
         QD+Q==
X-Gm-Message-State: ABy/qLZFJkonFlVihz0+y2vOUJE2N0yTYcIC0ipNCd4NdTgcN4FroBRS
        0Es/Upd03P5UFTiK06HFH9nPgQ==
X-Google-Smtp-Source: APBJJlGAmr0/UJAC8kytY2+fUeQfkDE7VGTOGWyv7yqIHO7IS3vrc7CDFjtiUckxYVrj8UVqqkr0DA==
X-Received: by 2002:a17:906:57c7:b0:991:fef4:bb7 with SMTP id u7-20020a17090657c700b00991fef40bb7mr3750894ejr.73.1689342691040;
        Fri, 14 Jul 2023 06:51:31 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h21-20020a170906261500b0099236e3f270sm5405991ejc.58.2023.07.14.06.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:51:30 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/8] dt-bindings: trivial-devices: Add MPS MP2971 and MP2973
Date:   Fri, 14 Jul 2023 15:51:10 +0200
Message-ID: <20230714135124.2645339-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
References: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add Monolithic Power Systems MP2971 & MP2973 to trivial devices.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 246863a9bc7e..f639618508a9 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -119,6 +119,10 @@ properties:
           - fsl,mpr121
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
+            # Monolithic Power Systems Inc. multi-phase controller mp2971
+          - mps,mp2971
+            # Monolithic Power Systems Inc. multi-phase controller mp2973
+          - mps,mp2973
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
-- 
2.41.0

