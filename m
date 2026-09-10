Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3FA3911C9
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046934; cv=none; b=s5niFaGs2xXXuNBe31of7j1q4P6HKNsIQC1ofZL1M2wk9rfxtEz4rmVa0H6YK3V1Z9+QamOVNap18xYkP/PNWtjJXkoLLGb3Hn1ToX6IlWo7gIo3FvcFELp7PFvKFLLMhMHMujlISVIqj8L6JR9JPusilLe7BNZDQegQ6bFON34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046934; c=relaxed/simple;
	bh=rb40kngR/1/9RS1g4ilZmUMdvuVrs61YvMqPlf0788g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bpnv8WzsdOvHFo1oqF6I+HrMMTitUu7liNFj8gejtRruYoULnRXR6wukOjs6dGrBoMCn9NsT4/aP/T7bPD1E/L9KOyTXU1uCpdtuTKTg1whda1JfGAmeiaD56LgMQJRHTQOEjzGOSkO9h8iv2CWSqztC2hyp8WDvuCJHSVx4exs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Iv6i5qW3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Iv6i5qW3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B5F534E400E7
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 13:28:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 823AD5FA2F;
	Thu, 10 Sep 2026 13:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9840F11C79B47;
	Thu, 10 Sep 2026 15:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789046924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rt27fNfNYQQhhwhCnyhkSYUYvGOP98IAFGMQ/8m3Q9E=;
	b=Iv6i5qW3kPrUMIHFNdkniPlC16wXLoYajlPU9/HH6ZlRjEBv3lJj/552BRZbFE+1AjByfs
	MOkjduw+/yLbXNMKMzK1Kp4mJQev6R920n8k63gyLzllzf/vnJT5VPR2IIFBg+LmqmaK88
	LLqX+m+5Ab927TXhT+WjWDJI4INiMI+xASv8xdnMOHf47hxJLYlwILshdYTkX+mC5/adn6
	le6/Qwrv5O0+VwrKkVuD86ncc2wtFEZSGYFkVjth9FcgaecpwYRAJm9gn39XjrRuUyE5Tp
	Dk+Vl5a2lACGTmE20oZvnRRnqifzl9QWO962osd15DZF50l43lMckdajoQHLIw==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Thu, 10 Sep 2026 15:28:22 +0200
Subject: [PATCH 2/2] hwmon: (cgbc-hwmon): Add some temperature sensors
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-2-ef13ae2fa147@bootlin.com>
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
In-Reply-To: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the following temperature sensors:
- Alternate Board Temperature (temp11_input)
- Top DIMM 1-7 temperature (temp12_input to temp18_input)
- Bottom DIMM 1 temperature (temp19_input)

This fixes the following warning on conga-SA7:

  Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it

Also update existing labels to match Congatec documentation.

Cc: stable@kernel.org
Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 Documentation/hwmon/cgbc-hwmon.rst | 42 +++++++++++++++++++-------------
 drivers/hwmon/cgbc-hwmon.c         | 49 +++++++++++++++++++++++++-------------
 2 files changed, 58 insertions(+), 33 deletions(-)

diff --git a/Documentation/hwmon/cgbc-hwmon.rst b/Documentation/hwmon/cgbc-hwmon.rst
index 3a5e6e6e8639..c6d09232392a 100644
--- a/Documentation/hwmon/cgbc-hwmon.rst
+++ b/Documentation/hwmon/cgbc-hwmon.rst
@@ -28,34 +28,44 @@ system.
 Name          Description
 ============= ======================
 temp1_input   CPU temperature
-temp2_input   Box temperature
+temp2_input   Case temperature
 temp3_input   Ambient temperature
-temp4_input   Board temperature
-temp5_input   Carrier temperature
-temp6_input   Chipset temperature
-temp7_input   Video temperature
+temp4_input   CPU Board temperature
+temp5_input   Carrier Board temperature
+temp6_input   System Chipset temperature
+temp7_input   Video Controller/Board temperature
 temp8_input   Other temperature
-temp9_input   TOPDIM temperature
-temp10_input  BOTTOMDIM temperature
-in0_input     CPU voltage
+temp9_input   Top DIMM 0 temperature
+temp10_input  Bottom DIMM 0 temperature
+temp11_input  Alternate Board temperature
+temp12_input  Top DIMM 1 temperature
+temp13_input  Top DIMM 2 temperature
+temp14_input  Top DIMM 3 temperature
+temp15_input  Top DIMM 4 temperature
+temp16_input  Top DIMM 5 temperature
+temp17_input  Top DIMM 6 temperature
+temp18_input  Top DIMM 7 temperature
+temp19_input  Bottom DIMM 1 temperature
+in0_input     CPU Core voltage
 in1_input     DC Runtime voltage
 in2_input     DC Standby voltage
 in3_input     CMOS Battery voltage
-in4_input     Battery voltage
+in4_input     Battery Supply voltage
 in5_input     AC voltage
 in6_input     Other voltage
-in7_input     5V voltage
+in7_input     5V Runtime voltage
 in8_input     5V Standby voltage
-in9_input     3V3 voltage
+in9_input     3V3 Runtime voltage
 in10_input    3V3 Standby voltage
 in11_input    VCore A voltage
 in12_input    VCore B voltage
-in13_input    12V voltage
-curr1_input   DC current
-curr2_input   5V current
-curr3_input   12V current
+in13_input    12V Runtime voltage
+in14_input    12V Standby voltage
+curr1_input   DC Runtime current
+curr2_input   5V Runtime current
+curr3_input   12V Runtime current
 fan1_input    CPU fan
-fan2_input    Box fan
+fan2_input    Case fan
 fan3_input    Ambient fan
 fan4_input    Chiptset fan
 fan5_input    Video fan
diff --git a/drivers/hwmon/cgbc-hwmon.c b/drivers/hwmon/cgbc-hwmon.c
index 2effa0b56286..098896ec8c6f 100644
--- a/drivers/hwmon/cgbc-hwmon.c
+++ b/drivers/hwmon/cgbc-hwmon.c
@@ -41,32 +41,42 @@ enum cgbc_sensor_types {
 
 static const char * const cgbc_hwmon_labels_temp[] = {
 	"CPU Temperature",
-	"Box Temperature",
+	"Case Temperature",
 	"Ambient Temperature",
-	"Board Temperature",
-	"Carrier Temperature",
-	"Chipset Temperature",
-	"Video Temperature",
+	"CPU Board Temperature",
+	"Carrier Board Temperature",
+	"System Chipset Temperature",
+	"Video Controller/Board Temperature",
 	"Other Temperature",
-	"TOPDIM Temperature",
-	"BOTTOMDIM Temperature",
+	"Top DIMM 0 Temperature",
+	"Bottom DIMM 0 Temperature",
+	"Alternate Board Temperature",
+	"Top DIMM 1 Temperature",
+	"Top DIMM 2 Temperature",
+	"Top DIMM 3 Temperature",
+	"Top DIMM 4 Temperature",
+	"Top DIMM 5 Temperature",
+	"Top DIMM 6 Temperature",
+	"Top DIMM 7 Temperature",
+	"Bottom DIMM 1 Temperature",
 };
 
 static const char * const cgbc_hwmon_labels_in[] = {
-	"CPU Voltage",
+	"CPU Core Voltage",
 	"DC Runtime Voltage",
 	"DC Standby Voltage",
 	"CMOS Battery Voltage",
-	"Battery Voltage",
+	"Battery Supply Voltage",
 	"AC Voltage",
 	"Other Voltage",
-	"5V Voltage",
+	"5V Runtime Voltage",
 	"5V Standby Voltage",
-	"3V3 Voltage",
+	"3V3 Runtime Voltage",
 	"3V3 Standby Voltage",
 	"VCore A Voltage",
 	"VCore B Voltage",
-	"12V Voltage",
+	"12V Runtime Voltage",
+	"12V Standby Voltage",
 };
 
 /*
@@ -77,14 +87,14 @@ static const struct {
 	const char *label;
 	int id;
 } cgbc_hwmon_labels_curr[] = {
-	{ "DC Current", 0x12 },
-	{ "5V Current", 0x18 },
-	{ "12V Current", 0x1E },
+	{ "DC Runtime Current", 0x12 },
+	{ "5V Runtime Current", 0x18 },
+	{ "12V Runtime Current", 0x1E },
 };
 
 static const char * const cgbc_hwmon_labels_fan[] = {
 	"CPU Fan",
-	"Box Fan",
+	"Case Fan",
 	"Ambient Fan",
 	"Chipset Fan",
 	"Video Fan",
@@ -255,7 +265,12 @@ static const struct hwmon_channel_info * const cgbc_hwmon_info[] = {
 			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL),
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(in,
 			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
 			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,

-- 
2.53.0

