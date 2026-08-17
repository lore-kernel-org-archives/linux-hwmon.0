Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19123DDAF7;
	Mon, 17 Aug 2026 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959997; cv=none; b=JZEBAYMo7heQpXUa5xMF9vLXfXsIT5walrfy3iybv9tLDI/xL2UPAkGdiG6pZKjtlzEVCBHUT7wSpD2+qk+gzJSe+GA/pxGOOKCYn7HbBZP+aBk8CkD1qV7zVo7y1zZqktNy8RX/Ybt5h5Nupb38eBagkKIpS2OfONFyvOtSHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959997; c=relaxed/simple;
	bh=YQY/N8TfSDfnDJl4ocQrehzQZljZ58lm9cl2supIv6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qxcmClfbOwzXiMp1LtuhZ7amcYGL6Sv22qHMMy4DoYi/dgkKP4QuQcJp+H1bN8fOnzEioO/zA3GQP3/gdydgyENwOiS4YJOMNsFdIkQazJ8sAfjG4CA3NckF0NQSiOo4tqwHay27EAN7i08a139LRhi+v56axGG7EzfVeyp7zy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NFCrd3/l; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NFCrd3/l"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 31F1E1A16D6;
	Mon, 17 Aug 2026 09:46:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 058D960352;
	Mon, 17 Aug 2026 09:46:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB69C11C4FFA6;
	Mon, 17 Aug 2026 11:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786959988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8IIh20nHvJmmcYjeLI71mWRYj3A8ITjQZRj//vCNnyI=;
	b=NFCrd3/lSq6dTbOuCPsNq7OMouzAbiRNl9Lw2F0rzNmZkugkToiRpbQy/OSRWWopjZ6z6O
	wBT0IrQ5WbhHdeYdCiJ1s6pst5a376QoTmuFfTNNQlr5NABDmEqBU1dA1abIcylf+sFVgB
	r8FaaZe9K4BzyMV4xZ7DvZKLQEFQ0kCif12kM8RDcBAvXHHuMRNPis7i1IvEIXtb7eCX+R
	9yrwII5YmTaejqBkhbjaLLLCVTl5rqgvXCxlauegkkImk+aDP+RgIV245v+FlFwDGbUs2p
	6Oq5rT66Kt1NztM3F5qViKCHxYQgoIj/0bxexYie/BJVv31abg3g4PyKR6tP+Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Aug 2026 11:46:12 +0200
Subject: [PATCH] Documentation: hwmon: replace a confusable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-doc-hwmon-remove-confusable-v1-1-dbfbaa8e952e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBAG0KuQWTtJafAnXsW4gOmHjJGOaQFNC
 He36vJt3koZSZHpXK2UsGhWiwX1riIZ2ngDaygm7/zBnWrPwYSH12iRE0ZbwGKxn3PbPcABzf7
 YeAdxnsrwTOj1/dsv17/z3N0h07ekbfsA9EIHEn8AAAA=
X-Change-ID: 20260812-doc-hwmon-remove-confusable-de457420ec02
To: Cryolitia PukNgae <cryolitia@uniontech.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YQY/N8TfSDfnDJl4ocQrehzQZljZ58lm9cl2supIv6U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqgthv4IoO5n6GtOzmJfazbcI4oit1BkHwTJjVh
 FJbXQvQIuKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaoLYbwAKCRDRgEFAKaOo
 NskkD/0U7N60bJ2jGYFseRl7vyZCmd5mWRZgZDPyIC2xPZwaFBBVa1AFF8E+3f+kbIsfekOLNYK
 OCWXcUcCURic9zeI/Hv2TZTFCTbOIdw2q1yys4WYL5BLf1q152wzVfID2tRSIYobXNIeCY8ixAw
 BtDwBSUpO0BCh8sqrbf2re8oDZguSPP1daRhyOUZbouXoG6TdCnuvIJX1eR26MlEtS3A7Am0tUs
 Pnsb3PzNrEfUgFdBROWzDo0mJRBqT00h/bqoHhfHyr2OZvQb5nLXUePHFSEhjccHlAgtsRzQvK7
 JNTm+cAV434mOY5vMeeaIvw2JviKK9PF61f22VlYjFizQyJdf8Zal3FwqutVvWcFH4OtiPK+wsK
 Bv0sC7eMJP0JUK5JBS0orj05wn11IXZACeC2h8puvDusf2EDaoTmGCD6FvSq0UNFvNWen/Opbrp
 y8P//FuOg3Ku73CSBo6tpWsVwgPre0EizT5ofz5dM3DGOF4d7IZrqXodfWcOc+EdHMJYLlHIDz3
 vlPpIiTR2TVC55UdmJvqnW9I/vb9YsEAkPfAu9YgOJJwSHDt7qBlnYS11Dc6AHp7DBcVTFxGHwh
 5CFjHZbOIC7mXwfsErvgiU7Htpj20KWgZhZ4AY86j1jAa7xaxeehCmpTn0LY/xOD/W1Qmk9eTMh
 qQKn8ktwQ6PWttw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

Remove a confusable that prevented the pdfdocs target to complete,
prompting the following error:

  Latexmk: ====Problematic refs and citations with line #s in .tex file:
  Missing character: There is no ： (U+FF1A) in font DejaVu Serif/OT:script=latn;l

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/hwmon/gpd-fan.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/gpd-fan.rst b/Documentation/hwmon/gpd-fan.rst
index 29527a77fe88..b27657d33056 100644
--- a/Documentation/hwmon/gpd-fan.rst
+++ b/Documentation/hwmon/gpd-fan.rst
@@ -67,7 +67,7 @@ pwm1_enable
   at full speed. Write "1" to set to manual, write "2" to let the EC control
   decide fan speed. Read this attribute to see current status.
 
-  NB：In consideration of the safety of the device, when setting to manual mode,
+  NB: In consideration of the safety of the device, when setting to manual mode,
   the pwm speed will be set to the maximum value (255) by default. You can set
   a different value by writing pwm1 later.
 

---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260812-doc-hwmon-remove-confusable-de457420ec02

