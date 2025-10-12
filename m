Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F602F068A
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 18:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760292793; cv=none; b=jvGm0or9Imyk6yqRA0EsxYkncwXh52355kz/2moy7epiN6bcweS9ioCuYMYcvHfoGlAwHrsijrWKb8FakZlu3eDEq8ln3hCBe97qn/ylDM0HPz2nJk3v2+Lou7f53hQx4J6Nk4tr0xEPt/TFQ0TexojR3dhpeNSAA/ZRkOZbRIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760292793; c=relaxed/simple;
	bh=qmgeVD2VVl4QslPbtYsfzqW9k+kHx43RIn2OTo4Jl5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ExKDWOxBVviyC2wVf2G5BwqWweTMTlosf5TbNoxmdrRVhNj5/POkQBopNeIzAgRa3Kf8yZFBihg2TITJor5l0AQOv91dIUCMyKG2FkP/c3fR7GApAuRBVxQ88wi5WGvEJo57NZ9rnKyreSZGex5U3w6hM9ne34qo5ihamhW7CUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmx6s7LS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmx6s7LS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4256866958bso1896610f8f.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 11:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292786; x=1760897586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qm49PMkGSlJZFDb/IimhHX7d0uXnXKa4R969SumUkuw=;
        b=mmx6s7LS19jylkIS6hn4qX2FfTZxuC4BW9foq6od94b6sWATQ/1g5W1Qnv0QKwc2dH
         TiQ70eh1Zqcj4S792FFiBtu7yKx1MuBgNTiZpq2HlBQMrZN8kwE5z+7RK8ks5Q2TF5D/
         910vVParU+ptPUSqcORmpXi861sDfaNgnkP+zVkxRl7IC3fEx5ZhXEUwS79hW5L2gpzO
         1kDX9ZaWJ3zKaBdyWWhfM3oOWedR/W9i88O12+53hNzyjSa2+HW8jVNzA2gyB4dSesfG
         hJQJD4GOHZbGjbtUawomfyaH9rRwHLRRQ2o6HgGvPjMqSM68SDTw6HcR8IsjrhJtGybq
         D1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292786; x=1760897586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qm49PMkGSlJZFDb/IimhHX7d0uXnXKa4R969SumUkuw=;
        b=FWPgu1S1vCXRr9Y20SEPxkR55LjT7INIPiriSn628i5fKoQCdtp5ka2uVuSK4jFNVE
         RORCoyqzDlI0WW0BtETkaal1n/OBZNUjs0ezfo7F9VbIZmod39If/cOJbvPwoi0mA8kP
         XKH32jrzyporeoBM6ty21EUaXCUClVao3oQG3KqHsVufKIuxS7o9eRkztz0coLwcdB2t
         1pkEgoojcY+MFyNjfZvWkcbyfPK7abiNFpWzJZTZ+ps7xD/eimd4KnAdO0L10bkzw5TD
         KlRTNFs7CtvP1mHa/G+NFU8E3P/tt2Y+AqpHX+JfZMTbrXGA+66xvch+/PVXZ7BN9B5R
         lI+g==
X-Forwarded-Encrypted: i=1; AJvYcCXd0Hj6jGtjx4Ekq8JvPY33jccoYkeVJlRy5IP0r+uYtf3UwaNDCb42FVhDNH9pIAMLkGc3YzoBTrAyrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwesFOm/Lgu/lxcG9le4BEGTf/PsE9ranWlQew1PDtppdLbnXJH
	bKCgroZ+t+j/C0DvgPKbRsoODXM1jH+g8RyIm03pzL3Qe3KQ8/foalC9
X-Gm-Gg: ASbGnctijNH392Ua/ykuzxVZcRSuYsQ9AkbtrCClV4rc8AT0WybuajqBq+AIuxe2V1J
	cLxI31Sq7kdXizhaXNya2YBBhcGHZJYd9QSaRqDLppaNY9rKeSjXwL9V4M1PTqsk74jaTLZpVO6
	ksMk88STlfvLt6zsLUpqJ90xyzjNqXIGtXLFAFTBSj6y7QH5AM4C6jRZS1n7oEV150I1/ZqoHhq
	uVdVhxSdNtNPYIHFeZeWbGZ89l4FcbLDbejDplIQjVO2QaZunTYPklWWC73fpEY2xT8N6vXOpDO
	rWuGgJFZ3a+JNeaZ+EQaSVrwUiY4PuLgsAFOLVOWZM6314ruookyeXbCjivI+1Dv60gYqcoLc6c
	AVhYlDM9HvnagvlodwxfA00iaTR/V8ipklQ==
X-Google-Smtp-Source: AGHT+IE1sITyqeK252spybpiCvyKv3IBHpRkeCYLSxM0igwtTT/L5xFKNU+rdVGC1vsPFlR1JqbCHg==
X-Received: by 2002:a05:6000:25fc:b0:426:d301:a501 with SMTP id ffacd0b85a97d-426d301a83bmr5173581f8f.62.1760292786392;
        Sun, 12 Oct 2025 11:13:06 -0700 (PDT)
Received: from pc.. ([105.163.1.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0efasm14478684f8f.41.2025.10.12.11.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:13:04 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: linux@roeck-us.net
Cc: grantpeltier93@gmail.com,
	chiang.brian@inventec.com,
	gregkh@linuxfoundation.org,
	peterz@infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] hwmon: (pmbus) Fix child node reference leak on early return
Date: Sun, 12 Oct 2025 21:12:49 +0300
Message-ID: <20251012181249.359401-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the case of an  early return, the reference to the
child node needs to be release.

Use for_each_child_of_node_scoped to fix the issue.

Fixes: 3996187f80a0e ("hwmon: (pmbus/isl68137) add support for voltage divider on Vout")
Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/hwmon/pmbus/isl68137.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 52cf62e45a86..6bba9b50c51b 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -336,10 +336,9 @@ static int isl68137_probe_from_dt(struct device *dev,
 				  struct isl68137_data *data)
 {
 	const struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int err;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (strcmp(child->name, "channel"))
 			continue;
 
-- 
2.43.0

