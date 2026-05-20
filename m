Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6207C3019A9;
	Wed, 20 May 2026 02:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779244351; cv=none; b=LHwgyGhmUhkBvAGY+Lx0XWj10NvJtrAQwSSH04ZR4cXx6+KHj31hWsEmcTVL1V6ToMiYX9ZRJdh9bGMoy98DFLkVwY/+O6vsWp2DWDgPc0DUjZjvYT0XxDGbnO5ycsuQn9QnD7vC0yN3fV7fcojX0voE/7Q1JhbLjxMaefxkszo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779244351; c=relaxed/simple;
	bh=hbzNeDUA24AMI3s3KMnTEBw/siHRoQTe7D1NJinOdi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLJ6OglFNRXLrOWMpuTROjs3AFYtpjGZ55hkp8fnF0/NKR+tJ80BIEcmrZZos/UKnSODmMYeFjTtyicdSCsD6SpbcjyvY0qBfpnrCDmNw/Ms9T5oypmgVV9vOGe22SEryItysGrht10xMQrY/VI7InJpkFcIiJal3lLFFv9gcRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NFCHJfJL; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NFCHJfJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Fx
	ODPs4QJ6dM2BqVvq1lkUcrICYdhCr64tLgPY/ObnE=; b=NFCHJfJL3BNuGL6N1N
	JWJEjKFhR4JBiqBXiXU7g2hxWipXn+6QDWADGqOqvgSQ5Ut+6o3SXt1aWj294jL4
	bnNr99Ws3MdhuN0d9ayXKLwiberfu9q0vvOnRFv5QK2Fl+45Qw6fbCuJMYY7mVJw
	ZeEHz/aCCscg6xVufY0Dye5DM=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCXhxccHQ1qsLyhCQ--.43220S2;
	Wed, 20 May 2026 10:31:56 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH v2 2/2] hwmon: (lenovo-ec-sensors): Fix EC "MCHP" signature validation logic
Date: Wed, 20 May 2026 10:32:22 +0800
Message-ID: <20260520023222.18321-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514011411.4167069-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXhxccHQ1qsLyhCQ--.43220S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWUCr1kWrWDJr4fuw45Jrb_yoW8Cr4Dpr
	4UXFW8Crn5WryDWw17t347uFy5Ja4rt3y8Wry3Wan5CrnxWa97urWFkFyagas8ZFs5Ja4I
	yFy5trWY9F1DAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRWv38UUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC-Bws2moNHRz6BgAA3M

The EC signature check uses && instead of || between the four
byte comparisons.  With &&, the condition is true only when ALL
four bytes fail to match simultaneously, meaning the driver
accepts a device as a valid Microchip EC if ANY single byte of
the 4-byte "MCHP" signature happens to match.

Due to short-circuit evaluation, if the first byte reads back as
'M' (0x4D, a very common register value), the remaining three
comparisons are skipped entirely and the device is accepted.

Change && to || so the check rejects devices that do not fully
match the expected EC signature, as originally intended.

Also remove the now-unnecessary braces around the single-statement
if body.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Kean Ren <rh_king@163.com>
---
Changes in v2: No change, just correct the format.

 drivers/hwmon/lenovo-ec-sensors.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
index 45db49e189d3..01138eed45e5 100644
--- a/drivers/hwmon/lenovo-ec-sensors.c
+++ b/drivers/hwmon/lenovo-ec-sensors.c
@@ -537,12 +537,11 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	outw_p(MCHP_SING_IDX, MCHP_EMI0_EC_ADDRESS);
 	mutex_unlock(&ec_data->mec_mutex);
 
-	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') &&
-	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
-	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
-	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
+	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') ||
+	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') ||
+	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
+	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P'))
 		return -ENODEV;
-	}
 
 	dmi_id = dmi_first_match(thinkstation_dmi_table);
 
-- 
2.53.0

