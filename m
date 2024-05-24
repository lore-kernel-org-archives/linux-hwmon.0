Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A212574B
	for <linux-hwmon@vger.kernel.org>; Fri, 24 May 2024 04:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716525504; cv=none; b=AebQkfimc9W4j+ZULBKnmPSx14uxrxFzElOuXJorb1jUExJ7XT9DLDucKg7mfXDQhy5d8qIMByxxRlp8tMwEVyjpiGJPo/AqEREotD+PeBvCSTfGGL35KeHRlIc5H2ovJ9dTj/YOBR+hhcL91zIlEUTznBJ8sKdIGQLMrDDcwBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716525504; c=relaxed/simple;
	bh=8asbgzuqi2IPHz+nIBJ+jEPSi1W2RJZnqVIMDtB6pzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HchIsZ+H+shlqlB+6ZhuR6j1HqJH9e3VIKRcjbYTz1i5fJk5UYIhvGMMLtUNb5yBknCvYCKFQ7eYrpkAiJJ+6QP0Pbe892HaswE6MdU7zaASR8oN3msv3EN+bs5V6WJ0hKdUfQUcz+sLQLwlsPkus+HqKAoT44BwOt0PQInE/VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=GAjrI05n; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="GAjrI05n"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 0E7E3240028
	for <linux-hwmon@vger.kernel.org>; Fri, 24 May 2024 06:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1716525494; bh=8asbgzuqi2IPHz+nIBJ+jEPSi1W2RJZnqVIMDtB6pzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=GAjrI05nvnCI4bhaGOo4MgChir8vToiqtZPJ0ymW8g+3ettuuW/OoJXth1hq2/qc6
	 DfdIDsHCifoVpqZSNMTTkW+xG4zp0mI5CmKar0XktiWEbrvZMWnX1LvYHNNDTe8flA
	 Afgg1w2Ihl6L1XDmuGmz1YjGgRJ3ft5T7ZKvzujcNx8T+tuULqlWONxBJo5xB+7UuB
	 1659Dsp9EUXgshSYFcOEzTVNY0V5Rc5G2jY00j+NdJtr+RvwuZ5U5a5NexiUnVtzk7
	 JU/oTdv+r1mMf/o3oxbvR2iZ16aIzqe78b1f/fecZ1/N7QlK8NZiJhc4f9a4zOh4+4
	 RNWErWceLEmjw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Vlsjc4XQ7z9rxF;
	Fri, 24 May 2024 06:38:12 +0200 (CEST)
Date: Fri, 24 May 2024 04:38:11 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: corsair-psu: add USB id of HX1200i Series 2023 psu
Message-ID: <ZlAZs4u0dU7JxtDf@monster.localdomain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add the usb id of the HX1200i Series 2023. Update the documentation
accordingly. Also fix the version comments, there are no Series 2022
products. That are legacy or first version products going back many
many years.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
 Documentation/hwmon/corsair-psu.rst | 6 +++---
 drivers/hwmon/corsair-psu.c         | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
index 16db34d464dd..7ed794087f84 100644
--- a/Documentation/hwmon/corsair-psu.rst
+++ b/Documentation/hwmon/corsair-psu.rst
@@ -15,11 +15,11 @@ Supported devices:
 
   Corsair HX850i
 
-  Corsair HX1000i (Series 2022 and 2023)
+  Corsair HX1000i (Legacy and Series 2023)
 
-  Corsair HX1200i
+  Corsair HX1200i (Legacy and Series 2023)
 
-  Corsair HX1500i (Series 2022 and 2023)
+  Corsair HX1500i (Legacy and Series 2023)
 
   Corsair RM550i
 
diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 2c7c92272fe3..f8f22b8a67cd 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -875,15 +875,16 @@ static const struct hid_device_id corsairpsu_idtable[] = {
 	{ HID_USB_DEVICE(0x1b1c, 0x1c04) }, /* Corsair HX650i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c05) }, /* Corsair HX750i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c06) }, /* Corsair HX850i */
-	{ HID_USB_DEVICE(0x1b1c, 0x1c07) }, /* Corsair HX1000i Series 2022 */
-	{ HID_USB_DEVICE(0x1b1c, 0x1c08) }, /* Corsair HX1200i */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c07) }, /* Corsair HX1000i Legacy */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c08) }, /* Corsair HX1200i Legacy */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c09) }, /* Corsair RM550i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0a) }, /* Corsair RM650i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0b) }, /* Corsair RM750i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0c) }, /* Corsair RM850i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0d) }, /* Corsair RM1000i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsair HX1000i Series 2023 */
-	{ HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Series 2022 and 2023 */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy and Series 2023 */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c23) }, /* Corsair HX1200i Series 2023 */
 	{ },
 };
 MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);
-- 
2.45.1

