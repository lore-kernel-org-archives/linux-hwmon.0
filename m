Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B08C4332B
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Jan 2021 13:59:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 095F222CAE
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Jan 2021 13:59:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387985AbhAKN7Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Jan 2021 08:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731292AbhAKN6k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Jan 2021 08:58:40 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D74CC0617A9
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Jan 2021 05:57:21 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id h16so18881743edt.7
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Jan 2021 05:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=05WhkcTFmBsr9whzq7N+CgKfu1Y8Nmz6LAwOiQkDfTI=;
        b=G3FlCdMjHDQKo4Fz17V1HFMjNMe0yhV20SwGuoyn/sN+dulQeXXYvNcQVzTdyGiN2k
         IJRGxpINn6xPGTF4227OfkMbNfWZC9/63wDRWvXbMuG822oc3kXK1lbhzcE0E8aq5SBi
         6d33VmLo2aqVKMEmn6YTHs/Go4s7HNfQDgtkN+sEErizfnF6PURrLNACnbRWYL/soHjO
         yklPhJSESqzWeVDo+UV4JqEqyzJlZrerCJ/Gh8SwGuhS3Qs9US0q85aNYiVmBvQm1Xxh
         Le6y0CjLzpBL3eMthzC5ioZWLszjStq3Z0KZDt2hW384vF6a9tQXhWQw8gEc7R7di9fw
         AA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=05WhkcTFmBsr9whzq7N+CgKfu1Y8Nmz6LAwOiQkDfTI=;
        b=VkitYXpfOkmaFOETjadN/2fNNQOHd7pxgg12wdHAPqGjYmjqqalqQ68r8U+61chnSd
         sj5/f0855BvUP38kyNNgXxo0dz5fr+W7xPxmbIo1ZMUzgDBGlKldJHakcpCUh63iZMsw
         J/hg4qi6Toa1ZM8dM7B+Z9jp2DwfP2/AJx9dizlTgwmt4CASKI7WFrXxPnyDewLiIXPB
         BiLwZfk2WvB+c2MDqFLm3xvayzrbTKvpq8X4jSqmtvRkg9eSCB/+RP4Gkrmb3VdSExqF
         GuX2WQg2cJJIzf5kfVAkC/pbILCT4vA0k4x5nnbQhGa/DVII1LODAi4Qo8RIo9K3kB4K
         PtZQ==
X-Gm-Message-State: AOAM532iYjadb5qbbRuQkLAljp97bHIm8Dc9upZVRbJLXxDjS06OQGVF
        uQhFQhQrTnTNjo6VCCitpnEyBw==
X-Google-Smtp-Source: ABdhPJxn3AWBZlrTAtOHn2pyFbV5zfR59Ms52ZaEkkfdw0/J4RQmgY1hSYy4TtW6q2V7RQoVpVp7UA==
X-Received: by 2002:a05:6402:a52:: with SMTP id bt18mr14445544edb.228.1610373439924;
        Mon, 11 Jan 2021 05:57:19 -0800 (PST)
Received: from localhost.localdomain (dh207-97-248.xnet.hr. [88.207.97.248])
        by smtp.googlemail.com with ESMTPSA id ak17sm7176408ejc.103.2021.01.11.05.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:57:19 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v4 3/3] MAINTAINERS: Add entry for Texas Instruments TPS23861 PoE PSE
Date:   Mon, 11 Jan 2021 14:57:08 +0100
Message-Id: <20210111135708.3703175-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111135708.3703175-1-robert.marko@sartura.hr>
References: <20210111135708.3703175-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add maintainers entry for the Texas Instruments TPS23861 PoE PSE driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes in v4:
* Add documentation file

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1feabab03fb2..527db97c42ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17607,6 +17607,15 @@ F:	include/dt-bindings/soc/ti,sci_pm_domain.h
 F:	include/linux/soc/ti/ti_sci_inta_msi.h
 F:	include/linux/soc/ti/ti_sci_protocol.h
 
+TEXAS INSTRUMENTS TPS23861 PoE PSE DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
+F:	Documentation/hwmon/tps23861.rst
+F:	drivers/hwmon/tps23861.c
+
 THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
-- 
2.29.2

