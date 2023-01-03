Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B493C53210
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Jan 2023 06:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236815AbjACGv5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 01:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236776AbjACGv4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 01:51:56 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D49AD2DF
        for <linux-hwmon@vger.kernel.org>; Mon,  2 Jan 2023 22:51:55 -0800 (PST)
IronPort-SDR: bdha5dCWZbevROJXZkyb/+PReRMFxRHUGLk2JHOjL7ov1RrJ692SkLUrQo7PrmjcGAW6vLQAkC
 kzv196p6RU0xmcSjmM6C2LuUD/UZ2UZqmpD/25rkM2LM8uzKl94NFhtUTAF2/ik88ELcJfXfvB
 GeoGpyT1mqQgBwJx3picnGn46Wqi6Yrijs7Vfw2MTZiAEvhOp/rt/b0ErSqXMPGxGC8lieOah/
 JWkVw14+2WD7obb0Cw79+naxjAz0kjo75GL74jqizAdMtnKnx4ttzOWRZ3kHUbl8nnjqWaj0lR
 7YCxMbyGBXGlZnQIvg9nmkVw
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2CqBgAozrNjjPQc8jxaHgEBCxIMSYE7C4Itgl+1Jw8BD?=
 =?us-ascii?q?wEBRAQBAYUFAoURJjcGDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgQUA?=
 =?us-ascii?q?QEBAUBSBwtSBwtYBweBQQuBYRMLAzENhlcCAQMyAQ0BATcBDxk4VwYBEoJ+g?=
 =?us-ascii?q?yOzVIEBgggBAQaCYppmgV4JgUABi1+BEoM3ekM/gU6CUYIsiwKMMoxoCoE9f?=
 =?us-ascii?q?YEnDkxXAwkDBwVJQAMLGA0WMgoTLTULDEsrGhsHgQoqKBUDBAQDAgYTAyACD?=
 =?us-ascii?q?SgxFAQpEw0nJmsJAgMiYQUDAwQoLQlAByYmPAdWNwUDAg8fNwYDCQMCHxI/c?=
 =?us-ascii?q?S8SEgUDCxUqRwQINgUGHDYSAggPEg8sQw5CNzYTBlwBKgsOEwNQRxlvBIIMC?=
 =?us-ascii?q?gYpKJ0OgQ7GAoN4gVCedkyBRKdgLZcZIKMNhCgCCgcWgXiBf00fGYMiTwECA?=
 =?us-ascii?q?QEBDQECAQEDAQIBAQEJAQEBAY4dDA0JggqMOGE7AgcLAQEDCYwjAQE?=
IronPort-PHdr: A9a23:mhu9BB+REDFRgP9uWBXoyV9kXcBvk7/1IhVT4YAulLxJaKjl8pH/e
 k3To/xw3xfAR46O7fVChqLNtrz4H3YN5JGdvTUDaMlCWxNf25oflgByDJLaWR+ifqzhZXViT
 s9JDAANwg==
IronPort-Data: A9a23:RKidb6J5mKYGx5GUFE+R5pMlxSXFcZb7ZxGr2PjKsXjdYENS1D0Cn
 zQfUT+BOvyPamT0fdl3bong9B5U7ZbTytNjHABkqy0xQXwR9ZXJDt/IIxn5Niqfd8aZQhpq5
 ZlEYNXOfOk5HyTWzvuPGuGx9SMmiclkZVZd5MrsYH0ZqdpMEX954f5bs7dlxNYu27BVOivV0
 T/Ii5S31GKNglaYDEpEs8pvlzs31BjCkGtwUosWOJinFHeH/5UkJMp3yZOZdhMUcaEIdgKOf
 Nsv+Znilo/vE7bBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XOdJEAXq7hQllkPh9l
 ctRsZmsED10O46Lk+4gazZoKBhXaPguFL/veRBTsOSZzlHdNXD2yupgC1s6e4Ad56B2DSdH6
 JT0KhhTNlbZ27jwmuL9ELUw7iggBJCD0Ic3tGtpyzLxBuwvXp7EWamM6NpFmjY8wMlTdRrbT
 5ZCOGQxNk6dOnWjPH9KJJg/uNWvqUXHaidIqBWFhLQuszPMmVkZPL/Fa4KOKobQFK25hH2wo
 mPA4nS8Ag4fM9q31zWI6DSvi/XJkCe9X5gdfJW89/h3kHWJwWEYC1gLTh29rOXRokyyVtZBI
 lYZ0jEztqV0/0uuJuQRRDXm+Dve4kRZAYoVSbFmrhqRw7bV6ECFHmcFCDVGbZovqafaWADGy
 HeFws31ATlz6YfITFHa/b2plRyCAhE8eDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsjETMW+uq
 9xthHZl74j/nfLnxI3+pguX3GvwznTdZldov1+PBjzNAhZROdbNWmC+1bTMxd99RGpzZmKQs
 H4JiqByB8hUVcnV/MBhaMMAA/mS4OuZMHXjiFpiBPEcG9mFpSbmJ9wKpWsuYR01boAfZTb1Y
 USVpRte5dlYO37sZLIfj2ON5yYCkfSI+TfNDKu8gj9yjn9ZLlHvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF0nH5umTmJGM+gk3xLNIZyglbLF9/p13PQNYgEAF+s+1y9H
 yt3bZTRkE4PCIUSnAGLrd5IfTjm0kTX9bit85cHLLTSSuaXMH05BLfQx68sYYpog8xoehTgo
 BmAtrtj4AOn3xX6xfCiNigLhEXHAc8h8RrW/EUEYT6V5pTUSdz3s/5PKcpmLehPGS4K5accc
 sTpsv6oWpxnIgkrMRxHBXUkhIA9JhmtmyyUOC+pPGo2c5J6Hlyb8cXtYQXo7iVIAy+q88oy5
 bS9j1uJTZ0GTgVkLcDXdPP2kQzp5CNDxLotUhuaOMRXdWXt7JNudX77gMg3FMdQex/N8STLh
 Q+ZDCARqfTJv4JoosLCgrqJrtn1HuYnRhhaEmDX4KyYLy7f+mb/k4ZMXPzRLWLWTmrr9qK4a
 aNYyuy6MfFBlUsT69hwFLNizKQf4drzpuYEkVw9RyuXNwumU+oyLGOH0M9Dsrx26oVY4QbmC
 FiS/tR6OKmSPJ23GlAmJD0jMraJ28YLy2vb4vkCKUnn4DN6oeicWkJIMhjS1CFQIecnMI4hx
 ut96sca5xbl0UggM8qdyCtO/nuCKWYMFagiq9cbDMnil1NzmF1FZJXdDA7w4Y2OMosTahBxf
 GPM26eS1a5BwkficmYoESaf1+RqhaMI5EJAwmgddgaAldfyj/Mq2AFcrGYsRQNPwxQZj+9+Z
 jpxO0tuKfnc9jtknpMZDT70XlsdXljDqgmrlwdPj3HQU0ijEHDVI2x7MuGIukkEqjoOcj9e9
 bCe6WDkTTezIp6ph3BsBRY6pqyxV8F1+y3DhNujQ5aPEa48MGjsjaKZbGYVrwfqXJEqj0rdq
 Og0oOt9ZMUX78LLT3HX1mVC6YktdQ==
IronPort-HdrOrdr: A9a23:aE4tj6ndtQm3v/+eBMPmSmP5CbTpDfL23DAbv31ZSRFFG/Fw9/
 rFoB3U737JYVEqKQgdcbLpAsS9qBbnmaKdjrNhXotKMDOIhILsFvAH0WKA+UyHJ8SBzJ8+6U
 4IScEXY+EYT2IK6voSizPZLz9P+re6GC/Ev5an854Ud3AOV0h51XYENu+EKDwKeOCYP+tDKH
 JMjvA33QadRQ==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 03 Jan 2023 17:16:47 +1030
Received: from agc.com.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3036kRlM2641329
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 3 Jan 2023 17:46:43 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3036kRlM2641329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1672728403; bh=4DBT79tjq1WVgv31x2pF9ZqTgnXCWwcLh3AzKWs39sU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TfTUbZnCILFesHV+hSJCaQJ17a9iCWV6OZvW2GsNKM7AacyQxoe0DUjL4OkZs1dk5
         IHt9bQrMRLMlm2PjW+ax+BUhZF5UtP6Z0izab6ffBs0ySbsTJSDC/KMv8eOkv37u3T
         xriyGEWBBlaRGOHYkK5/sbvGZDmLSw5rCogO7bua48frNjppPC1NFs7Vbg1YdrJFwM
         F6dg1F5Vzl396yIxvyZrwuDwLfhj25MM14y/u059h/5qBzWRyXPSrd2XDYu58wJ4gQ
         jY3kzqGth6FcGUj8xYTANdcFeU5zqrAJppHt95pxTTqU+J1MWCmov1yjQ0JHqinHb9
         ufmCmIvfVPFkg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 1/2] hwmon: (it87) Allow calling superio_enter outside mux
Date:   Tue,  3 Jan 2023 17:46:11 +1100
Message-Id: <20230103064612.404401-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230103064612.404401-1-frank@crawford.emu.id.au>
References: <20230103064612.404401-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Tue, 03 Jan 2023 17:46:43 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Allow for superio_enter to be called outside mux, in particular for
initialisation of the second chipset, which must be entered, but never
exited.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 9997f76b1f4a..4ebce2c661d7 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -87,6 +87,14 @@ static struct platform_device *it87_pdev[2];
 #define	DEVID	0x20	/* Register: Device ID */
 #define	DEVREV	0x22	/* Register: Device Revision */
 
+static inline void __superio_enter(int ioreg)
+{
+	outb(0x87, ioreg);
+	outb(0x01, ioreg);
+	outb(0x55, ioreg);
+	outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
+}
+
 static inline int superio_inb(int ioreg, int reg)
 {
 	outb(reg, ioreg);
@@ -124,10 +132,7 @@ static inline int superio_enter(int ioreg)
 	if (!request_muxed_region(ioreg, 2, DRVNAME))
 		return -EBUSY;
 
-	outb(0x87, ioreg);
-	outb(0x01, ioreg);
-	outb(0x55, ioreg);
-	outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
+	__superio_enter(ioreg);
 	return 0;
 }
 
-- 
2.38.1

