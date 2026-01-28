Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7919AD8B;
	Wed, 28 Jan 2026 00:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769559726; cv=none; b=jZ0Ti7yhFqVlD/IGQxJdaxowmGkZTpwIkn5VdfxCEynyiTykOCngvTTFevTJfs1OLmA/9HDaLtgN1GVeVUB2m09114TO7FukFwfTmSLpPHcPm1z5WbV83luxBAJK9SC9szRgjoJdIHiIWdTsCikyvG8hOBJZ+bKfSwmx09CyndQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769559726; c=relaxed/simple;
	bh=tHZRbBKdrQ24TTCeKB/FKmWwUU7znePxzR9d7riih50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLSZ0brelEoOl+2VbKmhd9DlFaPaOBGeboN98qESIQrhHKxDXXagvwgjYNPQXdYwfram3j1zT12s5nxm6bqM+dCPfny7dCwJezH+o9CPiXvTgd+1vPagFtDQ94SJUAjcO9EVASdes43V/SYN/Pxg3/GDUxwc+Nh0q5GhdXMnKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=v48nL1sF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="v48nL1sF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=LdHZia+Ngfng4o3avS7DoPsoS1YMGswmRXLDVdplu/Q=; b=v48nL1sF8gTq+Uw5/juXkHp8TM
	l2Kqn3B6grLKSdp1zVlWKkm789Vc6SszEbAGinaHe3N+FtQgeSagIChWrxBqatOGu7Smr53je3v3N
	6t1ZGwagiko8pRow5bdHMJ+3vgNVS+6QynNWZF5HtamIO+DVsS8WteSajHf//SCDCPQ60yaqL3+Zr
	IJzXiLOXTsV7Z+Ery1b+rfTrZnSUOYawXme8TZCsDe/3v7BalSryJ0iiWc8lMdjcu/PR+ApRreA4B
	kKrpa5Ljr04z+3fa9Vm6TdOXujltaoBolOUnIXTxsNMXrGHh3YSJd8XMA5RedU4r6kfTXmOx7eOLK
	a4mHoHUg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktJp-0000000FCXT-2mb0;
	Wed, 28 Jan 2026 00:22:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Charles Hsu <hsu.yungteng@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] hwmon: pmbus: fix table in STEF48H28 documentation
Date: Tue, 27 Jan 2026 16:22:00 -0800
Message-ID: <20260128002200.1665941-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"make htmldocs" reports build errors/warnings:

Documentation/hwmon/stef48h28.rst:45: ERROR: Missing matching underline for section title overline.
=========================================================
in1_label               "vin".
in1_input               Measured voltage. From READ_VIN register. [docutils]
Documentation/hwmon/stef48h28.rst:73: WARNING: Title underline too short.
temp2_input             Measured temperature. From READ_TEMPERATURE_2 register.
========================================================= [docutils]

Fix the table overline/underline line lengths and convert it to
a 2-column table.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Charles Hsu <hsu.yungteng@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/hwmon/stef48h28.rst |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

--- linux-next-20260126.orig/Documentation/hwmon/stef48h28.rst
+++ linux-next-20260126/Documentation/hwmon/stef48h28.rst
@@ -42,7 +42,7 @@ The driver supports standard PMBus drive
 Sysfs entries
 -------------
 
-=========================================================
+======================  ========================================================
 in1_label		"vin".
 in1_input		Measured voltage. From READ_VIN register.
 in1_min			Minimum Voltage. From VIN_UV_WARN_LIMIT register.
@@ -53,11 +53,9 @@ in2_input		Measured voltage. From READ_V
 in2_min			Minimum Voltage. From VOUT_UV_WARN_LIMIT register.
 in2_max			Maximum voltage. From VOUT_OV_WARN_LIMIT register.
 
-curr1_label "iin".
-curr1_input Measured current. From READ_IIN register.
+curr1_label "iin".      curr1_input Measured current. From READ_IIN register.
 
-curr2_label "iout1".
-curr2_input Measured current. From READ_IOUT register.
+curr2_label "iout1".    curr2_input Measured current. From READ_IOUT register.
 
 power1_label		"pin"
 power1_input		Measured input power. From READ_PIN register.
@@ -70,4 +68,4 @@ temp1_max		Maximum temperature. From OT_
 temp1_crit		Critical high temperature. From OT_FAULT_LIMIT register.
 
 temp2_input		Measured temperature. From READ_TEMPERATURE_2 register.
-=========================================================
+======================  ========================================================
