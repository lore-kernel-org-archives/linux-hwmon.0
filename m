Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37137565105
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999261; cv=none; b=Lpn92wAc61BcFRUXA8aFs3rg7CZUfpF0X7g4wbSfu1S+nzyEebsRWQEmofd6CfXxuepcMFz+RXx5qKWyJ5oCc5U7prP9Ms5eSO56czomL/VikknN5mfYw2dw5r8N4T4qLkqThB6nafr0nr/M6qFdCBr5yq+asLYys+/8mLSKkcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999261; c=relaxed/simple;
	bh=wYvYZooxr0D1eXxyAs7RyhlSeI5pKL4CUGAokR/iUDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKGIEGrDniuMlOwd/t9Y4SbmbfWX8QxcwGrg2tE8V7XQUaAvtzW2y2zuPOQpG4DQGhD5ekZZhTvPYo40Q7eqsYNjbVhk98Oa8HgCPwhWyYMimNmz2s67bUU0ObXtPyHjhi71pxuftepq8LZ3Hnc2HbVVyOIavu+s0+NWAv9vrSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8jPRoKc; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8jPRoKc"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso637175966b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999255; x=1792604055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBS27E8nAsA1v/XdjrYHK0evNjP09PVvsY7+Bln2L+4=;
        b=q8jPRoKcFssfJ2HTRJ5epil3rJ+0kV6rz0Oy/wwIiwyQyDSJIkcaZrlS2OuncqHDTP
         rckpmHu5lA8jwe4yPG5qiKY8mUN9/F5Uhu3zxbszc0nMXK9R2yQNASkF/HHMVsBAJ5Lu
         9TLj9Fp3li6Lo0GkingmFvclt+YkRXRmrNB6a95+rBna97HI6k7BmMaN938noPoFVbuI
         uPsFRyXVP7AmVsn3rG+mQaQDNOXKZrrnpD2ZPOi1XG3pqfh3RTg98G5pU48wsYxl14nR
         XWCFzTPftzfGrrNWTIvnNCqH6DulNxS2YU/oa4WAcO2D0Kj6FTCbkkslBQiv4bBvCx9y
         zKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999255; x=1792604055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBS27E8nAsA1v/XdjrYHK0evNjP09PVvsY7+Bln2L+4=;
        b=crvgAdioEXACBk8hSGS6CWr/Nge51kmT436QtHAeRWXCpL8xpjibV12JpBOxBpOut3
         4QsR7nvlPD8MFwOHrhlDW2Fg5dZlbRMppP1Il/TD/FDi+YTAtJ3nF5u6aR/JVlzumA9p
         Yk9KBTADTvNpvsoKU0D7ETRtz5L9ZhlepDBvw1AK4wkRC+LE7pEJb5TFZu60WhvWZ25B
         0Jrfo7xl3c7PJTPc0mObhwR0DCdTXBILZOKvVCy/CqzdIlpgrguBeo/zTsxEyfhK742Y
         1vy+P5HRf3MsutuXslwGXhjJ/oSMSD7BGR8QKS0bb7AERD1lTdA0d/lCqW2XPtW39T4B
         0G1A==
X-Gm-Message-State: AFq9FYKnkfLddM6adh5QNqdTqmeumWvklhAp/8deN2XmlgHf92lo+/un
	4fzQnRfQ4FTkEZBDDtwSLs1I1F+jmTIXR6trw/oTsDQPJ1kyC8cUfRjQ
X-Gm-Gg: AYBFou1XSxrskBCk+1YyPJy4ph+T68bNdRH4D6SHDSkksuvVTgNLATAlZNW0fdNYMfn
	dFmh/03y0oPWy0ZU6jGQBQ/4KCS5QLuU2a6KOzsAzqtImDL5EcoGivDST+2vxJTdrEUAi3vIrue
	EHG7NATOPeAcMCud0Ivc3QI93M8Wx2b8sn7D8OKky03t5hVHGtb67MYQHYtBc2SNAadOuej8J7D
	Gz2VBKdiC/X77SQ/znMvnzsSuUb1gIe9FL8hhc81HMnxzb3r4BNTNvgANCHIO1uftQgKGlsM14b
	iJuKT59p8y2UC9npQ+sE4et6G70+c6TG/GvidpdEnn3ZF2Nkmcy5hNURcQSBQImJraKHTSOhTkD
	g3GfMZuweq1vSK4XfDvtdl/FWP4Q5pGXOjcgRm4JS4DKgqtCQXBuRoe+TWp2fNW+pk8b2W10TFk
	BL9e7U8HhjhRnj9/Q0y7aCtl7NxDyRECXfv9iLXrJe24KA+F7xhOi9/hgaQ+vg/WUUIfVt4ePqF
	sQgVAmB8BXHKEnd
X-Received: by 2002:a17:907:c611:10b0:c3e:e677:563a with SMTP id a640c23a62f3a-c3ee6775af2mr9419266b.47.1791999255183;
        Wed, 14 Oct 2026 10:34:15 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:14 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:00 +0200
Subject: [PATCH v3 01/11] hwmon: chipcap2: fix command error diagnostics
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-1-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999251; l=1483;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=wYvYZooxr0D1eXxyAs7RyhlSeI5pKL4CUGAokR/iUDg=;
 b=W3cZt9Sh8KFwjVGXwR1flSOtWOTHFmIVMNX6I2ubqpqua3O9a5Mg9wKacL2nRtmFId2xkL151
 sjesXFvVNTADlEBGndnR8LpVzGvdu+KCFrog5i5f3A8hnltWiq1OTlM
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

The command response field only contains bits 1:0, while the
error flags are stored in bits 2:5. The existing diagnostic
checks test the extracted response field, so they can never report
an error flag.

Test the full status byte for the error flags, and check the
configuration-load flag instead of RAM parity for the last diagnostic.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 9bef767b589e..855057892852 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -167,13 +167,13 @@ static int cc2_cmd_response_diagnostic(struct device *dev, u8 status)
 	case CC2_RESPONSE_BUSY:
 		return -EBUSY;
 	case CC2_RESPONSE_NACK:
-		if (resp & CC2_ERR_CORR_EEPROM)
+		if (status & CC2_ERR_CORR_EEPROM)
 			dev_dbg(dev, "Command failed: corrected EEPROM\n");
-		if (resp & CC2_ERR_UNCORR_EEPROM)
+		if (status & CC2_ERR_UNCORR_EEPROM)
 			dev_dbg(dev, "Command failed: uncorrected EEPROM\n");
-		if (resp & CC2_ERR_RAM_PARITY)
+		if (status & CC2_ERR_RAM_PARITY)
 			dev_dbg(dev, "Command failed: RAM parity\n");
-		if (resp & CC2_ERR_RAM_PARITY)
+		if (status & CC2_ERR_CONFIG_LOAD)
 			dev_dbg(dev, "Command failed: configuration error\n");
 		return -ENODATA;
 	default:

-- 
2.43.0

