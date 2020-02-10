Return-Path: <SRS0=RJFc=36=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E66DC35254
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Feb 2020 17:53:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38E3E20715
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Feb 2020 17:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnUpdt72"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgBJRxW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Feb 2020 12:53:22 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53247 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgBJRxV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Feb 2020 12:53:21 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep11so71382pjb.2
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2020 09:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lf31ICTmd2LpndciqHkqNl0VJnwnAxJz9CPkLCZhl3k=;
        b=gnUpdt72wBdsDAHp7ElrGxUsYtnPr95vfaWl1h+gZzzNMSZf4RZ4LC6xdwBKmmJMaQ
         5UVovjb4cVemXiexkjmFcffMDJQcOH4Bv1WWfddJ82LBfej3Ea6NXMUc8QdGrsuXPO7X
         I/fgyR8kkHJtSSsmv0YdvqMYrLA5FgFOuTYwf3wvky72tyPPG+RKP2ydwUML1JtPgavd
         ry98qZNUZGUu9jF3hg9uzJDUZ6DA6l53FbL2nZrDpBOK1kcFbN1uYzbK16H+Qi/wsoIA
         fvXKk9/T1JzK/vTENlabZ5pXORpYXYGxRUnG9Zaky92ZHZZ6sXequ1o8bBE3u+vXP/lX
         cZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=lf31ICTmd2LpndciqHkqNl0VJnwnAxJz9CPkLCZhl3k=;
        b=jWUnEaX2zJyefC9CEWRKDR0pMwLzsiOnu5nqnicCZVTduZAF8VglsTK+BXFOcwULjY
         AVd62kpU0geCLYUGjos/J69xF3H/NDdtEIFEh+TLJxUXHQomVn9KaiZdWYJQD1XHzA44
         tD+j4JRgfPn1EXXY/UURJgBUAC5mz5sVOz6Ktt8FNtzIwegYDcWDGdbNRnyqFNNSZY6D
         adoIvwqfK6w7Bas9mqPOuAynrYgcDtIVdmBoRSgxiGVSwWsRyypIz/0hOQldOER5OIja
         m4DSPXVS3XGQyvaCOYrpOly568RMOtyUoeDoqQf4ZTLsbt+kNeYO7OG6KvtGv+f5A1qW
         mOqA==
X-Gm-Message-State: APjAAAVQ7GvyroQZCeQ6l2skH+csJ6bDY0F8NQwErbGrUD/sZJfS2gtp
        bQWddKAEk3oe4uAvu+EnhX+Q3ufp
X-Google-Smtp-Source: APXvYqyIjtsHGN/4tqPFVhDzW7KGBENFEjxOc0I7DOTDqFXaMrqwfhbNpen07q7+Mt3p7mBFZKLcuw==
X-Received: by 2002:a17:902:8d8d:: with SMTP id v13mr14112623plo.260.1581357201061;
        Mon, 10 Feb 2020 09:53:21 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q25sm1111159pfg.41.2020.02.10.09.53.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 09:53:20 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/3] hwmon: (k10temp) Update driver documentation
Date:   Mon, 10 Feb 2020 09:53:14 -0800
Message-Id: <20200210175314.32643-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210175314.32643-1-linux@roeck-us.net>
References: <20200210175314.32643-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document temperature, voltage, and current sensors available with
Family 17h and later CPUs.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/k10temp.rst | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.rst
index 4451d59b9425..8557e26281c3 100644
--- a/Documentation/hwmon/k10temp.rst
+++ b/Documentation/hwmon/k10temp.rst
@@ -100,9 +100,10 @@ socket type, not the processor's actual capabilities.  Therefore, if you
 are using an AM3 processor on an AM2+ mainboard, you can safely use the
 "force=1" parameter.
 
-There is one temperature measurement value, available as temp1_input in
-sysfs. It is measured in degrees Celsius with a resolution of 1/8th degree.
-Please note that it is defined as a relative value; to quote the AMD manual::
+For CPUs older than Family 17h, there is one temperature measurement value,
+available as temp1_input in sysfs. It is measured in degrees Celsius with a
+resolution of 1/8th degree.  Please note that it is defined as a relative
+value; to quote the AMD manual::
 
   Tctl is the processor temperature control value, used by the platform to
   control cooling systems. Tctl is a non-physical temperature on an
@@ -126,3 +127,25 @@ it.
 
 Models from 17h family report relative temperature, the driver aims to
 compensate and report the real temperature.
+
+On Family 17h and Family 18h CPUs, additional temperature sensors may report
+Core Complex Die (CCD) temperatures. Up to 8 such temperatures are reported
+as temp{3..10}_input, labeled Tccd{1..8}. Actual support depends on the CPU
+variant.
+
+Various Family 17h and 18h CPUs report voltage and current telemetry
+information. The following attributes may be reported.
+
+Attribute	Label	Description
+===============	=======	================
+in0_input	Vcore	Core voltage
+in1_input	Vsoc	SoC voltage
+curr1_input	Icore	Core current
+curr2_input	Isoc	SoC current
+===============	=======	================
+
+Current values are raw (unscaled) as reported by the CPU. Core current is
+reported as multiples of 1A / LSB. SoC is reported as multiples of 0.25A
+/ LSB. The real current is board specific. Reported currents should be seen
+as rough guidance, and should be scaled using sensors3.conf as appropriate
+for a given board.
-- 
2.17.1

