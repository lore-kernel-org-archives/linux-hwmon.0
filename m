Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393D22C3757
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790460327; cv=none; b=M2msM17cjiI7wD+/d8d2og7A7YJBT2z6B3vbuNCj6Wxxa0a6XLsz86OpLrippy9ErLbWF0myFjv1sanTvEBbxQMzy8lNlbOe3S3YGk0BSJRS5hqf0zSSuW5kfuKkvGlcvcoXYas8QABAJj7gbn85wUmAf8FgcCVA7jjX1jL1jUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790460327; c=relaxed/simple;
	bh=CgdVJ6BsuH4GCu6wDMdj6Qc/v6CwfNepjZFad0EEfnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7ZhIH6jnAQDNhNMMm+tTLHsNXVgcaWGvBlWCBt4Q+aYCPe3aaShqkSpzf7SwE2OSDSmMRVs9sFzN2boMGSSAgEiPgwlm6kPRz5rGir90JmlYNnDo7PDuud0MbUn+ej7EUvojq6mpYhlmLP4mDwlm+9shWTXyC6D4idnVdNYYEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAxcI29e; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAxcI29e"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91059280d58so16739406d6.1
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 15:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790460325; x=1791065125; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbjel2c4muWyHvcqY7KfJGxMd99JcLe33APmWlDvbtE=;
        b=dAxcI29eIoxyoAIR0BAZ2u0nKbbS1ap9PQ7lJivUqVKFDST8iIHKs4V/YrBNi7Onn/
         M8QRUuba3/vgOrAZmAQmnGW0kUNiz8md5mT0x7lrB0I/Anp3WCPZ5ZpJ3noFhTs1oJNL
         LfETQW5E8Lr7VtwlHZ3Lek8BVP3g9LAS4fSplJa6uEzIztc2+85MbjcQIgCJvj+78/zG
         jtuCH8ZNF2AvrI3h/b3CeknjtfxLZkEPyKKJ0kW25LwRzu0qTa35lSufDuEYRSkm712X
         zQcY6cczqrho3n5khxj5/Wyv6RTgqtZ9JldQfj/vRmloQn5nbXzRkVNuLIVypOm0t6nK
         8CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790460325; x=1791065125;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbjel2c4muWyHvcqY7KfJGxMd99JcLe33APmWlDvbtE=;
        b=Lhse8EsAhWkwB6ipIrJkOblndTeY6JgAwSl5exkkppzQwK7TYzQs5u0Hrc3ktApHc6
         +bZBvoYcoAoea+My0qEgfP5yrGQdkXiYKRSDDBGM+v3AmIoY1PSgDPS0DTc8Hy0ulXLH
         PoZp0TDDF/w2wuhAo7OZtBmgTY/LrLhDHAcRjG6YRkRbPNWfrdMjDkLexIS1tRaGhT04
         NQxMVCTxl6xWh7/HbacB660E2OLkZJxM5L48A4bFr0YXUTDbZnGTTf2Cy933GnFq+/CT
         Inm5cR90U2yOW11ccbd23w7vD+v0dBA7nEeb2C/hYCwEtaON8tNMQCgECEFgM2MWbr0d
         bC1Q==
X-Gm-Message-State: AFq9FYKG8wkOrervytFOp0FC2xWwo9EQitJPVYxeYcWk6wuyiZQF+doc
	DVN6zruNuzCUF9l1sakR1gugGu3KmJ0AvIHBOehqVCuhZHf+Keu17jKecLIX0Q==
X-Gm-Gg: AYBFou2CfoiW0BsUsmpQhoY0wdRg4r6Uzsf+Z/LI2PV+IAqUkjrCt0OfYLusNctVLdA
	Sa3CdHODVEaPuzTfbPJg3NlWK7AJXkY2aO1Fnlw0mc7d4QE75JsAVAKn0z1dfimnMBYgD47c4KU
	YZ1nUdbKPl6NLrc0SzX6mXd0zv2sksfHdjUDupcfc219TIw+o6jIZ1FnjrFr1JE5rRfyMh6iKHj
	U693wjfOewIPnYzhi9zrNKEZlNxp7DKinu1zMKhLSrVwM5mb1nq5RW2WYTZMeCfxuc5LBsmNLLw
	kFN/xg7aJB9M2SH51uggr8meMOeiXx+Z0GzdAsEkA/0nKV58up//j6sCzbVtZ49ylsr31uMLNPL
	BnB4UZ6hSmC/WD80OdECA7bhC4SYbZrVsggMBMJk2nuNmP3Xhueni3sXjKrYC/20h0l0O2nhYqf
	uN0WPpzzyqpL7IOWy+gHVmLIZM12Wf0dvaY7pPwMLA+Ut3ubLaJ1AKj0jMjXgS9jStgvZayGiye
	tq/uHouAYGIvVHhu2A4OA==
X-Received: by 2002:a05:6214:3913:b0:910:6cba:ea64 with SMTP id 6a1803df08f44-9142f70b55fmr128076076d6.14.1790460325074;
        Sat, 26 Sep 2026 15:05:25 -0700 (PDT)
Received: from DESKTOP-F7UNNQO.localdomain ([73.227.27.194])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9143edd60a7sm33214736d6.20.2026.09.26.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 15:05:24 -0700 (PDT)
Date: Sat, 26 Sep 2026 18:05:22 -0400
From: Jason Luo <jasonluomath@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/ucd9000) Add monitor types 5, 6, and 7 for
 UCD90320
Message-ID: <20260926220522.GA63217@DESKTOP-F7UNNQO.localdomain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The TI UCD90320 power sequencer defines additional monitor types:
- 5: Input voltage
- 6: Voltage with AVS
- 7: Input voltage with AVS

Because ucd9000_probe() only checks for monitor types 1-4,
voltage rails configured with types 5-7 are ignored, and thus
are never registered with PMBus.

Add handling for monitor types 5, 6, and 7 to allow these
voltage rails on UCD90320 to be detected and registered.

Refer to section 10.6 in the documentation below.

Link: https://www.ti.com/lit/ug/slvuaw9c/slvuaw9c.pdf
Link: https://www.ti.com/lit/ug/slvu352g/slvu352g.pdf
Signed-off-by: Jason Luo <jasonluomath@gmail.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index f76c2913c9ca..96e0c587d52e 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -44,10 +44,13 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
 #define UCD9000_MON_PAGE(x)	((x) & 0x1f)
 
-#define UCD9000_MON_VOLTAGE	1
-#define UCD9000_MON_TEMPERATURE	2
-#define UCD9000_MON_CURRENT	3
-#define UCD9000_MON_VOLTAGE_HW	4
+#define UCD9000_MON_VOLTAGE		1
+#define UCD9000_MON_TEMPERATURE		2
+#define UCD9000_MON_CURRENT		3
+#define UCD9000_MON_VOLTAGE_HW		4
+#define UCD9000_MON_INPUT_VOLTAGE	5
+#define UCD9000_MON_VOLTAGE_AVS		6
+#define UCD9000_MON_INPUT_VOLTAGE_AVS	7
 
 #define UCD9000_NUM_FAN		4
 
@@ -579,6 +582,9 @@ static int ucd9000_probe(struct i2c_client *client)
 		switch (UCD9000_MON_TYPE(block_buffer[i])) {
 		case UCD9000_MON_VOLTAGE:
 		case UCD9000_MON_VOLTAGE_HW:
+		case UCD9000_MON_INPUT_VOLTAGE:
+		case UCD9000_MON_VOLTAGE_AVS:
+		case UCD9000_MON_INPUT_VOLTAGE_AVS:
 			info->func[page] |= PMBUS_HAVE_VOUT
 			  | PMBUS_HAVE_STATUS_VOUT;
 			break;
-- 
2.25.1

