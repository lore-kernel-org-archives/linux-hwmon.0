Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF38BC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Nov 2021 05:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF5C260F70
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Nov 2021 05:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhKBFax (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Nov 2021 01:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbhKBFav (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Nov 2021 01:30:51 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C122C061767
        for <linux-hwmon@vger.kernel.org>; Mon,  1 Nov 2021 22:28:17 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id f8so14200168plo.12
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Nov 2021 22:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:in-reply-to:references:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=ddY1h2eGYLfbs2x7Sg+P0Vwdzd/3/Mm7kKddSfpI7pQ=;
        b=gwmn2ZjJcnxOyqAnLS8H4wwi8yTOW3eNImQ+znCVvqycgN5fpO0nBU/ELClCz2w75c
         nt5dP4SvmyLw+j1ZN6utGKQ4gRpwYs4Qge0NXIHN6DS07S9lm6/dfHlT1u/Z+cLBuhGm
         Ng2nd9GUOvFB3KjHKMzmfv06ORLplk8rNtiFzv58MG03HtFKYuCIvOoqQWtERFM8yZMn
         c/0xBn5/9BFCWtLny7NWaiUqqxCg3d+cZMf/lQ8qqYljXOejtmtV5kUsMt/1km/zucB4
         zYGj3bSpjSk4ubiD+tqImcLKnjPIEcnRAZ7Z4uheKMxdu4ftg3VqJLUcOIYThJs//3Uf
         QleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
         :cc:subject:content-transfer-encoding:mime-version;
        bh=ddY1h2eGYLfbs2x7Sg+P0Vwdzd/3/Mm7kKddSfpI7pQ=;
        b=vHTWNrKr+mgrgscIfiI4MFdq8Kxb5B7HvtnTrUGcG+TsG6ZQawIUUOeoFV23Qr53pH
         yJPcYD3ZW9OPBf8Rs6yaYs5tNiADX71+1M6O0n3o1dMA4gR8UjiwktPMmPL9whOu8keK
         Ldbgvdi0abLW00jS1JClCvBnz76kTt9YkXiwPyAJ7tT835lh6SifJBjZp6GgYZMvq1DU
         wqHPyGjYgf9eKLqdg+zQkQNyRW5r7RZdyWv3pFkV8XdRRiIvEdCvDnewdiL3b3PBe/fd
         6AHQ0O7pgCBgLXIf2RTCzSitZpcIlNv/a4h0cKef9JvB5HwCqJMu5JwYdtMpSM0gnKhV
         dMKg==
X-Gm-Message-State: AOAM530BDClmg5mbp10+ouv0WeyxGhtDYg1cphQeWi7bq8t/vXWPzPly
        zH3r31+EXn+II35sXDwyYPhMVw==
X-Google-Smtp-Source: ABdhPJyzQyW2vVc977ENPz6lzXGwxknQqwgLYJJ8BApXSW9HGT7quZVgRxyGTVFmvNMsz6VR1dnIAw==
X-Received: by 2002:a17:902:758c:b0:141:4c99:22b3 with SMTP id j12-20020a170902758c00b001414c9922b3mr29400168pll.40.1635830896759;
        Mon, 01 Nov 2021 22:28:16 -0700 (PDT)
Received: from [127.0.1.1] (117-20-69-24.751445.bne.nbn.aussiebb.net. [117.20.69.24])
        by smtp.gmail.com with UTF8SMTPSA id x9sm14344439pga.28.2021.11.01.22.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 22:28:16 -0700 (PDT)
Date:   Tue, 02 Nov 2021 05:27:54 +0000
Message-Id: <20211102052754.817220-1-nathan@nathanrossi.com>
In-Reply-To: <20211102052754.817220-0-nathan@nathanrossi.com>
References: <20211102052754.817220-0-nathan@nathanrossi.com>
From:   Nathan Rossi <nathan@nathanrossi.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nathan Rossi <nathan@nathanrossi.com>,
        Nathan Rossi <nathan.rossi@digi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: hwmon: ti,ina2xx: Document ti,ina238
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Nathan Rossi <nathan.rossi@digi.com>

Document the compatible string for the Texas Instruments INA238, this
device is a variant of the existing INA2xx devices and has the same
device tree bindings (shunt resistor).

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 6f0443322a..180573f26c 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -26,6 +26,7 @@ properties:
       - ti,ina226
       - ti,ina230
       - ti,ina231
+      - ti,ina238
 
   reg:
     maxItems: 1
---
2.33.0
