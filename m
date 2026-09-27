Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF965432316;
	Sun, 27 Sep 2026 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536446; cv=none; b=e1VjKTPG5XRFfrjxm229pcnRBZ1OsNqBu4NaubKabjwaPlOxYndxKRoCg3IkMaYDg67GqR6F6tXwauV9iuH34Ti0ddWvBA/Ix1LsMZ4nQ5zKH2TlbP8Pd5AcbaJAD1C6sNa3aPbgO3OrIVIhE+LeCtwoos5QJCrF2Da++qm3M/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536446; c=relaxed/simple;
	bh=rpU7IRwg82mYGW78DVGD7XuOMsxHe9fuobloRGa5dGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTDTRwmhfZ5y91EVsfkov96NUh6Nbv6V4hXc8la3EAaS9VrEJPxGyJumLJ7F62In1MdarseZmsam1SQBc4C92vsiDEgy/UXc4HGc//wqfLIllY4mqLHtltzBgXWoM0Nc0VpscOOmlOspQs3DaW1HGkFyfPiW5cceUfu8yTencck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=ttG1Vu0E; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="ttG1Vu0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790536430; x=1790795630;
	bh=LrkvP3pOwzlFNWHfOqIfXe/+PPygsLNzJ+tWmsbYbx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ttG1Vu0EDQbWgSqbdO2ewLCVCJqa9aSde58E36inji4UyQ+UnIzltofDBKHb3K9He
	 YLAlK4zxXiXfyhV8Fb0oEvW8MCA4WGobnX1JzNeEWEdY/hsXvKd4NRdwH4qqwB3O6K
	 4+OE7etWHLspPPnZYcqlZfiPDI8GXLNwqoU/TG+PWi5pN7SaTM/+5DGGiD35drhFF6
	 BU44EaDPSAQlGH60pcPrKiVmqzXL/Uh7/rMzRTgiXv3XszJtLgq5DsUq2rN7uVfMEw
	 5Y9ySLzimAbFEEz79dPgRodZVYRfx55QdK9hox9bVH2PbV2dh5ph3//8qA2Eq4g9pQ
	 SGboZyByS6Ilw==
X-Pm-Submission-Id: 4htDcr5nljz2ScPL
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 3/5] hwmon: (aquacomputer_d5next) Validate incoming status reports
Date: Sun, 27 Sep 2026 22:13:14 +0300
Message-ID: <20260927191316.4137752-4-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927191316.4137752-1-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The raw-event callback runs before HID core pads a short report. Check
that the report is an input report and that its length matches the HID
report descriptor before decoding sensor fields. Otherwise a truncated
report can be read past its received data, and a feature report with the
same ID can be mistaken for sensor data.

Apply these checks to every device using the shared raw-event path and
check the report ID byte before updating the cache. Legacy devices keep
using their separate feature-report read path.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
 drivers/hwmon/aquacomputer_d5next.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 0bd1886ef..f80027b27 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1334,7 +1334,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	int i, j, sensor_value;
 	struct aqc_data *priv;
 
-	if (report->id != STATUS_REPORT_ID)
+	if (report->id != STATUS_REPORT_ID || report->type != HID_INPUT_REPORT ||
+	    size != hid_report_len(report) || data[0] != STATUS_REPORT_ID)
 		return 0;
 
 	priv = hid_get_drvdata(hdev);
