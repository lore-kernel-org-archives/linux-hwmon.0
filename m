Return-Path: <SRS0=sw0Y=ZV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937E7C432C0
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Nov 2019 17:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59AD12158A
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Nov 2019 17:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWgRql//"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfK2RyO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Nov 2019 12:54:14 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45356 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK2RyN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Nov 2019 12:54:13 -0500
Received: by mail-ot1-f66.google.com with SMTP id r24so25464823otk.12
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Nov 2019 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:resent-from:resent-date:resent-message-id:resent-to
         :envelope-to:delivery-date:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :user-agent:content-id:content-transfer-encoding:mime-version;
        bh=o6jTf7K2b5VYgoB7BgVTe2gW1u286BnuUXjcCIVkAc4=;
        b=bWgRql//G79usmj8d1eYsp2BviNWVCh72Kzo9KvxAmfTd8k5BExOaHiz3vwbedwJCD
         yYENMzYZSCLTxGyQUcBpbcc7FJDRuSU3Re7opH5sgALkN/fs66KGpBL6K6VuFze2H8GA
         +sxh9ULMzDvKZODwEM4+JD1krKprlDnZDw+EB8QdJ/Xbu4Fplyie1+JAlRi0DvPbrLfl
         DwRUak6/dkGDm+wAELfxfqPPpAPgntoWGeKQKOGnTfZOYoy/GBgSjSOWjQl23n7kK0wR
         IU+oa68Wu2CvBlFcGwfAKxcB3VkI0ZoAJe7HQ9/aYZ3H6P3qeOy4WyVd9c1hzw0CO3Yx
         hwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:resent-from:resent-date:resent-message-id
         :resent-to:envelope-to:delivery-date:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :user-agent:content-id:content-transfer-encoding:mime-version;
        bh=o6jTf7K2b5VYgoB7BgVTe2gW1u286BnuUXjcCIVkAc4=;
        b=LclDPK/GM9CUJ9Vsr+jlCjKjHtFRniq9Ctc7lw8aR9JioJhXnRNZKYqlnM5r9nm100
         qJ0u81SFxhg00s1X47UUomYYJCOBgwzT7WwQ1WY1Mg2kYyhdJRlVBnQsRkRBtv6nf3pT
         NFmOw202W/GyK85EkhEXe3I3KDBWfqZgD17QDWRC6cUxI94u6t16Z9X8Oh7xarospJPn
         DnDPLoxgJTA5FOtRuZ/yw1qfolDRt9sp122MuOCBXXhpgDmMub8gUUnoYjGbXkKydrvZ
         tlCnSrd3XOHcLIxiBlt+ISwo8onRb2qH6yEBMJZU31luhbfc2t2AcufxBVhez+8TEjrL
         OutA==
X-Gm-Message-State: APjAAAXoGw3byVgG527CgJTIrZ76dgWpC1sbdlZGE4dlowRq8Uz0QoNd
        FRfeX+j62LWKxAFiqMGKaOEPSuRu
X-Google-Smtp-Source: APXvYqx51M9Fjto8TewI5s1a0vVb2ch6uv4xEtoTGO/PtxIWaLJjMmS+j2ffrwQEMw9wNLldBUX+zw==
X-Received: by 2002:a9d:5543:: with SMTP id h3mr12086326oti.33.1575050052540;
        Fri, 29 Nov 2019 09:54:12 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l3sm2770621oie.6.2019.11.29.09.54.11
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 09:54:11 -0800 (PST)
Received: from bh-25.webhostbox.net
        by bh-25.webhostbox.net with LMTP
        id 4Eq/ECP14F0x5wkAh82d6A
        (envelope-from <gilles.buloz@kontron.com>)
        for <linux@roeck-us.net>; Fri, 29 Nov 2019 10:38:27 +0000
Envelope-to: linux@roeck-us.net
Delivery-date: Fri, 29 Nov 2019 10:38:27 +0000
Received: from skedge04.snt-world.com ([91.208.41.69]:33624)
        by bh-25.webhostbox.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <gilles.buloz@kontron.com>)
        id 1iadfH-00380F-KF
        for linux@roeck-us.net; Fri, 29 Nov 2019 10:38:27 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge04.snt-world.com (Postfix) with ESMTPS id 1FD4567A075
        for <linux@roeck-us.net>; Fri, 29 Nov 2019 11:38:03 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 29 Nov
 2019 11:38:02 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Fri, 29 Nov 2019 11:38:02 +0100
From:   Gilles Buloz <Gilles.Buloz@kontron.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     Gilles Buloz <Gilles.Buloz@kontron.com>
Subject: [PATCH 1/2] hwmon: (nct7802) Fix voltage limits to wrong registers
Thread-Topic: [PATCH 1/2] hwmon: (nct7802) Fix voltage limits to wrong
 registers
Thread-Index: AQHVpqETZxldW7Z9bkSlKT2rifv8pA==
Date:   Fri, 29 Nov 2019 10:38:02 +0000
Message-ID: <5de0f509.rc0oEvPOMjbfPW1w%gilles.buloz@kontron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Heirloom mailx 12.4 7/29/08
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="us-ascii"
Content-ID: <14C586CF40B25D478169C2903432E6AB@snt-world.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 1FD4567A075.AB5FF
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: gilles.buloz@kontron.com
X-SnT-MailScanner-To: linux@roeck-us.net
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Gilles Buloz <gilles.buloz@kontron.com>
Date: Wed, 27 Nov 2019 18:09:34 +0100
Subject: [PATCH 1/2] hwmon: (nct7802) Fix voltage limits to wrong registers

in0 thresholds are written to the in2 thresholds registers
in2 thresholds to in3 thresholds
in3 thresholds to in4 thresholds
in4 thresholds to in0 thresholds

Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>
---
 drivers/hwmon/nct7802.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index f3dd2a17bd42..7915c2f2c85d 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -23,8 +23,8 @@
 static const u8 REG_VOLTAGE[5] =3D { 0x09, 0x0a, 0x0c, 0x0d, 0x0e };
=20
 static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] =3D {
-	{ 0x40, 0x00, 0x42, 0x44, 0x46 },
-	{ 0x3f, 0x00, 0x41, 0x43, 0x45 },
+	{ 0x46, 0x00, 0x40, 0x42, 0x44 },
+	{ 0x45, 0x00, 0x3f, 0x41, 0x43 },
 };
=20
 static const u8 REG_VOLTAGE_LIMIT_MSB[5] =3D { 0x48, 0x00, 0x47, 0x47, 0x4=
8 };
--=20
2.17.1
