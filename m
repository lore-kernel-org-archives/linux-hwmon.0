Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794EA3C1D78
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 15:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339789; cv=none; b=fab8KfU7gdlgfpIRP+kLzq7NHQGsetoKSMNBlP6tC1jPDfcIOGdV04SB2UELudsb87ZXddIO6z2Tc9kjTbPmrsDHfY5c2fw8c/QBEWHJEq+QRPuVt1FIsjh1uY5+/+CANx6B2jtvvDor/7JbidLaD/VoyptaA617ntrn/s2S8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339789; c=relaxed/simple;
	bh=ZjmPi3/+32uSw+3hiOKjc+GH3Y2EjeEhZ8M27XzsJbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b4qhuoEkJeA2F6bYXFkE5X5PwsRErebOnYGS6aPXF9gfcOoPT8udJ5sA8yzonaA+N0XSfc/UWZGO/IaM4/WHRyfZsi5s9cHyIJ4WIJ6LNZZa+9NxnGumO/Hz8SiMiE1Y7pRN/Mg60fnGiPM34kLPHxvAYyzqqEjeoMQg55I0lvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LhhqyYnj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdfIrFZh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LhhqyYnj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdfIrFZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785339787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rr3tmPamM72ZJ6exWQuss/gyPyAIbntUNRs0L7FlarE=;
	b=LhhqyYnj8ipsRc3IzHZTji56lz9NiYPrxiQYA7i91FQkfCV72flV2rDbl3CrfpgdDtdlog
	j6BIWEq8uNbMe/HiGlzWUSRN3Ts/Z/klxFGB01ch6exAhxL3fgeFQo5DZP0xdO76YFgd7q
	ne2a7v6GqBMucyZNGh6DdXB8mjbDeFM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-VV81XhNUO3OwHJ42QcKILQ-1; Wed, 29 Jul 2026 11:43:06 -0400
X-MC-Unique: VV81XhNUO3OwHJ42QcKILQ-1
X-Mimecast-MFC-AGG-ID: VV81XhNUO3OwHJ42QcKILQ_1785339785
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso11484951cf.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785339785; x=1785944585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rr3tmPamM72ZJ6exWQuss/gyPyAIbntUNRs0L7FlarE=;
        b=BdfIrFZhAQm8kbwNZex2ofOhiSXRM3k9CNP4ARVpcPoXvpqRDH4jJZF2ICOCllSWgu
         +b5FKFqt7IBgOe46M/7YOUTYf+gvIepc1vXv7hKVc2HOlvuJIUpbRezV0fLkTUlzzJbC
         xY7S9iEyz+01nBL03dd5HgWeESiJ9JzRC3gwTFCyvBzlNRe2AjpS7IAn292z3NMx2K1C
         Yrqtl1p8G0umbcO5mw1zPOyNHalQa5Vs9pt1g7DGNfLkAvhvImZ1TB8XvsNUTnZSIbnG
         Nwu1KWr2ZdYKXdS9C4hLyRiCWrzoBLQ4H2XpiCqMYrRDzqeQVaq94mYJPlAjWEiJKtLh
         ul5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339785; x=1785944585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr3tmPamM72ZJ6exWQuss/gyPyAIbntUNRs0L7FlarE=;
        b=PGmauJfLYaO7JgHMA2Gq6J2xHU2Rj3ekST27PkdUrpxPsXLdRM18ddaM3VhFGfg0pV
         heGQKu1mwCyq8ZswERToy5abTLMRfzdvOp68OfcdUMpsqwqSCsOhxTip4Yp5hI/L7CRR
         lbSKjzwG/aq4+3mzDzG8R2K4jdh0aUtzO7/kUDVYKY01aQUX7839YEMLdWKb5ev0/gvE
         Uty1+nzVp4gv8WS/jkV1WvlwzERr+pBQE+AnssZgIGJK2E/RrsDDI/6qRLfCqKTgzQ9Y
         j3crGTDHoV9k2c+B3kHzs9ahMyIXvUtrbv+6T3+J6tmVTH7c1n5se3UwUbFb2r9HxOne
         rNzQ==
X-Gm-Message-State: AOJu0Yyr9YwrswkjZIs9O+IaJMs5/LFOoY1tSMkHpaLbn1KHGS7qH/SO
	va0hqQnyOevJWM6SkW7Mt+z6Dfb4/dY4pT8lvAEKI8/VV+WM2vZUk3LNfDxHbMi9YHSGGN8Vk2M
	MganxjImpZ8jk9tmX7wQjgUiU6unuqDSmbZO2BHQ4E6YZTT8FOtffRCLd8Gs8JuBQ0st3X36Uu+
	yN8SSvuYt//HuUicfUO5tM+6Dh6f4gUyD+KUddNtFCc4V3sx8=
X-Gm-Gg: AR+sD10fAPiApIir6SYmFHmkgwPDmYL54ybaxfsthdyVZsc0jJKtKmeqrMPp1/8k+Mh
	w6ld27I+Wcu5ziPB/yHF8phS2TMCD1GB25C4lSykoMnEnp8tty85pGn4UlZZc4xqd/fm2tJD/+m
	6A3OPeMrhD7hCGzIZGLvCkV3u1zPIvGqELlgc2gtfRyXdZMlMfhohkaSliZ7Ug2rKp0Ji/JWK3r
	TspoIgE99hcq7/GWf2eUfA1hMhfholDY4Lrq+LS/UMBZs5hJMSWGpognkiQUFh7ksFuYf77tgls
	R+h6328w27xb2JNME/jbf4XxGdH8wZ480rctziptS+Z2sIUmiMVr/W3hr7Cp2w1f83YYZ/qekLC
	jp7jzIvj03fMj12l2Y7lN4K1TyIOEUM6V
X-Received: by 2002:a05:622a:1b22:b0:526:fa40:c275 with SMTP id d75a77b69052e-529d71a4c31mr63807901cf.88.1785339785276;
        Wed, 29 Jul 2026 08:43:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1b22:b0:526:fa40:c275 with SMTP id d75a77b69052e-529d71a4c31mr63807471cf.88.1785339784721;
        Wed, 29 Jul 2026 08:43:04 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2efcb4esm20749871cf.26.2026.07.29.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:43:03 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Wed, 29 Jul 2026 08:42:38 -0700
Subject: [PATCH 4/4] hwmon: (ina2xx) Return 0 on inactive alarm/limit reads
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-4-349f7b2f1df8@redhat.com>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785339776; l=3007;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=ZjmPi3/+32uSw+3hiOKjc+GH3Y2EjeEhZ8M27XzsJbg=;
 b=R0qLKzbGK7A//TbaN9mkSvXGT4/ZhoKR/LEXwHPrbpFFDhBB5P5JwN89peiVAX0Kvd0Q8pQwD
 wLRW8jM8FkqBwWRoUyE+MyaE8rp0kWbK2KnwFXiuqEU4cv9YmHuVxI3
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

Guard alarm/limit reads with a check that returns zero if the active
alarm is for a different type. This addresses two issues:

1. in0/curr1 alarms may be unintentionally cleared by reading from the
   opposite input's alarm.

2. When a limit for either in0 (shunt voltage) or curr1 (current) is
   set, both of their alarms are triggered, and both of their limits
   read nonzero.

An example of this behavior on an INA231:

        # cd /sys/class/hwmon/hwmon0
        # head {curr1,in0}_input
        ==> curr1_input <==
        1713

        ==> in0_input <==
        2
        # echo 1800 >curr1_lcrit
        # head {curr1,in0}_lcrit_alarm
        ==> curr1_lcrit_alarm <==
        1

        ==> in0_lcrit_alarm <==
        0
        # head {in0,curr1}_lcrit_alarm
        ==> in0_lcrit_alarm <==
        1

        ==> curr1_lcrit_alarm <==
        0
        # head {in0,curr1}_lcrit_alarm
        ==> in0_lcrit_alarm <==
        1

        ==> curr1_lcrit_alarm <==
        1

This is because curr1 uses the same underlying masks
(INA226_SHUNT_*_VOLTAGE_MASK) as in0 on the hardware. As a result,
ina2xx_{curr,in}_read() both read the shunt voltage alarms/limits
without considering whether the voltage or current is currently set.

After this fix, the alarms only read back 1 if their corresponding limit
is set:

        # echo 0 >curr1_lcrit
        # head {curr1,in0}_lcrit_alarm
        ==> curr1_lcrit_alarm <==
        0

        ==> in0_lcrit_alarm <==
        0
        # echo 9999 >curr1_lcrit
        # head {curr1,in0}_lcrit_alarm
        ==> curr1_lcrit_alarm <==
        1

        ==> in0_lcrit_alarm <==
        0
        # echo 9999 >in0_lcrit
        # head {curr1,in0}_lcrit_alarm
        ==> curr1_lcrit_alarm <==
        0

        ==> in0_lcrit_alarm <==
        1

Fixes: 4d5c2d986757 ("hwmon: (ina2xx) Add support for current limits")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/hwmon/ina2xx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 8ba0dce1f9e31..5521490deba98 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -479,6 +479,12 @@ static int ina226_alert_limit_read(struct ina2xx_data *data, enum ina2xx_alert_t
 	u32 mask;
 	int ret;
 
+	/* Avoid nonzero reads from inactive alerts caused by shared limit register */
+	if (data->active_alert != alert) {
+		*val = 0;
+		return 0;
+	}
+
 	ret = regmap_read(regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		return ret;
@@ -558,6 +564,12 @@ static int ina226_alert_read(struct ina2xx_data *data, enum ina2xx_alert_type al
 	u32 mask;
 	int ret;
 
+	/* Avoid reading inactive alerts, which may clear the active alert */
+	if (data->active_alert != alert) {
+		*val = 0;
+		return 0;
+	}
+
 	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &regval);
 	if (ret)
 		return ret;

-- 
2.55.0

