Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F174A1C
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Dec 2024 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735120556; cv=none; b=tWtV+8cK//X4Zi9we64GTTKe6JBSNW++36U1/DzpjA1iVwDqgxZ+CmaaOjESViUL1czA+TMAauVhCsh/Z9yCe8oP46pkTqakfsA6AgR4AEFQ7lFeIj77qpYJWCv3idL+9tbPMLOzPoPIZ4/0PriiEe5a1HLnSjpfhCsBhBCuyNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735120556; c=relaxed/simple;
	bh=mjuSPSGwaf+2rAuk5P6boI3Gn9LlgsleV3/s5dFEc1Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=uKc8GV7DomPq7WGws8nvuA6REt2URbdplLvnXb9gueV3C0WXcc2P42avRiYLlAAENKh3fk9BZ1RYuSyx03+k1SbcwtdjZuXLp8XArCso2VJrQHxCmdl0roWRaS1ZsqkRsMmX2zCVaILe1F5fHdYfpHN+0/U87CugAMyOj6Oz01A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=MBmRERrB; arc=none smtp.client-ip=209.85.217.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="MBmRERrB"
Received: by mail-vs1-f65.google.com with SMTP id ada2fe7eead31-4aff5b3845eso1896557137.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Dec 2024 01:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1735120553; x=1735725353; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6nX7iOW+lGn9pA4ZxjLq+B4s1KTEVik50/IGa4uEw/c=;
        b=MBmRERrBOxQMWUQGjwslnLTRrgfZeJi5WEChHDoiR+uyxNnEWOYYQv8kY0vKONyzMO
         I9+/fZiymuI3IgXbDV4BstDICP1/hZ3MSm3l3Goisba4GRCiID3/nosCgiYIaEAOYkIL
         kjCE8gkadEG+o6UVyJjPVMcwB61sMd5zQMB0hJSAe4ALoNlM0cn+YTHrCTIPBFZwbvPz
         tA9XuniyO6sS3asJQFApdb0U1navOM/FGRuJWVwkcnNEhDEcGvlX9UYKbvTEyh9H6JLA
         r9vscWrlJDKXTJckzvjLBhBIV8tGgms8Z+zlWP3FQFXiBXlCCxHLzWlQnRnvTrk9ugRJ
         ssMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735120553; x=1735725353;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nX7iOW+lGn9pA4ZxjLq+B4s1KTEVik50/IGa4uEw/c=;
        b=xJ0J4bTcY+LTCNRFBHo1cBMQi0GSba01+Yoyn42U2XWDC/fSybCifDv3MGHyTX5Qsr
         +Kn8HG1azYfbBZuSPqOEh+3e1vLY0DHWhpVRApPNqsnU0d+7i2iXVA+mjMJuLW4DpMj9
         UsDlW3V1ZUYIVIMAzIG0EWoPQoro5Za0OKX/fG9CV4l8uEYdM/yp/2vhj02NwbNdnurY
         z9UGU2SC85uqxC51OMSbZAAjce70cfdR/RfRH8OjQJ1gUdqIw+f4d0bkKdKz3VWHLGw1
         A8ZrXm/+IlBHpJDNXFSjgIyn6Kr6UFFUHXEOMq/cg6JwuWQcB3N9trX8buP5wOGyLv2R
         kfgQ==
X-Gm-Message-State: AOJu0YzZA6Cu/sPmfeuvvHYCZXoLWFXtOLQ3Tgrm8HiXXMHGDHKMwsM+
	HLBjb2xa2pqQ5pWvXTEvHlbie2h2+deigA5wRS4U5tG8tFbiJyx3qtGar7fboI0MnGEgBrfH47T
	1jWYEHS+pAzGHKXj1Zp06UKTDMVhpJxFsPquGSusewyQCXBzI0ShOBA==
X-Gm-Gg: ASbGncuW48vEjDfNhBVl2+sEKBgXZSZ2Al6DFBqglxrpkhjb6jZVfXDNM3bC/+4/rm7
	JTGpkC9/QMeASHm8hlXWyvLYbSqGiReiLy/hxXo4=
X-Google-Smtp-Source: AGHT+IH44TbOX7sTqtARqetRu1qL3qphJvVeU23v74FHcRJE2bgSC2TL8nywiJZmUuim9a7EM2PalPzLS8/Q1iQlkN0=
X-Received: by 2002:a05:6102:dd1:b0:4af:fca2:1b7 with SMTP id
 ada2fe7eead31-4b2cc37da95mr17182708137.14.1735120552636; Wed, 25 Dec 2024
 01:55:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?= <chiang.brian@inventec.com>
Date: Wed, 25 Dec 2024 17:55:42 +0800
Message-ID: <CAJCfHmXm-fPD70uN-mNJdJkzf9B526y8p=Jh5E+W5cwJ0NVhEQ@mail.gmail.com>
Subject: [PATCH v1] hwmon: Add RAA229621 for renesas spec
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Brian Chiang<chiang.brian@inventec.com>

According to the RAA229621 datasheet, add support for reading.

Signed-off-by: Brian Chiang<chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/isl68137.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 1a8caff1ac5f..c7a6b8d9c648 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -61,6 +61,7 @@ enum chips {
    raa228228,
    raa229001,
    raa229004,
+   raa229621,
 };

 enum variants {
@@ -70,6 +71,7 @@ enum variants {
    raa_dmpvr2_2rail_nontc,
    raa_dmpvr2_3rail,
    raa_dmpvr2_hv,
+   raa_dmpvr2_hvt,
 };

 static const struct i2c_device_id raa_dmpvr_id[];
@@ -264,6 +266,12 @@ static int isl68137_probe(struct i2c_client *client)
        info->R[PSC_POWER] = -1;
        info->read_word_data = raa_dmpvr2_read_word_data;
        break;
+   case raa_dmpvr2_hvt:
+       info->pages = 2;
+       info->func[0] &= ~PMBUS_HAVE_TEMP3;
+       info->func[1] &= ~PMBUS_HAVE_TEMP3;
+       info->read_word_data = raa_dmpvr2_read_word_data;
+       break;
    default:
        return -ENODEV;
    }
@@ -313,6 +321,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
    {"raa228228", raa_dmpvr2_2rail_nontc},
    {"raa229001", raa_dmpvr2_2rail},
    {"raa229004", raa_dmpvr2_2rail},
+   {"raa229621", raa_dmpvr2_hvt},
    {}
 };

-- 
2.40.1
