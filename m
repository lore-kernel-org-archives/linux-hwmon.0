Return-Path: <SRS0=55dy=QL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F001EC282CB
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Feb 2019 20:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC8002087C
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 Feb 2019 20:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sweptlaser-com.20150623.gappssmtp.com header.i=@sweptlaser-com.20150623.gappssmtp.com header.b="JIivbSlb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbfBDUTc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 Feb 2019 15:19:32 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:37332 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbfBDUTb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Feb 2019 15:19:31 -0500
Received: by mail-it1-f195.google.com with SMTP id b5so2955384iti.2
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Feb 2019 12:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sweptlaser-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Wde6ywv5CF0puEGzOKeSGxb2sXn9lYuppXAmRLphNEk=;
        b=JIivbSlbp2j/EJ4lWyi9eHg5ZUpbMLDwVOvGctIZGJvvJ8XzHh7LdcyYnz7H+Ag8k1
         DQAqYfC7FwlsOfjzlNtyw1xZUu4L3xn0JxOK/rzJiOKiz68duOudGzngUQcw2YH9RpF4
         L332KkqM07bzhZBUUwng35EvYo/WcegzTPo8AAghxRszniDf5fmxwgTeEzwOI0HzG5sn
         cSm1jzDu7vb/zkjOvBooKXStTm5A7asXbVwwjwOJiWJjZkV2NWhGe67xIAU0HzeBBohS
         HPOwWPcOPYRIzIzakv7sLuZzP+YBeGcKfNWhTrBNwr8elEEyYMvRpP7nd38zWrjCTRUH
         mfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Wde6ywv5CF0puEGzOKeSGxb2sXn9lYuppXAmRLphNEk=;
        b=j558mASVBqhmgnBshop+S9t0MtANelaQHP4bPEavvjyYVt60w43UpDTTv+UhzumTQY
         zO6p1FGZygH7XGXK/QlGYFQZPhd8EXpMepHJIQQpGBK9MCAsGHQohRy/HFknXe+0dVq/
         mcLgcofmjlLiVXn/qgWmVNl+JmSEHkRVuNH5Z3JVvzDRphYcKz/edPchkjv637tkGGn3
         zEVAJa72QGAjc26Au11ZiR3D45Gmh2Wy6XReZKO41uB4amIT5pf69Z9xDZ3pHJcM1L6I
         EICDIzSdg3CZTekerb5SL1gDi/FIgygF247sCLMTXTs3/Z0ItyMci7kBDUWLpAwwL2wA
         Y2+w==
X-Gm-Message-State: AHQUAuZdfMUn/DFSDjKQlsoyu4XEsHgHMsdm2N2yA52aEIyxL80P+oyi
        L8Y61zVLl90jhxxUQE4dDcBXmw==
X-Google-Smtp-Source: AHgI3IZFEfx8auZYTldQHlrfwtdXc3aKOjTgWiYOOmN2SQ6WaM/4XDXaPzI22T9ppFP6Viw9wLwGiw==
X-Received: by 2002:a5e:d503:: with SMTP id e3mr827208iom.291.1549311570756;
        Mon, 04 Feb 2019 12:19:30 -0800 (PST)
Received: from yngvi.hq.sweptlaser.com ([63.147.146.226])
        by smtp.googlemail.com with ESMTPSA id x79sm470003ita.34.2019.02.04.12.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 12:19:30 -0800 (PST)
From:   Jeremy Gebben <jgebben@sweptlaser.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: Add LM96000 as a trivial device
Date:   Mon,  4 Feb 2019 13:19:04 -0700
Message-Id: <20190204201906.8859-3-jgebben@sweptlaser.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190204201906.8859-1-jgebben@sweptlaser.com>
References: <20190204201906.8859-1-jgebben@sweptlaser.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The LM96000 is a temperature sensor and fan controller based
on the LM85.

Signed-off-by: Jeremy Gebben <jgebben@sweptlaser.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index cc64ec63a6ad..d79fb22bde39 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -322,6 +322,8 @@ properties:
           - ti,ads7830
             # Temperature Monitoring and Fan Control
           - ti,amc6821
+            # Temperature sensor with integrated fan control
+          - ti,lm96000
             # I2C Touch-Screen Controller
           - ti,tsc2003
             # Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
-- 
2.17.1

